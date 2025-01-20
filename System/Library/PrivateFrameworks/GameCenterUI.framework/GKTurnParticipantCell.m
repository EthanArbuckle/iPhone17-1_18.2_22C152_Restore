@interface GKTurnParticipantCell
+ (double)defaultRowHeight;
+ (id)itemHeightList;
+ (void)registerCellClassesForCollectionView:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isDetail;
- (BOOL)matchWantsLocalPlayerAttention;
- (BOOL)needsRefreshOverlappingPlayersView;
- (GKFocusableButton)detailButton;
- (GKLabel)bottomLabel;
- (GKTurnBasedMatch)match;
- (GKTurnBasedParticipant)participant;
- (GKTurnParticipantCell)initWithFrame:(CGRect)a3;
- (NSArray)constraints;
- (NSArray)previousParticipants;
- (NSDictionary)playerAvatarMapping;
- (NSLayoutConstraint)detailButtonConstraint;
- (NSLayoutConstraint)iconLeadingConstraint;
- (NSLayoutConstraint)overlappingPlayersViewTrailingConstraint;
- (NSLayoutConstraint)overlappingPlayersViewWidthConstraint;
- (NSLayoutConstraint)statusImageTrailingConstraint;
- (NSLayoutConstraint)textContainerTrailingConstraint;
- (NSLayoutConstraint)textStackViewToIconViewLeadingConstraint;
- (NSLayoutConstraint)textStackViewToSuperViewLeadingConstraint;
- (SEL)detailPressedAction;
- (UIEdgeInsets)insets;
- (UIImageView)statusImageView;
- (UILabel)additionalPlayerCountLabel;
- (UIStackView)textStackView;
- (UIView)divider;
- (UIView)overlappingPlayersViewContainer;
- (_TtC12GameCenterUI22OverlappingPlayersView)overlappingPlayersView;
- (double)getOverlappingPlayerAvatarIconSize;
- (id)getPlayerIDForAllNonAutomatchedTurnBasedParticipants;
- (void)configureForDetail;
- (void)configureForMatch;
- (void)configureOverlappingPlayersView;
- (void)detailPressed:(id)a3;
- (void)didUpdateModel;
- (void)establishConstraints;
- (void)setAdditionalPlayerCountLabel:(id)a3;
- (void)setBottomLabel:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDetailButton:(id)a3;
- (void)setDetailButtonConstraint:(id)a3;
- (void)setDetailPressedAction:(SEL)a3;
- (void)setDivider:(id)a3;
- (void)setIconLeadingConstraint:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setIsDetail:(BOOL)a3;
- (void)setMatch:(id)a3;
- (void)setOverlappingPlayersView:(id)a3;
- (void)setOverlappingPlayersViewContainer:(id)a3;
- (void)setOverlappingPlayersViewTrailingConstraint:(id)a3;
- (void)setOverlappingPlayersViewWidthConstraint:(id)a3;
- (void)setParticipant:(id)a3;
- (void)setPlayerAvatarMapping:(id)a3;
- (void)setPreviousParticipants:(id)a3;
- (void)setStatusImageTrailingConstraint:(id)a3;
- (void)setStatusImageView:(id)a3;
- (void)setTextContainerTrailingConstraint:(id)a3;
- (void)setTextStackView:(id)a3;
- (void)setTextStackViewToIconViewLeadingConstraint:(id)a3;
- (void)setTextStackViewToSuperViewLeadingConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMarginConstraints;
- (void)updateOverlappingPlayerViewsAvatar;
- (void)updateUIBasedOnTraitCollection;
@end

@implementation GKTurnParticipantCell

+ (void)registerCellClassesForCollectionView:(id)a3
{
  id v3 = a3;
  [v3 _gkRegisterCellClass:objc_opt_class()];
}

+ (double)defaultRowHeight
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 != 1) {
    return 65.0;
  }
  if (*MEMORY[0x1E4F63A38]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = *MEMORY[0x1E4F63830] == 0;
  }
  double result = 65.0;
  if (v4) {
    return 90.0;
  }
  return result;
}

+ (id)itemHeightList
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v4 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v4 = 0), v4))
  {
    uint64_t v9 = *MEMORY[0x1E4FB28C8];
    v12[0] = @"GKFixedHeightSentinel";
    v12[1] = v9;
    v13[0] = &unk_1F0812570;
    v13[1] = &unk_1F0812618;
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = v13;
    v8 = v12;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4FB28C8];
    v14[0] = @"GKFixedHeightSentinel";
    v14[1] = v5;
    v15[0] = &unk_1F0812558;
    v15[1] = &unk_1F0812618;
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = v15;
    v8 = v14;
  }
  v10 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:2];

  return v10;
}

