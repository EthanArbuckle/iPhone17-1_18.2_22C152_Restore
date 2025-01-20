@interface PKUCBPaletteView
+ (id)makeBackgroundView;
- (BOOL)_shouldHideLeadingButtonGroupView;
- (BOOL)_shouldHideReturnKeyButtonGroupView;
- (BOOL)_shouldHideTrailingButtonGroupView;
- (BOOL)_shouldShowCenterButtonGroupView;
- (BOOL)_shouldShowInputAssistantItems;
- (BOOL)_shouldShowReturnKey;
- (BOOL)alwaysIncludeReturnKeyAndInputAssistantItems;
- (BOOL)isPalettePresentingPopover;
- (BOOL)isReturnKeyEnabled;
- (BOOL)isUpdatingUI;
- (BOOL)shouldAdjustShadowRadiusForMinimized;
- (BOOL)shouldExpandFromCorner;
- (BOOL)shouldStartUpMinimized;
- (BOOL)toolPreviewMatchesExpandedTool;
- (CGSize)paletteSizeForEdge:(unint64_t)a3;
- (NSArray)centeredBarButtons;
- (NSArray)compactContentViewConstraints;
- (NSArray)leadingBarButtons;
- (NSArray)nonCompactContentViewConstraints;
- (NSArray)trailingBarButtons;
- (NSLayoutConstraint)_buttonStackViewBottomConstraint;
- (NSLayoutConstraint)_buttonStackViewHeightConstraint;
- (NSLayoutConstraint)_contentViewBottomAnchor;
- (NSLayoutConstraint)_contentViewLeadingAnchor;
- (NSLayoutConstraint)_contentViewTopAnchor;
- (NSLayoutConstraint)_contentViewTrailingAnchor;
- (NSString)localeIdentifier;
- (PKPaletteButtonGroupView)_centeredButtonGroupView;
- (PKPaletteButtonGroupView)_leadingButtonGroupView;
- (PKPaletteButtonGroupView)_returnKeyButtonGroupView;
- (PKPaletteButtonGroupView)_trailingButtonGroupView;
- (PKPaletteReturnKeyButton)_returnKeyButton;
- (PKUCBPaletteView)initWithFrame:(CGRect)a3;
- (UIStackView)_buttonStackView;
- (UIView)_contentView;
- (double)_buttonGroupSpacing;
- (double)_contentMargin;
- (double)_narrowLength;
- (double)borderWidthForTraitCollection:(id)a3;
- (double)compactPaletteHeight;
- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5;
- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5;
- (double)shadowOpacity;
- (double)shadowRadius;
- (id)_centeredBarButtons;
- (id)borderColorForTraitCollection:(id)a3;
- (id)returnKeyHandler;
- (int64_t)returnKeyType;
- (unint64_t)paletteViewType;
- (void)_flashLanguageIndicatorIfNeeded;
- (void)_handleReturnKey;
- (void)_performUpdateUIBlock:(id)a3;
- (void)_updateCenteredButtonGroup;
- (void)_updateLeadingButtonGroup;
- (void)_updateReturnKeyButton;
- (void)_updateSubviewLayoutAxis;
- (void)_updateTrailingButtonGroup;
- (void)_updateUI;
- (void)buttonDidChangeIntrinsicContentSize:(id)a3;
- (void)didChangePaletteScaleFactor;
- (void)dismissPalettePopoverWithCompletion:(id)a3;
- (void)setAlwaysIncludeReturnKeyAndInputAssistantItems:(BOOL)a3;
- (void)setCenteredBarButtons:(id)a3;
- (void)setCompactContentViewConstraints:(id)a3;
- (void)setLeadingBarButtons:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setNonCompactContentViewConstraints:(id)a3;
- (void)setReturnKeyEnabled:(BOOL)a3;
- (void)setReturnKeyHandler:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setTrailingBarButtons:(id)a3;
- (void)setUpdatingUI:(BOOL)a3;
- (void)set_buttonStackView:(id)a3;
- (void)set_buttonStackViewBottomConstraint:(id)a3;
- (void)set_buttonStackViewHeightConstraint:(id)a3;
- (void)set_centeredButtonGroupView:(id)a3;
- (void)set_contentView:(id)a3;
- (void)set_contentViewBottomAnchor:(id)a3;
- (void)set_contentViewLeadingAnchor:(id)a3;
- (void)set_contentViewTopAnchor:(id)a3;
- (void)set_contentViewTrailingAnchor:(id)a3;
- (void)set_leadingButtonGroupView:(id)a3;
- (void)set_returnKeyButton:(id)a3;
- (void)set_returnKeyButtonGroupView:(id)a3;
- (void)set_trailingButtonGroupView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)willStartAppearanceAnimation:(BOOL)a3;
@end

@implementation PKUCBPaletteView

+ (id)makeBackgroundView
{
  v2 = objc_alloc_init(PKPaletteBackgroundViewFactory);
  v3 = -[PKPaletteBackgroundViewFactory makeBackgroundViewWithName:backgroundColor:]((uint64_t)v2, @"com.apple.pencilkit.ucb.materialbackground", 0);

  return v3;
}

