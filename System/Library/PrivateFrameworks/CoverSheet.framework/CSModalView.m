@interface CSModalView
+ (double)_bottomBaselineOffsetForPortrait:(BOOL)a3;
+ (double)_modalViewBottomBaselineOffsetPortrait;
- (BOOL)_hasPortraitDimensions;
- (BOOL)_isPortraitForDelegate:(id)a3;
- (BOOL)_replaceView:(id)a3 withNewView:(id)a4 inParentView:(id)a5;
- (BOOL)showsDateView;
- (BOOL)showsStatusText;
- (BOOL)wantsEnhancedSecondaryActionButton;
- (CGRect)_dateTimeFrame;
- (CSModalButton)_primaryActionButton;
- (CSModalView)initWithFrame:(CGRect)a3;
- (CSModalViewDelegate)delegate;
- (NSString)footerText;
- (NSString)primaryActionButtonText;
- (NSString)secondaryActionButtonText;
- (NSString)secondarySubtitleText;
- (NSString)subtitleText;
- (NSString)titleText;
- (UIButton)_secondaryActionButton;
- (UIColor)primaryActionButtonBackgroundColor;
- (UIColor)secondaryActionButtonTextColor;
- (UIColor)titleTextColor;
- (UIImage)image;
- (UIImageView)_imageView;
- (UILabel)_secondarySubtitleLabel;
- (UILabel)_subtitleLabel;
- (UILabel)_titleLabel;
- (UIView)detailView;
- (_UILegibilitySettings)legibilitySettings;
- (double)_timeLabelBaselineY;
- (double)_timeToSubtitleLabelBaselineDifferenceY;
- (id)_fontWithTextStyle:(id)a3 cappedToSize:(id)a4;
- (id)_labelWithNumberOfLines:(unint64_t)a3 font:(id)a4;
- (id)_preferredContentSizeCategoryCappedToSize:(id)a3;
- (id)_primaryActionFont;
- (id)_secondaryActionFont;
- (id)_subtitleFont;
- (id)_titleFont;
- (void)_buttonTapped:(id)a3;
- (void)_createAppropriateSecondaryActionButtonIfNecessary;
- (void)_createEnhancedSecondaryActionButtonIfNecessary;
- (void)_createPrimaryActionButtonIfNecessary;
- (void)_createSecondaryActionButtonIfNecessary;
- (void)_positionBottomElementWithLayoutAnchor:(id)a3 lessThanOrEqual:(BOOL)a4;
- (void)_setImageView:(id)a3;
- (void)_setPrimaryActionButton:(id)a3;
- (void)_setSecondaryActionButton:(id)a3;
- (void)_setSecondarySubtitleLabel:(id)a3;
- (void)_setSubtitleLabel:(id)a3;
- (void)_setTitleLabel:(id)a3;
- (void)hideSecondarySubtitleLabel:(BOOL)a3;
- (void)hideSubtitleLabel:(BOOL)a3;
- (void)hideTitleLabel:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDetailView:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setImage:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setOverrideSecondarySubtitleFont:(id)a3;
- (void)setOverrideSecondarySubtitleTextColor:(id)a3;
- (void)setPrimaryActionButtonBackgroundColor:(id)a3;
- (void)setPrimaryActionButtonText:(id)a3;
- (void)setSecondaryActionButtonText:(id)a3;
- (void)setSecondaryActionButtonTextColor:(id)a3;
- (void)setSecondarySubtitleText:(id)a3;
- (void)setShowsDateView:(BOOL)a3;
- (void)setShowsStatusText:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setWantsEnhancedSecondaryActionButton:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation CSModalView

- (CSModalView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CSModalView;
  v3 = -[CSModalView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CSModalView *)v3 setShowsDateView:1];
    [(CSModalView *)v4 setShowsStatusText:1];
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    dateViewLayoutGuide = v4->_dateViewLayoutGuide;
    v4->_dateViewLayoutGuide = v5;

    [(CSModalView *)v4 addLayoutGuide:v4->_dateViewLayoutGuide];
    id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    centralGroupView = v4->_centralGroupView;
    v4->_centralGroupView = (UIView *)v8;

    [(CSModalView *)v4 addSubview:v4->_centralGroupView];
    [(UIView *)v4->_centralGroupView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(UIView *)v4->_centralGroupView leadingAnchor];
    v11 = [(CSModalView *)v4 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [(UIView *)v4->_centralGroupView trailingAnchor];
    v14 = [(CSModalView *)v4 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [(UIView *)v4->_centralGroupView centerYAnchor];
    v17 = [(CSModalView *)v4 centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];

    LODWORD(v19) = 1144750080;
    [v18 setPriority:v19];
    [v18 setActive:1];
  }
  return v4;
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v7 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v6 = [(CSStatusTextViewController *)self->_statusTextViewController statusTextView];
    [v6 setLegibilitySettings:*p_legibilitySettings];
  }
}

- (void)setShowsStatusText:(BOOL)a3
{
  if (self->_showsStatusText != a3)
  {
    self->_showsStatusText = a3;
    if (a3)
    {
      v4 = objc_alloc_init(CSStatusTextViewController);
      statusTextViewController = self->_statusTextViewController;
      self->_statusTextViewController = v4;

      v6 = [(CSStatusTextViewController *)self->_statusTextViewController view];
      [(CSModalView *)self addSubview:v6];

      [(CSStatusTextViewController *)self->_statusTextViewController viewWillAppear:0];
      [(CSCoverSheetViewControllerBase *)self->_statusTextViewController viewDidAppear:0];
      [(CSModalView *)self setNeedsLayout];
    }
    else
    {
      -[CSCoverSheetViewControllerBase viewWillDisappear:](self->_statusTextViewController, "viewWillDisappear:");
      [(CSStatusTextViewController *)self->_statusTextViewController viewDidDisappear:0];
      id v7 = [(CSStatusTextViewController *)self->_statusTextViewController view];
      [v7 removeFromSuperview];

      uint64_t v8 = self->_statusTextViewController;
      self->_statusTextViewController = 0;
    }
  }
}

- (void)setWantsEnhancedSecondaryActionButton:(BOOL)a3
{
  if (self->_wantsEnhancedSecondaryActionButton != a3)
  {
    self->_wantsEnhancedSecondaryActionButton = a3;
    [(CSModalView *)self _setSecondaryActionButton:0];
    [(CSModalView *)self _createAppropriateSecondaryActionButtonIfNecessary];
  }
}

- (NSString)titleText
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitleText:(id)a3
{
  id v12 = a3;
  v4 = [(CSModalView *)self _titleLabel];
  v5 = [v4 text];
  char v6 = [v12 isEqualToString:v5];

  id v8 = v12;
  if ((v6 & 1) == 0)
  {
    if (v12)
    {
      titleLabel = self->_titleLabel;
      if (!titleLabel)
      {
        v10 = [(CSModalView *)self _titleFont];
        v11 = [(CSModalView *)self _labelWithNumberOfLines:2 font:v10];

        [(CSModalView *)self _setTitleLabel:v11];
        titleLabel = self->_titleLabel;
      }
      uint64_t v7 = [(UILabel *)titleLabel setText:v12];
    }
    else
    {
      uint64_t v7 = [(CSModalView *)self _setTitleLabel:0];
    }
    id v8 = v12;
  }

  MEMORY[0x1F41817F8](v7, v8);
}

- (UIColor)titleTextColor
{
  return [(UILabel *)self->_titleLabel textColor];
}

- (void)setTitleTextColor:(id)a3
{
}

- (NSString)subtitleText
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitleText:(id)a3
{
  id v13 = a3;
  v4 = [(CSModalView *)self _subtitleLabel];
  v5 = [v4 text];
  char v6 = [v13 isEqualToString:v5];

  id v8 = v13;
  if ((v6 & 1) == 0)
  {
    if (v13)
    {
      subtitleLabel = self->_subtitleLabel;
      if (!subtitleLabel)
      {
        v10 = [(CSModalView *)self _subtitleFont];
        v11 = [(CSModalView *)self _labelWithNumberOfLines:10 font:v10];

        [(CSModalView *)self _setSubtitleLabel:v11];
        [v11 setLineBreakMode:4];
        LODWORD(v12) = 1144750080;
        [v11 setContentHuggingPriority:1 forAxis:v12];

        subtitleLabel = self->_subtitleLabel;
      }
      uint64_t v7 = [(UILabel *)subtitleLabel setText:v13];
    }
    else
    {
      uint64_t v7 = [(CSModalView *)self _setSubtitleLabel:0];
    }
    id v8 = v13;
  }

  MEMORY[0x1F41817F8](v7, v8);
}

- (NSString)secondarySubtitleText
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSecondarySubtitleText:(id)a3
{
  id v13 = a3;
  v4 = [(CSModalView *)self _secondarySubtitleLabel];
  v5 = [v4 text];
  char v6 = [v13 isEqualToString:v5];

  id v8 = v13;
  if ((v6 & 1) == 0)
  {
    if (v13)
    {
      secondarySubtitleLabel = self->_secondarySubtitleLabel;
      if (!secondarySubtitleLabel)
      {
        v10 = [(CSModalView *)self _subtitleFont];
        v11 = [(CSModalView *)self _labelWithNumberOfLines:1 font:v10];

        [(CSModalView *)self _setSecondarySubtitleLabel:v11];
        LODWORD(v12) = 1148846080;
        [v11 setContentCompressionResistancePriority:1 forAxis:v12];

        secondarySubtitleLabel = self->_secondarySubtitleLabel;
      }
      uint64_t v7 = [(UILabel *)secondarySubtitleLabel setText:v13];
    }
    else
    {
      uint64_t v7 = [(CSModalView *)self _setSecondarySubtitleLabel:0];
    }
    id v8 = v13;
  }

  MEMORY[0x1F41817F8](v7, v8);
}

- (UIColor)primaryActionButtonBackgroundColor
{
  return (UIColor *)[(CSModalButton *)self->_primaryActionButton backgroundColor];
}

- (void)setPrimaryActionButtonBackgroundColor:(id)a3
{
  id v4 = a3;
  [(CSModalView *)self _createPrimaryActionButtonIfNecessary];
  [(CSModalButton *)self->_primaryActionButton setBackgroundColor:v4];
}

- (NSString)primaryActionButtonText
{
  return (NSString *)[(CSModalButton *)self->_primaryActionButton title];
}

- (void)setPrimaryActionButtonText:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    [(CSModalView *)self _createPrimaryActionButtonIfNecessary];
    id v4 = [(CSModalButton *)self->_primaryActionButton titleLabel];
    v5 = [v4 text];
    char v6 = [v7 isEqualToString:v5];

    if ((v6 & 1) == 0) {
      [(CSModalButton *)self->_primaryActionButton setTitle:v7 forState:0];
    }
  }
  else
  {
    [(CSModalView *)self _setPrimaryActionButton:0];
  }
}

- (NSString)secondaryActionButtonText
{
  return (NSString *)[(UIButton *)self->_secondaryActionButton title];
}

- (void)setSecondaryActionButtonText:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    [(CSModalView *)self _createAppropriateSecondaryActionButtonIfNecessary];
    id v4 = [(CSModalView *)self _secondaryActionButton];
    v5 = [v4 titleLabel];
    char v6 = [v5 text];
    char v7 = [v8 isEqualToString:v6];

    if ((v7 & 1) == 0) {
      [(UIButton *)self->_secondaryActionButton setTitle:v8 forState:0];
    }
  }
  else
  {
    [(CSModalView *)self _setSecondaryActionButton:0];
  }
}

- (UIColor)secondaryActionButtonTextColor
{
  v2 = [(UIButton *)self->_secondaryActionButton titleLabel];
  v3 = [v2 color];

  return (UIColor *)v3;
}

- (void)setSecondaryActionButtonTextColor:(id)a3
{
  id v4 = a3;
  [(CSModalView *)self _createAppropriateSecondaryActionButtonIfNecessary];
  [(UIButton *)self->_secondaryActionButton setTitleColor:v4 forState:0];
}

- (NSString)footerText
{
  return [(CSStatusTextViewController *)self->_statusTextViewController overrideFooterText];
}

- (void)setFooterText:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(CSModalView *)self setShowsStatusText:1];
  }
  [(CSStatusTextViewController *)self->_statusTextViewController setOverrideFooterText:v4];
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  id v9 = a3;
  id v4 = [(CSModalView *)self _imageView];
  id v5 = [v4 image];

  char v6 = v9;
  if (v5 != v9)
  {
    if (v9)
    {
      imageView = self->_imageView;
      if (imageView)
      {
        [(UIImageView *)imageView setImage:v9];
      }
      else
      {
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v9];
        [(CSModalView *)self _setImageView:v8];
      }
    }
    else
    {
      [(CSModalView *)self _setImageView:0];
    }
    char v6 = v9;
  }
}

- (void)setDetailView:(id)a3
{
  id v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_detailView))
  {
    objc_storeStrong((id *)&self->_detailView, a3);
    self->_needsDetailViewConstraints = 1;
  }
}

- (void)hideTitleLabel:(BOOL)a3
{
}

- (void)hideSubtitleLabel:(BOOL)a3
{
}

- (void)hideSecondarySubtitleLabel:(BOOL)a3
{
}

- (void)setOverrideSecondarySubtitleFont:(id)a3
{
  secondarySubtitleLabel = (UILabel *)a3;
  id v5 = secondarySubtitleLabel;
  if (secondarySubtitleLabel)
  {
    secondarySubtitleLabel = self->_secondarySubtitleLabel;
    if (secondarySubtitleLabel)
    {
      char v6 = v5;
      [(UILabel *)secondarySubtitleLabel setFont:v5];
      secondarySubtitleLabel = (UILabel *)[(CSModalView *)self setNeedsLayout];
      id v5 = v6;
    }
  }

  MEMORY[0x1F41817F8](secondarySubtitleLabel, v5);
}

- (void)setOverrideSecondarySubtitleTextColor:(id)a3
{
  secondarySubtitleLabel = (UILabel *)a3;
  id v5 = secondarySubtitleLabel;
  if (secondarySubtitleLabel)
  {
    secondarySubtitleLabel = self->_secondarySubtitleLabel;
    if (secondarySubtitleLabel)
    {
      char v6 = v5;
      [(UILabel *)secondarySubtitleLabel setTextColor:v5];
      secondarySubtitleLabel = (UILabel *)[(CSModalView *)self setNeedsLayout];
      id v5 = v6;
    }
  }

  MEMORY[0x1F41817F8](secondarySubtitleLabel, v5);
}