- (GKTurnParticipantCell)initWithFrame:(CGRect)a3
{
  v57.receiver = self;
  v57.super_class = (Class)GKTurnParticipantCell;
  uint64_t v3 = -[GKBasePlayerCell initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F639F8] textStyle];
    uint64_t v5 = objc_alloc_init(GKLabel);
    v6 = [v4 body];
    [(GKLabel *)v5 applyTextStyle:v6];

    [(GKLabel *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)v5 setNumberOfLines:2];
    v7 = [(GKBasePlayerCell *)v3 nameLabel];
    [v7 removeFromSuperview];

    [(GKBasePlayerCell *)v3 setNameLabel:v5];
    v8 = objc_alloc_init(GKLabel);
    bottomLabel = v3->_bottomLabel;
    v3->_bottomLabel = v8;

    v10 = v3->_bottomLabel;
    v11 = [v4 footnote];
    v12 = [v11 emphasized];
    [(GKLabel *)v10 applyTextStyle:v12];

    [(GKLabel *)v3->_bottomLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKLabel *)v3->_bottomLabel setNumberOfLines:1];
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    statusImageView = v3->_statusImageView;
    v3->_statusImageView = v13;

    [(UIImageView *)v3->_statusImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle.fill"];
    v16 = [v15 imageWithRenderingMode:2];
    [(UIImageView *)v3->_statusImageView setImage:v16];

    [(UIImageView *)v3->_statusImageView setContentMode:1];
    v17 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v3->_statusImageView setTintColor:v17];

    [(UIImageView *)v3->_statusImageView setHidden:1];
    id v18 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v18 setAxis:0];
    [v18 setAlignment:3];
    [v18 setDistribution:0];
    [v18 setSpacing:2.0];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v18 addArrangedSubview:v3->_statusImageView];
    [v18 addArrangedSubview:v3->_bottomLabel];
    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    textStackView = v3->_textStackView;
    v3->_textStackView = v19;

    [(UIStackView *)v3->_textStackView setAxis:1];
    [(UIStackView *)v3->_textStackView setAlignment:1];
    [(UIStackView *)v3->_textStackView setDistribution:0];
    [(UIStackView *)v3->_textStackView setSpacing:2.0];
    [(UIStackView *)v3->_textStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = v3->_textStackView;
    v22 = [(GKBasePlayerCell *)v3 nameLabel];
    [(UIStackView *)v21 addArrangedSubview:v22];

    [(UIStackView *)v3->_textStackView addArrangedSubview:v18];
    v23 = [(GKCollectionViewCell *)v3 staticContentView];
    [v23 addSubview:v3->_textStackView];

    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    overlappingPlayersViewContainer = v3->_overlappingPlayersViewContainer;
    v3->_overlappingPlayersViewContainer = v24;

    [(UIView *)v3->_overlappingPlayersViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v26) = 1148829696;
    [(UIView *)v3->_overlappingPlayersViewContainer setContentHuggingPriority:0 forAxis:v26];
    LODWORD(v27) = 1148829696;
    [(UIView *)v3->_overlappingPlayersViewContainer setContentHuggingPriority:1 forAxis:v27];
    LODWORD(v28) = 1120403456;
    [(UIView *)v3->_overlappingPlayersViewContainer setContentCompressionResistancePriority:0 forAxis:v28];
    LODWORD(v29) = 1120403456;
    [(UIView *)v3->_overlappingPlayersViewContainer setContentCompressionResistancePriority:1 forAxis:v29];
    v30 = [(GKCollectionViewCell *)v3 staticContentView];
    [v30 addSubview:v3->_overlappingPlayersViewContainer];

    v31 = [_TtC12GameCenterUI22OverlappingPlayersView alloc];
    uint64_t v32 = -[OverlappingPlayersView initWithFrame:](v31, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    overlappingPlayersView = v3->_overlappingPlayersView;
    v3->_overlappingPlayersView = (_TtC12GameCenterUI22OverlappingPlayersView *)v32;

    [(OverlappingPlayersView *)v3->_overlappingPlayersView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(OverlappingPlayersView *)v3->_overlappingPlayersView setOverlapPercentage:0.75];
    [(UIView *)v3->_overlappingPlayersViewContainer addSubview:v3->_overlappingPlayersView];
    [(UIView *)v3->_overlappingPlayersViewContainer setClipsToBounds:0];
    [(OverlappingPlayersView *)v3->_overlappingPlayersView setClipsToBounds:0];
    [MEMORY[0x1E4F28DC8] _gkInstallEdgeConstraintsForView:v3->_overlappingPlayersView containedWithinParentView:v3->_overlappingPlayersViewContainer];
    v34 = +[GKFocusableButton buttonWithType:3];
    [(GKTurnParticipantCell *)v3 setDetailButton:v34];

    -[GKFocusableButton _setTouchInsets:](v3->_detailButton, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(GKFocusableButton *)v3->_detailButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKFocusableButton *)v3->_detailButton addTarget:v3 action:sel_detailPressed_ forControlEvents:0x2000];
    [(GKFocusableButton *)v3->_detailButton setHidden:1];
    v35 = [MEMORY[0x1E4FB1618] whiteColor];
    [(GKFocusableButton *)v3->_detailButton setTintColor:v35];

    v36 = [(GKCollectionViewCell *)v3 staticContentView];
    [v36 addSubview:v3->_detailButton];

    v37 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    divider = v3->_divider;
    v3->_divider = v37;

    v39 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    [(UIView *)v3->_divider setBackgroundColor:v39];

    [(UIView *)v3->_divider setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [(GKCollectionViewCell *)v3 staticContentView];
    [v40 addSubview:v3->_divider];

    v41 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    additionalPlayerCountLabel = v3->_additionalPlayerCountLabel;
    v3->_additionalPlayerCountLabel = v41;

    v43 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v3->_additionalPlayerCountLabel setFont:v43];

    [(UILabel *)v3->_additionalPlayerCountLabel setAdjustsFontForContentSizeCategory:1];
    v44 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v3->_additionalPlayerCountLabel setTextColor:v44];

    [(UILabel *)v3->_additionalPlayerCountLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v45 = [(GKCollectionViewCell *)v3 staticContentView];
    [v45 addSubview:v3->_additionalPlayerCountLabel];

    uint64_t v46 = [MEMORY[0x1E4F1C978] array];
    constraints = v3->_constraints;
    v3->_constraints = (NSArray *)v46;

    [(GKTurnParticipantCell *)v3 establishConstraints];
    [(GKTurnParticipantCell *)v3 updateUIBasedOnTraitCollection];
    v48 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0700000003];
    v49 = [(GKCollectionViewCell *)v3 staticContentView];
    [v49 setBackgroundColor:v48];

    [(GKTurnParticipantCell *)v3 setClipsToBounds:1];
    uint64_t v50 = *MEMORY[0x1E4F39EA8];
    v51 = [(GKTurnParticipantCell *)v3 layer];
    [v51 setCornerCurve:v50];

    v52 = (void *)MEMORY[0x1E4FB14C0];
    [(GKFocusableButton *)v3->_detailButton bounds];
    CGRect v59 = CGRectInset(v58, 1.0, 1.0);
    v53 = objc_msgSend(v52, "bezierPathWithOvalInRect:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
    v54 = [MEMORY[0x1E4FB1788] effectWithPath:v53];
    [(GKFocusableButton *)v3->_detailButton setFocusEffect:v54];

    v55 = [MEMORY[0x1E4FB1618] whiteColor];
    [(GKTurnParticipantCell *)v3 setTintColor:v55];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKTurnParticipantCell;
  [(GKTurnParticipantCell *)&v4 traitCollectionDidChange:a3];
  [(GKTurnParticipantCell *)self updateUIBasedOnTraitCollection];
}