- (PKUCBPaletteView)initWithFrame:(CGRect)a3
{
  PKPaletteButtonGroupView *returnKeyButtonGroupView;
  PKPaletteReturnKeyButton *v56;
  PKPaletteReturnKeyButton *returnKeyButton;
  id v58;
  void *v59;
  uint64_t v60;
  UIStackView *buttonStackView;
  void *v62;
  void *v63;
  uint64_t v64;
  NSLayoutConstraint *buttonStackViewBottomConstraint;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *buttonStackViewHeightConstraint;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v79;
  void *v80;
  void *v81;
  PKPaletteConcreteHandwritingTool *v82;
  objc_super v83;
  void v84[4];
  void v85[4];
  void v86[4];
  void v87[4];

  v87[2] = *MEMORY[0x1E4F143B8];
  v83.receiver = self;
  v83.super_class = (Class)PKUCBPaletteView;
  v3 = -[PKPaletteView initWithFrame:](&v83, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKUCBPaletteView *)v3 setAccessibilityIdentifier:@"Scribble-UCB-Palette"];
    v5 = +[PKTextInputSettings sharedSettings];
    v4->_alwaysIncludeReturnKeyAndInputAssistantItems = [v5 alwaysIncludeReturnKeyAndInputAssistantItems];

    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v4->__contentView;
    v4->__contentView = v6;

    [(UIView *)v4->__contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(PKPaletteView *)v4 containerView];
    v9 = [v8 contentView];
    [v9 addSubview:v4->__contentView];

    v81 = [(UIView *)v4->__contentView centerXAnchor];
    v10 = [(PKPaletteView *)v4 containerView];
    v11 = [v10 contentView];
    v12 = [v11 centerXAnchor];
    v13 = [v81 constraintEqualToAnchor:v12];
    v87[0] = v13;
    v14 = [(UIView *)v4->__contentView centerYAnchor];
    v15 = [(PKPaletteView *)v4 containerView];
    v16 = [v15 contentView];
    v17 = [v16 centerYAnchor];
    v18 = [v14 constraintEqualToAnchor:v17];
    v87[1] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
    nonCompactContentViewConstraints = v4->_nonCompactContentViewConstraints;
    v4->_nonCompactContentViewConstraints = (NSArray *)v19;

    v21 = [(UIView *)v4->__contentView topAnchor];
    v22 = [(PKPaletteView *)v4 containerView];
    v23 = [v22 contentView];
    v24 = [v23 topAnchor];
    uint64_t v25 = [v21 constraintEqualToAnchor:v24];
    contentViewTopAnchor = v4->__contentViewTopAnchor;
    v4->__contentViewTopAnchor = (NSLayoutConstraint *)v25;

    v27 = [(UIView *)v4->__contentView bottomAnchor];
    v28 = [(PKPaletteView *)v4 containerView];
    v29 = [v28 contentView];
    v30 = [v29 bottomAnchor];
    uint64_t v31 = [v27 constraintEqualToAnchor:v30];
    contentViewBottomAnchor = v4->__contentViewBottomAnchor;
    v4->__contentViewBottomAnchor = (NSLayoutConstraint *)v31;

    v33 = [(UIView *)v4->__contentView leadingAnchor];
    v34 = [(PKPaletteView *)v4 containerView];
    v35 = [v34 contentView];
    v36 = [v35 leadingAnchor];
    uint64_t v37 = [v33 constraintEqualToAnchor:v36];
    contentViewLeadingAnchor = v4->__contentViewLeadingAnchor;
    v4->__contentViewLeadingAnchor = (NSLayoutConstraint *)v37;

    v39 = [(UIView *)v4->__contentView trailingAnchor];
    v40 = [(PKPaletteView *)v4 containerView];
    v41 = [v40 contentView];
    v42 = [v41 trailingAnchor];
    uint64_t v43 = [v39 constraintEqualToAnchor:v42];
    contentViewTrailingAnchor = v4->__contentViewTrailingAnchor;
    v4->__contentViewTrailingAnchor = (NSLayoutConstraint *)v43;

    v86[0] = v4->__contentViewTopAnchor;
    v86[1] = v4->__contentViewBottomAnchor;
    v86[2] = v4->__contentViewLeadingAnchor;
    v86[3] = v4->__contentViewTrailingAnchor;
    uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];
    compactContentViewConstraints = v4->_compactContentViewConstraints;
    v4->_compactContentViewConstraints = (NSArray *)v45;

    v82 = objc_alloc_init(PKPaletteConcreteHandwritingTool);
    v47 = [(PKPaletteView *)v4 toolPreview];
    [v47 showPreviewForTool:v82 animated:0];

    v48 = objc_alloc_init(PKPaletteButtonGroupView);
    leadingButtonGroupView = v4->__leadingButtonGroupView;
    v4->__leadingButtonGroupView = v48;

    v50 = objc_alloc_init(PKPaletteButtonGroupView);
    centeredButtonGroupView = v4->__centeredButtonGroupView;
    v4->__centeredButtonGroupView = v50;

    v52 = objc_alloc_init(PKPaletteButtonGroupView);
    trailingButtonGroupView = v4->__trailingButtonGroupView;
    v4->__trailingButtonGroupView = v52;

    v54 = objc_alloc_init(PKPaletteButtonGroupView);
    returnKeyButtonGroupView = v4->__returnKeyButtonGroupView;
    v4->__returnKeyButtonGroupView = v54;

    v56 = objc_alloc_init(PKPaletteReturnKeyButton);
    returnKeyButton = v4->__returnKeyButton;
    v4->__returnKeyButton = v56;

    [(PKPaletteReturnKeyButton *)v4->__returnKeyButton addTarget:v4 action:sel__handleReturnKey forControlEvents:64];
    v58 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v85[0] = v4->__leadingButtonGroupView;
    v85[1] = v4->__returnKeyButtonGroupView;
    v85[2] = v4->__centeredButtonGroupView;
    v85[3] = v4->__trailingButtonGroupView;
    v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:4];
    v60 = [v58 initWithArrangedSubviews:v59];
    buttonStackView = v4->__buttonStackView;
    v4->__buttonStackView = (UIStackView *)v60;

    [(UIStackView *)v4->__buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->__buttonStackView setDistribution:3];
    [(UIStackView *)v4->__buttonStackView setAlignment:3];
    [(UIView *)v4->__contentView addSubview:v4->__buttonStackView];
    v62 = [(UIStackView *)v4->__buttonStackView bottomAnchor];
    v63 = [(UIView *)v4->__contentView bottomAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    buttonStackViewBottomConstraint = v4->__buttonStackViewBottomConstraint;
    v4->__buttonStackViewBottomConstraint = (NSLayoutConstraint *)v64;

    v66 = [(UIStackView *)v4->__buttonStackView heightAnchor];
    [(PKUCBPaletteView *)v4 compactPaletteHeight];
    v67 = objc_msgSend(v66, "constraintEqualToConstant:");
    buttonStackViewHeightConstraint = v4->__buttonStackViewHeightConstraint;
    v4->__buttonStackViewHeightConstraint = (NSLayoutConstraint *)v67;

    v79 = (void *)MEMORY[0x1E4F28DC8];
    v80 = [(UIStackView *)v4->__buttonStackView topAnchor];
    v69 = [(UIView *)v4->__contentView topAnchor];
    v70 = [v80 constraintEqualToAnchor:v69];
    v84[0] = v70;
    v84[1] = v4->__buttonStackViewBottomConstraint;
    v71 = [(UIStackView *)v4->__buttonStackView leadingAnchor];
    v72 = [(UIView *)v4->__contentView leadingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    v84[2] = v73;
    v74 = [(UIStackView *)v4->__buttonStackView trailingAnchor];
    v75 = [(UIView *)v4->__contentView trailingAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    v84[3] = v76;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
    [v79 activateConstraints:v77];

    [(PKUCBPaletteView *)v4 _updateUI];
  }
  return v4;
}

- (void)updateConstraints
{
  if ([(PKPaletteView *)self useCompactSize])
  {
    [(PKUCBPaletteView *)self _contentMargin];
    double v4 = v3;
    v5 = [(PKUCBPaletteView *)self _contentViewLeadingAnchor];
    [v5 setConstant:v4];

    [(PKUCBPaletteView *)self _contentMargin];
    double v7 = -v6;
    v8 = [(PKUCBPaletteView *)self _contentViewTrailingAnchor];
    [v8 setConstant:v7];

    v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = [(PKUCBPaletteView *)self nonCompactContentViewConstraints];
    [v9 deactivateConstraints:v10];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    [(PKUCBPaletteView *)self compactContentViewConstraints];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28DC8];
    v13 = [(PKUCBPaletteView *)self compactContentViewConstraints];
    [v12 deactivateConstraints:v13];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    [(PKUCBPaletteView *)self nonCompactContentViewConstraints];
  v14 = };
  [v11 activateConstraints:v14];

  v15.receiver = self;
  v15.super_class = (Class)PKUCBPaletteView;
  [(PKUCBPaletteView *)&v15 updateConstraints];
}