- (void)layoutSubviews
{
  [(CSModalView *)self bounds];
  double v4 = v3;
  +[CSPageControl suggestedFrameForPageBounds:](CSPageControl, "suggestedFrameForPageBounds:");
  double v6 = v5;
  id v20 = [(CSStatusTextViewController *)self->_statusTextViewController view];
  objc_msgSend(MEMORY[0x1E4FA5EE0], "suggestedFrameForStatusView:inView:withInsets:", v20, self, 0.0, 0.0, v4 - v6, 0.0);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v20 frame];
  v23.origin.x = v15;
  v23.origin.y = v16;
  v23.size.width = v17;
  v23.size.height = v18;
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  if (!CGRectEqualToRect(v22, v23))
  {
    double v19 = [(CSStatusTextViewController *)self->_statusTextViewController view];
    objc_msgSend(v19, "setFrame:", v8, v10, v12, v14);

    self->_needsSecondaryActionConstraints = 1;
    [(CSModalView *)self setNeedsUpdateConstraints];
  }
  if (self->_detailView)
  {
    self->_needsDetailViewConstraints = 1;
    [(CSModalView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D839D000, log, OS_LOG_TYPE_ERROR, "Bottom element in dashboard modal view is not positioned", v1, 2u);
}

- (void)_positionBottomElementWithLayoutAnchor:(id)a3 lessThanOrEqual:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  if (self->_showsStatusText)
  {
    double v6 = [(CSStatusTextViewController *)self->_statusTextViewController view];
    double v7 = [v6 topAnchor];

    double v8 = -20.0;
  }
  else
  {
    double v7 = [(CSModalView *)self bottomAnchor];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v10 = [(CSModalView *)self _isPortraitForDelegate:WeakRetained];

    [(id)objc_opt_class() _bottomBaselineOffsetForPortrait:v10];
    double v8 = -v11;
  }
  if (v4) {
    [v13 constraintLessThanOrEqualToAnchor:v7 constant:v8];
  }
  else {
  double v12 = [v13 constraintEqualToAnchor:v7 constant:v8];
  }
  [v12 setActive:1];
}

- (void)_setTitleLabel:(id)a3
{
  id v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_titleLabel))
  {
    objc_storeStrong((id *)&self->_titleLabel, a3);
    self->_needsTitleConstraints = 1;
  }
}

- (void)_setSubtitleLabel:(id)a3
{
  id v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_subtitleLabel))
  {
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    self->_needsSubTitleConstraints = 1;
  }
}

- (void)_setSecondarySubtitleLabel:(id)a3
{
  id v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_secondarySubtitleLabel))
  {
    objc_storeStrong((id *)&self->_secondarySubtitleLabel, a3);
    self->_needsSecondarySubTitleConstraints = 1;
  }
}

- (void)_setPrimaryActionButton:(id)a3
{
  id v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_primaryActionButton))
  {
    objc_storeStrong((id *)&self->_primaryActionButton, a3);
    self->_needsPrimaryActionConstraints = 1;
  }
}

- (void)_setSecondaryActionButton:(id)a3
{
  id v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_secondaryActionButton))
  {
    objc_storeStrong((id *)&self->_secondaryActionButton, a3);
    self->_needsSecondaryActionConstraints = 1;
  }
}

- (void)_setImageView:(id)a3
{
  id v5 = a3;
  if (-[CSModalView _replaceView:withNewView:inParentView:](self, "_replaceView:withNewView:inParentView:", self->_imageView))
  {
    objc_storeStrong((id *)&self->_imageView, a3);
    self->_needsImageConstraints = 1;
  }
}

- (id)_preferredContentSizeCategoryCappedToSize:(id)a3
{
  uint64_t v3 = _preferredContentSizeCategoryCappedToSize__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_preferredContentSizeCategoryCappedToSize__onceToken, &__block_literal_global_14);
  }
  id v5 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  unint64_t v6 = [(id)_preferredContentSizeCategoryCappedToSize__fontSizes indexOfObject:v5];
  unint64_t v7 = [(id)_preferredContentSizeCategoryCappedToSize__fontSizes indexOfObject:v4];

  if (v7 >= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v7;
  }
  double v9 = [(id)_preferredContentSizeCategoryCappedToSize__fontSizes objectAtIndexedSubscript:v8];

  return v9;
}

void __57__CSModalView__preferredContentSizeCategoryCappedToSize___block_invoke()
{
  v8[13] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F437C8];
  v8[0] = *MEMORY[0x1E4F437A8];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F437B0];
  v8[2] = *MEMORY[0x1E4F437B8];
  v8[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F43798];
  v8[4] = *MEMORY[0x1E4F437A0];
  v8[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F43780];
  v8[6] = *MEMORY[0x1E4F43790];
  v8[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F43770];
  v8[8] = *MEMORY[0x1E4F43778];
  v8[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F43760];
  v8[10] = *MEMORY[0x1E4F43768];
  v8[11] = v5;
  v8[12] = *MEMORY[0x1E4F437D0];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:13];
  unint64_t v7 = (void *)_preferredContentSizeCategoryCappedToSize__fontSizes;
  _preferredContentSizeCategoryCappedToSize__fontSizes = v6;
}

- (id)_fontWithTextStyle:(id)a3 cappedToSize:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [(CSModalView *)self _preferredContentSizeCategoryCappedToSize:a4];
  unint64_t v8 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v7];
  double v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v6 compatibleWithTraitCollection:v8];

  return v9;
}

- (id)_titleFont
{
  uint64_t v5 = *MEMORY[0x1E4F438E0];
  id v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    goto LABEL_25;
  }
  uint64_t v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v8 = 0;
      int v11 = 0;
      goto LABEL_13;
    }
LABEL_9:
    int v11 = v7 ^ 1;
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
      [(id)v7 _referenceBounds];
    }
    int v8 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v12 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_25;
    }
    goto LABEL_13;
  }
  id v6 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v6 userInterfaceIdiom]) {
    goto LABEL_9;
  }
  int v8 = 0;
  int v11 = 1;
LABEL_13:
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v9 = 0;
      int v10 = 0;
      id v13 = (void *)MEMORY[0x1E4F43780];
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v2 userInterfaceIdiom])
    {
      int v10 = 0;
      id v13 = (void *)MEMORY[0x1E4F43780];
      int v9 = 1;
      goto LABEL_26;
    }
  }
  int v9 = v3 ^ 1;
  int v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v3 _referenceBounds];
  }
  int v10 = v14 ^ 1;
  BSSizeRoundForScale();
  if (v15 < *(double *)(MEMORY[0x1E4FA6E50] + 40))
  {
    id v13 = (void *)MEMORY[0x1E4F43780];
    goto LABEL_26;
  }
LABEL_25:
  id v13 = (void *)MEMORY[0x1E4F43778];
LABEL_26:
  CGFloat v16 = [(CSModalView *)self _fontWithTextStyle:v5 cappedToSize:*v13];
  if (v10)
  {

    if (!v9) {
      goto LABEL_28;
    }
  }
  else if (!v9)
  {
LABEL_28:
    if (v8) {
      goto LABEL_29;
    }
LABEL_33:
    if (!v11) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  if (!v8) {
    goto LABEL_33;
  }
LABEL_29:

  if (v11) {
LABEL_34:
  }

LABEL_35:

  return v16;
}

- (id)_subtitleFont
{
  return [(CSModalView *)self _fontWithTextStyle:*MEMORY[0x1E4F438F0] cappedToSize:*MEMORY[0x1E4F43780]];
}

- (id)_primaryActionFont
{
  return [(CSModalView *)self _fontWithTextStyle:*MEMORY[0x1E4F438F0] cappedToSize:*MEMORY[0x1E4F43780]];
}

- (id)_secondaryActionFont
{
  return [(CSModalView *)self _fontWithTextStyle:*MEMORY[0x1E4F43878] cappedToSize:*MEMORY[0x1E4F43798]];
}

- (BOOL)_replaceView:(id)a3 withNewView:(id)a4 inParentView:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 != v8)
  {
    [a3 removeFromSuperview];
    if (v8)
    {
      [v9 addSubview:v8];
      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    [(CSModalView *)self setNeedsUpdateConstraints];
  }

  return a3 != v8;
}

- (id)_labelWithNumberOfLines:(unint64_t)a3 font:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F42B38];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setTextAlignment:1];
  [v7 setFont:v6];

  id v8 = [MEMORY[0x1E4F428B8] whiteColor];
  [v7 setTextColor:v8];

  [v7 setNumberOfLines:a3];
  [v7 setAdjustsFontSizeToFitWidth:1];
  [v7 setContentMode:5];

  return v7;
}

- (void)_createPrimaryActionButtonIfNecessary
{
  if (!self->_primaryActionButton)
  {
    uint64_t v3 = [CSModalButton alloc];
    id v7 = -[CSModalButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v4 = [(CSModalButton *)v7 titleLabel];
    uint64_t v5 = [(CSModalView *)self _primaryActionFont];
    [v4 setFont:v5];

    [(CSModalButton *)v7 addTarget:self action:sel__buttonTapped_ forControlEvents:64];
    id v6 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(CSModalButton *)v7 setBackgroundColor:v6];

    [(CSModalButton *)v7 _setContinuousCornerRadius:30.0];
    [(CSModalView *)self _setPrimaryActionButton:v7];
  }
}

- (void)_createAppropriateSecondaryActionButtonIfNecessary
{
  if (self->_wantsEnhancedSecondaryActionButton) {
    [(CSModalView *)self _createEnhancedSecondaryActionButtonIfNecessary];
  }
  else {
    [(CSModalView *)self _createSecondaryActionButtonIfNecessary];
  }
}

- (void)_createSecondaryActionButtonIfNecessary
{
  if (self->_secondaryActionButton) {
    return;
  }
  uint64_t v4 = (void *)0x1E4F42000;
  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    goto LABEL_23;
  }
  int v7 = __sb__runningInSpringBoard();
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v8 = 0;
      int v9 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    id v26 = v5;
    if ([v5 userInterfaceIdiom])
    {
      int v8 = 0;
      int v9 = 1;
      goto LABEL_13;
    }
  }
  int v9 = v7 ^ 1;
  int v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 _referenceBounds];
  }
  int v8 = v10 ^ 1;
  BSSizeRoundForScale();
  if (v11 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    BOOL v14 = 0;
    if (v8) {
      goto LABEL_30;
    }
    goto LABEL_21;
  }
LABEL_13:
  int v12 = __sb__runningInSpringBoard();
  char v13 = v12;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      BOOL v14 = 1;
      if (v8) {
        goto LABEL_30;
      }
LABEL_21:
      if (!v9) {
        goto LABEL_31;
      }
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom])
    {
      BOOL v14 = 1;
      goto LABEL_29;
    }
  }
  int v18 = __sb__runningInSpringBoard();
  char v19 = v18;
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v14 = v20 < *(double *)(MEMORY[0x1E4FA6E50] + 40);
  if (v19)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_29;
    }
  }
  else
  {

    if ((v13 & 1) == 0)
    {
LABEL_29:

      if (v8) {
        goto LABEL_30;
      }
      goto LABEL_21;
    }
  }
  if (!v8) {
    goto LABEL_21;
  }
LABEL_30:

  if ((v9 & 1) == 0)
  {
LABEL_31:
    if (v14) {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
LABEL_22:

  if (v14)
  {
LABEL_32:
    v27 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    goto LABEL_33;
  }
LABEL_23:
  double v15 = [CSModalButton alloc];
  v27 = -[CSModalButton initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  CGFloat v16 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.6];
  [(CSModalButton *)v27 setBackgroundColor:v16];

  [(CSModalButton *)v27 _setContinuousCornerRadius:24.0];
  CGFloat v17 = objc_opt_new();
  [(CSModalButton *)v27 setVisualEffect:v17];

LABEL_33:
  objc_super v21 = [(CSModalButton *)v27 titleLabel];
  CGRect v22 = [(CSModalView *)self _secondaryActionFont];
  [v21 setFont:v22];

  CGRect v23 = [(CSModalButton *)v27 titleLabel];
  [v23 setNumberOfLines:1];

  v24 = [(CSModalButton *)v27 titleLabel];
  [v24 setAdjustsFontSizeToFitWidth:0];

  v25 = [MEMORY[0x1E4F428B8] whiteColor];
  [(CSModalButton *)v27 setTitleColor:v25 forState:0];

  [(CSModalButton *)v27 addTarget:self action:sel__buttonTapped_ forControlEvents:64];
  [(CSModalView *)self _setSecondaryActionButton:v27];
}

- (void)_createEnhancedSecondaryActionButtonIfNecessary
{
  if (!self->_secondaryActionButton)
  {
    uint64_t v3 = [CSEnhancedModalButton alloc];
    int v8 = -[CSEnhancedModalButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CSEnhancedModalButton *)v8 _setContinuousCornerRadius:24.0];
    uint64_t v4 = [(CSEnhancedModalButton *)v8 titleLabel];
    uint64_t v5 = [(CSModalView *)self _secondaryActionFont];
    [v4 setFont:v5];

    uint64_t v6 = [(CSEnhancedModalButton *)v8 titleLabel];
    [v6 setNumberOfLines:1];

    int v7 = [(CSEnhancedModalButton *)v8 titleLabel];
    [v7 setAdjustsFontSizeToFitWidth:0];

    [(CSEnhancedModalButton *)v8 addTarget:self action:sel__buttonTapped_ forControlEvents:64];
    [(CSModalView *)self _setSecondaryActionButton:v8];
  }
}

- (void)_buttonTapped:(id)a3
{
  uint64_t v5 = (CSModalButton *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((CSModalButton *)self->_secondaryActionButton == v5)
  {
    [WeakRetained handleSecondaryActionForView:self];
  }
  else if (self->_primaryActionButton == v5)
  {
    [WeakRetained handlePrimaryActionForView:self];
  }
}

- (CGRect)_dateTimeFrame
{
  [(CSModalView *)self bounds];
  CGRectGetWidth(v8);
  [(CSModalView *)self bounds];
  [(CSModalView *)self bounds];
  UIRectCenteredXInRect();
  CGRectGetMinX(v9);
  [(CSModalView *)self _timeLabelBaselineY];
  [(CSModalView *)self _timeLabelBaselineY];
  [(CSModalView *)self _timeToSubtitleLabelBaselineDifferenceY];
  [MEMORY[0x1E4FA5F58] timeFontMetrics];
  [MEMORY[0x1E4FA5F50] labelFontMetrics];
  SBFMainScreenScale();

  BSRectRoundForScale();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)_timeLabelBaselineY
{
  double v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = (void *)(v4 & 0xFFFFFFFFFFFFFFFBLL);
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v5 == (void *)1)
  {
    if (v6)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_25;
      }
LABEL_10:
      int v8 = __sb__runningInSpringBoard();
      char v9 = v8;
      if (v8)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
        [v2 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (v9) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    double v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom] == 1) {
      goto LABEL_10;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (!v6)
  {
    double v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom]) {
      goto LABEL_24;
    }
LABEL_18:
    int v10 = __sb__runningInSpringBoard();
    char v11 = v10;
    if (v10)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v11)
    {
LABEL_23:
      if (v7) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) {
    goto LABEL_18;
  }
LABEL_25:
  SBFMainScreenScale();

  BSFloatRoundForScale();
  return result;
}

- (double)_timeToSubtitleLabelBaselineDifferenceY
{
  if (_timeToSubtitleLabelBaselineDifferenceY_onceToken != -1) {
    dispatch_once(&_timeToSubtitleLabelBaselineDifferenceY_onceToken, &__block_literal_global_34);
  }
  if (BSFloatIsZero())
  {
    double v3 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    if (IsAccessibilityCategory)
    {
      [MEMORY[0x1E4FA5F50] labelFontMetrics];
      _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = v5;
      return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
    }
    int v6 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      uint64_t v10 = 0x4042000000000000;
      goto LABEL_11;
    }
    int v8 = __sb__runningInSpringBoard();
    char v9 = v8;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v10 = 0x4044000000000000;
LABEL_11:
        _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = v10;
        return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
      if ([(id)v7 userInterfaceIdiom] != 1)
      {
        _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = 0x4044000000000000;
LABEL_22:

        return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
      }
    }
    int v11 = __sb__runningInSpringBoard();
    char v12 = v11;
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v13 = 40.0;
    if (v14 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
      double v13 = 46.0;
    }
    _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = *(void *)&v13;
    if ((v12 & 1) == 0) {

    }
    if ((v9 & 1) == 0) {
      goto LABEL_22;
    }
  }
  return *(double *)&_timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY;
}