- (void)updateUIBasedOnTraitCollection
{
  [(GKTurnParticipantCell *)self establishConstraints];
  uint64_t v3 = [(GKTurnParticipantCell *)self traitCollection];
  objc_super v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = [(GKBasePlayerCell *)self nameLabel];
  v7 = v6;
  if (IsAccessibilityCategory) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  if (IsAccessibilityCategory) {
    double v9 = 0.649999976;
  }
  else {
    double v9 = 0.75;
  }
  [v6 setNumberOfLines:v8];

  [(OverlappingPlayersView *)self->_overlappingPlayersView setOverlapPercentage:v9];
  v10 = [(GKTurnParticipantCell *)self overlappingPlayersView];
  v11 = [(NSDictionary *)self->_playerAvatarMapping allValues];
  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  double v13 = v12;
  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  objc_msgSend(v10, "applyWithPlayerAvatars:playerSize:", v11, v13, v14);

  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  double v16 = -5.0 - v15;
  id v17 = [(GKTurnParticipantCell *)self overlappingPlayersViewTrailingConstraint];
  [v17 setConstant:v16];
}

- (double)getOverlappingPlayerAvatarIconSize
{
  uint64_t v3 = [MEMORY[0x1E4FB17A8] defaultMetrics];
  objc_super v4 = [(GKTurnParticipantCell *)self traitCollection];
  uint64_t v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);
  double v7 = 30.0;
  if (IsAccessibilityCategory) {
    double v7 = 20.0;
  }
  [v3 scaledValueForValue:v7];
  double v9 = v8;

  return v9;
}

