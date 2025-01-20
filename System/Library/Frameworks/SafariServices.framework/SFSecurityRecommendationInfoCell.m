@interface SFSecurityRecommendationInfoCell
- (CGSize)_hideButtonViewSize;
- (NSString)subtitle;
- (NSString)title;
- (SFSecurityRecommendationInfoCell)initWithConfiguration:(unint64_t)a3 reuseIdentifier:(id)a4;
- (SFSecurityRecommendationInfoCellDelegate)delegate;
- (UIImage)icon;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (WBSSavedAccount)savedAccount;
- (double)_iconWidth;
- (void)_createHideButton;
- (void)_hideButtonPressed:(id)a3;
- (void)_updateSharedAccountBadgeImageViewIfNecessary;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setIcon:(id)a3;
- (void)setSavedAccount:(id)a3;
- (void)setShowsHideButton:(BOOL)a3;
- (void)setShowsUpgradeCompletionCheckmark:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)showCheckmarkForDetailView;
- (void)showPlaceholderImageForDomain:(id)a3 backgroundColor:(id)a4;
@end

@implementation SFSecurityRecommendationInfoCell

- (SFSecurityRecommendationInfoCell)initWithConfiguration:(unint64_t)a3 reuseIdentifier:(id)a4
{
  v95[12] = *MEMORY[0x1E4F143B8];
  v93.receiver = self;
  v93.super_class = (Class)SFSecurityRecommendationInfoCell;
  v5 = [(SFSecurityRecommendationInfoCell *)&v93 initWithStyle:0 reuseIdentifier:a4];
  v6 = v5;
  if (v5)
  {
    v5->_configuration = a3;
    v7 = [(SFSecurityRecommendationInfoCell *)v5 contentView];
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconView = v6->_iconView;
    v6->_iconView = v8;

    if (v6->_configuration == 1) {
      [(UIImageView *)v6->_iconView _setContinuousCornerRadius:12.0];
    }
    [(UIImageView *)v6->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(UIImageView *)v6->_iconView layer];
    [v10 setMasksToBounds:1];

    [(UIImageView *)v6->_iconView setContentMode:2];
    [(UIImageView *)v6->_iconView setClipsToBounds:1];
    [v7 addSubview:v6->_iconView];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = v11;

    v13 = +[_SFAccountManagerAppearanceValues titleFontForLargerCell];
    [(UILabel *)v6->_titleLabel setFont:v13];

    [(UILabel *)v6->_titleLabel setNumberOfLines:0];
    [(UILabel *)v6->_titleLabel setTextAlignment:4];
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v6->_titleLabel setTextColor:v14];

    [(UILabel *)v6->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_titleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v15) = 1148846080;
    [(UILabel *)v6->_titleLabel setContentHuggingPriority:1 forAxis:v15];
    LODWORD(v16) = 1148846080;
    [(UILabel *)v6->_titleLabel setContentCompressionResistancePriority:1 forAxis:v16];
    [v7 addSubview:v6->_titleLabel];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v6->_subtitleLabel;
    v6->_subtitleLabel = v17;

    v19 = +[_SFAccountManagerAppearanceValues subtitleFontForLargerCell];
    [(UILabel *)v6->_subtitleLabel setFont:v19];

    [(UILabel *)v6->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v6->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v6->_subtitleLabel setTextAlignment:4];
    v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6->_subtitleLabel setTextColor:v20];

    [(UILabel *)v6->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v21) = 1148846080;
    [(UILabel *)v6->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v21];
    [v7 addSubview:v6->_subtitleLabel];
    if (a3) {
      double v22 = 0.0;
    }
    else {
      double v22 = -1.5;
    }
    v23 = [(SFSecurityRecommendationInfoCell *)v6 contentView];
    v24 = [v23 layoutMarginsGuide];

    v25 = [(UILabel *)v6->_titleLabel trailingAnchor];
    v26 = [v24 trailingAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    standardTitleTrailingConstraint = v6->_standardTitleTrailingConstraint;
    v6->_standardTitleTrailingConstraint = (NSLayoutConstraint *)v27;

    v87 = [(UIImageView *)v6->_iconView widthAnchor];
    [(SFSecurityRecommendationInfoCell *)v6 _iconWidth];
    v85 = objc_msgSend(v87, "constraintEqualToConstant:");
    v95[0] = v85;
    v83 = [(UIImageView *)v6->_iconView heightAnchor];
    v82 = [(UIImageView *)v6->_iconView widthAnchor];
    v81 = [v83 constraintEqualToAnchor:v82];
    v95[1] = v81;
    v80 = [(UIImageView *)v6->_iconView leadingAnchor];
    v79 = [v24 leadingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79 constant:v22];
    v95[2] = v78;
    v77 = [(UILabel *)v6->_titleLabel leadingAnchor];
    v76 = [(UIImageView *)v6->_iconView trailingAnchor];
    v75 = [v77 constraintEqualToSystemSpacingAfterAnchor:v76 multiplier:1.5];
    v95[3] = v75;
    v74 = [(UILabel *)v6->_subtitleLabel leadingAnchor];
    v73 = [(UILabel *)v6->_titleLabel leadingAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v95[4] = v72;
    v71 = [(UILabel *)v6->_subtitleLabel trailingAnchor];
    v92 = v24;
    v70 = [v24 trailingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v95[5] = v69;
    v95[6] = v6->_standardTitleTrailingConstraint;
    v68 = [(UIImageView *)v6->_iconView topAnchor];
    v67 = [v7 topAnchor];
    v66 = [v68 constraintEqualToSystemSpacingBelowAnchor:v67 multiplier:1.5];
    v95[7] = v66;
    v65 = [v7 bottomAnchor];
    v64 = [(UIImageView *)v6->_iconView bottomAnchor];
    v63 = [v65 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v64 multiplier:1.5];
    v95[8] = v63;
    v29 = [(UILabel *)v6->_titleLabel topAnchor];
    v30 = [(UIImageView *)v6->_iconView topAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v95[9] = v31;
    v32 = [(UILabel *)v6->_subtitleLabel topAnchor];
    v33 = [(UILabel *)v6->_titleLabel bottomAnchor];
    v34 = [v32 constraintEqualToSystemSpacingBelowAnchor:v33 multiplier:0.5];
    v95[10] = v34;
    [v7 bottomAnchor];
    v35 = v91 = v7;
    v36 = [(UILabel *)v6->_subtitleLabel bottomAnchor];
    v37 = [v35 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v36 multiplier:1.5];
    v95[11] = v37;
    v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:12];

    if (v6->_configuration == 1)
    {
      v38 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      completedUpgradeCheckmarkView = v6->_completedUpgradeCheckmarkView;
      v6->_completedUpgradeCheckmarkView = v38;

      [(UIImageView *)v6->_completedUpgradeCheckmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
      v40 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
      v41 = [MEMORY[0x1E4FB1618] systemGreenColor];
      v42 = [v40 imageWithTintColor:v41 renderingMode:1];
      [(UIImageView *)v6->_completedUpgradeCheckmarkView setImage:v42];

      [(UIImageView *)v6->_completedUpgradeCheckmarkView setAlpha:0.0];
      [v91 addSubview:v6->_completedUpgradeCheckmarkView];
      v90 = [(UIImageView *)v6->_completedUpgradeCheckmarkView widthAnchor];
      v88 = [v90 constraintGreaterThanOrEqualToConstant:28.0];
      v94[0] = v88;
      v86 = [(UIImageView *)v6->_completedUpgradeCheckmarkView heightAnchor];
      v84 = [v86 constraintEqualToConstant:28.0];
      v94[1] = v84;
      v43 = [(UIImageView *)v6->_completedUpgradeCheckmarkView trailingAnchor];
      v44 = [v92 trailingAnchor];
      v45 = [v43 constraintEqualToAnchor:v44];
      v94[2] = v45;
      v46 = [(UIImageView *)v6->_completedUpgradeCheckmarkView leadingAnchor];
      v47 = [(UILabel *)v6->_titleLabel trailingAnchor];
      v48 = [v46 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v47 multiplier:1.0];
      v94[3] = v48;
      v49 = [(UIImageView *)v6->_completedUpgradeCheckmarkView topAnchor];
      v50 = [v91 topAnchor];
      v51 = [v49 constraintEqualToSystemSpacingBelowAnchor:v50 multiplier:1.0];
      v94[4] = v51;
      uint64_t v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:5];
      completedUpgradeCheckmarkViewConstraints = v6->_completedUpgradeCheckmarkViewConstraints;
      v6->_completedUpgradeCheckmarkViewConstraints = (NSArray *)v52;
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:v89];
    v54 = [SFAccountIconSharingBadgeImageCoordinator alloc];
    v55 = v6->_iconView;
    [(SFSecurityRecommendationInfoCell *)v6 _iconWidth];
    double v57 = v56;
    v58 = [(SFSecurityRecommendationInfoCell *)v6 contentView];
    uint64_t v59 = [(SFAccountIconSharingBadgeImageCoordinator *)v54 initWithIconImageView:v55 iconDiameter:v58 parentView:v57];
    badgeImageCoordinator = v6->_badgeImageCoordinator;
    v6->_badgeImageCoordinator = (SFAccountIconSharingBadgeImageCoordinator *)v59;

    v61 = v6;
  }

  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFSecurityRecommendationInfoCell;
  [(SFSecurityRecommendationInfoCell *)&v3 layoutSubviews];
  [(SFAccountIconSharingBadgeImageCoordinator *)self->_badgeImageCoordinator containerDidLayoutSubviews];
}

- (UIImage)icon
{
  return [(UIImageView *)self->_iconView image];
}

- (void)setIcon:(id)a3
{
  monogramLabel = self->_monogramLabel;
  id v5 = a3;
  [(UILabel *)monogramLabel setHidden:1];
  [(UIView *)self->_monogramBackgroundView setHidden:1];
  [(UIImageView *)self->_iconView setImage:v5];

  [(SFSecurityRecommendationInfoCell *)self setNeedsLayout];

  [(SFSecurityRecommendationInfoCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)showCheckmarkForDetailView
{
  [(UILabel *)self->_monogramLabel setHidden:1];
  [(UIView *)self->_monogramBackgroundView setHidden:1];
  objc_super v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
  v4 = [MEMORY[0x1E4FB1618] systemGreenColor];
  id v5 = [v3 imageWithTintColor:v4 renderingMode:1];
  [(UIImageView *)self->_iconView setImage:v5];

  [(SFSecurityRecommendationInfoCell *)self setNeedsLayout];
}

- (void)setShowsUpgradeCompletionCheckmark:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28DC8];
  if (a3)
  {
    v10[0] = self->_standardTitleTrailingConstraint;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v4 deactivateConstraints:v5];

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_completedUpgradeCheckmarkViewConstraints];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__SFSecurityRecommendationInfoCell_setShowsUpgradeCompletionCheckmark___block_invoke;
    v8[3] = &unk_1E5C724D8;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.25];
  }
  else
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_completedUpgradeCheckmarkViewConstraints];
    v6 = (void *)MEMORY[0x1E4F28DC8];
    standardTitleTrailingConstraint = self->_standardTitleTrailingConstraint;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&standardTitleTrailingConstraint count:1];
    [v6 activateConstraints:v7];

    [(UIImageView *)self->_completedUpgradeCheckmarkView setAlpha:0.0];
  }
  [(SFSecurityRecommendationInfoCell *)self setNeedsLayout];
}