- (double)_contentMargin
{
  [(PKPaletteView *)self paletteScaleFactor];
  return v2 * 26.0;
}

- (double)_buttonGroupSpacing
{
  [(PKPaletteView *)self paletteScaleFactor];
  return v2 * 26.0;
}

- (double)_narrowLength
{
  [(PKPaletteView *)self paletteScaleFactor];
  return v2 * 88.0;
}

- (double)responseForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  double v5 = sqrt(a5.y * a5.y + a5.x * a5.x);
  switch(a3)
  {
    case 1:
      unint64_t v6 = a4 - 5;
      goto LABEL_5;
    case 2:
      BOOL v7 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6;
      goto LABEL_9;
    case 3:
      unint64_t v6 = a4 - 7;
LABEL_5:
      if (v6 >= 2) {
        goto LABEL_12;
      }
      BOOL v7 = 1;
LABEL_9:
      BOOL v8 = v5 > 2700.0;
      if (!v7 || v5 <= 2700.0) {
        goto LABEL_13;
      }
      return 0.456;
    case 4:
      BOOL v7 = 1;
      if (a4 == 5 || a4 == 8) {
        goto LABEL_9;
      }
      goto LABEL_12;
    default:
LABEL_12:
      BOOL v8 = v5 > 2700.0;
LABEL_13:
      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 && (a4 == 2 || a4 == 4))
      {
LABEL_19:
        if (v8) {
          return 0.456;
        }
        switch(a3)
        {
          case 1:
            goto LABEL_26;
          case 2:
          case 4:
            if (a4 == 4 || a4 == 2)
            {
              v10 = [(PKUCBPaletteView *)self window];
              v11 = [v10 windowScene];
              double v12 = dbl_1C482B190[(unint64_t)([v11 interfaceOrientation] - 1) < 2];

              return dbl_1C482B1A0[v5 > v12];
            }
            if (a3 == 2)
            {
              BOOL v13 = a4 == 5 || a4 == 8;
            }
            else
            {
              if (a3 == 3) {
                goto LABEL_31;
              }
              BOOL v13 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6;
              if (a3 != 4) {
                BOOL v13 = 0;
              }
            }
            break;
          case 3:
            goto LABEL_31;
          default:
            goto LABEL_25;
        }
      }
      else
      {
        switch(a3)
        {
          case 1:
LABEL_26:
            unint64_t v14 = a4 - 7;
            break;
          case 2:
          case 4:
            if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
              BOOL v8 = 0;
            }
            goto LABEL_19;
          case 3:
LABEL_31:
            unint64_t v14 = a4 - 5;
            break;
          default:
LABEL_25:
            BOOL v13 = 0;
            goto LABEL_33;
        }
        BOOL v13 = v14 < 2;
      }