void __54__CSModalView__timeToSubtitleLabelBaselineDifferenceY__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  uint64_t v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_39];
}

void __54__CSModalView__timeToSubtitleLabelBaselineDifferenceY__block_invoke_2()
{
  _timeToSubtitleLabelBaselineDifferenceY__timeToSubtitleLabelBaselineDifferenceY = 0;
}

- (BOOL)_isPortraitForDelegate:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 isPortrait];
  }
  else {
    char v5 = [(CSModalView *)self _hasPortraitDimensions];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_hasPortraitDimensions
{
  [(CSModalView *)self bounds];
  CGRectGetHeight(v5);
  [(CSModalView *)self bounds];
  CGRectGetWidth(v6);

  return BSFloatGreaterThanOrEqualToFloat();
}

+ (double)_bottomBaselineOffsetForPortrait:(BOOL)a3
{
  if (a3)
  {
    [a1 _modalViewBottomBaselineOffsetPortrait];
  }
  else
  {
    CGRect v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    double result = 90.0;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      return 21.0;
    }
  }
  return result;
}

+ (double)_modalViewBottomBaselineOffsetPortrait
{
  BOOL v3 = +[CSQuickActionsViewController deviceSupportsButtons];
  int v4 = __sb__runningInSpringBoard();
  int v5 = v4;
  if (!v3)
  {
    if (v4)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v6 = 0;
        uint64_t v7 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      id v457 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v457 userInterfaceIdiom] != 1)
      {
        uint64_t v7 = 0;
        int v6 = 1;
        goto LABEL_27;
      }
    }
    int v6 = v5 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v9 = __sb__runningInSpringBoard();
      if (v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v426 = [MEMORY[0x1E4F42D90] mainScreen];
        [v426 _referenceBounds];
      }
      uint64_t v7 = v9 ^ 1;
      BSSizeRoundForScale();
      if (v47 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v46 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        int v455 = v9 ^ 1;
        int v456 = v6;
        unint64_t v453 = 0;
        unint64_t v452 = 0;
        unint64_t v451 = 0;
        int v454 = 0;
        memset(v450, 0, sizeof(v450));
        int v447 = 0;
        int v445 = 0;
        uint64_t v448 = 0;
        uint64_t v442 = 0;
        int v444 = 0;
        uint64_t v438 = 0;
        uint64_t v434 = 0;
        uint64_t v436 = 0;
        uint64_t v433 = 0;
        uint64_t v431 = 0;
        int v428 = 0;
        int v31 = 0;
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        double v36 = 90.0;
        goto LABEL_194;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
LABEL_27:
    int v12 = __sb__runningInSpringBoard();
    int v455 = v7;
    int v456 = v6;
    if (v12)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v13 = 0;
        unsigned int v14 = 0;
        goto LABEL_45;
      }
    }
    else
    {
      v424 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v424 userInterfaceIdiom] != 1)
      {
        unsigned int v14 = 0;
        int v13 = 1;
        goto LABEL_45;
      }
    }
    int v13 = v12 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v9 = __sb__runningInSpringBoard();
      if (v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v408 = [MEMORY[0x1E4F42D90] mainScreen];
        [v408 _referenceBounds];
      }
      unsigned int v14 = v9 ^ 1;
      BSSizeRoundForScale();
      if (v50 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        LODWORD(v453) = v9 ^ 1;
        HIDWORD(v453) = v13;
        unint64_t v452 = 0;
        unint64_t v451 = 0;
        int v454 = 0;
        memset(v450, 0, sizeof(v450));
        int v447 = 0;
        int v445 = 0;
        uint64_t v448 = 0;
        uint64_t v442 = 0;
        int v444 = 0;
        uint64_t v438 = 0;
        uint64_t v434 = 0;
        uint64_t v436 = 0;
        uint64_t v433 = 0;
        uint64_t v431 = 0;
        int v428 = 0;
        int v31 = 0;
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        double v36 = 90.0;
        goto LABEL_194;
      }
    }
    else
    {
      unsigned int v14 = 0;
    }
LABEL_45:
    int v17 = __sb__runningInSpringBoard();
    unint64_t v453 = __PAIR64__(v13, v14);
    if (v17)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v18 = 0;
        unsigned int v19 = 0;
        goto LABEL_62;
      }
    }
    else
    {
      v422 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v422 userInterfaceIdiom] != 1)
      {
        unsigned int v19 = 0;
        int v18 = 1;
        goto LABEL_62;
      }
    }
    int v18 = v17 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v9 = __sb__runningInSpringBoard();
      if (v9)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v406 = [MEMORY[0x1E4F42D90] mainScreen];
        [v406 _referenceBounds];
      }
      unsigned int v19 = v9 ^ 1;
      BSSizeRoundForScale();
      if (v81 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        LODWORD(v452) = v9 ^ 1;
        HIDWORD(v452) = v18;
        unint64_t v451 = 0;
        int v454 = 0;
        memset(v450, 0, sizeof(v450));
        int v447 = 0;
        int v445 = 0;
        uint64_t v448 = 0;
        uint64_t v442 = 0;
        int v444 = 0;
        uint64_t v438 = 0;
        uint64_t v434 = 0;
        uint64_t v436 = 0;
        uint64_t v433 = 0;
        uint64_t v431 = 0;
        int v428 = 0;
        int v31 = 0;
        int v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v35 = 0;
        double v36 = 90.0;
        goto LABEL_194;
      }
    }
    else
    {
      unsigned int v19 = 0;
    }
LABEL_62:
    int v22 = __sb__runningInSpringBoard();
    unint64_t v452 = __PAIR64__(v18, v19);
    if (v22)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v23 = 0;
        unsigned int v24 = 0;
        goto LABEL_80;
      }
    }
    else
    {
      v420 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v420 userInterfaceIdiom] != 1)
      {
        unsigned int v24 = 0;
        int v23 = 1;
        goto LABEL_80;
      }
    }
    int v23 = v22 ^ 1;
    uint64_t v9 = __sb__runningInSpringBoard();
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v414 = [MEMORY[0x1E4F42D90] mainScreen];
      [v414 _referenceBounds];
    }
    unsigned int v24 = v9 ^ 1;
    BSSizeRoundForScale();
    if (v28 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      LODWORD(v451) = v9 ^ 1;
      HIDWORD(v451) = v23;
      int v454 = 0;
      memset(v450, 0, sizeof(v450));
      int v447 = 0;
      int v445 = 0;
      uint64_t v448 = 0;
      uint64_t v442 = 0;
      int v444 = 0;
      uint64_t v438 = 0;
      uint64_t v434 = 0;
      uint64_t v436 = 0;
      uint64_t v433 = 0;
      uint64_t v431 = 0;
      int v428 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      double v36 = 90.0;
      goto LABEL_194;
    }
LABEL_80:
    int v29 = __sb__runningInSpringBoard();
    unint64_t v451 = __PAIR64__(v23, v24);
    if (v29)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v2 = 0;
        int v454 = 0;
        goto LABEL_100;
      }
    }
    else
    {
      v418 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v418 userInterfaceIdiom] != 1)
      {
        int v454 = 0;
        uint64_t v2 = 1;
        goto LABEL_100;
      }
    }
    uint64_t v2 = v29 ^ 1u;
    uint64_t v9 = __sb__runningInSpringBoard();
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v410 = [MEMORY[0x1E4F42D90] mainScreen];
      [v410 _referenceBounds];
    }
    int v454 = v9 ^ 1;
    BSSizeRoundForScale();
    if (v40 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      HIDWORD(v450[9]) = v2;
      memset(v450, 0, 76);
      int v447 = 0;
      int v445 = 0;
      uint64_t v448 = 0;
      uint64_t v442 = 0;
      int v444 = 0;
      uint64_t v438 = 0;
      uint64_t v434 = 0;
      uint64_t v436 = 0;
      uint64_t v433 = 0;
      uint64_t v431 = 0;
      int v428 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      double v36 = 90.0;
      goto LABEL_194;
    }
LABEL_100:
    int v41 = __sb__runningInSpringBoard();
    HIDWORD(v450[9]) = v2;
    if (v41)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(void *)((char *)&v450[8] + 4) = 0;
        goto LABEL_530;
      }
    }
    else
    {
      v416 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v416 userInterfaceIdiom] != 1)
      {
        HIDWORD(v450[8]) = 0;
        LODWORD(v450[9]) = 1;
        goto LABEL_530;
      }
    }
    LODWORD(v450[9]) = v41 ^ 1;
    uint64_t v9 = __sb__runningInSpringBoard();
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v404 = [MEMORY[0x1E4F42D90] mainScreen];
      [v404 _referenceBounds];
    }
    HIDWORD(v450[8]) = v9 ^ 1;
    BSSizeRoundForScale();
    if (v90 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      memset(v450, 0, 68);
      int v447 = 0;
      int v445 = 0;
      uint64_t v448 = 0;
      uint64_t v442 = 0;
      int v444 = 0;
      uint64_t v438 = 0;
      uint64_t v434 = 0;
      uint64_t v436 = 0;
      uint64_t v433 = 0;
      uint64_t v431 = 0;
      int v428 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      double v36 = 90.0;
      goto LABEL_194;
    }
LABEL_530:
    uint64_t v9 = __sb__runningInSpringBoard();
    if (v9)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_532;
      }
    }
    else
    {
      v412 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v412 userInterfaceIdiom] != 1)
      {
LABEL_532:
        LODWORD(v450[8]) = v9 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_536:
          *(void *)((char *)&v450[6] + 4) = 0;
          goto LABEL_589;
        }
        int v91 = __sb__runningInSpringBoard();
        if (v91)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_536;
          }
        }
        else
        {
          v400 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v400 userInterfaceIdiom])
          {
            *(void *)((char *)&v450[6] + 4) = 1;
            goto LABEL_589;
          }
        }
        HIDWORD(v450[6]) = v91 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
            [(id)v2 _referenceBounds];
          }
          v394 = (void *)v2;
          LODWORD(v450[7]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v104 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            HIDWORD(v450[7]) = 0;
            memset(v450, 0, 52);
            int v447 = 0;
            int v445 = 0;
            uint64_t v448 = 0;
            uint64_t v442 = 0;
            int v444 = 0;
            uint64_t v438 = 0;
            uint64_t v434 = 0;
            uint64_t v436 = 0;
            uint64_t v433 = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[7]) = 0;
        }
LABEL_589:
        uint64_t v9 = __sb__runningInSpringBoard();
        uint64_t v2 = (uint64_t)&qword_1D8505000;
        if (v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v450[7]) = 0;
            LODWORD(v450[6]) = 0;
            goto LABEL_599;
          }
        }
        else
        {
          v402 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v402 userInterfaceIdiom])
          {
            LODWORD(v450[6]) = 0;
            HIDWORD(v450[7]) = 1;
            goto LABEL_599;
          }
        }
        HIDWORD(v450[7]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v390 = [MEMORY[0x1E4F42D90] mainScreen];
            [v390 _referenceBounds];
          }
          LODWORD(v450[6]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v99 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_603;
          }
        }
        else
        {
          LODWORD(v450[6]) = 0;
        }
LABEL_599:
        if (_SBF_Private_IsD94Like())
        {
          memset(v450, 0, 48);
          int v447 = 0;
          int v445 = 0;
          uint64_t v448 = 0;
          uint64_t v442 = 0;
          int v444 = 0;
          uint64_t v438 = 0;
          uint64_t v434 = 0;
          uint64_t v436 = 0;
          uint64_t v433 = 0;
          uint64_t v431 = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 48.7;
          goto LABEL_194;
        }
LABEL_603:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_607:
          v450[5] = 0;
          goto LABEL_682;
        }
        int v100 = __sb__runningInSpringBoard();
        if (v100)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_607;
          }
        }
        else
        {
          v392 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v392 userInterfaceIdiom])
          {
            v450[5] = 0x100000000;
            goto LABEL_682;
          }
        }
        HIDWORD(v450[5]) = v100 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v376 = [MEMORY[0x1E4F42D90] mainScreen];
            [v376 _referenceBounds];
          }
          LODWORD(v450[5]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            memset(v450, 0, 40);
            int v447 = 0;
            int v445 = 0;
            uint64_t v448 = 0;
            uint64_t v442 = 0;
            int v444 = 0;
            uint64_t v438 = 0;
            uint64_t v434 = 0;
            uint64_t v436 = 0;
            uint64_t v433 = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[5]) = 0;
        }
LABEL_682:
        uint64_t v9 = __sb__runningInSpringBoard();
        if (v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v450[4]) = 0;
            HIDWORD(v450[3]) = 0;
            goto LABEL_692;
          }
        }
        else
        {
          v398 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v398 userInterfaceIdiom])
          {
            HIDWORD(v450[3]) = 0;
            HIDWORD(v450[4]) = 1;
            goto LABEL_692;
          }
        }
        HIDWORD(v450[4]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v384 = [MEMORY[0x1E4F42D90] mainScreen];
            [v384 _referenceBounds];
          }
          HIDWORD(v450[3]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v113 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_696;
          }
        }
        else
        {
          HIDWORD(v450[3]) = 0;
        }
LABEL_692:
        if (_SBF_Private_IsD64Like())
        {
          LODWORD(v450[4]) = 0;
          memset(v450, 0, 28);
          int v447 = 0;
          int v445 = 0;
          uint64_t v448 = 0;
          uint64_t v442 = 0;
          int v444 = 0;
          uint64_t v438 = 0;
          uint64_t v434 = 0;
          uint64_t v436 = 0;
          uint64_t v433 = 0;
          uint64_t v431 = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 48.7;
          goto LABEL_194;
        }
LABEL_696:
        int v114 = __sb__runningInSpringBoard();
        if (v114)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v450[4]) = 0;
            LODWORD(v450[3]) = 0;
            goto LABEL_706;
          }
        }
        else
        {
          v396 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v396 userInterfaceIdiom])
          {
            LODWORD(v450[3]) = 0;
            LODWORD(v450[4]) = 1;
            goto LABEL_706;
          }
        }
        LODWORD(v450[4]) = v114 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v115 = __sb__runningInSpringBoard();
          if (v115)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v378 = [MEMORY[0x1E4F42D90] mainScreen];
            [v378 _referenceBounds];
          }
          uint64_t v9 = v115 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v450[3]) = v9;
          if (v121 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            memset(v450, 0, 24);
            int v447 = 0;
            int v445 = 0;
            uint64_t v448 = 0;
            uint64_t v442 = 0;
            int v444 = 0;
            uint64_t v438 = 0;
            uint64_t v434 = 0;
            uint64_t v436 = 0;
            uint64_t v433 = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[3]) = 0;
        }
