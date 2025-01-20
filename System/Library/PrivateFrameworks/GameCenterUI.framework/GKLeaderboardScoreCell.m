@interface GKLeaderboardScoreCell
+ (CGSize)defaultSize;
+ (id)highRankNib;
+ (id)lowRankNib;
- (BOOL)canBecomeFocused;
- (BOOL)isLocalPlayerScore;
- (BOOL)lineVisible;
- (BOOL)shouldShowContextMenu;
- (GKDashboardPlayerPhotoView)playerView;
- (GKLeaderboardEntry)entry;
- (GKLeaderboardScoreActionDelegate)delegate;
- (NSLayoutConstraint)playerViewHeightConstraint;
- (UILabel)nameLabel;
- (UILabel)rankLabel;
- (UILabel)scoreLabel;
- (UILabel)subtitleLabel;
- (UIView)backView;
- (UIView)monogramColorView;
- (UIView)topLine;
- (id)cellBackgroundColor:(BOOL)a3;
- (void)awakeFromNib;
- (void)prepareForReuse;
- (void)setBackView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntry:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsLocalPlayerScore:(BOOL)a3;
- (void)setLineVisible:(BOOL)a3;
- (void)setMonogramColorView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPlayerViewHeightConstraint:(id)a3;
- (void)setRankLabel:(id)a3;
- (void)setScoreLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldShowContextMenu:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTopLine:(id)a3;
- (void)setupForLeaderboardEntry:(id)a3;
- (void)updateLayerMask:(id)a3;
@end

@implementation GKLeaderboardScoreCell

+ (CGSize)defaultSize
{
  double v2 = 60.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

+ (id)lowRankNib
{
  double v2 = objc_opt_class();

  return (id)[v2 _gkNibWithBaseName:@"GKLeaderboardScoreLowRankCell"];
}

+ (id)highRankNib
{
  double v2 = objc_opt_class();

  return (id)[v2 _gkNibWithBaseName:@"GKLeaderboardScoreHighRankCell"];
}

- (void)awakeFromNib
{
  v17.receiver = self;
  v17.super_class = (Class)GKLeaderboardScoreCell;
  [(GKFocusHighlightingCollectionViewCell *)&v17 awakeFromNib];
  double v3 = [(GKLeaderboardScoreCell *)self playerView];
  [v3 setUseDarkerPlaceholder:1];

  v4 = [(GKLeaderboardScoreCell *)self playerView];
  [v4 setAvatarSize:0x10000];

  v5 = [MEMORY[0x1E4F63A10] sharedTheme];
  v6 = [v5 secondaryLabelCompositingFilter];
  v7 = [(GKLeaderboardScoreCell *)self scoreLabel];
  v8 = [v7 layer];
  [v8 setCompositingFilter:v6];

  v9 = [MEMORY[0x1E4F63A10] sharedTheme];
  v10 = [v9 secondaryLabelCompositingFilter];
  v11 = [(GKLeaderboardScoreCell *)self rankLabel];
  v12 = [v11 layer];
  [v12 setCompositingFilter:v10];

  v13 = [MEMORY[0x1E4F63A10] sharedTheme];
  v14 = [v13 secondaryLabelCompositingFilter];
  v15 = [(GKLeaderboardScoreCell *)self subtitleLabel];
  v16 = [v15 layer];
  [v16 setCompositingFilter:v14];
}

- (void)setEntry:(id)a3
{
  v7 = (GKLeaderboardEntry *)a3;
  if (self->_entry == v7)
  {
    v5 = [(GKDashboardPlayerPhotoView *)self->_playerView player];

    v6 = v7;
    if (v5) {
      goto LABEL_5;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_entry, a3);
  }
  [(GKLeaderboardScoreCell *)self setupForLeaderboardEntry:v7];
  v6 = v7;
LABEL_5:
}

- (void)setShouldShowContextMenu:(BOOL)a3
{
  self->_shouldShowContextMenu = a3;
}

- (id)cellBackgroundColor:(BOOL)a3
{
  if (*MEMORY[0x1E4F63830])
  {
    if (a3)
    {
      double v3 = [MEMORY[0x1E4FB1618] whiteColor];
      v4 = [v3 colorWithAlphaComponent:0.05];

      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (!a3)
  {
LABEL_6:
    uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
    goto LABEL_7;
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
LABEL_7:
  v4 = (void *)v5;
LABEL_8:

  return v4;
}

- (void)setupForLeaderboardEntry:(id)a3
{
  id v36 = a3;
  uint64_t v5 = [v36 player];
  -[GKLeaderboardScoreCell setIsLocalPlayerScore:](self, "setIsLocalPlayerScore:", [v5 isLocalPlayer]);
  id v6 = [(GKLeaderboardScoreCell *)self cellBackgroundColor:[(GKLeaderboardScoreCell *)self isLocalPlayerScore]];
  uint64_t v7 = [v6 CGColor];
  v8 = [(GKLeaderboardScoreCell *)self layer];
  [v8 setBackgroundColor:v7];

  v9 = [(GKLeaderboardScoreCell *)self monogramColorView];
  [v9 setHidden:0];

  v10 = [(GKLeaderboardScoreCell *)self playerView];
  [v10 setPlayer:v5];

  v11 = [(GKLeaderboardScoreCell *)self playerView];
  [v11 setUserInteractionEnabled:0];

  v12 = [v5 displayNameWithOptions:0];
  v13 = [(GKLeaderboardScoreCell *)self nameLabel];
  [v13 setText:v12];

  v14 = [v36 formattedScore];
  v15 = [(GKLeaderboardScoreCell *)self scoreLabel];
  [v15 setText:v14];

  uint64_t v16 = [v36 rank];
  objc_super v17 = [MEMORY[0x1E4FB1618] labelColor];
  v18 = v17;
  if (v16 < 100)
  {
    v26 = [(GKLeaderboardScoreCell *)self rankLabel];
    [v26 setTextColor:v18];

    [v36 rank];
    v22 = GKFormattedStringWithGroupingFromInteger();
    v23 = [(GKLeaderboardScoreCell *)self rankLabel];
    [v23 setText:v22];
  }
  else
  {
    v19 = [v17 colorWithAlphaComponent:0.5];
    v20 = [(GKLeaderboardScoreCell *)self rankLabel];
    [v20 setTextColor:v19];

    v21 = NSString;
    v22 = GKGameCenterUIFrameworkBundle();
    v23 = GKGetLocalizedStringFromTableInBundle();
    [v36 rank];
    double v3 = GKFormattedStringWithGroupingFromInteger();
    v24 = objc_msgSend(v21, "stringWithFormat:", v23, v3);
    v25 = [(GKLeaderboardScoreCell *)self rankLabel];
    [v25 setText:v24];
  }
  BOOL v27 = [(GKLeaderboardScoreCell *)self isLocalPlayerScore];
  BOOL v28 = v27;
  if (v27)
  {
    v29 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
  }
  else
  {
    v29 = [v5 internal];
    double v3 = [v29 contact];
    [v3 _gkCompositeName];
  v30 = };
  v31 = [(GKLeaderboardScoreCell *)self subtitleLabel];
  [v31 setText:v30];

  if (!v28)
  {

    v30 = v3;
  }

  v32 = [(GKLeaderboardScoreCell *)self subtitleLabel];
  v33 = [v32 text];
  BOOL v34 = [v33 length] == 0;
  v35 = [(GKLeaderboardScoreCell *)self subtitleLabel];
  [v35 setHidden:v34];
}

- (void)updateLayerMask:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FB14C0];
  id v4 = a3;
  [v4 bounds];
  uint64_t v5 = objc_msgSend(v3, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 12);
  id v6 = [MEMORY[0x1E4F39C88] layer];
  [v4 bounds];
  objc_msgSend(v6, "setFrame:");
  id v8 = v5;
  objc_msgSend(v6, "setPath:", objc_msgSend(v8, "CGPath"));
  uint64_t v7 = [v4 layer];

  [v7 setMask:v6];
}

- (void)setLineVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(GKLeaderboardScoreCell *)self topLine];
  [v4 setHidden:v3];
}

