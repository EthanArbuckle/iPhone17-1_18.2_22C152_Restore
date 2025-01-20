@interface AMUIOnboardingView
- (AMUIOnboardingView)initWithFrame:(CGRect)a3;
- (AMUIOnboardingViewDelegate)delegate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)_contentAllowedWidthForSize:(CGSize)a3;
- (id)_containerScrollView;
- (id)_onboardingTitle;
- (id)_onboardingViewPackageName;
- (void)_configureContainerScrollViewIfNecessary;
- (void)_configureContinueButtonIfNecessary;
- (void)_configureContinueButtonOcclusionMaterialViewIfNecessary;
- (void)_configurePackageViewIfNecessary;
- (void)_layoutContainerScrollViewIfNecessary;
- (void)_layoutContentLabelIfNecessary;
- (void)_layoutContinueButtonIfNecessary;
- (void)_layoutContinueButtonOcclusionMaterialViewIfNecessary;
- (void)_layoutPackageViewIfNecessary;
- (void)_layoutTitleLabelIfNecessary;
- (void)_performNextAnimationForPackageViewAnimated:(BOOL)a3;
- (void)_setContent:(id)a3;
- (void)_setTitle:(id)a3;
- (void)_toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AMUIOnboardingView

- (AMUIOnboardingView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AMUIOnboardingView;
  v3 = -[AMUIOnboardingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AMUIOnboardingView *)v3 _setOverrideUserInterfaceStyle:2];
    v5 = [(AMUIOnboardingView *)v4 _onboardingTitle];
    [(AMUIOnboardingView *)v4 _setTitle:v5];

    v6 = AMUIAmbientUIFrameworkBundle();
    v7 = [v6 localizedStringForKey:@"ONBOARDING_DESCRIPTION" value:&stru_26FBC9C48 table:0];
    [(AMUIOnboardingView *)v4 _setContent:v7];

    v8 = [(AMUIOnboardingView *)v4 layer];
    [v8 setAllowsGroupOpacity:1];

    [(AMUIOnboardingView *)v4 setMaximumContentSizeCategory:*MEMORY[0x263F1D168]];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIOnboardingView;
  [(AMUIOnboardingView *)&v3 layoutSubviews];
  [(AMUIOnboardingView *)self _configureContainerScrollViewIfNecessary];
  [(AMUIOnboardingView *)self _configurePackageViewIfNecessary];
  [(AMUIOnboardingView *)self _configureContinueButtonIfNecessary];
  [(AMUIOnboardingView *)self _layoutPackageViewIfNecessary];
  [(AMUIOnboardingView *)self _layoutTitleLabelIfNecessary];
  [(AMUIOnboardingView *)self _layoutContentLabelIfNecessary];
  [(AMUIOnboardingView *)self _layoutContinueButtonIfNecessary];
  [(AMUIOnboardingView *)self _layoutContainerScrollViewIfNecessary];
  [(AMUIOnboardingView *)self _configureContinueButtonOcclusionMaterialViewIfNecessary];
  [(AMUIOnboardingView *)self _layoutContinueButtonOcclusionMaterialViewIfNecessary];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  -[AMUIOnboardingView _contentAllowedWidthForSize:](self, "_contentAllowedWidthForSize:");
  double v7 = v6;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:");
  double v9 = v8 + 154.0 + 8.0;
  -[UILabel sizeThatFits:](self->_contentLabel, "sizeThatFits:", v7, height);
  double v11 = ceil(v9 + v10 + 72.0 + 24.0);
  double v12 = width;
  result.double height = v11;
  result.CGFloat width = v12;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 frame];
  double Height = CGRectGetHeight(v11);
  [v4 contentSize];
  double v9 = v8;

  -[AMUIOnboardingView _toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible:animated:](self, "_toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible:animated:", v6 + Height < v9, 1, v6 + Height);
}

- (id)_onboardingTitle
{
  v2 = NSString;
  objc_super v3 = AMUIAmbientUIFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"ONBOARDING_TITLE" value:&stru_26FBC9C48 table:0];
  double v5 = AMUIAmbientUIFrameworkBundle();
  double v6 = [v5 localizedStringForKey:@"FEATURE_NAME" value:&stru_26FBC9C48 table:0];
  double v7 = objc_msgSend(v2, "stringWithFormat:", v4, v6);

  return v7;
}

- (id)_containerScrollView
{
  [(AMUIOnboardingView *)self _configureContainerScrollViewIfNecessary];
  containerScrollView = self->_containerScrollView;

  return containerScrollView;
}