LABEL_706:
        uint64_t v9 = __sb__runningInSpringBoard();
        if (v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v450[1]) = 0;
            LODWORD(v450[0]) = 0;
            goto LABEL_756;
          }
        }
        else
        {
          v388 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v388 userInterfaceIdiom])
          {
            LODWORD(v450[0]) = 0;
            HIDWORD(v450[1]) = 1;
            goto LABEL_756;
          }
        }
        HIDWORD(v450[1]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v374 = [MEMORY[0x1E4F42D90] mainScreen];
            [v374 _referenceBounds];
          }
          LODWORD(v450[0]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v128 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_792;
          }
        }
        else
        {
          LODWORD(v450[0]) = 0;
        }
LABEL_756:
        if (_SBF_Private_IsD54())
        {
          v450[2] = 0;
          *(void *)((char *)v450 + 4) = 0;
          int v447 = 0;
          int v445 = 0;
          uint64_t v448 = 0;
          uint64_t v442 = 0;
          int v444 = 0;
          uint64_t v438 = 0;
          uint64_t v434 = 0;
          uint64_t v436 = 0;
          uint64_t v433 = 0;
          uint64_t v431 = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 48.7;
          goto LABEL_194;
        }
LABEL_792:
        int v129 = __sb__runningInSpringBoard();
        if (v129)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v2 = 0;
            LODWORD(v450[2]) = 0;
            goto LABEL_820;
          }
        }
        else
        {
          v386 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v386 userInterfaceIdiom])
          {
            LODWORD(v450[2]) = 0;
            uint64_t v2 = 1;
            goto LABEL_820;
          }
        }
        uint64_t v2 = v129 ^ 1u;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v134 = __sb__runningInSpringBoard();
          if (v134)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v368 = [MEMORY[0x1E4F42D90] mainScreen];
            [v368 _referenceBounds];
          }
          uint64_t v9 = v134 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v450[2]) = v9;
          if (v138 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            HIDWORD(v450[2]) = v2;
            *(void *)((char *)v450 + 4) = 0;
            int v447 = 0;
            int v445 = 0;
            uint64_t v448 = 0;
            uint64_t v442 = 0;
            int v444 = 0;
            uint64_t v438 = 0;
            uint64_t v434 = 0;
            uint64_t v436 = 0;
            uint64_t v433 = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 58.5;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v450[2]) = 0;
        }
LABEL_820:
        uint64_t v9 = __sb__runningInSpringBoard();
        HIDWORD(v450[2]) = v2;
        if (v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)((char *)v450 + 4) = 0;
            goto LABEL_847;
          }
        }
        else
        {
          v382 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v382 userInterfaceIdiom])
          {
            HIDWORD(v450[0]) = 0;
            LODWORD(v450[1]) = 1;
            goto LABEL_847;
          }
        }
        LODWORD(v450[1]) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v366 = [MEMORY[0x1E4F42D90] mainScreen];
            [v366 _referenceBounds];
          }
          HIDWORD(v450[0]) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v142 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_880;
          }
        }
        else
        {
          HIDWORD(v450[0]) = 0;
        }
LABEL_847:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          int v447 = 0;
          int v445 = 0;
          uint64_t v448 = 0;
          uint64_t v442 = 0;
          int v444 = 0;
          uint64_t v438 = 0;
          uint64_t v434 = 0;
          uint64_t v436 = 0;
          uint64_t v433 = 0;
          uint64_t v431 = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 50.7;
          goto LABEL_194;
        }
LABEL_880:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_884:
          int v447 = 0;
          int v445 = 0;
          goto LABEL_925;
        }
        int v143 = __sb__runningInSpringBoard();
        if (v143)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_884;
          }
        }
        else
        {
          v372 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v372 userInterfaceIdiom])
          {
            int v445 = 0;
            int v447 = 1;
            goto LABEL_925;
          }
        }
        int v447 = v143 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v151 = __sb__runningInSpringBoard();
          if (v151)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
            [(id)v2 _referenceBounds];
          }
          v362 = (void *)v2;
          uint64_t v9 = v151 ^ 1u;
          BSSizeRoundForScale();
          int v445 = v9;
          if (v162 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            uint64_t v448 = 0;
            uint64_t v442 = 0;
            int v444 = 0;
            uint64_t v438 = 0;
            uint64_t v434 = 0;
            uint64_t v436 = 0;
            uint64_t v433 = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 51.0;
            goto LABEL_194;
          }
        }
        else
        {
          int v445 = 0;
        }
LABEL_925:
        int v152 = __sb__runningInSpringBoard();
        uint64_t v2 = (uint64_t)&qword_1D8505000;
        if (v152)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v448) = 0;
            uint64_t v9 = 0;
            goto LABEL_935;
          }
        }
        else
        {
          v380 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v380 userInterfaceIdiom])
          {
            uint64_t v9 = 0;
            HIDWORD(v448) = 1;
            goto LABEL_935;
          }
        }
        HIDWORD(v448) = v152 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v153 = __sb__runningInSpringBoard();
          if (v153)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v358 = [MEMORY[0x1E4F42D90] mainScreen];
            [v358 _referenceBounds];
          }
          uint64_t v9 = v153 ^ 1u;
          BSSizeRoundForScale();
          if (v154 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_939;
          }
        }
        else
        {
          uint64_t v9 = 0;
        }
LABEL_935:
        if (_SBF_Private_IsD93Like())
        {
          LODWORD(v448) = v9;
          uint64_t v442 = 0;
          int v444 = 0;
          uint64_t v438 = 0;
          uint64_t v434 = 0;
          uint64_t v436 = 0;
          uint64_t v433 = 0;
          uint64_t v431 = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 37.5;
          goto LABEL_194;
        }
LABEL_939:
        LODWORD(v448) = v9;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_943:
          uint64_t v442 = 0;
          goto LABEL_1018;
        }
        int v155 = __sb__runningInSpringBoard();
        if (v155)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_943;
          }
        }
        else
        {
          v360 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v360 userInterfaceIdiom])
          {
            uint64_t v442 = 0x100000000;
            goto LABEL_1018;
          }
        }
        HIDWORD(v442) = v155 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v346 = [MEMORY[0x1E4F42D90] mainScreen];
            [v346 _referenceBounds];
          }
          LODWORD(v442) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v182 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            int v444 = 0;
            uint64_t v438 = 0;
            uint64_t v434 = 0;
            uint64_t v436 = 0;
            uint64_t v433 = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 51.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v442) = 0;
        }
LABEL_1018:
        uint64_t v9 = __sb__runningInSpringBoard();
        if (v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v444 = 0;
            HIDWORD(v438) = 0;
            goto LABEL_1028;
          }
        }
        else
        {
          v370 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v370 userInterfaceIdiom])
          {
            HIDWORD(v438) = 0;
            int v444 = 1;
            goto LABEL_1028;
          }
        }
        int v444 = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v352 = [MEMORY[0x1E4F42D90] mainScreen];
            [v352 _referenceBounds];
          }
          HIDWORD(v438) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v171 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_1032;
          }
        }
        else
        {
          HIDWORD(v438) = 0;
        }
LABEL_1028:
        if (_SBF_Private_IsD63Like())
        {
          LODWORD(v438) = 0;
          uint64_t v434 = 0;
          uint64_t v436 = 0;
          uint64_t v433 = 0;
          uint64_t v431 = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 37.5;
          goto LABEL_194;
        }
LABEL_1032:
        int v172 = __sb__runningInSpringBoard();
        if (v172)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v438) = 0;
            LODWORD(v434) = 0;
            goto LABEL_1042;
          }
        }
        else
        {
          v364 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v364 userInterfaceIdiom])
          {
            LODWORD(v434) = 0;
            LODWORD(v438) = 1;
            goto LABEL_1042;
          }
        }
        LODWORD(v438) = v172 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v173 = __sb__runningInSpringBoard();
          if (v173)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v348 = [MEMORY[0x1E4F42D90] mainScreen];
            [v348 _referenceBounds];
          }
          uint64_t v9 = v173 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v434) = v9;
          if (v179 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            uint64_t v436 = 0;
            HIDWORD(v434) = 0;
            uint64_t v433 = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 59.0;
            goto LABEL_194;
          }
        }
        else
        {
          LODWORD(v434) = 0;
        }
LABEL_1042:
        uint64_t v9 = __sb__runningInSpringBoard();
        if (v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v436 = 0;
            goto LABEL_1092;
          }
        }
        else
        {
          v356 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v356 userInterfaceIdiom])
          {
            uint64_t v436 = 0x100000000;
            goto LABEL_1092;
          }
        }
        HIDWORD(v436) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v344 = [MEMORY[0x1E4F42D90] mainScreen];
            [v344 _referenceBounds];
          }
          LODWORD(v436) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v186 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_1128;
          }
        }
        else
        {
          LODWORD(v436) = 0;
        }
LABEL_1092:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          HIDWORD(v434) = 0;
          uint64_t v433 = 0;
          uint64_t v431 = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 51.2;
          goto LABEL_194;
        }
LABEL_1128:
        int v187 = __sb__runningInSpringBoard();
        if (v187)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v434) = 0;
            HIDWORD(v433) = 0;
            goto LABEL_1156;
          }
        }
        else
        {
          v354 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v354 userInterfaceIdiom])
          {
            HIDWORD(v433) = 0;
            HIDWORD(v434) = 1;
            goto LABEL_1156;
          }
        }
        HIDWORD(v434) = v187 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v342 = [MEMORY[0x1E4F42D90] mainScreen];
            [v342 _referenceBounds];
          }
          HIDWORD(v433) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v196 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            LODWORD(v433) = 0;
            uint64_t v431 = 0;
            int v428 = 0;
            int v31 = 0;
            int v32 = 0;
            int v33 = 0;
            int v34 = 0;
            int v35 = 0;
            double v36 = 51.0;
            goto LABEL_194;
          }
        }
        else
        {
          HIDWORD(v433) = 0;
        }
LABEL_1156:
        uint64_t v9 = __sb__runningInSpringBoard();
        if (v9)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v433) = 0;
            HIDWORD(v431) = 0;
            goto LABEL_1182;
          }
        }
        else
        {
          v350 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v350 userInterfaceIdiom])
          {
            HIDWORD(v431) = 0;
            LODWORD(v433) = 1;
            goto LABEL_1182;
          }
        }
        LODWORD(v433) = v9 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v9 = __sb__runningInSpringBoard();
          if (v9)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v340 = [MEMORY[0x1E4F42D90] mainScreen];
            [v340 _referenceBounds];
          }
          HIDWORD(v431) = v9 ^ 1;
          BSSizeRoundForScale();
          if (v199 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
LABEL_1213:
            uint64_t v9 = (uint64_t)&qword_1D8505000;
            if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
            {
              LODWORD(v431) = 0;
              int v428 = 0;
              int v31 = 0;
              int v32 = 0;
              int v33 = 0;
              int v34 = 0;
              int v35 = 0;
              double v36 = 51.0;
              goto LABEL_194;
            }
            if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16()) {
              goto LABEL_1221;
            }
            double v36 = 51.0;
            if (_SBF_Private_IsD52OrSimilarDevice())
            {
              LODWORD(v431) = 0;
              int v428 = 0;
              int v31 = 0;
              int v32 = 0;
              int v33 = 0;
              int v34 = 0;
              int v35 = 0;
              goto LABEL_194;
            }
            if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
            {
LABEL_1221:
              LODWORD(v431) = 0;
              int v428 = 0;
              int v31 = 0;
              int v32 = 0;
              int v33 = 0;
              int v34 = 0;
              int v35 = 0;
              uint64_t v200 = 0x4044000000000000;
LABEL_1222:
              double v36 = *(double *)&v200;
              goto LABEL_194;
            }
            int v203 = __sb__runningInSpringBoard();
            if (v203)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                LODWORD(v431) = 0;
                int v428 = 0;
                goto LABEL_1267;
              }
            }
            else
            {
              v338 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v338 userInterfaceIdiom])
              {
                int v428 = 0;
                LODWORD(v431) = 1;
                goto LABEL_1267;
              }
            }
            LODWORD(v431) = v203 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              uint64_t v9 = __sb__runningInSpringBoard();
              if (v9)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v334 = [MEMORY[0x1E4F42D90] mainScreen];
                [v334 _referenceBounds];
              }
              int v428 = v9 ^ 1;
              BSSizeRoundForScale();
              if (v217 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
              {
                int v31 = 0;
                int v32 = 0;
                int v33 = 0;
                int v34 = 0;
                int v35 = 0;
                goto LABEL_194;
              }
            }
            else
            {
              int v428 = 0;
            }