- (BOOL)lineVisible
{
  return ![(UIView *)self->_topLine isHidden];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)GKLeaderboardScoreCell;
  [(GKLeaderboardScoreCell *)&v6 prepareForReuse];
  BOOL v3 = [(GKLeaderboardScoreCell *)self playerView];
  [v3 setPlayer:0];

  id v4 = [(GKLeaderboardScoreCell *)self cellBackgroundColor:0];
  uint64_t v5 = [(GKLeaderboardScoreCell *)self contentView];
  [v5 setBackgroundColor:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardScoreCell;
  -[GKLeaderboardScoreCell setHighlighted:](&v7, sel_setHighlighted_);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__GKLeaderboardScoreCell_setHighlighted___block_invoke;
  v5[3] = &unk_1E5F63D68;
  v5[4] = self;
  BOOL v6 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0 completion:0.05];
}

void __41__GKLeaderboardScoreCell_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    float v1 = 0.5;
  }
  else {
    float v1 = 1.0;
  }
  id v3 = [*(id *)(a1 + 32) layer];
  *(float *)&double v2 = v1;
  [v3 setOpacity:v2];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardScoreCell;
  -[GKLeaderboardScoreCell setSelected:](&v8, sel_setSelected_);
  uint64_t v5 = [(GKLeaderboardScoreCell *)self layer];
  [v5 setBackgroundColor:0];

  if (v3) {
    [MEMORY[0x1E4FB1618] _gkSelectedCellBackgroundColor];
  }
  else {
  BOOL v6 = [(GKLeaderboardScoreCell *)self cellBackgroundColor:[(GKLeaderboardScoreCell *)self isLocalPlayerScore]];
  }
  objc_super v7 = [(GKLeaderboardScoreCell *)self contentView];
  [v7 setBackgroundColor:v6];
}

- (GKLeaderboardEntry)entry
{
  return self->_entry;
}

- (GKLeaderboardScoreActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKLeaderboardScoreActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldShowContextMenu
{
  return self->_shouldShowContextMenu;
}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
}

- (NSLayoutConstraint)playerViewHeightConstraint
{
  return self->_playerViewHeightConstraint;
}

- (void)setPlayerViewHeightConstraint:(id)a3
{
}

- (BOOL)isLocalPlayerScore
{
  return self->_isLocalPlayerScore;
}

- (void)setIsLocalPlayerScore:(BOOL)a3
{
  self->_isLocalPlayerScore = a3;
}

- (UILabel)rankLabel
{
  return self->_rankLabel;
}

- (void)setRankLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)scoreLabel
{
  return self->_scoreLabel;
}

- (void)setScoreLabel:(id)a3
{
}

- (UIView)topLine
{
  return self->_topLine;
}

- (void)setTopLine:(id)a3
{
}

- (UIView)monogramColorView
{
  return self->_monogramColorView;
}

- (void)setMonogramColorView:(id)a3
{
}

- (UIView)backView
{
  return self->_backView;
}

- (void)setBackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backView, 0);
  objc_storeStrong((id *)&self->_monogramColorView, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_scoreLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_rankLabel, 0);
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_entry, 0);
}

@end