LABEL_33:
      double result = 0.7;
      if (v13 && v5 > 7000.0) {
        return 0.456;
      }
      return result;
  }
}

- (double)dampingRatioForThrowingFromPosition:(int64_t)a3 toPosition:(int64_t)a4 withVelocity:(CGPoint)a5
{
  double v5 = sqrt(a5.y * a5.y + a5.x * a5.x);
  switch(a3)
  {
    case 1:
      unint64_t v6 = a4 - 5;
      goto LABEL_5;
    case 2:
      BOOL v7 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 6;
      goto LABEL_9;
    case 3:
      unint64_t v6 = a4 - 7;
LABEL_5:
      if (v6 >= 2) {
        goto LABEL_12;
      }
      BOOL v7 = 1;
LABEL_9:
      if (v7 && v5 > 1900.0) {
        return 0.95;
      }
LABEL_11:
      if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
        goto LABEL_14;
      }
LABEL_12:
      BOOL v8 = 1;
      if (a4 == 2 || a4 == 4) {
        goto LABEL_17;
      }
LABEL_14:
      if (a3 != 4 && a3 != 2) {
        goto LABEL_28;
      }
LABEL_16:
      BOOL v8 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
LABEL_17:
      if (v8 && v5 > 3000.0) {
        return 0.95;
      }
      if (a3 == 4 || a3 == 2) {
        BOOL v11 = a4 == 2 || a4 == 4;
      }
      else {
LABEL_28:
      }
        BOOL v11 = 0;
      BOOL v12 = v5 > 4000.0;
      double result = 0.8;
      if (v11 && v12) {
        return 0.95;
      }
      return result;
    case 4:
      BOOL v7 = 1;
      if (a4 == 5 || a4 == 8) {
        goto LABEL_9;
      }
      goto LABEL_16;
    default:
      goto LABEL_11;
  }
}

- (double)compactPaletteHeight
{
  return 50.0;
}

- (id)borderColorForTraitCollection:(id)a3
{
  id v3 = a3;
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    double v4 = [MEMORY[0x1E4FB1618] systemGray4Color];
  }
  else
  {
    uint64_t v5 = [v3 userInterfaceStyle];
    unint64_t v6 = [MEMORY[0x1E4FB1618] systemGray4Color];
    BOOL v7 = v6;
    if (v5 == 2) {
      double v8 = 0.4;
    }
    else {
      double v8 = 0.5;
    }
    double v4 = [v6 colorWithAlphaComponent:v8];
  }

  return v4;
}

- (double)borderWidthForTraitCollection:(id)a3
{
  BOOL v3 = UIAccessibilityDarkerSystemColorsEnabled();
  double result = 0.5;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (double)shadowOpacity
{
  BOOL v2 = UIAccessibilityDarkerSystemColorsEnabled();
  double result = 0.25;
  if (v2) {
    return 0.5;
  }
  return result;
}

- (double)shadowRadius
{
  return 15.0;
}

- (BOOL)shouldAdjustShadowRadiusForMinimized
{
  return 0;
}

- (void)didChangePaletteScaleFactor
{
  [(PKUCBPaletteView *)self _updateUI];
  v3.receiver = self;
  v3.super_class = (Class)PKUCBPaletteView;
  [(PKPaletteView *)&v3 didChangePaletteScaleFactor];
  [(PKUCBPaletteView *)self setNeedsUpdateConstraints];
}

- (CGSize)paletteSizeForEdge:(unint64_t)a3
{
  uint64_t v5 = [(PKUCBPaletteView *)self _buttonStackView];
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v7 = v6;
  double v9 = v8;

  int64_t v10 = [(PKPaletteView *)self palettePosition];
  if (v10 == 4 || v10 == 2)
  {
    [(PKUCBPaletteView *)self _contentMargin];
    double v12 = v11 + v11;
    [(PKUCBPaletteView *)self _narrowLength];
    double v14 = v13;
    double v15 = v9 + v12;
    int v16 = 1;
  }
  else
  {
    [(PKUCBPaletteView *)self _contentMargin];
    double v14 = v7 + v17 + v17;
    [(PKUCBPaletteView *)self _narrowLength];
    int v16 = 0;
  }
  BOOL v19 = a3 == 2 || a3 == 8;
  int v20 = v19 ^ v16;
  if (v20) {
    double v21 = v14;
  }
  else {
    double v21 = v15;
  }
  if (!v20) {
    double v15 = v14;
  }
  result.height = v21;
  result.width = v15;
  return result;
}

- (BOOL)shouldStartUpMinimized
{
  return [(PKUCBPaletteView *)self returnKeyType] == 0;
}

- (BOOL)shouldExpandFromCorner
{
  return [(PKUCBPaletteView *)self returnKeyType] != 0;
}

- (void)willStartAppearanceAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKUCBPaletteView;
  -[PKPaletteView willStartAppearanceAnimation:](&v5, sel_willStartAppearanceAnimation_);
  if (v3) {
    [(PKUCBPaletteView *)self _flashLanguageIndicatorIfNeeded];
  }
}