- (void)establishConstraints
{
  v132[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKCollectionViewCell *)self staticContentView];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  v125 = [MEMORY[0x1E4F1CA48] array];
  v120 = [(GKBasePlayerCell *)self iconView];
  v118 = [v120 widthAnchor];
  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  v116 = objc_msgSend(v118, "constraintEqualToConstant:");
  v132[0] = v116;
  v114 = [(GKBasePlayerCell *)self iconView];
  v112 = [v114 heightAnchor];
  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  v110 = objc_msgSend(v112, "constraintEqualToConstant:");
  v132[1] = v110;
  v108 = [(UIImageView *)self->_statusImageView widthAnchor];
  v106 = [v108 constraintEqualToConstant:8.0];
  v132[2] = v106;
  v104 = [(UIImageView *)self->_statusImageView heightAnchor];
  v102 = [v104 constraintEqualToConstant:8.0];
  v132[3] = v102;
  v100 = [(UIView *)self->_divider heightAnchor];
  v98 = [v100 constraintEqualToConstant:1.0];
  v132[4] = v98;
  v96 = [(UIView *)self->_divider bottomAnchor];
  v122 = v3;
  v94 = [v3 bottomAnchor];
  v92 = [v96 constraintEqualToAnchor:v94 constant:0.0];
  v132[5] = v92;
  v89 = [(UILabel *)self->_additionalPlayerCountLabel trailingAnchor];
  v87 = [(GKFocusableButton *)self->_detailButton leadingAnchor];
  v85 = [v89 constraintEqualToAnchor:v87 constant:-2.0];
  v132[6] = v85;
  v83 = [(GKTurnParticipantCell *)self detailButton];
  v79 = [v83 trailingAnchor];
  v81 = [(GKFocusableButton *)self->_detailButton superview];
  objc_super v4 = [v81 trailingAnchor];
  uint64_t v5 = [v79 constraintEqualToAnchor:v4 constant:-16.0];
  [(GKTurnParticipantCell *)self setDetailButtonConstraint:v5];
  v132[7] = v5;
  v6 = [(OverlappingPlayersView *)self->_overlappingPlayersView bottomAnchor];
  double v7 = [(GKFocusableButton *)self->_detailButton bottomAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  v132[8] = v8;
  double v9 = [(UIView *)self->_overlappingPlayersViewContainer trailingAnchor];
  v10 = [(UILabel *)self->_additionalPlayerCountLabel leadingAnchor];
  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  double v12 = [v9 constraintEqualToAnchor:v10 constant:-5.0 - v11];
  [(GKTurnParticipantCell *)self setOverlappingPlayersViewTrailingConstraint:v12];
  v132[9] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:10];
  [(NSArray *)v125 addObjectsFromArray:v13];

  LODWORD(v10) = self->_isDetail;
  double v14 = [(UIView *)self->_divider leadingAnchor];
  if (v10)
  {
    double v15 = v122;
    double v16 = [v122 leadingAnchor];
    id v17 = [v14 constraintEqualToAnchor:v16 constant:20.0];
    v131[0] = v17;
    id v18 = [(UIView *)self->_divider trailingAnchor];
    v19 = [v122 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19 constant:-20.0];
    v131[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
    [(NSArray *)v125 addObjectsFromArray:v21];
  }
  else
  {
    double v16 = [(GKTurnParticipantCell *)self textStackView];
    id v17 = [v16 leadingAnchor];
    id v18 = [v14 constraintEqualToAnchor:v17 constant:0.0];
    v130[0] = v18;
    v19 = [(UIView *)self->_divider trailingAnchor];
    v20 = [(GKTurnParticipantCell *)self detailButton];
    v21 = [v20 trailingAnchor];
    v22 = [v19 constraintEqualToAnchor:v21 constant:0.0];
    v130[1] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
    [(NSArray *)v125 addObjectsFromArray:v23];

    double v15 = v122;
  }

  v24 = [(GKTurnParticipantCell *)self traitCollection];
  v25 = [v24 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

  if (IsAccessibilityCategory)
  {
    v78 = [(GKBasePlayerCell *)self iconView];
    v77 = [v78 leadingAnchor];
    uint64_t v76 = [v15 leadingAnchor];
    uint64_t v27 = [v77 constraintEqualToAnchor:v76 constant:8.0];
    [(GKTurnParticipantCell *)self setIconLeadingConstraint:v27];
    v123 = (void *)v27;
    v129[0] = v27;
    v121 = [(GKBasePlayerCell *)self iconView];
    double v28 = [v121 topAnchor];
    v117 = [v15 topAnchor];
    v119 = v28;
    v115 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", 16.0);
    v129[1] = v115;
    v113 = [(GKTurnParticipantCell *)self textStackView];
    double v29 = [v113 leadingAnchor];
    v109 = [v15 leadingAnchor];
    v111 = v29;
    uint64_t v30 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", 8.0);
    [(GKTurnParticipantCell *)self setTextStackViewToIconViewLeadingConstraint:v30];
    v107 = (void *)v30;
    v129[2] = v30;
    v105 = [(GKTurnParticipantCell *)self textStackView];
    v31 = [v105 trailingAnchor];
    v101 = [v15 trailingAnchor];
    v103 = v31;
    uint64_t v32 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", -8.0);
    [(GKTurnParticipantCell *)self setTextContainerTrailingConstraint:v32];
    v99 = (void *)v32;
    v129[3] = v32;
    v97 = [(GKTurnParticipantCell *)self textStackView];
    v33 = [v97 topAnchor];
    v93 = [(GKTurnParticipantCell *)self detailButton];
    [v93 bottomAnchor];
    v91 = v95 = v33;
    v90 = objc_msgSend(v33, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", 1.1);
    v129[4] = v90;
    v34 = [(UILabel *)self->_additionalPlayerCountLabel centerYAnchor];
    [(GKFocusableButton *)self->_detailButton centerYAnchor];
    v88 = v124 = v34;
    v86 = objc_msgSend(v34, "constraintEqualToAnchor:");
    v129[5] = v86;
    v84 = [(GKTurnParticipantCell *)self detailButton];
    v35 = [v84 topAnchor];
    v80 = [v15 topAnchor];
    v82 = v35;
    v36 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", 8.0);
    v129[6] = v36;
    v37 = [(UIView *)self->_overlappingPlayersViewContainer widthAnchor];
    v38 = [v37 constraintEqualToConstant:120.0];
    [(GKTurnParticipantCell *)self setOverlappingPlayersViewWidthConstraint:v38];
    v129[7] = v38;
    v39 = [(OverlappingPlayersView *)self->_overlappingPlayersView topAnchor];
    v40 = [(GKFocusableButton *)self->_detailButton topAnchor];
    [v39 constraintEqualToAnchor:v40 constant:8.0];
    v42 = v41 = v15;
    v129[8] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:9];
    v44 = v125;
    [(NSArray *)v125 addObjectsFromArray:v43];

    v45 = v78;
    double v15 = v41;
    uint64_t v46 = (void *)v76;

    v47 = v77;
  }
  else
  {
    BOOL isDetail = self->_isDetail;
    v49 = [(GKTurnParticipantCell *)self textStackView];
    uint64_t v50 = [v49 trailingAnchor];
    if (isDetail)
    {
      v51 = [v15 trailingAnchor];
      v52 = [v50 constraintEqualToAnchor:v51 constant:-8.0];
      [(GKTurnParticipantCell *)self setTextContainerTrailingConstraint:v52];
      v128 = v52;
      v53 = &v128;
    }
    else
    {
      v51 = [(UIView *)self->_overlappingPlayersViewContainer leadingAnchor];
      v52 = [v50 constraintEqualToAnchor:v51 constant:0.0];
      [(GKTurnParticipantCell *)self setTextContainerTrailingConstraint:v52];
      v127 = v52;
      v53 = &v127;
    }
    v44 = v125;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    [(NSArray *)v125 addObjectsFromArray:v54];

    v45 = [(GKBasePlayerCell *)self iconView];
    v55 = [v45 leadingAnchor];
    uint64_t v56 = [v15 leadingAnchor];
    objc_super v57 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v58 = [v57 userInterfaceIdiom];

    double v59 = 15.0;
    if (v58 == 1)
    {
      if (*MEMORY[0x1E4F63A38]) {
        BOOL v60 = 1;
      }
      else {
        BOOL v60 = *MEMORY[0x1E4F63830] == 0;
      }
      if (v60) {
        double v59 = 25.0;
      }
    }
    v47 = v55;
    uint64_t v46 = (void *)v56;
    uint64_t v61 = [v55 constraintEqualToAnchor:v56 constant:v59];
    [(GKTurnParticipantCell *)self setIconLeadingConstraint:v61];
    v123 = (void *)v61;
    v126[0] = v61;
    v121 = [(GKBasePlayerCell *)self iconView];
    v62 = [v121 centerYAnchor];
    v117 = [v15 centerYAnchor];
    v119 = v62;
    v115 = objc_msgSend(v62, "constraintEqualToAnchor:");
    v126[1] = v115;
    v113 = [(GKTurnParticipantCell *)self textStackView];
    v63 = [v113 leadingAnchor];
    v109 = [(GKBasePlayerCell *)self iconView];
    [v109 trailingAnchor];
    v107 = v111 = v63;
    uint64_t v64 = objc_msgSend(v63, "constraintEqualToAnchor:constant:", 8.0);
    [(GKTurnParticipantCell *)self setTextStackViewToIconViewLeadingConstraint:v64];
    v105 = (void *)v64;
    v126[2] = v64;
    v103 = [(GKTurnParticipantCell *)self textStackView];
    v65 = [v103 centerYAnchor];
    v99 = [v15 centerYAnchor];
    v101 = v65;
    v97 = objc_msgSend(v65, "constraintEqualToAnchor:");
    v126[3] = v97;
    v66 = [(UILabel *)self->_additionalPlayerCountLabel centerYAnchor];
    v93 = [v15 centerYAnchor];
    v95 = v66;
    v91 = objc_msgSend(v66, "constraintEqualToAnchor:");
    v126[4] = v91;
    v90 = [(GKTurnParticipantCell *)self detailButton];
    v67 = [v90 centerYAnchor];
    [v15 centerYAnchor];
    v88 = v124 = v67;
    v86 = objc_msgSend(v67, "constraintEqualToAnchor:");
    v126[5] = v86;
    v84 = [(UIView *)self->_overlappingPlayersViewContainer widthAnchor];
    uint64_t v68 = [v84 constraintEqualToConstant:60.0];
    [(GKTurnParticipantCell *)self setOverlappingPlayersViewWidthConstraint:v68];
    v82 = (void *)v68;
    v126[6] = v68;
    v69 = [(OverlappingPlayersView *)self->_overlappingPlayersView topAnchor];
    v36 = [(GKFocusableButton *)self->_detailButton topAnchor];
    v80 = v69;
    v37 = [v69 constraintEqualToAnchor:v36 constant:-2.0];
    v126[7] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:8];
    [(NSArray *)v125 addObjectsFromArray:v38];
  }

  constraints = self->_constraints;
  self->_constraints = v44;
  v71 = v44;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  v72 = [(GKTurnParticipantCell *)self textStackView];
  v73 = [v72 leadingAnchor];
  v74 = [v15 leadingAnchor];
  v75 = [v73 constraintEqualToAnchor:v74 constant:15.0];
  [(GKTurnParticipantCell *)self setTextStackViewToSuperViewLeadingConstraint:v75];

  [(GKTurnParticipantCell *)self updateMarginConstraints];
}