- (double)_contentAllowedWidthForSize:(CGSize)a3
{
  return a3.width * 0.5;
}

- (void)_setTitle:(id)a3
{
  id v13 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  char v5 = [v4 isEqualToString:v13];

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      double v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
      double v8 = self->_titleLabel;
      self->_titleLabel = v7;

      [(UILabel *)self->_titleLabel setNumberOfLines:1];
      [(UILabel *)self->_titleLabel setTextAlignment:1];
      [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)self->_titleLabel setAdjustsFontForContentSizeCategory:1];
      double v9 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D2F8] weight:*MEMORY[0x263F1D318]];
      [(UILabel *)self->_titleLabel setFont:v9];
      double v10 = self->_titleLabel;
      CGRect v11 = [MEMORY[0x263F1C550] labelColor];
      [(UILabel *)v10 setTextColor:v11];

      [(UILabel *)self->_titleLabel setPreferredVibrancy:1];
      double v12 = [(AMUIOnboardingView *)self _containerScrollView];
      [v12 addSubview:self->_titleLabel];

      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setText:v13];
    [(AMUIOnboardingView *)self setNeedsLayout];
  }
}

- (void)_setContent:(id)a3
{
  id v13 = a3;
  id v4 = [(UILabel *)self->_contentLabel text];
  char v5 = [v4 isEqualToString:v13];

  if ((v5 & 1) == 0)
  {
    contentLabel = self->_contentLabel;
    if (!contentLabel)
    {
      double v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
      double v8 = self->_contentLabel;
      self->_contentLabel = v7;

      [(UILabel *)self->_contentLabel setNumberOfLines:0];
      [(UILabel *)self->_contentLabel setTextAlignment:1];
      [(UILabel *)self->_contentLabel setAdjustsFontForContentSizeCategory:1];
      double v9 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:*MEMORY[0x263F1D260] weight:*MEMORY[0x263F1D338]];
      [(UILabel *)self->_contentLabel setFont:v9];
      double v10 = self->_contentLabel;
      CGRect v11 = [MEMORY[0x263F1C550] secondaryLabelColor];
      [(UILabel *)v10 setTextColor:v11];

      [(UILabel *)self->_contentLabel setPreferredVibrancy:1];
      double v12 = [(AMUIOnboardingView *)self _containerScrollView];
      [v12 addSubview:self->_contentLabel];

      contentLabel = self->_contentLabel;
    }
    [(UILabel *)contentLabel setText:v13];
    [(AMUIOnboardingView *)self setNeedsLayout];
  }
}

- (void)_configureContinueButtonIfNecessary
{
  v20[1] = *MEMORY[0x263EF8340];
  if (!self->_continueButton)
  {
    objc_super v3 = [MEMORY[0x263F1C490] filledButtonConfiguration];
    id v4 = [MEMORY[0x263F29D38] preferredFontProvider];
    char v5 = [v4 preferredFontForTextStyle:*MEMORY[0x263F1D260] hiFontStyle:4];

    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    double v7 = AMUIAmbientUIFrameworkBundle();
    double v8 = [v7 localizedStringForKey:@"ONBOARDING_CONTINUE" value:&stru_26FBC9C48 table:0];
    uint64_t v19 = *MEMORY[0x263F1C238];
    v20[0] = v5;
    double v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    double v10 = (void *)[v6 initWithString:v8 attributes:v9];

    [v3 setAttributedTitle:v10];
    [v3 setCornerStyle:3];
    objc_initWeak(&location, self);
    CGRect v11 = (void *)MEMORY[0x263F1C488];
    double v12 = (void *)MEMORY[0x263F1C3C0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__AMUIOnboardingView__configureContinueButtonIfNecessary__block_invoke;
    v16[3] = &unk_2652247B8;
    objc_copyWeak(&v17, &location);
    id v13 = [v12 actionWithHandler:v16];
    v14 = [v11 buttonWithConfiguration:v3 primaryAction:v13];
    continueButton = self->_continueButton;
    self->_continueButton = v14;

    [(AMUIOnboardingView *)self addSubview:self->_continueButton];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __57__AMUIOnboardingView__configureContinueButtonIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 onboardingViewRequestsDismissal:v3];

    id WeakRetained = v3;
  }
}