- (BOOL)isPalettePresentingPopover
{
  BOOL v2 = [(PKPaletteView *)self palettePopoverPresentingController];
  BOOL v3 = [v2 presentedViewController];

  if (v3)
  {
    double v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v6 = v4 == v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)toolPreviewMatchesExpandedTool
{
  return 0;
}

- (void)setReturnKeyType:(int64_t)a3
{
  if (self->_returnKeyType != a3)
  {
    self->_returnKeyType = a3;
    [(PKUCBPaletteView *)self _updateUI];
    double v4 = [(PKPaletteView *)self internalDelegate];
    [v4 paletteViewContentSizeDidChange:self];

    id v5 = [(PKPaletteView *)self internalDelegate];
    [v5 paletteViewReturnKeyTypeDidChange:self];
  }
}

- (void)setReturnKeyEnabled:(BOOL)a3
{
  if (self->_returnKeyEnabled != a3)
  {
    self->_returnKeyEnabled = a3;
    [(PKUCBPaletteView *)self _updateUI];
  }
}

- (void)setLocaleIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_localeIdentifier, "isEqualToString:"))
  {
    double v4 = (NSString *)[v6 copy];
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v4;

    [(PKUCBPaletteView *)self _updateUI];
  }
}

- (void)setLeadingBarButtons:(id)a3
{
  if (self->_leadingBarButtons != a3)
  {
    double v4 = (NSArray *)[a3 copy];
    leadingBarButtons = self->_leadingBarButtons;
    self->_leadingBarButtons = v4;

    [(PKUCBPaletteView *)self _updateUI];
    id v6 = [(PKPaletteView *)self internalDelegate];
    [v6 paletteViewContentSizeDidChange:self];
  }
}

- (void)setCenteredBarButtons:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v4 = (NSArray *)a3;
  centeredBarButtons = self->_centeredBarButtons;
  if (centeredBarButtons != v4)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = centeredBarButtons;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v10++) removeIntrinsicContentSizeObserver:self];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }

    double v11 = (NSArray *)[(NSArray *)v4 copy];
    double v12 = self->_centeredBarButtons;
    self->_centeredBarButtons = v11;

    [(PKUCBPaletteView *)self _updateUI];
    double v13 = [(PKPaletteView *)self internalDelegate];
    [v13 paletteViewContentSizeDidChange:self];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v14 = self->_centeredBarButtons;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "addIntrinsicContentSizeObserver:", self, (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (void)setTrailingBarButtons:(id)a3
{
  if (self->_trailingBarButtons != a3)
  {
    double v4 = (NSArray *)[a3 copy];
    trailingBarButtons = self->_trailingBarButtons;
    self->_trailingBarButtons = v4;

    [(PKUCBPaletteView *)self _updateUI];
    id v6 = [(PKPaletteView *)self internalDelegate];
    [v6 paletteViewContentSizeDidChange:self];
  }
}

- (void)_flashLanguageIndicatorIfNeeded
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if ([(PKPaletteView *)self isToolPreviewMinimized])
  {
    BOOL v3 = +[PKTextInputLanguageSelectionController sharedInstance];
    if ([v3 shouldIdentifyLanguages])
    {
      double v4 = [v3 languageIdentificationIcon];
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
      [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v5 setTintColor:v6];

      [v4 size];
      double v7 = 1.0;
      if (v8 > 0.0)
      {
        [v4 size];
        double v10 = v9;
        [v4 size];
        double v7 = v10 / v11;
      }
      double v12 = (void *)MEMORY[0x1E4F28DC8];
      double v13 = [v5 heightAnchor];
      double v14 = [v13 constraintEqualToConstant:28.0];
      v21[0] = v14;
      uint64_t v15 = [v5 widthAnchor];
      uint64_t v16 = [v5 heightAnchor];
      uint64_t v17 = [v15 constraintEqualToAnchor:v16 multiplier:v7];
      v21[1] = v17;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      v18 = long long v20 = v4;
      [v12 activateConstraints:v18];

      long long v19 = [(PKPaletteView *)self toolPreview];
      [v19 flashAlternatePreviewView:v5];
    }
  }
}

- (void)buttonDidChangeIntrinsicContentSize:(id)a3
{
  if (![(PKUCBPaletteView *)self isUpdatingUI])
  {
    id v4 = [(PKPaletteView *)self internalDelegate];
    [v4 paletteViewContentSizeDidChange:self];
  }
}

- (unint64_t)paletteViewType
{
  return 2;
}

- (void)_handleReturnKey
{
  BOOL v3 = [(PKUCBPaletteView *)self returnKeyHandler];

  if (v3)
  {
    id v4 = [(PKUCBPaletteView *)self returnKeyHandler];
    v4[2](v4, self);
  }
}

- (void)_performUpdateUIBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(PKUCBPaletteView *)self setUpdatingUI:1];
  v4[2](v4);

  [(PKUCBPaletteView *)self setUpdatingUI:0];
}

- (void)_updateUI
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29__PKUCBPaletteView__updateUI__block_invoke;
  v2[3] = &unk_1E64C61C0;
  v2[4] = self;
  [(PKUCBPaletteView *)self _performUpdateUIBlock:v2];
}