- (BOOL)matchWantsLocalPlayerAttention
{
  v2 = [(GKTurnParticipantCell *)self match];
  int v3 = [v2 state];

  return v3 == 2 || (v3 & 0xFFFFFFFD) == 1;
}

- (void)didUpdateModel
{
  v3.receiver = self;
  v3.super_class = (Class)GKTurnParticipantCell;
  [(GKBasePlayerCell *)&v3 didUpdateModel];
  if (self->_isDetail) {
    [(GKTurnParticipantCell *)self configureForDetail];
  }
  else {
    [(GKTurnParticipantCell *)self configureForMatch];
  }
  [(GKTurnParticipantCell *)self establishConstraints];
}

- (void)configureForMatch
{
  id v35 = [MEMORY[0x1E4F639F8] textStyle];
  v6 = [(GKTurnParticipantCell *)self match];
  double v7 = [(GKBasePlayerCell *)self iconView];
  [v7 setHidden:1];

  double v8 = [(GKTurnParticipantCell *)self textStackViewToIconViewLeadingConstraint];
  [v8 setActive:0];

  double v9 = [(GKTurnParticipantCell *)self textStackViewToSuperViewLeadingConstraint];
  [v9 setActive:1];

  v10 = [v6 message];
  v34 = v6;
  switch([v6 state])
  {
    case 1u:
      double v11 = [v6 currentParticipant];
      double v12 = [v11 inviteMessage];

      if (v12 && [v12 length]) {
        goto LABEL_13;
      }
      goto LABEL_14;
    case 2u:
      double v13 = [v6 activeExchanges];
      double v12 = [v13 lastObject];
      v2 = [v12 message];

      if (!v2 || ![v2 length])
      {
        double v14 = GKGameCenterUIFrameworkBundle();
        uint64_t v15 = GKGetLocalizedStringFromTableInBundle();

        v2 = (void *)v15;
      }
      goto LABEL_16;
    case 3u:
      goto LABEL_15;
    case 4u:
      double v16 = [(GKBasePlayerCell *)self player];

      if (v16
        && ([(GKBasePlayerCell *)self player],
            id v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v17 isAutomatchPlayer],
            v17,
            !v18))
      {
        v31 = NSString;
        double v13 = GKGameCenterUIFrameworkBundle();
        double v12 = GKGetLocalizedStringFromTableInBundle();
        uint64_t v32 = [(GKBasePlayerCell *)self player];
        objc_super v3 = [v32 displayNameWithOptions:1];
        v2 = objc_msgSend(v31, "stringWithFormat:", v12, v3);
      }
      else
      {
LABEL_15:
        double v13 = GKGameCenterUIFrameworkBundle();
        v2 = GKGetLocalizedStringFromTableInBundle();
        double v12 = v10;
      }
      goto LABEL_16;
    case 5u:
      v19 = [v6 localPlayerParticipant];
      v20 = [(GKTurnParticipantCell *)self match];
      v2 = [v20 participants];
      double v12 = objc_msgSend(v19, "matchOutcomeStringForLocalPlayer:", objc_msgSend(v2, "count"));

      if (v12 && [v12 length])
      {
LABEL_13:
        v10 = v12;
      }
      else
      {
LABEL_14:
        double v13 = GKGameCenterUIFrameworkBundle();
        v2 = GKGetLocalizedStringFromTableInBundle();
LABEL_16:

        v10 = v2;
      }
LABEL_17:
      v21 = [v35 footnote];
      v22 = [v10 _gkAttributedStringByApplyingStyle:v21];
      [(GKLabel *)self->_bottomLabel setAttributedText:v22];

      [(UIImageView *)self->_statusImageView setHidden:[(GKTurnParticipantCell *)self matchWantsLocalPlayerAttention] ^ 1];
      v23 = [(GKTurnParticipantCell *)self match];
      v24 = [v23 participants];
      unint64_t v25 = [v24 count];
      v33 = v10;
      if (v25 < 5)
      {
        uint64_t v27 = &stru_1F07B2408;
      }
      else
      {
        double v26 = NSString;
        v2 = GKGameCenterUIFrameworkBundle();
        objc_super v3 = GKGetLocalizedStringFromTableInBundle();
        v10 = [(GKTurnParticipantCell *)self match];
        objc_super v4 = [v10 participants];
        objc_msgSend(v26, "stringWithFormat:", v3, objc_msgSend(v4, "count") - 4, v33, v34);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      double v28 = [(GKTurnParticipantCell *)self additionalPlayerCountLabel];
      [v28 setText:v27];

      if (v25 >= 5)
      {
      }
      double v29 = [(GKTurnBasedMatch *)self->_match matchTitle];
      uint64_t v30 = [(GKBasePlayerCell *)self nameLabel];
      [v30 setText:v29];

      [(GKTurnParticipantCell *)self configureOverlappingPlayersView];

      return;
    default:
      goto LABEL_17;
  }
}