LABEL_1267:
            uint64_t v9 = __sb__runningInSpringBoard();
            if (v9)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v31 = 0;
                int v32 = 0;
                goto LABEL_1297;
              }
            }
            else
            {
              v336 = [MEMORY[0x1E4F42948] currentDevice];
              if ([v336 userInterfaceIdiom])
              {
                int v32 = 0;
                int v31 = 1;
                goto LABEL_1297;
              }
            }
            int v31 = v9 ^ 1;
            if (SBFEffectiveHomeButtonType() == 2)
            {
              uint64_t v2 = __sb__runningInSpringBoard();
              if (v2)
              {
                __sb__mainScreenReferenceBounds();
              }
              else
              {
                v332 = [MEMORY[0x1E4F42D90] mainScreen];
                [v332 _referenceBounds];
              }
              int v32 = v2 ^ 1;
              BSSizeRoundForScale();
              if (v220 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
              {
                int v33 = 0;
                int v34 = 0;
                int v35 = 0;
                double v36 = 40.0;
                goto LABEL_194;
              }
            }
            else
            {
              int v32 = 0;
            }
LABEL_1297:
            uint64_t v2 = __sb__runningInSpringBoard();
            if (v2)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
                int v33 = 0;
                int v34 = 0;
LABEL_1328:
                uint64_t v214 = __sb__runningInSpringBoard();
                if (v214)
                {
                  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
                  {
LABEL_1331:
                    int v35 = 0;
                    double v36 = 50.0;
                    goto LABEL_194;
                  }
                }
                else
                {
                  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
                  if ([(id)v2 userInterfaceIdiom])
                  {
                    int v35 = 1;
                    uint64_t v200 = 0x4049000000000000;
                    goto LABEL_1222;
                  }
                }
                int v35 = v214 ^ 1;
                int v224 = __sb__runningInSpringBoard();
                if (v224)
                {
                  __sb__mainScreenReferenceBounds();
                }
                else
                {
                  uint64_t v214 = [MEMORY[0x1E4F42D90] mainScreen];
                  [(id)v214 _referenceBounds];
                }
                BSSizeRoundForScale();
                double v36 = 50.0;
                if (v224 != 1) {

                }
LABEL_194:
                if (v35) {

                }
                if (v34) {
                if (v33)
                }

                if (v32) {
                if (v31)
                }

                if (v428) {
                if (v431)
                }

                if (HIDWORD(v431)) {
                if (v433)
                }

                if (HIDWORD(v433)) {
                if (HIDWORD(v434))
                }

                if (v436) {
                if (HIDWORD(v436))
                }

                if (v434) {
                if (v438)
                }

                if (HIDWORD(v438)) {
                if (v444)
                }

                if (v442) {
                if (HIDWORD(v442))
                }

                if (v448) {
                if (HIDWORD(v448))
                }

                if (v445) {
                if (v447)
                }

                if (HIDWORD(v450[0])) {
                if (LODWORD(v450[1]))
                }

                if (LODWORD(v450[2])) {
                if (HIDWORD(v450[2]))
                }

                if (LODWORD(v450[0])) {
                if (HIDWORD(v450[1]))
                }

                if (LODWORD(v450[3])) {
                if (LODWORD(v450[4]))
                }

                if (HIDWORD(v450[3])) {
                if (HIDWORD(v450[4]))
                }

                if (LODWORD(v450[5])) {
                if (HIDWORD(v450[5]))
                }

                if (LODWORD(v450[6])) {
                if (HIDWORD(v450[7]))
                }

                if (LODWORD(v450[7])) {
                if (HIDWORD(v450[6]))
                }

                if (LODWORD(v450[8])) {
                if (HIDWORD(v450[8]))
                }

                if (LODWORD(v450[9])) {
                if (v454)
                }

                if (HIDWORD(v450[9]))
                {

                  if (!v451) {
                    goto LABEL_282;
                  }
                }
                else if (!v451)
                {
LABEL_282:
                  if (HIDWORD(v451)) {
                    goto LABEL_283;
                  }
                  goto LABEL_293;
                }

                if (HIDWORD(v451))
                {
LABEL_283:

                  if (!v452) {
                    goto LABEL_284;
                  }
                  goto LABEL_294;
                }
LABEL_293:
                if (!v452)
                {
LABEL_284:
                  if (HIDWORD(v452)) {
                    goto LABEL_285;
                  }
                  goto LABEL_295;
                }
LABEL_294:

                if (HIDWORD(v452))
                {
LABEL_285:

                  if (!v453) {
                    goto LABEL_286;
                  }
                  goto LABEL_296;
                }
LABEL_295:
                if (!v453)
                {
LABEL_286:
                  if (HIDWORD(v453)) {
                    goto LABEL_287;
                  }
                  goto LABEL_297;
                }
LABEL_296:

                if (HIDWORD(v453))
                {
LABEL_287:

                  if (!v455) {
                    goto LABEL_288;
                  }
                  goto LABEL_298;
                }
LABEL_297:
                if (!v455)
                {
LABEL_288:
                  if (!v456) {
                    return v36;
                  }
LABEL_289:

                  return v36;
                }
LABEL_298:

                if (!v456) {
                  return v36;
                }
                goto LABEL_289;
              }
            }
            else
            {
              uint64_t v9 = [MEMORY[0x1E4F42948] currentDevice];
              if ([(id)v9 userInterfaceIdiom])
              {
                int v34 = 0;
                int v33 = 1;
                goto LABEL_1328;
              }
            }
            int v33 = v2 ^ 1;
            uint64_t v2 = __sb__runningInSpringBoard();
            if (v2)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              uint64_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
              [(id)v7 _referenceBounds];
            }
            int v34 = v2 ^ 1;
            BSSizeRoundForScale();
            if (v213 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
              goto LABEL_1331;
            }
            goto LABEL_1328;
          }
        }
        else
        {
          HIDWORD(v431) = 0;
        }
LABEL_1182:
        if (_SBF_Private_IsD53())
        {
          LODWORD(v431) = 0;
          int v428 = 0;
          int v31 = 0;
          int v32 = 0;
          int v33 = 0;
          int v34 = 0;
          int v35 = 0;
          double v36 = 37.5;
          goto LABEL_194;
        }
        goto LABEL_1213;
      }
    }
    memset(v450, 0, 64);
    int v447 = 0;
    int v445 = 0;
    uint64_t v448 = 0;
    uint64_t v442 = 0;
    int v444 = 0;
    uint64_t v438 = 0;
    uint64_t v434 = 0;
    uint64_t v436 = 0;
    uint64_t v433 = 0;
    uint64_t v431 = 0;
    int v428 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    double v36 = 90.0;
    LODWORD(v450[8]) = v9 ^ 1;
    goto LABEL_194;
  }
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v453) = 0;
      LOBYTE(v456) = 0;
      goto LABEL_18;
    }
  }
  else
  {
    id v457 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v457 userInterfaceIdiom] != 1)
    {
      HIDWORD(v453) = 0;
      LOBYTE(v456) = 1;
      goto LABEL_18;
    }
  }
  LOBYTE(v456) = v5 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v8 = __sb__runningInSpringBoard();
    if (v8)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v302 = [MEMORY[0x1E4F42D90] mainScreen];
      [v302 _referenceBounds];
    }
    int v42 = v8 ^ 1;
    BSSizeRoundForScale();
    BOOL v45 = v44 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v43 == *(double *)(MEMORY[0x1E4FA6E50] + 280);
    HIDWORD(v453) = v42;
    if (v45)
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      int v393 = 0;
      int v397 = 0;
      int v417 = 0;
      int v419 = 0;
      uint64_t v430 = 0;
      int v409 = 0;
      int v421 = 0;
      uint64_t v432 = 0;
      uint64_t v441 = 0;
      uint64_t v443 = 0;
      uint64_t v446 = 0;
      v450[1] = 0;
      LODWORD(v450[0]) = 0;
      *(void *)((char *)&v450[2] + 4) = 0;
      *(void *)((char *)&v450[4] + 4) = 0;
      unint64_t v452 = 0;
      v450[9] = 0;
      LODWORD(v453) = 0;
      LODWORD(v451) = 0;
      v30 = &qword_1D8505EC8;
      goto LABEL_131;
    }
  }
  else
  {
    HIDWORD(v453) = 0;
  }
LABEL_18:
  int v10 = __sb__runningInSpringBoard();
  if (v10)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v450[1]) = 0;
      LODWORD(v450[3]) = 0;
      goto LABEL_36;
    }
  }
  else
  {
    v317 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v317 userInterfaceIdiom] != 1)
    {
      HIDWORD(v450[1]) = 0;
      LODWORD(v450[3]) = 1;
      goto LABEL_36;
    }
  }
  LODWORD(v450[3]) = v10 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v11 = __sb__runningInSpringBoard();
    if (v11)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v300 = [MEMORY[0x1E4F42D90] mainScreen];
      [v300 _referenceBounds];
    }
    BSSizeRoundForScale();
    HIDWORD(v450[1]) = v11 ^ 1;
    if (v49 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      int v393 = 0;
      int v397 = 0;
      int v417 = 0;
      int v419 = 0;
      uint64_t v430 = 0;
      int v409 = 0;
      int v421 = 0;
      uint64_t v432 = 0;
      uint64_t v441 = 0;
      uint64_t v443 = 0;
      uint64_t v446 = 0;
      LODWORD(v450[1]) = 0;
      LODWORD(v450[0]) = 0;
      HIDWORD(v450[2]) = 0;
      *(void *)((char *)&v450[4] + 4) = 0;
      unint64_t v452 = 0;
      v450[9] = 0;
      LODWORD(v453) = 0;
      LODWORD(v451) = 0;
      v30 = &qword_1D8505EF0;
      goto LABEL_131;
    }
  }
  else
  {
    HIDWORD(v450[1]) = 0;
  }
LABEL_36:
  int v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      LODWORD(v453) = 0;
      LODWORD(v451) = 0;
      goto LABEL_54;
    }
  }
  else
  {
    v315 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v315 userInterfaceIdiom] != 1)
    {
      LODWORD(v453) = 0;
      LODWORD(v451) = 1;
      goto LABEL_54;
    }
  }
  LODWORD(v451) = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v16 = __sb__runningInSpringBoard();
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v298 = [MEMORY[0x1E4F42D90] mainScreen];
      [v298 _referenceBounds];
    }
    LODWORD(v453) = v16 ^ 1;
    BSSizeRoundForScale();
    if (v51 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      int v393 = 0;
      int v397 = 0;
      int v417 = 0;
      int v419 = 0;
      uint64_t v430 = 0;
      int v409 = 0;
      int v421 = 0;
      uint64_t v432 = 0;
      uint64_t v441 = 0;
      uint64_t v443 = 0;
      uint64_t v446 = 0;
      LODWORD(v450[1]) = 0;
      LODWORD(v450[0]) = 0;
      HIDWORD(v450[2]) = 0;
      *(void *)((char *)&v450[4] + 4) = 0;
      unint64_t v452 = 0;
      v450[9] = 0;
      v30 = &qword_1D8505EE0;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v453) = 0;
  }
LABEL_54:
  int v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v450[9] = 0;
      goto LABEL_71;
    }
  }
  else
  {
    v313 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v313 userInterfaceIdiom] != 1)
    {
      v450[9] = 0x100000000;
      goto LABEL_71;
    }
  }
  HIDWORD(v450[9]) = v20 ^ 1;
  int v21 = __sb__runningInSpringBoard();
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v308 = [MEMORY[0x1E4F42D90] mainScreen];
    [v308 _referenceBounds];
  }
  LODWORD(v450[9]) = v21 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    int v417 = 0;
    int v419 = 0;
    uint64_t v430 = 0;
    int v409 = 0;
    int v421 = 0;
    uint64_t v432 = 0;
    uint64_t v441 = 0;
    uint64_t v443 = 0;
    uint64_t v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    HIDWORD(v450[2]) = 0;
    *(void *)((char *)&v450[4] + 4) = 0;
    unint64_t v452 = 0;
    v30 = &qword_1D8505EE8;
    goto LABEL_131;
  }
LABEL_71:
  int v26 = __sb__runningInSpringBoard();
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      unint64_t v452 = 0;
      goto LABEL_91;
    }
  }
  else
  {
    v311 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v311 userInterfaceIdiom] != 1)
    {
      unint64_t v452 = 0x100000000;
      goto LABEL_91;
    }
  }
  HIDWORD(v452) = v26 ^ 1;
  int v27 = __sb__runningInSpringBoard();
  if (v27)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v304 = [MEMORY[0x1E4F42D90] mainScreen];
    [v304 _referenceBounds];
  }
  LODWORD(v452) = v27 ^ 1;
  BSSizeRoundForScale();
  if (v37 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    int v417 = 0;
    int v419 = 0;
    uint64_t v430 = 0;
    int v409 = 0;
    int v421 = 0;
    uint64_t v432 = 0;
    uint64_t v441 = 0;
    uint64_t v443 = 0;
    uint64_t v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    HIDWORD(v450[2]) = 0;
    *(void *)((char *)&v450[4] + 4) = 0;
    v30 = &qword_1D8505ED8;
    goto LABEL_131;
  }
LABEL_91:
  int v38 = __sb__runningInSpringBoard();
  if (v38)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v450[4] + 4) = 0;
      goto LABEL_518;
    }
  }
  else
  {
    v327 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v327 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v450[4] + 4) = 0x100000000;
      goto LABEL_518;
    }
  }
  LODWORD(v450[5]) = v38 ^ 1;
  int v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v296 = [MEMORY[0x1E4F42D90] mainScreen];
    [v296 _referenceBounds];
  }
  HIDWORD(v450[4]) = v39 ^ 1;
  BSSizeRoundForScale();
  if (v87 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    int v417 = 0;
    int v419 = 0;
    uint64_t v430 = 0;
    int v409 = 0;
    int v421 = 0;
    uint64_t v432 = 0;
    uint64_t v441 = 0;
    uint64_t v443 = 0;
    uint64_t v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    HIDWORD(v450[2]) = 0;
    v30 = &qword_1D8505ED0;
    goto LABEL_131;
  }
LABEL_518:
  int v88 = __sb__runningInSpringBoard();
  if (v88)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_520;
    }
LABEL_526:
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    int v417 = 0;
    int v419 = 0;
    uint64_t v430 = 0;
    int v409 = 0;
    int v421 = 0;
    uint64_t v432 = 0;
    uint64_t v441 = 0;
    uint64_t v443 = 0;
    uint64_t v446 = 0;
    LODWORD(v450[1]) = 0;
    LODWORD(v450[0]) = 0;
    v30 = &qword_1D8505EC0;
    HIDWORD(v450[2]) = v88 ^ 1;
    goto LABEL_131;
  }
  v306 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v306 userInterfaceIdiom] == 1) {
    goto LABEL_526;
  }
LABEL_520:
  HIDWORD(v450[2]) = v88 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_524:
    LODWORD(v450[0]) = 0;
    HIDWORD(v446) = 0;
    goto LABEL_564;
  }
  int v89 = __sb__runningInSpringBoard();
  if (v89)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_524;
    }
  }
  else
  {
    v292 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v292 userInterfaceIdiom])
    {
      LODWORD(v450[0]) = 0;
      HIDWORD(v446) = 1;
      goto LABEL_564;
    }
  }
  HIDWORD(v446) = v89 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v94 = __sb__runningInSpringBoard();
    if (v94)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v278 = [MEMORY[0x1E4F42D90] mainScreen];
      [v278 _referenceBounds];
    }
    LODWORD(v450[0]) = v94 ^ 1;
    BSSizeRoundForScale();
    if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      int v393 = 0;
      int v397 = 0;
      int v417 = 0;
      int v419 = 0;
      uint64_t v430 = 0;
      int v409 = 0;
      int v421 = 0;
      uint64_t v432 = 0;
      uint64_t v441 = 0;
      uint64_t v443 = 0;
      LODWORD(v446) = 0;
      LODWORD(v450[1]) = 0;
      v30 = &qword_1D8505EA0;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v450[0]) = 0;
  }
LABEL_564:
  int v95 = __sb__runningInSpringBoard();
  if (v95)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v446) = 0;
      LODWORD(v450[1]) = 0;
      goto LABEL_574;
    }
  }
  else
  {
    v294 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v294 userInterfaceIdiom])
    {
      LODWORD(v446) = 0;
      LODWORD(v450[1]) = 1;
      goto LABEL_574;
    }
  }
  LODWORD(v450[1]) = v95 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v96 = __sb__runningInSpringBoard();
    if (v96)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v284 = [MEMORY[0x1E4F42D90] mainScreen];
      [v284 _referenceBounds];
    }
    LODWORD(v446) = v96 ^ 1;
    BSSizeRoundForScale();
    if (v97 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_578;
    }
  }
  else
  {
    LODWORD(v446) = 0;
  }
LABEL_574:
  if (_SBF_Private_IsD94Like())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    int v417 = 0;
    int v419 = 0;
    uint64_t v430 = 0;
    int v409 = 0;
    int v421 = 0;
    uint64_t v432 = 0;
    uint64_t v441 = 0;
    uint64_t v443 = 0;
    v30 = &qword_1D8505EA8;
    goto LABEL_131;
  }
LABEL_578:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_582:
    uint64_t v443 = 0;
    goto LABEL_648;
  }
  int v98 = __sb__runningInSpringBoard();
  if (v98)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_582;
    }
  }
  else
  {
    v286 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v286 userInterfaceIdiom])
    {
      uint64_t v443 = 0x100000000;
      goto LABEL_648;
    }
  }
  HIDWORD(v443) = v98 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v106 = __sb__runningInSpringBoard();
    if (v106)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v268 = [MEMORY[0x1E4F42D90] mainScreen];
      [v268 _referenceBounds];
    }
    LODWORD(v443) = v106 ^ 1;
    BSSizeRoundForScale();
    if (v123 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      int v393 = 0;
      int v397 = 0;
      int v417 = 0;
      int v419 = 0;
      uint64_t v430 = 0;
      int v409 = 0;
      int v421 = 0;
      uint64_t v432 = 0;
      uint64_t v441 = 0;
      v30 = &qword_1D8505EB0;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v443) = 0;
  }