uint64_t __29__PKUCBPaletteView__updateUI__block_invoke(uint64_t a1)
{
  BOOL v2 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_paletteBackgroundColor");
  [*(id *)(a1 + 32) setBackgroundColor:v2];

  BOOL v3 = [*(id *)(a1 + 32) localeIdentifier];
  id v4 = [*(id *)(a1 + 32) toolPreview];
  [v4 setLocaleIdentifier:v3];

  [*(id *)(a1 + 32) _buttonGroupSpacing];
  double v6 = v5;
  double v7 = [*(id *)(a1 + 32) _buttonStackView];
  [v7 setSpacing:v6];

  uint64_t v8 = [*(id *)(a1 + 32) useCompactSize] ^ 1;
  double v9 = [*(id *)(a1 + 32) _buttonStackViewBottomConstraint];
  [v9 setActive:v8];

  uint64_t v10 = [*(id *)(a1 + 32) useCompactSize];
  double v11 = [*(id *)(a1 + 32) _buttonStackViewHeightConstraint];
  [v11 setActive:v10];

  [*(id *)(a1 + 32) paletteScaleFactor];
  double v13 = v12;
  double v14 = [*(id *)(a1 + 32) _leadingButtonGroupView];
  [v14 setScalingFactor:v13];

  [*(id *)(a1 + 32) paletteScaleFactor];
  double v16 = v15;
  uint64_t v17 = [*(id *)(a1 + 32) _trailingButtonGroupView];
  [v17 setScalingFactor:v16];

  [*(id *)(a1 + 32) paletteScaleFactor];
  double v19 = v18;
  long long v20 = [*(id *)(a1 + 32) _centeredButtonGroupView];
  [v20 setScalingFactor:v19];

  [*(id *)(a1 + 32) paletteScaleFactor];
  double v22 = v21;
  long long v23 = [*(id *)(a1 + 32) _returnKeyButtonGroupView];
  [v23 setScalingFactor:v22];

  [*(id *)(a1 + 32) _updateReturnKeyButton];
  [*(id *)(a1 + 32) _updateLeadingButtonGroup];
  [*(id *)(a1 + 32) _updateCenteredButtonGroup];
  [*(id *)(a1 + 32) _updateTrailingButtonGroup];
  long long v24 = *(void **)(a1 + 32);

  return [v24 _updateSubviewLayoutAxis];
}

- (void)_updateReturnKeyButton
{
  int64_t v3 = [(PKUCBPaletteView *)self returnKeyType];
  id v4 = [(PKUCBPaletteView *)self _returnKeyButton];
  [v4 setReturnKeyType:v3];

  BOOL v5 = [(PKUCBPaletteView *)self isReturnKeyEnabled];
  double v6 = [(PKUCBPaletteView *)self _returnKeyButton];
  [v6 setEnabled:v5];

  BOOL v7 = [(PKUCBPaletteView *)self _shouldHideReturnKeyButtonGroupView];
  uint64_t v8 = [(PKUCBPaletteView *)self _returnKeyButtonGroupView];
  [v8 setHidden:v7];

  if (![(PKUCBPaletteView *)self _shouldHideReturnKeyButtonGroupView])
  {
    double v9 = [(PKUCBPaletteView *)self _returnKeyButtonGroupView];
    [v9 removeAllButtons];

    id v11 = [(PKUCBPaletteView *)self _returnKeyButtonGroupView];
    uint64_t v10 = [(PKUCBPaletteView *)self _returnKeyButton];
    [v11 addButton:v10];
  }
}

- (BOOL)_shouldHideReturnKeyButtonGroupView
{
  if ([(PKPaletteView *)self useCompactSize]) {
    return 1;
  }
  else {
    return ![(PKUCBPaletteView *)self _shouldShowReturnKey];
  }
}