- (id)getPlayerIDForAllNonAutomatchedTurnBasedParticipants
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v4 = [(GKTurnParticipantCell *)self match];
  uint64_t v5 = [v4 participants];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      if ((unint64_t)[v3 count] > 3) {
        break;
      }
      double v11 = [v10 player];

      if (v11)
      {
        double v12 = [v10 player];
        double v13 = [v12 internal];
        double v14 = [v13 playerID];
        [v3 addObject:v14];
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v3;
}

- (BOOL)needsRefreshOverlappingPlayersView
{
  objc_super v3 = [(GKTurnParticipantCell *)self getPlayerIDForAllNonAutomatchedTurnBasedParticipants];
  objc_super v4 = [(GKTurnParticipantCell *)self playerAvatarMapping];
  uint64_t v5 = [v4 allKeys];
  char v6 = [v3 isEqualToArray:v5] ^ 1;

  return v6;
}

- (void)configureOverlappingPlayersView
{
  if ([(GKTurnParticipantCell *)self needsRefreshOverlappingPlayersView])
  {
    objc_super v3 = [(GKTurnParticipantCell *)self overlappingPlayersView];
    [v3 prepareForReuse];

    objc_super v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [(GKTurnParticipantCell *)self setPlayerAvatarMapping:v4];

    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    uint64_t v5 = (void *)MEMORY[0x1E4F636D8];
    char v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnCell.m", 413, "-[GKTurnParticipantCell configureOverlappingPlayersView]");
    uint64_t v7 = [v5 dispatchGroupWithName:v6];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke;
    v17[3] = &unk_1E5F64138;
    v17[4] = self;
    long long v19 = v20;
    id v8 = v7;
    id v18 = v8;
    [v8 perform:v17];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_6;
    v14[3] = &unk_1E5F63350;
    id v9 = v8;
    id v15 = v9;
    long long v16 = self;
    [v9 notifyOnMainQueueWithBlock:v14];
    v10 = [(GKTurnParticipantCell *)self match];
    double v11 = [v10 participants];
    uint64_t v12 = [v11 count];

    if (!v12)
    {
      double v13 = [(GKTurnParticipantCell *)self overlappingPlayersViewWidthConstraint];
      [v13 setConstant:0.0];
    }
    _Block_object_dispose(v20, 8);
  }
}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  objc_super v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [*(id *)(a1 + 32) match];
  char v6 = [v5 participants];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v25 = v3;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = [*(id *)(a1 + 32) match];
    id v9 = [v8 participants];

    id obj = v9;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(obj);
          }
          double v14 = [*(id *)(*((void *)&v34 + 1) + 8 * i) player];
          if (v14)
          {
            ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
            id v15 = (void *)MEMORY[0x1E4F636D8];
            long long v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnCell.m", 427, "-[GKTurnParticipantCell configureOverlappingPlayersView]_block_invoke");
            long long v17 = [v15 dispatchGroupWithName:v16];

            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_2;
            v31[3] = &unk_1E5F62F28;
            id v18 = v14;
            id v32 = v18;
            long long v19 = v4;
            id v20 = v4;
            id v33 = v20;
            [v17 perform:v31];
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_5;
            v26[3] = &unk_1E5F66D80;
            uint64_t v21 = *(void **)(a1 + 40);
            uint64_t v30 = *(void *)(a1 + 48);
            id v27 = v21;
            id v28 = v20;
            id v29 = v25;
            [v17 notifyOnMainQueueWithBlock:v26];
            uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

            BOOL v23 = v22 == 4;
            objc_super v4 = v19;
            if (v23)
            {

              goto LABEL_14;
            }
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_super v3 = (void (**)(void))v25;
  }
  else
  {
    [*(id *)(a1 + 40) setResult:v4];
    v3[2](v3);
  }
}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_3;
    v5[3] = &unk_1E5F66D58;
    id v6 = v4;
    id v7 = *(id *)(a1 + 40);
    id v8 = v3;
    [v6 loadPhotoForSize:0 withCompletionHandler:v5];
  }
}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_4;
    v10[3] = &unk_1E5F65350;
    id v6 = a1[4];
    id v11 = a1[5];
    id v12 = a1[4];
    id v13 = a1[6];
    [v6 monogramImageWithPhotoSize:0 handler:v10];
  }
  else
  {
    id v7 = a1[5];
    id v8 = [a1[4] internal];
    id v9 = [v8 playerID];
    [v7 setObject:v5 forKeyedSubscript:v9];

    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_4(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  objc_super v4 = (void *)a1[5];
  id v5 = a2;
  id v6 = [v4 internal];
  id v7 = [v6 playerID];
  [v3 setObject:v5 forKeyedSubscript:v7];

  id v8 = *(uint64_t (**)(void))(a1[6] + 16);

  return v8();
}

uint64_t __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_5(uint64_t result)
{
  if (!--*(void *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) setResult:*(void *)(result + 40)];
    v2 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v2();
  }
  return result;
}