uint64_t __71__SFSecurityRecommendationInfoCell_setShowsUpgradeCompletionCheckmark___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1024) setAlpha:1.0];
}

- (void)setShowsHideButton:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    p_hideButton = &self->_hideButton;
    if (!self->_hideButton) {
      [(SFSecurityRecommendationInfoCell *)self _createHideButton];
    }
    v6 = (void *)MEMORY[0x1E4F28DC8];
    standardTitleTrailingConstraint = self->_standardTitleTrailingConstraint;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&standardTitleTrailingConstraint count:1];
    [v6 deactivateConstraints:v7];

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_hideButtonConstraints];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F28DC8];
    v11[0] = self->_standardTitleTrailingConstraint;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v8 activateConstraints:v9];

    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_hideButtonConstraints];
    p_hideButton = &self->_hideButton;
  }
  [(UIButton *)*p_hideButton setHidden:!v3];
}

- (void)_createHideButton
{
  v32[5] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
  hideButton = self->_hideButton;
  self->_hideButton = v3;

  [(UIButton *)self->_hideButton setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = self->_hideButton;
  v6 = (void *)MEMORY[0x1E4FB1818];
  v7 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
  v8 = [v6 systemImageNamed:@"xmark" withConfiguration:v7];
  v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  v10 = [v8 imageWithTintColor:v9 renderingMode:1];
  [(UIButton *)v5 setImage:v10 forState:0];

  if (UIAccessibilityButtonShapesEnabled())
  {
    v11 = self->_hideButton;
    v12 = [MEMORY[0x1E4FB1618] systemGray5Color];
    [(UIButton *)v11 setBackgroundColor:v12];

    [(UIButton *)self->_hideButton _setContinuousCornerRadius:5.0];
  }
  [(UIButton *)self->_hideButton addTarget:self action:sel__hideButtonPressed_ forControlEvents:0x2000];
  v13 = [(SFSecurityRecommendationInfoCell *)self contentView];
  [v13 addSubview:self->_hideButton];
  v31 = [(UIButton *)self->_hideButton widthAnchor];
  [(SFSecurityRecommendationInfoCell *)self _hideButtonViewSize];
  v30 = objc_msgSend(v31, "constraintGreaterThanOrEqualToConstant:");
  v32[0] = v30;
  v29 = [(UIButton *)self->_hideButton heightAnchor];
  [(SFSecurityRecommendationInfoCell *)self _hideButtonViewSize];
  v28 = [v29 constraintEqualToConstant:v14];
  v32[1] = v28;
  v26 = [(UIButton *)self->_hideButton trailingAnchor];
  uint64_t v27 = [v13 layoutMarginsGuide];
  v25 = [v27 trailingAnchor];
  double v15 = [v26 constraintEqualToAnchor:v25 constant:5.0];
  v32[2] = v15;
  double v16 = [(UIButton *)self->_hideButton leadingAnchor];
  v17 = [(UILabel *)self->_titleLabel trailingAnchor];
  v18 = [v16 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v17 multiplier:1.0];
  v32[3] = v18;
  v19 = [(UIButton *)self->_hideButton topAnchor];
  v20 = [v13 layoutMarginsGuide];
  double v21 = [v20 topAnchor];
  double v22 = [v19 constraintEqualToAnchor:v21];
  v32[4] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  hideButtonConstraints = self->_hideButtonConstraints;
  self->_hideButtonConstraints = v23;
}

- (void)_hideButtonPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained securityRecommendationInfoCellHideButtonPressed:self];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(SFSecurityRecommendationInfoCell *)self setNeedsLayout];
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  [(UILabel *)self->_subtitleLabel setText:a3];

  [(SFSecurityRecommendationInfoCell *)self setNeedsLayout];
}