LABEL_648:
  int v107 = __sb__runningInSpringBoard();
  if (v107)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v432) = 0;
      HIDWORD(v441) = 0;
      goto LABEL_658;
    }
  }
  else
  {
    v290 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v290 userInterfaceIdiom])
    {
      HIDWORD(v432) = 0;
      HIDWORD(v441) = 1;
      goto LABEL_658;
    }
  }
  HIDWORD(v441) = v107 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v108 = __sb__runningInSpringBoard();
    if (v108)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v276 = [MEMORY[0x1E4F42D90] mainScreen];
      [v276 _referenceBounds];
    }
    HIDWORD(v432) = v108 ^ 1;
    BSSizeRoundForScale();
    if (v109 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_662;
    }
  }
  else
  {
    HIDWORD(v432) = 0;
  }
LABEL_658:
  if (_SBF_Private_IsD64Like())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    int v417 = 0;
    int v419 = 0;
    uint64_t v430 = 0;
    int v409 = 0;
    int v421 = 0;
    LODWORD(v432) = 0;
    LODWORD(v441) = 0;
    v30 = &qword_1D8505EB8;
    goto LABEL_131;
  }
LABEL_662:
  int v110 = __sb__runningInSpringBoard();
  if (v110)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v432) = 0;
      LODWORD(v441) = 0;
      goto LABEL_672;
    }
  }
  else
  {
    v288 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v288 userInterfaceIdiom])
    {
      LODWORD(v432) = 0;
      LODWORD(v441) = 1;
      goto LABEL_672;
    }
  }
  LODWORD(v441) = v110 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v111 = __sb__runningInSpringBoard();
    if (v111)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v270 = [MEMORY[0x1E4F42D90] mainScreen];
      [v270 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v432) = v111 ^ 1;
    if (v120 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      int v393 = 0;
      int v397 = 0;
      int v417 = 0;
      int v419 = 0;
      uint64_t v430 = 0;
      int v409 = 0;
      int v421 = 0;
      v30 = &qword_1D8505E90;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v432) = 0;
  }
LABEL_672:
  int v112 = __sb__runningInSpringBoard();
  if (v112)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v409 = 0;
      int v421 = 0;
      goto LABEL_750;
    }
  }
  else
  {
    v282 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v282 userInterfaceIdiom])
    {
      int v409 = 0;
      int v421 = 1;
      goto LABEL_750;
    }
  }
  int v421 = v112 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v119 = __sb__runningInSpringBoard();
    if (v119)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v266 = [MEMORY[0x1E4F42D90] mainScreen];
      [v266 _referenceBounds];
    }
    int v409 = v119 ^ 1;
    BSSizeRoundForScale();
    if (v126 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_784;
    }
  }
  else
  {
    int v409 = 0;
  }
LABEL_750:
  if (_SBF_Private_IsD54())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    int v417 = 0;
    int v419 = 0;
    uint64_t v430 = 0;
    v30 = &qword_1D8505E98;
    goto LABEL_131;
  }
LABEL_784:
  int v127 = __sb__runningInSpringBoard();
  if (v127)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v430 = 0;
      goto LABEL_810;
    }
  }
  else
  {
    v280 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v280 userInterfaceIdiom])
    {
      uint64_t v430 = 0x100000000;
      goto LABEL_810;
    }
  }
  HIDWORD(v430) = v127 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v132 = __sb__runningInSpringBoard();
    if (v132)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v260 = [MEMORY[0x1E4F42D90] mainScreen];
      [v260 _referenceBounds];
    }
    BSSizeRoundForScale();
    LODWORD(v430) = v132 ^ 1;
    if (v137 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      int v393 = 0;
      int v397 = 0;
      int v417 = 0;
      int v419 = 0;
      v30 = &qword_1D8505E60;
      goto LABEL_131;
    }
  }
  else
  {
    LODWORD(v430) = 0;
  }
LABEL_810:
  int v133 = __sb__runningInSpringBoard();
  if (v133)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v417 = 0;
      int v419 = 0;
      goto LABEL_840;
    }
  }
  else
  {
    v274 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v274 userInterfaceIdiom])
    {
      int v417 = 0;
      int v419 = 1;
      goto LABEL_840;
    }
  }
  int v419 = v133 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v136 = __sb__runningInSpringBoard();
    if (v136)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v258 = [MEMORY[0x1E4F42D90] mainScreen];
      [v258 _referenceBounds];
    }
    int v417 = v136 ^ 1;
    BSSizeRoundForScale();
    if (v140 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_871;
    }
  }
  else
  {
    int v417 = 0;
  }
LABEL_840:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    int v405 = 0;
    int v407 = 0;
    int v393 = 0;
    int v397 = 0;
    v30 = &qword_1D8505E68;
    goto LABEL_131;
  }
LABEL_871:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_875:
    int v393 = 0;
    int v397 = 0;
    goto LABEL_900;
  }
  int v141 = __sb__runningInSpringBoard();
  if (v141)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_875;
    }
  }
  else
  {
    v264 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v264 userInterfaceIdiom])
    {
      int v393 = 0;
      int v397 = 1;
      goto LABEL_900;
    }
  }
  int v397 = v141 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v146 = __sb__runningInSpringBoard();
    if (v146)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v246 = [MEMORY[0x1E4F42D90] mainScreen];
      [v246 _referenceBounds];
    }
    BSSizeRoundForScale();
    int v393 = v146 ^ 1;
    if (v161 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      int v383 = 0;
      int v385 = 0;
      int v405 = 0;
      int v407 = 0;
      v30 = &qword_1D8505E50;
      goto LABEL_131;
    }
  }
  else
  {
    int v393 = 0;
  }
LABEL_900:
  int v147 = __sb__runningInSpringBoard();
  if (v147)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v405 = 0;
      int v407 = 0;
      goto LABEL_910;
    }
  }
  else
  {
    v272 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v272 userInterfaceIdiom])
    {
      int v405 = 0;
      int v407 = 1;
      goto LABEL_910;
    }
  }
  int v407 = v147 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v148 = __sb__runningInSpringBoard();
    if (v148)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    int v405 = v148 ^ 1;
    BSSizeRoundForScale();
    if (v149 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_914;
    }
  }
  else
  {
    int v405 = 0;
  }
LABEL_910:
  if (_SBF_Private_IsD93Like())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    int v381 = 0;
    int v391 = 0;
    int v383 = 0;
    int v385 = 0;
    v30 = &qword_1D8505E58;
    goto LABEL_131;
  }
LABEL_914:
  if (!_SBF_Private_IsD63Like())
  {
LABEL_918:
    int v383 = 0;
    int v385 = 0;
    goto LABEL_984;
  }
  int v150 = __sb__runningInSpringBoard();
  if (v150)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_918;
    }
  }
  else
  {
    v254 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v254 userInterfaceIdiom])
    {
      int v383 = 0;
      int v385 = 1;
      goto LABEL_984;
    }
  }
  int v385 = v150 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v164 = __sb__runningInSpringBoard();
    if (v164)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v238 = [MEMORY[0x1E4F42D90] mainScreen];
      [v238 _referenceBounds];
    }
    int v383 = v164 ^ 1;
    BSSizeRoundForScale();
    if (v181 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      int v355 = 0;
      int v373 = 0;
      int v381 = 0;
      int v391 = 0;
      v30 = &qword_1D8505E80;
      goto LABEL_131;
    }
  }
  else
  {
    int v383 = 0;
  }
LABEL_984:
  int v165 = __sb__runningInSpringBoard();
  if (v165)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v381 = 0;
      int v391 = 0;
      goto LABEL_994;
    }
  }
  else
  {
    v262 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v262 userInterfaceIdiom])
    {
      int v381 = 0;
      int v391 = 1;
      goto LABEL_994;
    }
  }
  int v391 = v165 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v166 = __sb__runningInSpringBoard();
    if (v166)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v244 = [MEMORY[0x1E4F42D90] mainScreen];
      [v244 _referenceBounds];
    }
    int v381 = v166 ^ 1;
    BSSizeRoundForScale();
    if (v167 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_998;
    }
  }
  else
  {
    int v381 = 0;
  }
LABEL_994:
  if (_SBF_Private_IsD63Like())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    int v367 = 0;
    int v369 = 0;
    int v355 = 0;
    int v373 = 0;
    v30 = &qword_1D8505E88;
    goto LABEL_131;
  }
LABEL_998:
  int v168 = __sb__runningInSpringBoard();
  if (v168)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v355 = 0;
      int v373 = 0;
      goto LABEL_1008;
    }
  }
  else
  {
    v256 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v256 userInterfaceIdiom])
    {
      int v355 = 0;
      int v373 = 1;
      goto LABEL_1008;
    }
  }
  int v373 = v168 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v169 = __sb__runningInSpringBoard();
    if (v169)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v240 = [MEMORY[0x1E4F42D90] mainScreen];
      [v240 _referenceBounds];
    }
    BSSizeRoundForScale();
    int v355 = v169 ^ 1;
    if (v178 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      int v353 = 0;
      int v365 = 0;
      int v367 = 0;
      int v369 = 0;
      v30 = &qword_1D8505E70;
      goto LABEL_131;
    }
  }
  else
  {
    int v355 = 0;
  }
LABEL_1008:
  int v170 = __sb__runningInSpringBoard();
  if (v170)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v367 = 0;
      int v369 = 0;
      goto LABEL_1086;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      int v367 = 0;
      int v369 = 1;
      goto LABEL_1086;
    }
  }
  int v369 = v170 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v177 = __sb__runningInSpringBoard();
    if (v177)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v236 = [MEMORY[0x1E4F42D90] mainScreen];
      [v236 _referenceBounds];
    }
    int v367 = v177 ^ 1;
    BSSizeRoundForScale();
    if (v184 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1120;
    }
  }
  else
  {
    int v367 = 0;
  }
LABEL_1086:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    int v349 = 0;
    int v351 = 0;
    int v353 = 0;
    int v365 = 0;
    v30 = &qword_1D8505E78;
    goto LABEL_131;
  }
LABEL_1120:
  int v185 = __sb__runningInSpringBoard();
  if (v185)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v353 = 0;
      int v365 = 0;
      goto LABEL_1146;
    }
  }
  else
  {
    v248 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v248 userInterfaceIdiom])
    {
      int v353 = 0;
      int v365 = 1;
      goto LABEL_1146;
    }
  }
  int v365 = v185 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v190 = __sb__runningInSpringBoard();
    if (v190)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v234 = [MEMORY[0x1E4F42D90] mainScreen];
      [v234 _referenceBounds];
    }
    int v353 = v190 ^ 1;
    BSSizeRoundForScale();
    if (v195 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      int v330 = 0;
      int v341 = 0;
      int v349 = 0;
      int v351 = 0;
      v30 = &qword_1D8505E40;
      goto LABEL_131;
    }
  }
  else
  {
    int v353 = 0;
  }
LABEL_1146:
  int v191 = __sb__runningInSpringBoard();
  if (v191)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v349 = 0;
      int v351 = 0;
      goto LABEL_1176;
    }
  }
  else
  {
    v242 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v242 userInterfaceIdiom])
    {
      int v349 = 0;
      int v351 = 1;
      goto LABEL_1176;
    }
  }
  int v351 = v191 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v193 = __sb__runningInSpringBoard();
    if (v193)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v326 = [MEMORY[0x1E4F42D90] mainScreen];
      [v326 _referenceBounds];
    }
    int v349 = v193 ^ 1;
    BSSizeRoundForScale();
    if (v198 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1201;
    }
  }
  else
  {
    int v349 = 0;
  }
LABEL_1176:
  if (_SBF_Private_IsD53())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    v30 = &qword_1D8505E48;
    goto LABEL_131;
  }
LABEL_1201:
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    v30 = &qword_1D8505E20;
    goto LABEL_131;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    v30 = &qword_1D8505E28;
    goto LABEL_131;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    v30 = &qword_1D8505E10;
    goto LABEL_131;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v333 = 0;
    int v335 = 0;
    uint64_t v329 = 0;
    int v337 = 0;
    int v339 = 0;
    int v330 = 0;
    int v341 = 0;
    v30 = &qword_1D8505E18;
    goto LABEL_131;
  }
  int v202 = __sb__runningInSpringBoard();
  if (v202)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v330 = 0;
      int v341 = 0;
      goto LABEL_1257;
    }
  }
  else
  {
    v325 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v325 userInterfaceIdiom])
    {
      int v330 = 0;
      int v341 = 1;
      goto LABEL_1257;
    }
  }
  int v341 = v202 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v204 = __sb__runningInSpringBoard();
    if (v204)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v320 = [MEMORY[0x1E4F42D90] mainScreen];
      [v320 _referenceBounds];
    }
    int v330 = v204 ^ 1;
    BSSizeRoundForScale();
    if (v216 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      int v337 = 0;
      int v339 = 0;
      v30 = &qword_1D8505E30;
      goto LABEL_131;
    }
  }
  else
  {
    int v330 = 0;
  }
LABEL_1257:
  int v205 = __sb__runningInSpringBoard();
  if (v205)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v337 = 0;
      int v339 = 0;
      goto LABEL_1287;
    }
  }
  else
  {
    v324 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v324 userInterfaceIdiom])
    {
      int v337 = 0;
      int v339 = 1;
      goto LABEL_1287;
    }
  }
  int v339 = v205 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v207 = __sb__runningInSpringBoard();
    if (v207)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v319 = [MEMORY[0x1E4F42D90] mainScreen];
      [v319 _referenceBounds];
    }
    int v337 = v207 ^ 1;
    BSSizeRoundForScale();
    if (v219 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v333 = 0;
      int v335 = 0;
      uint64_t v329 = 0;
      v30 = &qword_1D8505E38;
      goto LABEL_131;
    }
  }
  else
  {
    int v337 = 0;
  }
LABEL_1287:
  int v208 = __sb__runningInSpringBoard();
  if (v208)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v329 = 0;
      goto LABEL_1317;
    }
  }
  else
  {
    v323 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v323 userInterfaceIdiom])
    {
      uint64_t v329 = 0x100000000;
      goto LABEL_1317;
    }
  }
  HIDWORD(v329) = v208 ^ 1;
  int v210 = __sb__runningInSpringBoard();
  if (v210)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v321 = [MEMORY[0x1E4F42D90] mainScreen];
    [v321 _referenceBounds];
  }
  LODWORD(v329) = v210 ^ 1;
  BSSizeRoundForScale();
  if (v211 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v333 = 0;
    int v335 = 0;
    v30 = &qword_1D8505E08;
    goto LABEL_131;
  }
LABEL_1317:
  int v212 = __sb__runningInSpringBoard();
  if (v212)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v333 = 0;
      int v335 = 0;