void __56__GKTurnParticipantCell_configureOverlappingPlayersView__block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  if ([v2 count])
  {
    [*(id *)(a1 + 40) setPlayerAvatarMapping:v2];
    [*(id *)(a1 + 40) updateOverlappingPlayerViewsAvatar];
  }
}

- (void)updateOverlappingPlayerViewsAvatar
{
  id v15 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [(GKTurnParticipantCell *)self playerAvatarMapping];
  objc_super v4 = [v3 allValues];
  [v15 addObjectsFromArray:v4];

  for (unint64_t i = [v15 count]; ; ++i)
  {
    id v6 = [(GKTurnParticipantCell *)self match];
    id v7 = [v6 participants];
    unint64_t v8 = [v7 count];

    if (i > 3 || i >= v8) {
      break;
    }
    id v9 = [MEMORY[0x1E4F63A10] sharedTheme];
    uint64_t v10 = [v9 defaultPlayerPhoto];
    [v15 addObject:v10];
  }
  id v11 = [(GKTurnParticipantCell *)self overlappingPlayersView];
  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  double v13 = v12;
  [(GKTurnParticipantCell *)self getOverlappingPlayerAvatarIconSize];
  objc_msgSend(v11, "applyWithPlayerAvatars:playerSize:", v15, v13, v14);
}

- (void)configureForDetail
{
  v40[1] = *MEMORY[0x1E4F143B8];
  [(UIImageView *)self->_statusImageView setHidden:1];
  id v3 = [MEMORY[0x1E4F639F8] textStyle];
  objc_super v4 = [(GKBasePlayerCell *)self player];
  id v5 = [v4 displayNameWithOptions:0];
  id v6 = v3;
  id v7 = [v3 body];
  unint64_t v8 = [v5 _gkAttributedStringByApplyingStyle:v7];
  id v9 = [(GKBasePlayerCell *)self nameLabel];
  [v9 setAttributedText:v8];

  uint64_t v10 = [(GKTurnParticipantCell *)self match];
  id v11 = [(GKTurnParticipantCell *)self participant];
  uint64_t v12 = [v10 localPlayerParticipant];
  double v13 = [v10 currentParticipant];

  if (v11 != v13)
  {
    double v14 = &stru_1F07B2408;
    goto LABEL_4;
  }
  id v15 = GKGameCenterUIFrameworkBundle();
  GKGetLocalizedStringFromTableInBundle();
  double v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_4:
    if ([(__CFString *)v14 length]) {
      goto LABEL_9;
    }
  }
  if ([v11 status] == 5)
  {
    long long v16 = [v10 participants];
    uint64_t v17 = objc_msgSend(v11, "matchOutcomeString:", -[__CFString count](v16, "count"));

    double v14 = v16;
  }
  else
  {
    uint64_t v17 = [v11 matchStatusString];
  }

  double v14 = (__CFString *)v17;
LABEL_9:
  id v18 = [v11 lastTurnDate];
  long long v35 = v18;
  if (v18)
  {
    long long v19 = [v18 _gkFormattedWhenStringWithOptions:0];
  }
  else
  {
    long long v19 = &stru_1F07B2408;
  }
  id v20 = [v10 currentParticipant];
  long long v37 = v11;
  v38 = v10;
  long long v36 = (void *)v12;
  if ([v20 status] == 1)
  {

LABEL_15:
    long long v19 = &stru_1F07B2408;
    goto LABEL_16;
  }
  uint64_t v21 = [v10 currentParticipant];

  if (v11 == v21) {
    goto LABEL_15;
  }
LABEL_16:
  long long v34 = v19;
  uint64_t v22 = NSString;
  BOOL v23 = GKGameCenterUIFrameworkBundle();
  v24 = GKGetLocalizedStringFromTableInBundle();
  unint64_t v25 = objc_msgSend(v22, "stringWithFormat:", v24, v14, v19);

  uint64_t v39 = @"state";
  double v26 = [v6 footnote];
  id v27 = [v26 emphasized];
  v40[0] = v27;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  id v29 = [v6 footnote];
  uint64_t v30 = [v29 emphasized];
  v31 = [v25 _gkAttributedStringByApplyingStylesForTags:v28 untaggedStyle:v30];
  [(GKLabel *)self->_bottomLabel setAttributedText:v31];

  id v32 = [MEMORY[0x1E4F639B0] sharedPalette];
  id v33 = [v32 standardTextColor];
  [(GKLabel *)self->_bottomLabel setTextColor:v33];

  [(GKLabel *)self->_bottomLabel setAdjustsFontSizeToFitWidth:1];
  [(GKLabel *)self->_bottomLabel setMinimumScaleFactor:0.7];
}

- (void)setParticipant:(id)a3
{
  participant = (GKTurnBasedParticipant *)a3;
  id v7 = participant;
  if (self->_participant != participant)
  {
    objc_storeStrong((id *)&self->_participant, a3);
    participant = self->_participant;
  }
  id v6 = [(GKTurnBasedParticipant *)participant player];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F63788] automatchPlayer];
  }
  [(GKBasePlayerCell *)self setPlayer:v6];
}