- (void)setSavedAccount:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccount, a3);

  [(SFSecurityRecommendationInfoCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
}

- (void)showPlaceholderImageForDomain:(id)a3 backgroundColor:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if (!self->_monogramLabel)
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [(SFSecurityRecommendationInfoCell *)self _iconWidth];
    double v10 = v9;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    monogramBackgroundView = self->_monogramBackgroundView;
    self->_monogramBackgroundView = v11;

    -[UIView setFrame:](self->_monogramBackgroundView, "setFrame:", v7, v8, v10, v10);
    v13 = [(UIView *)self->_monogramBackgroundView layer];
    [v13 setMasksToBounds:1];

    [(UIView *)self->_monogramBackgroundView _setContinuousCornerRadius:12.0];
    [(UIView *)self->_monogramBackgroundView _setAllowsHighContrastForBackgroundColor:1];
    [(UIImageView *)self->_iconView addSubview:self->_monogramBackgroundView];
    double v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    monogramLabel = self->_monogramLabel;
    self->_monogramLabel = v14;

    [(UILabel *)self->_monogramLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_monogramLabel setTextAlignment:1];
    [(UILabel *)self->_monogramLabel setNumberOfLines:0];
    double v16 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_monogramLabel setTextColor:v16];

    -[UILabel setFrame:](self->_monogramLabel, "setFrame:", v7, v8, v10, v10);
    v17 = objc_msgSend(MEMORY[0x1E4FB1798], "_sf_roundedSystemFontOfSize:weight:", 34, *MEMORY[0x1E4FB29C8]);
    [(UILabel *)self->_monogramLabel setFont:v17];

    [(UIImageView *)self->_iconView addSubview:self->_monogramLabel];
  }
  if (blankImage_onceToken_0 != -1) {
    dispatch_once(&blankImage_onceToken_0, &__block_literal_global_48);
  }
  [(UIImageView *)self->_iconView setImage:blankImage_image_0];
  [(UIView *)self->_monogramBackgroundView setBackgroundColor:v6];
  [(UIView *)self->_monogramBackgroundView setHidden:0];
  [(UILabel *)self->_monogramLabel setHidden:0];
  v18 = (void *)MEMORY[0x1E4F98F18];
  v19 = [(WBSSavedAccount *)self->_savedAccount effectiveTitle];
  v20 = objc_msgSend(v22, "safari_bestURLForUserTypedString");
  double v21 = [v18 monogramStringForTitle:v19 url:v20];
  [(UILabel *)self->_monogramLabel setText:v21];

  [(SFSecurityRecommendationInfoCell *)self _updateSharedAccountBadgeImageViewIfNecessary];
  [(SFSecurityRecommendationInfoCell *)self setNeedsLayout];
}