- (void)_updateLeadingButtonGroup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKUCBPaletteView *)self _shouldHideLeadingButtonGroupView];
  id v4 = [(PKUCBPaletteView *)self _leadingButtonGroupView];
  [v4 setHidden:v3];

  if (![(PKUCBPaletteView *)self _shouldHideLeadingButtonGroupView])
  {
    BOOL v5 = [(PKUCBPaletteView *)self _leadingButtonGroupView];
    [v5 removeAllButtons];

    double v6 = [(PKUCBPaletteView *)self _leadingButtonGroupView];
    BOOL v7 = [(PKUCBPaletteView *)self leadingBarButtons];
    [v6 addButtonsFromArray:v7];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(PKUCBPaletteView *)self _leadingButtonGroupView];
    double v9 = [v8 buttons];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "setUseCompactLayout:", -[PKPaletteView useCompactSize](self, "useCompactSize"));
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)_shouldHideLeadingButtonGroupView
{
  BOOL v3 = [(PKUCBPaletteView *)self leadingBarButtons];
  if ([v3 count]) {
    BOOL v4 = [(PKPaletteView *)self useCompactSize];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_updateCenteredButtonGroup
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKUCBPaletteView *)self _shouldShowCenterButtonGroupView] ^ 1;
  BOOL v4 = [(PKUCBPaletteView *)self _centeredButtonGroupView];
  [v4 setHidden:v3];

  if ([(PKUCBPaletteView *)self _shouldShowCenterButtonGroupView])
  {
    BOOL v5 = [(PKUCBPaletteView *)self _centeredButtonGroupView];
    [v5 removeAllButtons];

    double v6 = [(PKUCBPaletteView *)self _centeredButtonGroupView];
    BOOL v7 = [(PKUCBPaletteView *)self _centeredBarButtons];
    [v6 addButtonsFromArray:v7];

    BOOL v8 = [(PKUCBPaletteView *)self _shouldHideLeadingButtonGroupView]
      || [(PKUCBPaletteView *)self _shouldHideTrailingButtonGroupView];
    double v9 = [(PKUCBPaletteView *)self _centeredButtonGroupView];
    [v9 setUseEqualInterItemSpacing:v8];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [(PKUCBPaletteView *)self _centeredButtonGroupView];
    uint64_t v11 = [v10 buttons];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "setUseCompactLayout:", -[PKPaletteView useCompactSize](self, "useCompactSize"));
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)_shouldShowCenterButtonGroupView
{
  if ([(PKPaletteView *)self useCompactSize]) {
    return 1;
  }
  if (![(PKUCBPaletteView *)self _shouldShowInputAssistantItems]) {
    return 0;
  }
  BOOL v4 = [(PKUCBPaletteView *)self _centeredBarButtons];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (id)_centeredBarButtons
{
  BOOL v3 = [MEMORY[0x1E4F1C978] array];
  BOOL v4 = [(PKPaletteView *)self useCompactSize];
  BOOL v5 = [(PKUCBPaletteView *)self centeredBarButtons];
  double v6 = v5;
  if (v4)
  {
    BOOL v7 = [v5 indexesOfObjectsPassingTest:&__block_literal_global_59];

    BOOL v8 = [(PKUCBPaletteView *)self leadingBarButtons];
    if ([v8 count])
    {
      unint64_t v9 = [v7 count];

      if (v9 > 3) {
        goto LABEL_6;
      }
      [(PKUCBPaletteView *)self leadingBarButtons];
      BOOL v3 = v8 = v3;
    }

LABEL_6:
    if ([(PKUCBPaletteView *)self _shouldShowReturnKey])
    {
      uint64_t v10 = [(PKUCBPaletteView *)self _returnKeyButton];
      uint64_t v11 = [v3 arrayByAddingObject:v10];

      BOOL v3 = (void *)v11;
    }
    if ([v7 count])
    {
      uint64_t v12 = [(PKUCBPaletteView *)self centeredBarButtons];
      uint64_t v13 = [v12 objectsAtIndexes:v7];

      unint64_t v14 = [v13 count];
      if (v14 >= 8) {
        uint64_t v15 = 8;
      }
      else {
        uint64_t v15 = v14;
      }
      long long v16 = objc_msgSend(v13, "subarrayWithRange:", 0, v15);
      uint64_t v17 = [v3 arrayByAddingObjectsFromArray:v16];

      BOOL v3 = (void *)v17;
    }
    long long v18 = [(PKUCBPaletteView *)self trailingBarButtons];
    if ([v18 count])
    {
      unint64_t v19 = [v7 count];

      if (v19 > 5)
      {
LABEL_17:
        double v6 = v3;
        goto LABEL_19;
      }
      long long v18 = [(PKUCBPaletteView *)self trailingBarButtons];
      uint64_t v20 = [v3 arrayByAddingObjectsFromArray:v18];

      BOOL v3 = (void *)v20;
    }

    goto LABEL_17;
  }
  BOOL v7 = v3;
LABEL_19:

  return v6;
}

uint64_t __39__PKUCBPaletteView__centeredBarButtons__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (void)_updateTrailingButtonGroup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKUCBPaletteView *)self _shouldHideTrailingButtonGroupView];
  BOOL v4 = [(PKUCBPaletteView *)self _trailingButtonGroupView];
  [v4 setHidden:v3];

  if (![(PKUCBPaletteView *)self _shouldHideTrailingButtonGroupView])
  {
    BOOL v5 = [(PKUCBPaletteView *)self _trailingButtonGroupView];
    [v5 removeAllButtons];

    double v6 = [(PKUCBPaletteView *)self _trailingButtonGroupView];
    BOOL v7 = [(PKUCBPaletteView *)self trailingBarButtons];
    [v6 addButtonsFromArray:v7];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v8 = [(PKUCBPaletteView *)self _trailingButtonGroupView];
    unint64_t v9 = [v8 buttons];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "setUseCompactLayout:", -[PKPaletteView useCompactSize](self, "useCompactSize"));
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (BOOL)_shouldHideTrailingButtonGroupView
{
  BOOL v3 = [(PKUCBPaletteView *)self trailingBarButtons];
  if ([v3 count]) {
    BOOL v4 = [(PKPaletteView *)self useCompactSize];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_updateSubviewLayoutAxis
{
  BOOL v3 = (([(PKPaletteView *)self palettePosition] - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
  BOOL v4 = [(PKUCBPaletteView *)self _buttonStackView];
  [v4 setAxis:v3];

  BOOL v5 = [(PKUCBPaletteView *)self _leadingButtonGroupView];
  [v5 setAxis:v3];

  double v6 = [(PKUCBPaletteView *)self _centeredButtonGroupView];
  [v6 setAxis:v3];

  BOOL v7 = [(PKUCBPaletteView *)self _trailingButtonGroupView];
  [v7 setAxis:v3];

  id v8 = [(PKUCBPaletteView *)self _returnKeyButton];
  [v8 setAxis:v3];
}

- (BOOL)_shouldShowReturnKey
{
  return [(PKUCBPaletteView *)self alwaysIncludeReturnKeyAndInputAssistantItems]|| [(PKUCBPaletteView *)self returnKeyType] != 0;
}

- (BOOL)_shouldShowInputAssistantItems
{
  return [(PKUCBPaletteView *)self alwaysIncludeReturnKeyAndInputAssistantItems]|| [(PKUCBPaletteView *)self returnKeyType] == 0;
}

- (void)dismissPalettePopoverWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKUCBPaletteView_dismissPalettePopoverWithCompletion___block_invoke;
  v7[3] = &unk_1E64C6B40;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PKUCBPaletteView;
  id v5 = v4;
  [(PKPaletteView *)&v6 dismissPalettePopoverWithCompletion:v7];
}

void __56__PKUCBPaletteView_dismissPalettePopoverWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPalettePresentingPopover])
  {
    id v4 = [*(id *)(a1 + 32) palettePopoverPresentingController];
    [v4 dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      BOOL v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKUCBPaletteView;
  [(PKPaletteView *)&v10 traitCollectionDidChange:v4];
  id v5 = [(PKUCBPaletteView *)self traitCollection];
  uint64_t v6 = [v5 verticalSizeClass];
  if (v6 == [v4 verticalSizeClass])
  {
    BOOL v7 = [(PKUCBPaletteView *)self traitCollection];
    uint64_t v8 = [v7 horizontalSizeClass];
    uint64_t v9 = [v4 horizontalSizeClass];

    if (v8 == v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(PKUCBPaletteView *)self _updateUI];
  [(PKUCBPaletteView *)self setNeedsUpdateConstraints];
LABEL_6:
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (BOOL)isReturnKeyEnabled
{
  return self->_returnKeyEnabled;
}

- (id)returnKeyHandler
{
  return self->_returnKeyHandler;
}

- (void)setReturnKeyHandler:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSArray)leadingBarButtons
{
  return self->_leadingBarButtons;
}

- (NSArray)centeredBarButtons
{
  return self->_centeredBarButtons;
}

- (NSArray)trailingBarButtons
{
  return self->_trailingBarButtons;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (void)set_contentView:(id)a3
{
}

- (NSLayoutConstraint)_contentViewTopAnchor
{
  return self->__contentViewTopAnchor;
}

- (void)set_contentViewTopAnchor:(id)a3
{
}

- (NSLayoutConstraint)_contentViewBottomAnchor
{
  return self->__contentViewBottomAnchor;
}

- (void)set_contentViewBottomAnchor:(id)a3
{
}

- (NSLayoutConstraint)_contentViewLeadingAnchor
{
  return self->__contentViewLeadingAnchor;
}

- (void)set_contentViewLeadingAnchor:(id)a3
{
}

- (NSLayoutConstraint)_contentViewTrailingAnchor
{
  return self->__contentViewTrailingAnchor;
}

- (void)set_contentViewTrailingAnchor:(id)a3
{
}

- (UIStackView)_buttonStackView
{
  return self->__buttonStackView;
}

- (void)set_buttonStackView:(id)a3
{
}

- (NSLayoutConstraint)_buttonStackViewHeightConstraint
{
  return self->__buttonStackViewHeightConstraint;
}

- (void)set_buttonStackViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)_buttonStackViewBottomConstraint
{
  return self->__buttonStackViewBottomConstraint;
}

- (void)set_buttonStackViewBottomConstraint:(id)a3
{
}

- (PKPaletteButtonGroupView)_leadingButtonGroupView
{
  return self->__leadingButtonGroupView;
}

- (void)set_leadingButtonGroupView:(id)a3
{
}

- (PKPaletteButtonGroupView)_centeredButtonGroupView
{
  return self->__centeredButtonGroupView;
}

- (void)set_centeredButtonGroupView:(id)a3
{
}

- (PKPaletteButtonGroupView)_trailingButtonGroupView
{
  return self->__trailingButtonGroupView;
}

- (void)set_trailingButtonGroupView:(id)a3
{
}

- (PKPaletteButtonGroupView)_returnKeyButtonGroupView
{
  return self->__returnKeyButtonGroupView;
}

- (void)set_returnKeyButtonGroupView:(id)a3
{
  objc_storeStrong((id *)&self->__returnKeyButtonGroupView, a3);
}

- (PKPaletteReturnKeyButton)_returnKeyButton
{
  return self->__returnKeyButton;
}

- (void)set_returnKeyButton:(id)a3
{
  objc_storeStrong((id *)&self->__returnKeyButton, a3);
}

- (BOOL)alwaysIncludeReturnKeyAndInputAssistantItems
{
  return self->_alwaysIncludeReturnKeyAndInputAssistantItems;
}

- (void)setAlwaysIncludeReturnKeyAndInputAssistantItems:(BOOL)a3
{
  self->_alwaysIncludeReturnKeyAndInputAssistantItems = a3;
}

- (BOOL)isUpdatingUI
{
  return self->_updatingUI;
}

- (void)setUpdatingUI:(BOOL)a3
{
  self->_updatingUI = a3;
}

- (NSArray)nonCompactContentViewConstraints
{
  return self->_nonCompactContentViewConstraints;
}

- (void)setNonCompactContentViewConstraints:(id)a3
{
}

- (NSArray)compactContentViewConstraints
{
  return self->_compactContentViewConstraints;
}

- (void)setCompactContentViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactContentViewConstraints, 0);
  objc_storeStrong((id *)&self->_nonCompactContentViewConstraints, 0);
  objc_storeStrong((id *)&self->__returnKeyButton, 0);
  objc_storeStrong((id *)&self->__returnKeyButtonGroupView, 0);
  objc_storeStrong((id *)&self->__trailingButtonGroupView, 0);
  objc_storeStrong((id *)&self->__centeredButtonGroupView, 0);
  objc_storeStrong((id *)&self->__leadingButtonGroupView, 0);
  objc_storeStrong((id *)&self->__buttonStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->__buttonStackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->__buttonStackView, 0);
  objc_storeStrong((id *)&self->__contentViewTrailingAnchor, 0);
  objc_storeStrong((id *)&self->__contentViewLeadingAnchor, 0);
  objc_storeStrong((id *)&self->__contentViewBottomAnchor, 0);
  objc_storeStrong((id *)&self->__contentViewTopAnchor, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->_trailingBarButtons, 0);
  objc_storeStrong((id *)&self->_centeredBarButtons, 0);
  objc_storeStrong((id *)&self->_leadingBarButtons, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);

  objc_storeStrong(&self->_returnKeyHandler, 0);
}

@end