- (void)setMatch:(id)a3
{
  id v5 = (GKTurnBasedMatch *)a3;
  match = self->_match;
  if (match != v5)
  {
    id v9 = v5;
    if (match)
    {
      id v7 = [(GKTurnBasedMatch *)match participants];
      previousParticipants = self->_previousParticipants;
      self->_previousParticipants = v7;
    }
    objc_storeStrong((id *)&self->_match, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](match, v5);
}

- (void)setDetailPressedAction:(SEL)a3
{
  p_detailPressedAction = &self->_detailPressedAction;
  detailPressedAction = self->_detailPressedAction;
  if (detailPressedAction)
  {
    if (detailPressedAction == a3) {
      return;
    }
    [(GKFocusableButton *)self->_detailButton removeTarget:self action:sel_detailPressed_ forControlEvents:64];
    if (!a3)
    {
      SEL *p_detailPressedAction = 0;
      goto LABEL_8;
    }
  }
  else if (!a3)
  {
    return;
  }
  SEL *p_detailPressedAction = a3;
  if (a3)
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v7 = 1;
LABEL_9:
  [(GKFocusableButton *)self->_detailButton setHidden:v7];
  if (!*p_detailPressedAction)
  {
    detailButton = self->_detailButton;
    [(GKFocusableButton *)detailButton removeFromSuperview];
  }
}

- (void)detailPressed:(id)a3
{
  id v11 = a3;
  objc_super v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = v4;
  p_SEL detailPressedAction = &self->_detailPressedAction;
  if (self->_detailPressedAction) {
    SEL detailPressedAction = self->_detailPressedAction;
  }
  else {
    SEL detailPressedAction = 0;
  }
  unint64_t v8 = [v4 _gkTargetForAction:detailPressedAction viaResponder:v11];

  if (*p_detailPressedAction) {
    id v9 = *p_detailPressedAction;
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = [(GKTurnParticipantCell *)self match];
  objc_msgSend(v8, v9, v10);
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
  [(GKTurnParticipantCell *)self updateMarginConstraints];
}

- (void)updateMarginConstraints
{
  p_insets = &self->_insets;
  float64x2_t v3 = *(float64x2_t *)&self->_insets.top;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*MEMORY[0x1E4FB2848], v3), (int32x4_t)vceqq_f64(*(float64x2_t *)(MEMORY[0x1E4FB2848] + 16), *(float64x2_t *)&self->_insets.bottom))), 0xFuLL))) & 1) == 0)
  {
    [(NSLayoutConstraint *)self->_iconLeadingConstraint setConstant:v3.f64[1]];
    double v5 = -p_insets->right;
    detailButtonConstraint = self->_detailButtonConstraint;
    [(NSLayoutConstraint *)detailButtonConstraint setConstant:v5];
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (GKTurnBasedParticipant)participant
{
  return self->_participant;
}

- (SEL)detailPressedAction
{
  if (self->_detailPressedAction) {
    return self->_detailPressedAction;
  }
  else {
    return 0;
  }
}

- (BOOL)isDetail
{
  return self->_isDetail;
}

- (void)setIsDetail:(BOOL)a3
{
  self->_BOOL isDetail = a3;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
}

- (GKFocusableButton)detailButton
{
  return self->_detailButton;
}

- (void)setDetailButton:(id)a3
{
}

- (GKLabel)bottomLabel
{
  return self->_bottomLabel;
}

- (void)setBottomLabel:(id)a3
{
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (void)setStatusImageView:(id)a3
{
}

- (UIStackView)textStackView
{
  return self->_textStackView;
}

- (void)setTextStackView:(id)a3
{
}

- (NSLayoutConstraint)iconLeadingConstraint
{
  return self->_iconLeadingConstraint;
}

- (void)setIconLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textStackViewToSuperViewLeadingConstraint
{
  return self->_textStackViewToSuperViewLeadingConstraint;
}

- (void)setTextStackViewToSuperViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textStackViewToIconViewLeadingConstraint
{
  return self->_textStackViewToIconViewLeadingConstraint;
}

- (void)setTextStackViewToIconViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)statusImageTrailingConstraint
{
  return self->_statusImageTrailingConstraint;
}

- (void)setStatusImageTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textContainerTrailingConstraint
{
  return self->_textContainerTrailingConstraint;
}

- (void)setTextContainerTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)detailButtonConstraint
{
  return self->_detailButtonConstraint;
}

- (void)setDetailButtonConstraint:(id)a3
{
}

- (NSLayoutConstraint)overlappingPlayersViewWidthConstraint
{
  return self->_overlappingPlayersViewWidthConstraint;
}

- (void)setOverlappingPlayersViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)overlappingPlayersViewTrailingConstraint
{
  return self->_overlappingPlayersViewTrailingConstraint;
}

- (void)setOverlappingPlayersViewTrailingConstraint:(id)a3
{
}

- (_TtC12GameCenterUI22OverlappingPlayersView)overlappingPlayersView
{
  return self->_overlappingPlayersView;
}

- (void)setOverlappingPlayersView:(id)a3
{
}

- (UIView)overlappingPlayersViewContainer
{
  return self->_overlappingPlayersViewContainer;
}

- (void)setOverlappingPlayersViewContainer:(id)a3
{
}

- (UILabel)additionalPlayerCountLabel
{
  return self->_additionalPlayerCountLabel;
}

- (void)setAdditionalPlayerCountLabel:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSDictionary)playerAvatarMapping
{
  return self->_playerAvatarMapping;
}

- (void)setPlayerAvatarMapping:(id)a3
{
}

- (NSArray)previousParticipants
{
  return self->_previousParticipants;
}

- (void)setPreviousParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousParticipants, 0);
  objc_storeStrong((id *)&self->_playerAvatarMapping, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_additionalPlayerCountLabel, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersViewContainer, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersView, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_overlappingPlayersViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_detailButtonConstraint, 0);
  objc_storeStrong((id *)&self->_textContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_statusImageTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textStackViewToIconViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textStackViewToSuperViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_detailButton, 0);
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_participant, 0);

  objc_storeStrong((id *)&self->_match, 0);
}

@end