- (double)_iconWidth
{
  double result = 48.0;
  if (self->_configuration != 1) {
    return 28.0;
  }
  return result;
}

- (void)_updateSharedAccountBadgeImageViewIfNecessary
{
  if (self->_configuration == 1) {
    uint64_t v3 = [(WBSSavedAccount *)self->_savedAccount isSavedInPersonalKeychain] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  badgeImageCoordinator = self->_badgeImageCoordinator;

  [(SFAccountIconSharingBadgeImageCoordinator *)badgeImageCoordinator setShowsBadge:v3];
}

- (CGSize)_hideButtonViewSize
{
  BOOL v2 = UIAccessibilityButtonShapesEnabled();
  double v3 = 20.0;
  if (v2) {
    double v3 = 30.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (SFSecurityRecommendationInfoCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFSecurityRecommendationInfoCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_savedAccount, 0);
  objc_storeStrong((id *)&self->_badgeImageCoordinator, 0);
  objc_storeStrong((id *)&self->_hideButtonConstraints, 0);
  objc_storeStrong((id *)&self->_hideButton, 0);
  objc_storeStrong((id *)&self->_standardTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_completedUpgradeCheckmarkViewConstraints, 0);
  objc_storeStrong((id *)&self->_monogramBackgroundView, 0);
  objc_storeStrong((id *)&self->_monogramLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_completedUpgradeCheckmarkView, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end