@interface GKTurnBasedMatchDetailHeaderView
+ (BOOL)requiresConstraintBasedLayout;
- (GKDashboardPlayerPhotoView)avatarView;
- (GKLabel)infoLabel;
- (GKLabel)lastTurnLabel;
- (GKLabel)startedLabel;
- (GKTurnBasedMatch)match;
- (GKTurnBasedMatchDetailHeaderView)initWithFrame:(CGRect)a3;
- (NSArray)constraints;
- (NSString)actionText;
- (NSString)infoText;
- (NSString)playingWithString;
- (SEL)actionSelector;
- (UIButton)actionButton;
- (UIFocusGuide)actionFocusGuide;
- (UILabel)playingWithLabel;
- (id)actionTarget;
- (void)actionPressed:(id)a3;
- (void)didUpdateModel;
- (void)establishConstraints;
- (void)setActionButton:(id)a3;
- (void)setActionFocusGuide:(id)a3;
- (void)setActionSelector:(SEL)a3;
- (void)setActionTarget:(id)a3;
- (void)setActionText:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setInfoText:(id)a3;
- (void)setLabelAlpha:(double)a3;
- (void)setLastTurnLabel:(id)a3;
- (void)setMatch:(id)a3;
- (void)setPlayingWithLabel:(id)a3;
- (void)setStartedLabel:(id)a3;
@end