- (void)_configureContinueButtonOcclusionMaterialViewIfNecessary
{
  BOOL showContinueButtonOcclusionMaterialView = self->_showContinueButtonOcclusionMaterialView;
  continueButtonOcclusionMaterialView = self->_continueButtonOcclusionMaterialView;
  if (showContinueButtonOcclusionMaterialView)
  {
    if (!continueButtonOcclusionMaterialView)
    {
      char v5 = [MEMORY[0x263F53FE8] materialViewWithRecipe:51];
      id v6 = self->_continueButtonOcclusionMaterialView;
      self->_continueButtonOcclusionMaterialView = v5;

      [(MTMaterialView *)self->_continueButtonOcclusionMaterialView setGroupNameBase:@"AMUIOnboardingViewMaterialGroup"];
      double v7 = self->_continueButtonOcclusionMaterialView;
      [(AMUIOnboardingView *)self addSubview:v7];
    }
  }
  else if (continueButtonOcclusionMaterialView)
  {
    [(MTMaterialView *)continueButtonOcclusionMaterialView removeFromSuperview];
    double v8 = self->_continueButtonOcclusionMaterialView;
    self->_continueButtonOcclusionMaterialView = 0;
  }
}

- (id)_onboardingViewPackageName
{
  if ([(AMUIOnboardingView *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v2 = [@"AmbientOnboardingAsset" stringByAppendingString:@"-RTL"];
  }
  else
  {
    v2 = @"AmbientOnboardingAsset";
  }

  return v2;
}

- (void)_configurePackageViewIfNecessary
{
  if (!self->_packageView)
  {
    id v3 = objc_alloc(MEMORY[0x263F29D30]);
    id v4 = [(AMUIOnboardingView *)self _onboardingViewPackageName];
    char v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = (BSUICAPackageView *)[v3 initWithPackageName:v4 inBundle:v5];
    packageView = self->_packageView;
    self->_packageView = v6;

    double v8 = [(AMUIOnboardingView *)self _containerScrollView];
    [v8 addSubview:self->_packageView];

    self->_packageViewStateIndex = 0;
    dispatch_time_t v9 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__AMUIOnboardingView__configurePackageViewIfNecessary__block_invoke;
    block[3] = &unk_2652247E0;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __54__AMUIOnboardingView__configurePackageViewIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performNextAnimationForPackageViewAnimated:1];
}

- (void)_configureContainerScrollViewIfNecessary
{
  if (!self->_containerScrollView)
  {
    id v3 = objc_alloc(MEMORY[0x263F1C940]);
    [(AMUIOnboardingView *)self bounds];
    id v4 = (UIScrollView *)objc_msgSend(v3, "initWithFrame:");
    containerScrollView = self->_containerScrollView;
    self->_containerScrollView = v4;

    [(UIScrollView *)self->_containerScrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)self->_containerScrollView setClipsToBounds:0];
    [(UIScrollView *)self->_containerScrollView setDelegate:self];
    id v6 = self->_containerScrollView;
    [(AMUIOnboardingView *)self addSubview:v6];
  }
}

- (void)_layoutTitleLabelIfNecessary
{
  if (self->_titleLabel)
  {
    [(AMUIOnboardingView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[AMUIOnboardingView _contentAllowedWidthForSize:](self, "_contentAllowedWidthForSize:", v7, v9);
    double v12 = v11;
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.CGFloat width = v8;
    v15.size.double height = v10;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, CGRectGetHeight(v15));
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    titleLabel = self->_titleLabel;
    -[UILabel setFrame:](titleLabel, "setFrame:");
  }
}

- (void)_layoutContentLabelIfNecessary
{
  if (self->_contentLabel)
  {
    [(AMUIOnboardingView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[AMUIOnboardingView _contentAllowedWidthForSize:](self, "_contentAllowedWidthForSize:", v7, v9);
    double v12 = v11;
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.CGFloat width = v8;
    v15.size.double height = v10;
    -[UILabel sizeThatFits:](self->_contentLabel, "sizeThatFits:", v12, CGRectGetHeight(v15));
    [(UILabel *)self->_titleLabel frame];
    CGRectGetMaxY(v16);
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    contentLabel = self->_contentLabel;
    -[UILabel setFrame:](contentLabel, "setFrame:");
  }
}

- (void)_layoutPackageViewIfNecessary
{
  if (self->_packageView)
  {
    [(AMUIOnboardingView *)self bounds];
    [(BSUICAPackageView *)self->_packageView frame];
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    packageView = self->_packageView;
    -[BSUICAPackageView setFrame:](packageView, "setFrame:");
  }
}

- (void)_layoutContinueButtonOcclusionMaterialViewIfNecessary
{
  if (self->_continueButtonOcclusionMaterialView)
  {
    [(AMUIOnboardingView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(MTMaterialView *)self->_continueButtonOcclusionMaterialView frame];
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.CGFloat width = v8;
    v13.size.double height = v10;
    CGRectGetHeight(v13);
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.CGFloat width = v8;
    v14.size.double height = v10;
    CGRectGetWidth(v14);
    UIRectIntegralWithScale();
    -[MTMaterialView setFrame:](self->_continueButtonOcclusionMaterialView, "setFrame:");
    continueButton = self->_continueButton;
    [(AMUIOnboardingView *)self bringSubviewToFront:continueButton];
  }
}

- (void)_layoutContinueButtonIfNecessary
{
  if (self->_continueButton)
  {
    [(AMUIOnboardingView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(UIButton *)self->_continueButton frame];
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.CGFloat width = v8;
    v13.size.double height = v10;
    CGRectGetWidth(v13);
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.CGFloat width = v8;
    v14.size.double height = v10;
    CGRectGetMaxY(v14);
    UIRectCenteredXInRect();
    UIRectIntegralWithScale();
    -[UIButton setFrame:](self->_continueButton, "setFrame:");
    continueButton = self->_continueButton;
    [(AMUIOnboardingView *)self bringSubviewToFront:continueButton];
  }
}

- (void)_layoutContainerScrollViewIfNecessary
{
  if (self->_containerScrollView)
  {
    [(AMUIOnboardingView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(UIScrollView *)self->_containerScrollView frame];
    [(UIButton *)self->_continueButton frame];
    CGFloat v11 = CGRectGetMinY(v21) + -24.0;
    v22.origin.x = v4;
    v22.origin.y = v6;
    v22.size.CGFloat width = v8;
    v22.size.double height = v10;
    CGRectGetWidth(v22);
    UIRectIntegralWithScale();
    double v13 = v12;
    double v15 = v14;
    -[UIScrollView setFrame:](self->_containerScrollView, "setFrame:");
    [(UILabel *)self->_contentLabel frame];
    double MaxY = CGRectGetMaxY(v23);
    if (MaxY <= v11)
    {
      [(UIScrollView *)self->_containerScrollView setScrollEnabled:0];
      BOOL v18 = 0;
      double v17 = v15;
    }
    else
    {
      double v17 = MaxY;
      BOOL v18 = 1;
    }
    self->_BOOL showContinueButtonOcclusionMaterialView = v18;
    containerScrollView = self->_containerScrollView;
    -[UIScrollView setContentSize:](containerScrollView, "setContentSize:", v13, v17);
  }
}

- (void)_performNextAnimationForPackageViewAnimated:(BOOL)a3
{
  if (self->_packageView)
  {
    BOOL v3 = a3;
    double v5 = [&unk_26FBDB1B0 objectAtIndexedSubscript:self->_packageViewStateIndex];
    [(BSUICAPackageView *)self->_packageView setState:v5 animated:v3 transitionSpeed:0 completion:1.0];
    objc_initWeak(&location, self);
    if (v3) {
      int64_t v6 = 2200000000;
    }
    else {
      int64_t v6 = 0;
    }
    dispatch_time_t v7 = dispatch_time(0, v6);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__AMUIOnboardingView__performNextAnimationForPackageViewAnimated___block_invoke;
    v8[3] = &unk_265224808;
    objc_copyWeak(&v9, &location);
    dispatch_after(v7, MEMORY[0x263EF83A0], v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __66__AMUIOnboardingView__performNextAnimationForPackageViewAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unint64_t v2 = WeakRetained[54] + 1;
    WeakRetained[54] = v2;
    double v5 = WeakRetained;
    unint64_t v3 = [&unk_26FBDB1C8 count];
    if (v2 >= v3) {
      v5[54] = 0;
    }
    [v5 _performNextAnimationForPackageViewAnimated:v2 < v3];
  }

  return MEMORY[0x270F9A758]();
}

- (void)_toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  int64_t v6 = self->_continueButtonOcclusionMaterialView;
  dispatch_time_t v7 = v6;
  if (a4)
  {
    CGFloat v8 = (void *)MEMORY[0x263F1CB60];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __93__AMUIOnboardingView__toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible_animated___block_invoke;
    v9[3] = &unk_265224830;
    CGFloat v10 = v6;
    double v11 = v5;
    [v8 animateWithDuration:0 delay:v9 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    [(MTMaterialView *)v6 setAlpha:v5];
  }
}

uint64_t __93__AMUIOnboardingView__toggleContinueButtonOcclusionMaterialViewVisibilityIsVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (AMUIOnboardingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIOnboardingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_continueButtonOcclusionMaterialView, 0);
  objc_storeStrong((id *)&self->_containerScrollView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end