LABEL_1367:
      v30 = &CSQuickActionButtonInsetY;
      goto LABEL_131;
    }
  }
  else
  {
    v322 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v322 userInterfaceIdiom])
    {
      int v333 = 0;
      int v335 = 1;
      goto LABEL_1367;
    }
  }
  int v335 = v212 ^ 1;
  int v222 = __sb__runningInSpringBoard();
  if (v222)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v229 = [MEMORY[0x1E4F42D90] mainScreen];
    [v229 _referenceBounds];
  }
  int v333 = v222 ^ 1;
  BSSizeRoundForScale();
  if (v223 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_1367;
  }
  v30 = &qword_1D8505E00;
LABEL_131:
  double v52 = *(double *)v30;
  int v53 = __sb__runningInSpringBoard();
  uint64_t v54 = (uint64_t)&CSQuickActionButtonDiameter;
  if (v53)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      goto LABEL_140;
    }
  }
  else
  {
    v318 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v318 userInterfaceIdiom] != 1)
    {
      uint64_t v56 = 0;
      uint64_t v55 = 1;
      goto LABEL_140;
    }
  }
  uint64_t v55 = v53 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v301 = [MEMORY[0x1E4F42D90] mainScreen];
      [v301 _referenceBounds];
    }
    uint64_t v56 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v79 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v78 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v454 = v57 ^ 1;
      int v455 = v55;
      memset((char *)&v450[5] + 4, 0, 28);
      HIDWORD(v451) = 0;
      *(void *)((char *)&v450[3] + 4) = 0;
      LODWORD(v450[2]) = 0;
      int v440 = 0;
      int v449 = 0;
      HIDWORD(v450[0]) = 0;
      int v439 = 0;
      uint64_t v437 = 0;
      uint64_t v435 = 0;
      int v429 = 0;
      int v427 = 0;
      int v415 = 0;
      int v403 = 0;
      int v425 = 0;
      int v423 = 0;
      int v413 = 0;
      int v411 = 0;
      int v395 = 0;
      int v389 = 0;
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505CC8;
      goto LABEL_303;
    }
  }
  else
  {
    uint64_t v56 = 0;
  }
LABEL_140:
  int v58 = __sb__runningInSpringBoard();
  int v454 = v56;
  int v455 = v55;
  if (v58)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v59 = 0;
      uint64_t v54 = 0;
      goto LABEL_149;
    }
  }
  else
  {
    v316 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v316 userInterfaceIdiom] != 1)
    {
      uint64_t v54 = 0;
      int v59 = 1;
      goto LABEL_149;
    }
  }
  int v59 = v58 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v299 = [MEMORY[0x1E4F42D90] mainScreen];
      [v299 _referenceBounds];
    }
    uint64_t v54 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v80 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      v450[8] = __PAIR64__(v59, v54);
      memset((char *)&v450[5] + 4, 0, 20);
      HIDWORD(v451) = 0;
      *(void *)((char *)&v450[3] + 4) = 0;
      LODWORD(v450[2]) = 0;
      int v440 = 0;
      int v449 = 0;
      HIDWORD(v450[0]) = 0;
      int v439 = 0;
      uint64_t v437 = 0;
      uint64_t v435 = 0;
      int v429 = 0;
      int v427 = 0;
      int v415 = 0;
      int v403 = 0;
      int v425 = 0;
      int v423 = 0;
      int v413 = 0;
      int v411 = 0;
      int v395 = 0;
      int v389 = 0;
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505CF0;
      goto LABEL_303;
    }
  }
  else
  {
    uint64_t v54 = 0;
  }
LABEL_149:
  int v60 = __sb__runningInSpringBoard();
  v450[8] = __PAIR64__(v59, v54);
  if (v60)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v61 = 0;
      unsigned int v62 = 0;
      goto LABEL_158;
    }
  }
  else
  {
    v314 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v314 userInterfaceIdiom] != 1)
    {
      unsigned int v62 = 0;
      int v61 = 1;
      goto LABEL_158;
    }
  }
  int v61 = v60 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v297 = [MEMORY[0x1E4F42D90] mainScreen];
      [v297 _referenceBounds];
    }
    unsigned int v62 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v83 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v450[7]) = v57 ^ 1;
      HIDWORD(v450[7]) = v61;
      v450[6] = 0;
      HIDWORD(v450[5]) = 0;
      HIDWORD(v451) = 0;
      *(void *)((char *)&v450[3] + 4) = 0;
      LODWORD(v450[2]) = 0;
      int v440 = 0;
      int v449 = 0;
      HIDWORD(v450[0]) = 0;
      int v439 = 0;
      uint64_t v437 = 0;
      uint64_t v435 = 0;
      int v429 = 0;
      int v427 = 0;
      int v415 = 0;
      int v403 = 0;
      int v425 = 0;
      int v423 = 0;
      int v413 = 0;
      int v411 = 0;
      int v395 = 0;
      int v389 = 0;
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505CE0;
      goto LABEL_303;
    }
  }
  else
  {
    unsigned int v62 = 0;
  }
LABEL_158:
  int v63 = __sb__runningInSpringBoard();
  v450[7] = __PAIR64__(v61, v62);
  if (v63)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v64 = 0;
      unsigned int v65 = 0;
      goto LABEL_167;
    }
  }
  else
  {
    v312 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v312 userInterfaceIdiom] != 1)
    {
      unsigned int v65 = 0;
      int v64 = 1;
      goto LABEL_167;
    }
  }
  int v64 = v63 ^ 1;
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v307 = [MEMORY[0x1E4F42D90] mainScreen];
    [v307 _referenceBounds];
  }
  unsigned int v65 = v57 ^ 1;
  BSSizeRoundForScale();
  if (v66 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    LODWORD(v450[6]) = v57 ^ 1;
    HIDWORD(v450[6]) = v64;
    HIDWORD(v450[5]) = 0;
    HIDWORD(v451) = 0;
    *(void *)((char *)&v450[3] + 4) = 0;
    LODWORD(v450[2]) = 0;
    int v440 = 0;
    int v449 = 0;
    HIDWORD(v450[0]) = 0;
    int v439 = 0;
    uint64_t v437 = 0;
    uint64_t v435 = 0;
    int v429 = 0;
    int v427 = 0;
    int v415 = 0;
    int v403 = 0;
    int v425 = 0;
    int v423 = 0;
    int v413 = 0;
    int v411 = 0;
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505CE8;
    goto LABEL_303;
  }
LABEL_167:
  int v67 = __sb__runningInSpringBoard();
  v450[6] = __PAIR64__(v64, v65);
  if (v67)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v68 = 0;
      HIDWORD(v451) = 0;
      goto LABEL_177;
    }
  }
  else
  {
    v310 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v310 userInterfaceIdiom] != 1)
    {
      HIDWORD(v451) = 0;
      int v68 = 1;
      goto LABEL_177;
    }
  }
  int v68 = v67 ^ 1;
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v303 = [MEMORY[0x1E4F42D90] mainScreen];
    [v303 _referenceBounds];
  }
  HIDWORD(v451) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v76 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    HIDWORD(v450[5]) = v68;
    *(void *)((char *)&v450[3] + 4) = 0;
    LODWORD(v450[2]) = 0;
    int v440 = 0;
    int v449 = 0;
    HIDWORD(v450[0]) = 0;
    int v439 = 0;
    uint64_t v437 = 0;
    uint64_t v435 = 0;
    int v429 = 0;
    int v427 = 0;
    int v415 = 0;
    int v403 = 0;
    int v425 = 0;
    int v423 = 0;
    int v413 = 0;
    int v411 = 0;
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505CD8;
    goto LABEL_303;
  }
LABEL_177:
  int v77 = __sb__runningInSpringBoard();
  HIDWORD(v450[5]) = v68;
  if (v77)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v450[3] + 4) = 0;
      goto LABEL_542;
    }
  }
  else
  {
    v309 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v309 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v450[3] + 4) = 0x100000000;
      goto LABEL_542;
    }
  }
  LODWORD(v450[4]) = v77 ^ 1;
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v295 = [MEMORY[0x1E4F42D90] mainScreen];
    [v295 _referenceBounds];
  }
  HIDWORD(v450[3]) = v57 ^ 1;
  BSSizeRoundForScale();
  if (v92 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    LODWORD(v450[2]) = 0;
    int v440 = 0;
    int v449 = 0;
    HIDWORD(v450[0]) = 0;
    int v439 = 0;
    uint64_t v437 = 0;
    uint64_t v435 = 0;
    int v429 = 0;
    int v427 = 0;
    int v415 = 0;
    int v403 = 0;
    int v425 = 0;
    int v423 = 0;
    int v413 = 0;
    int v411 = 0;
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505CD0;
    goto LABEL_303;
  }
LABEL_542:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_544;
    }
LABEL_550:
    int v440 = 0;
    int v449 = 0;
    HIDWORD(v450[0]) = 0;
    int v439 = 0;
    uint64_t v437 = 0;
    uint64_t v435 = 0;
    int v429 = 0;
    int v427 = 0;
    int v415 = 0;
    int v403 = 0;
    int v425 = 0;
    int v423 = 0;
    int v413 = 0;
    int v411 = 0;
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505CC0;
    LODWORD(v450[2]) = v57 ^ 1;
    goto LABEL_303;
  }
  v305 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v305 userInterfaceIdiom] == 1) {
    goto LABEL_550;
  }
LABEL_544:
  LODWORD(v450[2]) = v57 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_548:
    int v440 = 0;
    int v449 = 0;
    goto LABEL_614;
  }
  int v93 = __sb__runningInSpringBoard();
  if (v93)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_548;
    }
  }
  else
  {
    v291 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v291 userInterfaceIdiom])
    {
      int v449 = 0;
      int v440 = 1;
      goto LABEL_614;
    }
  }
  int v440 = v93 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v277 = [MEMORY[0x1E4F42D90] mainScreen];
      [v277 _referenceBounds];
    }
    int v449 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v105 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      HIDWORD(v450[0]) = 0;
      int v439 = 0;
      uint64_t v437 = 0;
      uint64_t v435 = 0;
      int v429 = 0;
      int v427 = 0;
      int v415 = 0;
      int v403 = 0;
      int v425 = 0;
      int v423 = 0;
      int v413 = 0;
      int v411 = 0;
      int v395 = 0;
      int v389 = 0;
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505CA0;
      goto LABEL_303;
    }
  }
  else
  {
    int v449 = 0;
  }
LABEL_614:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v450[0]) = 0;
      int v439 = 0;
      goto LABEL_624;
    }
  }
  else
  {
    v293 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v293 userInterfaceIdiom])
    {
      int v439 = 0;
      HIDWORD(v450[0]) = 1;
      goto LABEL_624;
    }
  }
  HIDWORD(v450[0]) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v283 = [MEMORY[0x1E4F42D90] mainScreen];
      [v283 _referenceBounds];
    }
    int v439 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v101 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_628;
    }
  }
  else
  {
    int v439 = 0;
  }
LABEL_624:
  if (_SBF_Private_IsD94Like())
  {
    uint64_t v437 = 0;
    uint64_t v435 = 0;
    int v429 = 0;
    int v427 = 0;
    int v415 = 0;
    int v403 = 0;
    int v425 = 0;
    int v423 = 0;
    int v413 = 0;
    int v411 = 0;
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505CA8;
    goto LABEL_303;
  }
LABEL_628:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_632:
    uint64_t v437 = 0;
    goto LABEL_716;
  }
  int v102 = __sb__runningInSpringBoard();
  if (v102)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_632;
    }
  }
  else
  {
    v285 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v285 userInterfaceIdiom])
    {
      uint64_t v437 = 0x100000000;
      goto LABEL_716;
    }
  }
  HIDWORD(v437) = v102 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v267 = [MEMORY[0x1E4F42D90] mainScreen];
      [v267 _referenceBounds];
    }
    LODWORD(v437) = v57 ^ 1;
    BSSizeRoundForScale();
    if (v125 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      uint64_t v435 = 0;
      int v429 = 0;
      int v427 = 0;
      int v415 = 0;
      int v403 = 0;
      int v425 = 0;
      int v423 = 0;
      int v413 = 0;
      int v411 = 0;
      int v395 = 0;
      int v389 = 0;
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505CB0;
      goto LABEL_303;
    }
  }
  else
  {
    LODWORD(v437) = 0;
  }
LABEL_716:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v435) = 0;
      int v429 = 0;
      goto LABEL_726;
    }
  }
  else
  {
    v289 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v289 userInterfaceIdiom])
    {
      int v429 = 0;
      HIDWORD(v435) = 1;
      goto LABEL_726;
    }
  }
  HIDWORD(v435) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v275 = [MEMORY[0x1E4F42D90] mainScreen];
      [v275 _referenceBounds];
    }
    int v429 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v116 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_730;
    }
  }
  else
  {
    int v429 = 0;
  }
LABEL_726:
  if (_SBF_Private_IsD64Like())
  {
    LODWORD(v435) = 0;
    int v427 = 0;
    int v415 = 0;
    int v403 = 0;
    int v425 = 0;
    int v423 = 0;
    int v413 = 0;
    int v411 = 0;
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505CB8;
    goto LABEL_303;
  }
LABEL_730:
  int v117 = __sb__runningInSpringBoard();
  if (v117)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v435) = 0;
      int v427 = 0;
      goto LABEL_740;
    }
  }
  else
  {
    v287 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v287 userInterfaceIdiom])
    {
      int v427 = 0;
      LODWORD(v435) = 1;
      goto LABEL_740;
    }
  }
  LODWORD(v435) = v117 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v118 = __sb__runningInSpringBoard();
    if (v118)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v269 = [MEMORY[0x1E4F42D90] mainScreen];
      [v269 _referenceBounds];
    }
    uint64_t v57 = v118 ^ 1u;
    BSSizeRoundForScale();
    int v427 = v57;
    if (v122 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v415 = 0;
      int v403 = 0;
      int v425 = 0;
      int v423 = 0;
      int v413 = 0;
      int v411 = 0;
      int v395 = 0;
      int v389 = 0;
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C90;
      goto LABEL_303;
    }
  }
  else
  {
    int v427 = 0;
  }
LABEL_740:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v415 = 0;
      int v403 = 0;
      goto LABEL_762;
    }
  }
  else
  {
    v281 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v281 userInterfaceIdiom])
    {
      int v403 = 0;
      int v415 = 1;
      goto LABEL_762;
    }
  }
  int v415 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v265 = [MEMORY[0x1E4F42D90] mainScreen];
      [v265 _referenceBounds];
    }
    int v403 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v130 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_800;
    }
  }
  else
  {
    int v403 = 0;
  }
LABEL_762:
  if (_SBF_Private_IsD54())
  {
    int v425 = 0;
    int v423 = 0;
    int v413 = 0;
    int v411 = 0;
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C98;
    goto LABEL_303;
  }
LABEL_800:
  int v131 = __sb__runningInSpringBoard();
  if (v131)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v425 = 0;
      int v423 = 0;
      goto LABEL_830;
    }
  }
  else
  {
    v279 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v279 userInterfaceIdiom])
    {
      int v423 = 0;
      int v425 = 1;
      goto LABEL_830;
    }
  }
  int v425 = v131 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v135 = __sb__runningInSpringBoard();
    if (v135)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v259 = [MEMORY[0x1E4F42D90] mainScreen];
      [v259 _referenceBounds];
    }
    uint64_t v57 = v135 ^ 1u;
    BSSizeRoundForScale();
    int v423 = v57;
    if (v139 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      int v413 = 0;
      int v411 = 0;
      int v395 = 0;
      int v389 = 0;
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C60;
      goto LABEL_303;
    }
  }
  else
  {
    int v423 = 0;
  }