@implementation GKTurnBasedMatchDetailHeaderView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKTurnBasedMatchDetailHeaderView)initWithFrame:(CGRect)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)GKTurnBasedMatchDetailHeaderView;
  v3 = -[GKTurnBasedMatchDetailHeaderView initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v42 = [MEMORY[0x1E4F639B0] sharedPalette];
    v4 = [v42 viewBackgroundColor];
    v5 = [GKDashboardPlayerPhotoView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[GKDashboardPlayerPhotoView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    avatarView = v3->_avatarView;
    v3->_avatarView = (GKDashboardPlayerPhotoView *)v10;

    [(GKDashboardPlayerPhotoView *)v3->_avatarView setClipsToBounds:1];
    [(GKDashboardPlayerPhotoView *)v3->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    playingWithLabel = v3->_playingWithLabel;
    v3->_playingWithLabel = (UILabel *)v12;

    [(UILabel *)v3->_playingWithLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_playingWithLabel setBackgroundColor:v4];
    [(UILabel *)v3->_playingWithLabel setOpaque:0];
    [(UILabel *)v3->_playingWithLabel setNumberOfLines:2];
    v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
    [(UILabel *)v3->_playingWithLabel setFont:v14];

    [(UILabel *)v3->_playingWithLabel setTextAlignment:1];
    [(UILabel *)v3->_playingWithLabel setAdjustsFontForContentSizeCategory:1];
    v15 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    startedLabel = v3->_startedLabel;
    v3->_startedLabel = v15;

    [(GKLabel *)v3->_startedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)v3->_startedLabel setBackgroundColor:v4];
    [(GKLabel *)v3->_startedLabel setNumberOfLines:2];
    v17 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    [(GKLabel *)v3->_startedLabel setTextColor:v17];

    [(GKLabel *)v3->_startedLabel setAdjustsFontForContentSizeCategory:1];
    [(GKLabel *)v3->_startedLabel setOpaque:0];
    v18 = -[GKLabel initWithFrame:]([GKLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    lastTurnLabel = v3->_lastTurnLabel;
    v3->_lastTurnLabel = v18;

    [(GKLabel *)v3->_lastTurnLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)v3->_lastTurnLabel setBackgroundColor:v4];
    [(GKLabel *)v3->_lastTurnLabel setNumberOfLines:2];
    v20 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    [(GKLabel *)v3->_lastTurnLabel setTextColor:v20];

    [(GKLabel *)v3->_lastTurnLabel setAdjustsFontForContentSizeCategory:1];
    [(GKLabel *)v3->_lastTurnLabel setOpaque:0];
    uint64_t v21 = +[GKFocusableButton buttonWithType:0];
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v21;

    [(UIButton *)v3->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    v24 = [(UIButton *)v3->_actionButton titleLabel];
    [v24 setFont:v23];

    v25 = [(UIButton *)v3->_actionButton titleLabel];
    [v25 setAdjustsFontForContentSizeCategory:1];

    [(UIButton *)v3->_actionButton addTarget:v3 action:sel_actionPressed_ forControlEvents:0x2000];
    v26 = [(UIButton *)v3->_actionButton layer];
    [v26 setCornerRadius:14.0];

    v27 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0799999982];
    [(UIButton *)v3->_actionButton setBackgroundColor:v27];

    -[UIButton setContentEdgeInsets:](v3->_actionButton, "setContentEdgeInsets:", 8.0, 16.0, 8.0, 16.0);
    uint64_t v28 = *MEMORY[0x1E4F3A2E8];
    v29 = [(UIButton *)v3->_actionButton layer];
    [v29 setCompositingFilter:v28];

    v30 = objc_alloc_init(GKLabel);
    infoLabel = v3->_infoLabel;
    v3->_infoLabel = v30;

    [(GKLabel *)v3->_infoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = v3->_infoLabel;
    v33 = [MEMORY[0x1E4F639F8] textStyle];
    v34 = [v33 lineHeight:15.0];
    v35 = [v34 centered];
    [(GKLabel *)v32 applyTextStyle:v35];

    [(GKLabel *)v3->_infoLabel setAdjustsFontForContentSizeCategory:1];
    [(GKLabel *)v3->_infoLabel setNumberOfLines:2];
    [(GKLabel *)v3->_infoLabel setHidden:1];
    [(GKLabel *)v3->_infoLabel setBackgroundColor:v4];
    [(GKLabel *)v3->_infoLabel setOpaque:0];
    [(GKTurnBasedMatchDetailHeaderView *)v3 addSubview:v3->_playingWithLabel];
    [(GKTurnBasedMatchDetailHeaderView *)v3 addSubview:v3->_startedLabel];
    [(GKTurnBasedMatchDetailHeaderView *)v3 addSubview:v3->_lastTurnLabel];
    [(GKTurnBasedMatchDetailHeaderView *)v3 addSubview:v3->_actionButton];
    [(GKTurnBasedMatchDetailHeaderView *)v3 addSubview:v3->_infoLabel];
    [(GKTurnBasedMatchDetailHeaderView *)v3 addSubview:v3->_avatarView];
    if (v3->_actionButton)
    {
      v36 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x1E4FB1780]);
      actionFocusGuide = v3->_actionFocusGuide;
      v3->_actionFocusGuide = v36;

      v44[0] = v3->_actionButton;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      [(UIFocusGuide *)v3->_actionFocusGuide setPreferredFocusEnvironments:v38];

      [(GKTurnBasedMatchDetailHeaderView *)v3 addLayoutGuide:v3->_actionFocusGuide];
    }
    uint64_t v39 = [MEMORY[0x1E4F1C978] array];
    constraints = v3->_constraints;
    v3->_constraints = (NSArray *)v39;

    [(GKTurnBasedMatchDetailHeaderView *)v3 establishConstraints];
  }
  return v3;
}

- (void)establishConstraints
{
  v85[26] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC8];
  constraints = self->_constraints;
  v4 = self;
  [v2 deactivateConstraints:constraints];
  v5 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  [v5 scaledValueForValue:80.0];
  double v7 = v6;

  v84 = [(GKDashboardPlayerPhotoView *)v4->_avatarView widthAnchor];
  v83 = [v84 constraintEqualToConstant:v7];
  v85[0] = v83;
  v82 = [(GKDashboardPlayerPhotoView *)v4->_avatarView heightAnchor];
  v81 = [v82 constraintEqualToConstant:v7];
  v85[1] = v81;
  v80 = [(GKDashboardPlayerPhotoView *)v4->_avatarView centerXAnchor];
  v79 = [(GKTurnBasedMatchDetailHeaderView *)v4 centerXAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v85[2] = v78;
  v77 = [(GKDashboardPlayerPhotoView *)v4->_avatarView topAnchor];
  v76 = [(GKTurnBasedMatchDetailHeaderView *)v4 topAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:8.0];
  v85[3] = v75;
  v74 = [(UILabel *)v4->_playingWithLabel centerXAnchor];
  v73 = [(GKTurnBasedMatchDetailHeaderView *)v4 centerXAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v85[4] = v72;
  v71 = [(UILabel *)v4->_playingWithLabel topAnchor];
  v70 = [(GKDashboardPlayerPhotoView *)v4->_avatarView bottomAnchor];
  v69 = [v71 constraintEqualToSystemSpacingBelowAnchor:v70 multiplier:1.0];
  v85[5] = v69;
  v68 = [(UILabel *)v4->_playingWithLabel leadingAnchor];
  v67 = [(GKTurnBasedMatchDetailHeaderView *)v4 leadingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:20.0];
  v85[6] = v66;
  v65 = [(UILabel *)v4->_playingWithLabel trailingAnchor];
  v64 = [(GKTurnBasedMatchDetailHeaderView *)v4 trailingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-20.0];
  v85[7] = v63;
  v62 = [(GKLabel *)v4->_startedLabel centerXAnchor];
  v61 = [(GKTurnBasedMatchDetailHeaderView *)v4 centerXAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v85[8] = v60;
  v59 = [(GKLabel *)v4->_startedLabel leadingAnchor];
  v58 = [(UILabel *)v4->_playingWithLabel leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v85[9] = v57;
  v56 = [(GKLabel *)v4->_startedLabel trailingAnchor];
  v55 = [(UILabel *)v4->_playingWithLabel trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v85[10] = v54;
  v53 = [(GKLabel *)v4->_startedLabel topAnchor];
  v52 = [(UILabel *)v4->_playingWithLabel bottomAnchor];
  v51 = [v53 constraintEqualToSystemSpacingBelowAnchor:v52 multiplier:1.0];
  v85[11] = v51;
  v50 = [(GKLabel *)v4->_lastTurnLabel centerXAnchor];
  v49 = [(GKTurnBasedMatchDetailHeaderView *)v4 centerXAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v85[12] = v48;
  v47 = [(GKLabel *)v4->_lastTurnLabel topAnchor];
  v46 = [(GKLabel *)v4->_startedLabel bottomAnchor];
  v45 = [v47 constraintEqualToAnchor:v46 constant:4.0];
  v85[13] = v45;
  v44 = [(GKLabel *)v4->_lastTurnLabel leadingAnchor];
  objc_super v43 = [(UILabel *)v4->_playingWithLabel leadingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v85[14] = v42;
  v41 = [(GKLabel *)v4->_lastTurnLabel trailingAnchor];
  v40 = [(UILabel *)v4->_playingWithLabel trailingAnchor];
  uint64_t v39 = [v41 constraintEqualToAnchor:v40];
  v85[15] = v39;
  v38 = [(GKLabel *)v4->_infoLabel centerXAnchor];
  v36 = [(GKTurnBasedMatchDetailHeaderView *)v4 centerXAnchor];
  v35 = [v38 constraintEqualToAnchor:v36];
  v85[16] = v35;
  v34 = [(GKLabel *)v4->_infoLabel topAnchor];
  v33 = [(GKLabel *)v4->_lastTurnLabel bottomAnchor];
  v32 = [v34 constraintEqualToSystemSpacingBelowAnchor:v33 multiplier:1.0];
  v85[17] = v32;
  v31 = [(GKLabel *)v4->_infoLabel leadingAnchor];
  v30 = [(UILabel *)v4->_playingWithLabel leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v85[18] = v29;
  uint64_t v28 = [(GKLabel *)v4->_infoLabel trailingAnchor];
  v27 = [(UILabel *)v4->_playingWithLabel trailingAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v85[19] = v26;
  v25 = [(UIButton *)v4->_actionButton topAnchor];
  v24 = [(GKLabel *)v4->_infoLabel bottomAnchor];
  v23 = [v25 constraintEqualToSystemSpacingBelowAnchor:v24 multiplier:1.0];
  v85[20] = v23;
  v22 = [(UIButton *)v4->_actionButton centerXAnchor];
  uint64_t v21 = [(GKTurnBasedMatchDetailHeaderView *)v4 centerXAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v85[21] = v20;
  v19 = [(UIFocusGuide *)v4->_actionFocusGuide leadingAnchor];
  v18 = [(GKTurnBasedMatchDetailHeaderView *)v4 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v85[22] = v17;
  double v8 = [(UIFocusGuide *)v4->_actionFocusGuide trailingAnchor];
  double v9 = [(GKTurnBasedMatchDetailHeaderView *)v4 trailingAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  v85[23] = v10;
  v11 = [(UIFocusGuide *)v4->_actionFocusGuide topAnchor];
  uint64_t v12 = [(UIButton *)v4->_actionButton topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v85[24] = v13;
  v14 = [(UIFocusGuide *)v4->_actionFocusGuide bottomAnchor];
  v15 = [(UIButton *)v4->_actionButton bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v85[25] = v16;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:26];

  [MEMORY[0x1E4F28DC8] activateConstraints:v37];
  [(GKTurnBasedMatchDetailHeaderView *)v4 setConstraints:v37];
}

- (void)setLabelAlpha:(double)a3
{
  -[UILabel setAlpha:](self->_playingWithLabel, "setAlpha:");
  [(GKLabel *)self->_startedLabel setAlpha:a3];
  [(GKLabel *)self->_lastTurnLabel setAlpha:a3];
  infoLabel = self->_infoLabel;

  [(GKLabel *)infoLabel setAlpha:a3];
}

- (void)setMatch:(id)a3
{
  v5 = (GKTurnBasedMatch *)a3;
  p_match = &self->_match;
  if (self->_match != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_match, a3);
    p_match = (GKTurnBasedMatch **)[(GKTurnBasedMatchDetailHeaderView *)self didUpdateModel];
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_match, v5);
}

- (NSString)actionText
{
  v2 = [(UIButton *)self->_actionButton titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setActionText:(id)a3
{
  [(UIButton *)self->_actionButton setTitle:a3 forState:0];
  [(UIButton *)self->_actionButton sizeToFit];

  [(GKTurnBasedMatchDetailHeaderView *)self didUpdateModel];
}

- (void)setInfoText:(id)a3
{
  double v7 = (NSString *)a3;
  if (self->_infoText != v7)
  {
    objc_storeStrong((id *)&self->_infoText, a3);
    [(GKLabel *)self->_infoLabel setText:v7];
    uint64_t v5 = [(NSString *)v7 length];
    BOOL v6 = v5 == 0;
    [(UIButton *)self->_actionButton setHidden:v5 != 0];
    [(GKLabel *)self->_infoLabel setHidden:v6];
    [(GKTurnBasedMatchDetailHeaderView *)self didUpdateModel];
  }
}

- (NSString)playingWithString
{
  v3 = [(GKTurnBasedMatch *)self->_match showcasePlayer];
  v4 = [v3 displayNameWithOptions:0];
  uint64_t v5 = [(GKTurnBasedMatchDetailHeaderView *)self avatarView];
  [v5 setPlayer:v3 completionHandler:0];

  return (NSString *)v4;
}

- (void)didUpdateModel
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F639F8] textStyle];
  v4 = [(GKTurnBasedMatchDetailHeaderView *)self playingWithString];
  [(UILabel *)self->_playingWithLabel setText:v4];

  uint64_t v5 = NSString;
  BOOL v6 = GKGameCenterUIFrameworkBundle();
  double v7 = GKGetLocalizedStringFromTableInBundle();
  double v8 = [(GKTurnBasedMatch *)self->_match creationDate];
  double v9 = [v8 _gkFormattedDateForStyle:2 relative:0];
  uint64_t v10 = objc_msgSend(v5, "stringWithFormat:", v7, v9);

  v11 = [v3 caption1];
  uint64_t v12 = [v11 centered];
  v26 = v10;
  v13 = [v10 _gkAttributedStringByApplyingStyle:v12];
  [(GKLabel *)self->_startedLabel setAttributedText:v13];

  v14 = [(GKTurnBasedMatch *)self->_match lastTurnDate];
  if (v14)
  {
    v15 = NSString;
    v16 = GKGameCenterUIFrameworkBundle();
    v17 = GKGetLocalizedStringFromTableInBundle();
    v18 = [v14 _gkFormattedWhenStringWithOptions:0];
    objc_msgSend(v15, "stringWithFormat:", v17, v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = &stru_1F07B2408;
  }
  v27 = @"when";
  v20 = [v3 caption1];
  uint64_t v21 = [v20 centered];
  v28[0] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v23 = [v3 caption1];
  v24 = [v23 centered];
  v25 = [(__CFString *)v19 _gkAttributedStringByApplyingStylesForTags:v22 untaggedStyle:v24];
  [(GKLabel *)self->_lastTurnLabel setAttributedText:v25];

  [(GKTurnBasedMatchDetailHeaderView *)self establishConstraints];
}

- (void)actionPressed:(id)a3
{
  id v14 = a3;
  p_actionTarget = &self->_actionTarget;
  id WeakRetained = objc_loadWeakRetained(&self->_actionTarget);
  if (WeakRetained)
  {
    BOOL v6 = WeakRetained;
    p_actionSelector = &self->_actionSelector;
    if (self->_actionSelector)
    {

      id v8 = objc_loadWeakRetained(p_actionTarget);
      double v9 = v8;
      if (*p_actionSelector) {
        SEL v10 = *p_actionSelector;
      }
      else {
        SEL v10 = 0;
      }
      v11 = (void (*)(id, SEL))[v8 methodForSelector:v10];

      id v12 = objc_loadWeakRetained(p_actionTarget);
      BOOL v6 = v12;
      if (*p_actionSelector) {
        SEL v13 = *p_actionSelector;
      }
      else {
        SEL v13 = 0;
      }
      v11(v12, v13);
    }
  }
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (NSString)infoText
{
  return self->_infoText;
}

- (id)actionTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_actionTarget);

  return WeakRetained;
}

- (void)setActionTarget:(id)a3
{
}

- (SEL)actionSelector
{
  if (self->_actionSelector) {
    return self->_actionSelector;
  }
  else {
    return 0;
  }
}

- (void)setActionSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_actionSelector = v3;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UILabel)playingWithLabel
{
  return self->_playingWithLabel;
}

- (void)setPlayingWithLabel:(id)a3
{
}

- (GKLabel)startedLabel
{
  return self->_startedLabel;
}

- (void)setStartedLabel:(id)a3
{
}

- (GKLabel)lastTurnLabel
{
  return self->_lastTurnLabel;
}

- (void)setLastTurnLabel:(id)a3
{
}

- (GKLabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (GKDashboardPlayerPhotoView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UIFocusGuide)actionFocusGuide
{
  return self->_actionFocusGuide;
}

- (void)setActionFocusGuide:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_actionFocusGuide, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_lastTurnLabel, 0);
  objc_storeStrong((id *)&self->_startedLabel, 0);
  objc_storeStrong((id *)&self->_playingWithLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_destroyWeak(&self->_actionTarget);
  objc_storeStrong((id *)&self->_infoText, 0);

  objc_storeStrong((id *)&self->_match, 0);
}

@end