LABEL_830:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v413 = 0;
      int v411 = 0;
      goto LABEL_854;
    }
  }
  else
  {
    v273 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v273 userInterfaceIdiom])
    {
      int v411 = 0;
      int v413 = 1;
      goto LABEL_854;
    }
  }
  int v413 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v257 = [MEMORY[0x1E4F42D90] mainScreen];
      [v257 _referenceBounds];
    }
    int v411 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v144 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_889;
    }
  }
  else
  {
    int v411 = 0;
  }
LABEL_854:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v395 = 0;
    int v389 = 0;
    int v401 = 0;
    int v399 = 0;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C68;
    goto LABEL_303;
  }
LABEL_889:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_893:
    int v395 = 0;
    int v389 = 0;
    goto LABEL_950;
  }
  int v145 = __sb__runningInSpringBoard();
  if (v145)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_893;
    }
  }
  else
  {
    v263 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v263 userInterfaceIdiom])
    {
      int v389 = 0;
      int v395 = 1;
      goto LABEL_950;
    }
  }
  int v395 = v145 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v156 = __sb__runningInSpringBoard();
    if (v156)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v245 = [MEMORY[0x1E4F42D90] mainScreen];
      [v245 _referenceBounds];
    }
    uint64_t v57 = v156 ^ 1u;
    BSSizeRoundForScale();
    int v389 = v57;
    if (v163 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v401 = 0;
      int v399 = 0;
      int v379 = 0;
      int v377 = 0;
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C50;
      goto LABEL_303;
    }
  }
  else
  {
    int v389 = 0;
  }
LABEL_950:
  int v157 = __sb__runningInSpringBoard();
  if (v157)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v401 = 0;
      uint64_t v57 = 0;
      goto LABEL_960;
    }
  }
  else
  {
    v271 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v271 userInterfaceIdiom])
    {
      uint64_t v57 = 0;
      int v401 = 1;
      goto LABEL_960;
    }
  }
  int v401 = v157 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v158 = __sb__runningInSpringBoard();
    if (v158)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v251 = [MEMORY[0x1E4F42D90] mainScreen];
      [v251 _referenceBounds];
    }
    uint64_t v57 = v158 ^ 1u;
    BSSizeRoundForScale();
    if (v159 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_964;
    }
  }
  else
  {
    uint64_t v57 = 0;
  }
LABEL_960:
  if (_SBF_Private_IsD93Like())
  {
    int v399 = v57;
    int v379 = 0;
    int v377 = 0;
    int v387 = 0;
    int v375 = 0;
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C58;
    goto LABEL_303;
  }
LABEL_964:
  int v399 = v57;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_968:
    int v379 = 0;
    int v377 = 0;
    goto LABEL_1052;
  }
  int v160 = __sb__runningInSpringBoard();
  if (v160)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_968;
    }
  }
  else
  {
    v253 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v253 userInterfaceIdiom])
    {
      int v377 = 0;
      int v379 = 1;
      goto LABEL_1052;
    }
  }
  int v379 = v160 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v237 = [MEMORY[0x1E4F42D90] mainScreen];
      [v237 _referenceBounds];
    }
    int v377 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v183 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v387 = 0;
      int v375 = 0;
      int v371 = 0;
      int v347 = 0;
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C80;
      goto LABEL_303;
    }
  }
  else
  {
    int v377 = 0;
  }
LABEL_1052:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v387 = 0;
      int v375 = 0;
      goto LABEL_1062;
    }
  }
  else
  {
    v261 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v261 userInterfaceIdiom])
    {
      int v375 = 0;
      int v387 = 1;
      goto LABEL_1062;
    }
  }
  int v387 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v243 = [MEMORY[0x1E4F42D90] mainScreen];
      [v243 _referenceBounds];
    }
    int v375 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v174 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1066;
    }
  }
  else
  {
    int v375 = 0;
  }
LABEL_1062:
  if (_SBF_Private_IsD63Like())
  {
    int v371 = 0;
    int v347 = 0;
    int v363 = 0;
    int v361 = 0;
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C88;
    goto LABEL_303;
  }
LABEL_1066:
  int v175 = __sb__runningInSpringBoard();
  if (v175)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v371 = 0;
      int v347 = 0;
      goto LABEL_1076;
    }
  }
  else
  {
    v255 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v255 userInterfaceIdiom])
    {
      int v347 = 0;
      int v371 = 1;
      goto LABEL_1076;
    }
  }
  int v371 = v175 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v176 = __sb__runningInSpringBoard();
    if (v176)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v239 = [MEMORY[0x1E4F42D90] mainScreen];
      [v239 _referenceBounds];
    }
    uint64_t v57 = v176 ^ 1u;
    BSSizeRoundForScale();
    int v347 = v57;
    if (v180 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      int v363 = 0;
      int v361 = 0;
      int v359 = 0;
      int v345 = 0;
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C70;
      goto LABEL_303;
    }
  }
  else
  {
    int v347 = 0;
  }
LABEL_1076:
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v363 = 0;
      int v361 = 0;
      goto LABEL_1098;
    }
  }
  else
  {
    v249 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v249 userInterfaceIdiom])
    {
      int v361 = 0;
      int v363 = 1;
      goto LABEL_1098;
    }
  }
  int v363 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v235 = [MEMORY[0x1E4F42D90] mainScreen];
      [v235 _referenceBounds];
    }
    int v361 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v188 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1136;
    }
  }
  else
  {
    int v361 = 0;
  }
LABEL_1098:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    int v359 = 0;
    int v345 = 0;
    int v343 = 0;
    int v357 = 0;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C78;
    goto LABEL_303;
  }
LABEL_1136:
  int v189 = __sb__runningInSpringBoard();
  if (v189)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v359 = 0;
      int v345 = 0;
      goto LABEL_1166;
    }
  }
  else
  {
    v247 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v247 userInterfaceIdiom])
    {
      int v345 = 0;
      int v359 = 1;
      goto LABEL_1166;
    }
  }
  int v359 = v189 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v233 = [MEMORY[0x1E4F42D90] mainScreen];
      [v233 _referenceBounds];
    }
    int v345 = v57 ^ 1;
    BSSizeRoundForScale();
    if (v197 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v343 = 0;
      int v357 = 0;
      int v331 = 0;
      int v328 = 0;
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C40;
      goto LABEL_303;
    }
  }
  else
  {
    int v345 = 0;
  }
LABEL_1166:
  int v192 = __sb__runningInSpringBoard();
  if (v192)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v343 = 0;
      uint64_t v57 = 0;
      goto LABEL_1188;
    }
  }
  else
  {
    v241 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v241 userInterfaceIdiom])
    {
      uint64_t v57 = 0;
      int v343 = 1;
      goto LABEL_1188;
    }
  }
  int v343 = v192 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v194 = __sb__runningInSpringBoard();
    if (v194)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v232 = [MEMORY[0x1E4F42D90] mainScreen];
      [v232 _referenceBounds];
    }
    uint64_t v57 = v194 ^ 1u;
    BSSizeRoundForScale();
    if (v201 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1225;
    }
  }
  else
  {
    uint64_t v57 = 0;
  }
LABEL_1188:
  if (_SBF_Private_IsD53())
  {
    int v357 = v57;
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C48;
    goto LABEL_303;
  }
LABEL_1225:
  int v357 = v57;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C20;
    goto LABEL_303;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C28;
    goto LABEL_303;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C10;
    goto LABEL_303;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v331 = 0;
    int v328 = 0;
    int v69 = 0;
    int v70 = 0;
    int v71 = 0;
    int v72 = 0;
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C18;
    goto LABEL_303;
  }
  uint64_t v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v331 = 0;
      int v328 = 0;
      goto LABEL_1277;
    }
  }
  else
  {
    v231 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v231 userInterfaceIdiom])
    {
      int v328 = 0;
      int v331 = 1;
      goto LABEL_1277;
    }
  }
  int v331 = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v55 = __sb__runningInSpringBoard();
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v228 = [MEMORY[0x1E4F42D90] mainScreen];
      [v228 _referenceBounds];
    }
    int v328 = v55 ^ 1;
    BSSizeRoundForScale();
    if (v218 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v69 = 0;
      int v70 = 0;
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C30;
      goto LABEL_303;
    }
  }
  else
  {
    int v328 = 0;
  }
LABEL_1277:
  int v206 = __sb__runningInSpringBoard();
  if (v206)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v69 = 0;
      int v70 = 0;
      goto LABEL_1307;
    }
  }
  else
  {
    v230 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v230 userInterfaceIdiom])
    {
      int v70 = 0;
      int v69 = 1;
      goto LABEL_1307;
    }
  }
  int v69 = v206 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v55 = __sb__runningInSpringBoard();
    if (v55)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v227 = [MEMORY[0x1E4F42D90] mainScreen];
      [v227 _referenceBounds];
    }
    int v70 = v55 ^ 1;
    BSSizeRoundForScale();
    if (v221 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v71 = 0;
      int v72 = 0;
      int v73 = 0;
      int v74 = 0;
      v75 = &qword_1D8505C38;
      goto LABEL_303;
    }
  }
  else
  {
    int v70 = 0;
  }
LABEL_1307:
  int v209 = __sb__runningInSpringBoard();
  if (v209)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v71 = 0;
      int v72 = 0;
      goto LABEL_1338;
    }
  }
  else
  {
    uint64_t v57 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v57 userInterfaceIdiom])
    {
      int v72 = 0;
      int v71 = 1;
      goto LABEL_1338;
    }
  }
  int v71 = v209 ^ 1;
  uint64_t v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v54 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v54 _referenceBounds];
  }
  int v72 = v55 ^ 1;
  BSSizeRoundForScale();
  if (v215 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v73 = 0;
    int v74 = 0;
    v75 = &qword_1D8505C08;
    goto LABEL_303;
  }
LABEL_1338:
  uint64_t v55 = __sb__runningInSpringBoard();
  if (v55)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v73 = 0;
      int v74 = 0;
LABEL_1378:
      v75 = &CSQuickActionButtonDiameter;
      goto LABEL_303;
    }
  }
  else
  {
    uint64_t v56 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v56 userInterfaceIdiom])
    {
      int v74 = 0;
      int v73 = 1;
      goto LABEL_1378;
    }
  }
  int v73 = v55 ^ 1;
  int v225 = __sb__runningInSpringBoard();
  if (v225)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v55 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v55 _referenceBounds];
  }
  int v74 = v225 ^ 1;
  BSSizeRoundForScale();
  if (v226 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_1378;
  }
  v75 = &qword_1D8505C00;
LABEL_303:
  double v84 = *(double *)v75;
  if (v74) {

  }
  if (v73) {
  if (v72)
  }

  if (v71) {
  if (v70)
  }

  if (v69) {
  if (v328)
  }

  if (v331) {
  if (v357)
  }

  if (v343) {
  if (v345)
  }

  if (v359) {
  if (v361)
  }

  if (v363) {
  if (v347)
  }

  if (v371) {
  if (v375)
  }

  if (v387) {
  if (v377)
  }

  if (v379) {
  if (v399)
  }

  if (v401) {
  if (v389)
  }

  if (v395) {
  if (v411)
  }

  if (v413) {
  if (v423)
  }

  if (v425) {
  if (v403)
  }

  if (v415) {
  if (v427)
  }

  if (v435) {
  if (v429)
  }

  if (HIDWORD(v435)) {
  if (v437)
  }

  if (HIDWORD(v437)) {
  if (v439)
  }

  if (HIDWORD(v450[0])) {
  if (v449)
  }

  if (v440) {
  if (LODWORD(v450[2]))
  }

  if (HIDWORD(v450[3])) {
  if (LODWORD(v450[4]))
  }

  if (HIDWORD(v451)) {
  if (HIDWORD(v450[5]))
  }

  if (LODWORD(v450[6])) {
  if (HIDWORD(v450[6]))
  }

  if (LODWORD(v450[7])) {
  if (HIDWORD(v450[7]))
  }

  if (LODWORD(v450[8])) {
  if (HIDWORD(v450[8]))
  }

  if (v454) {
  if (v455)
  }

  if (v333) {
  if (v335)
  }

  if (v329) {
  if (HIDWORD(v329))
  }

  if (v337) {
  if (v339)
  }

  if (v330) {
  if (v341)
  }

  if (v349) {
  if (v351)
  }

  if (v353) {
  if (v365)
  }

  if (v367) {
  if (v369)
  }

  if (v355) {
  if (v373)
  }

  if (v381) {
  if (v391)
  }

  if (v383) {
  if (v385)
  }

  if (v405) {
  if (v407)
  }

  if (v393) {
  if (v397)
  }

  if (v417) {
  if (v419)
  }

  if (v430) {
  if (HIDWORD(v430))
  }

  if (v409) {
  if (v421)
  }

  if (v432) {
  if (v441)
  }

  if (HIDWORD(v432)) {
  if (HIDWORD(v441))
  }

  if (v443) {
  if (HIDWORD(v443))
  }

  if (v446) {
  if (LODWORD(v450[1]))
  }

  if (LODWORD(v450[0])) {
  if (HIDWORD(v446))
  }

  if (HIDWORD(v450[2])) {
  if (HIDWORD(v450[4]))
  }

  if (LODWORD(v450[5])) {
  if (v452)
  }

  if (HIDWORD(v452)) {
  if (LODWORD(v450[9]))
  }

  if (HIDWORD(v450[9])) {
  if (v453)
  }

  if (v451) {
  if (HIDWORD(v450[1]))
  }

  double v85 = v84 * 0.5;
  if (LODWORD(v450[3])) {

  }
  double v86 = v52 + v85;
  if (HIDWORD(v453)) {

  }
  double v36 = v86 + -24.0;
  if (v456) {
    goto LABEL_289;
  }
  return v36;
}

- (CSModalViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSModalViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)showsStatusText
{
  return self->_showsStatusText;
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (UILabel)_subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)_secondarySubtitleLabel
{
  return self->_secondarySubtitleLabel;
}

- (CSModalButton)_primaryActionButton
{
  return self->_primaryActionButton;
}

- (UIButton)_secondaryActionButton
{
  return self->_secondaryActionButton;
}

- (UIImageView)_imageView
{
  return self->_imageView;
}

- (UIView)detailView
{
  return self->_detailView;
}

- (BOOL)wantsEnhancedSecondaryActionButton
{
  return self->_wantsEnhancedSecondaryActionButton;
}

- (BOOL)showsDateView
{
  return self->_showsDateView;
}

- (void)setShowsDateView:(BOOL)a3
{
  self->_showsDateView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_statusTextViewController, 0);
  objc_storeStrong((id *)&self->_overrideFooterText, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_centralGroupBottomConstraint, 0);
  objc_storeStrong((id *)&self->_centralGroupTopConstraint, 0);
  objc_storeStrong((id *)&self->_dateViewVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_dateViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_centralGroupView, 0);
  objc_storeStrong((id *)&self->_secondaryActionButton, 0);
  objc_storeStrong((id *)&self->_primaryActionButton, 0);
  objc_storeStrong((id *)&self->_detailView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end