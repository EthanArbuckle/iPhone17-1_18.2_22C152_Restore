@interface FCUIOnboardingStackedNotificationView
- (FCUIOnboardingStackedNotificationView)initWithBackgroundColor:(id)a3 assetImageName:(id)a4;
- (void)_configureViewIfNecessary;
- (void)layoutSubviews;
@end

@implementation FCUIOnboardingStackedNotificationView

- (FCUIOnboardingStackedNotificationView)initWithBackgroundColor:(id)a3 assetImageName:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FCUIOnboardingStackedNotificationView;
  v7 = [(FCUIOnboardingStackedNotificationView *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_assetImageName, a4);
  }

  return v8;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)FCUIOnboardingStackedNotificationView;
  [(FCUIOnboardingStackedNotificationView *)&v20 layoutSubviews];
  [(FCUIOnboardingStackedNotificationView *)self _configureViewIfNecessary];
  v3 = [(FCUIOnboardingStackedNotificationView *)self traitCollection];
  [v3 displayScale];
  uint64_t v5 = v4;

  [(FCUIOnboardingStackedNotificationView *)self bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  CGFloat v19 = CGRectGetWidth(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v22) + -12.0;
  if (v10 <= 30.0) {
    double v11 = v10;
  }
  else {
    double v11 = 30.0;
  }
  UIRectCenteredYInRectScale();
  double v13 = v12;
  -[UIView setFrame:](self->_assetView, "setFrame:", v14 + 10.0, v5, *(void *)&v19);
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_line1TextView, "setFrame:", v13 + v15 + 20.0, v16 + 6.0);
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_line2TextView, "setFrame:", v13 + v17 + 20.0, v11 * 0.25 + v18 + 12.0);
}

- (void)_configureViewIfNecessary
{
  [(FCUIOnboardingStackedNotificationView *)self _setContinuousCornerRadius:10.0];
  backgroundMaterialView = self->_backgroundMaterialView;
  if (!backgroundMaterialView)
  {
    uint64_t v4 = [MEMORY[0x263F53FE8] materialViewWithRecipe:1 options:0];
    uint64_t v5 = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v4;

    id v6 = self->_backgroundMaterialView;
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    double v10 = [v7 stringWithFormat:@"%@.%p", v9, self];
    [(MTMaterialView *)v6 setGroupNameBase:v10];

    [(FCUIOnboardingStackedNotificationView *)self insertSubview:self->_backgroundMaterialView atIndex:0];
    double v11 = self->_backgroundMaterialView;
    [(FCUIOnboardingStackedNotificationView *)self bounds];
    -[MTMaterialView setFrame:](v11, "setFrame:");
    [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
    [(MTMaterialView *)self->_backgroundMaterialView _setContinuousCornerRadius:10.0];
    backgroundMaterialView = self->_backgroundMaterialView;
  }
  double v12 = [(MTMaterialView *)backgroundMaterialView visualStylingProviderForCategory:1];
  visualStylingProvider = self->_visualStylingProvider;
  self->_visualStylingProvider = v12;

  [(FCUIOnboardingStackedNotificationView *)self setOverrideUserInterfaceStyle:2];
  if (!self->_assetView)
  {
    if (self->_assetImageName)
    {
      double v14 = [MEMORY[0x263F82818] configurationWithPointSize:2 weight:60.0];
      double v15 = [MEMORY[0x263F827E8] systemImageNamed:self->_assetImageName withConfiguration:v14];
      double v16 = (UIView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v15];
      assetView = self->_assetView;
      self->_assetView = v16;

      double v18 = self->_assetView;
      CGFloat v19 = [MEMORY[0x263F825C8] systemLightGrayColor];
      [(UIView *)v18 setTintColor:v19];
    }
    else
    {
      objc_super v20 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      CGRect v21 = self->_assetView;
      self->_assetView = v20;

      CGRect v22 = self->_assetView;
      v23 = [MEMORY[0x263F825C8] systemLightGrayColor];
      [(UIView *)v22 setBackgroundColor:v23];

      [(UIView *)self->_assetView _setContinuousCornerRadius:10.0];
    }
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_assetView withStyle:1];
    [(FCUIOnboardingStackedNotificationView *)self addSubview:self->_assetView];
  }
  if (!self->_line1TextView)
  {
    v24 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    line1TextView = self->_line1TextView;
    self->_line1TextView = v24;

    v26 = self->_line1TextView;
    v27 = [MEMORY[0x263F825C8] systemLightGrayColor];
    [(UIView *)v26 setBackgroundColor:v27];

    [(UIView *)self->_line1TextView _setContinuousCornerRadius:3.0];
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_line1TextView withStyle:1];
    [(FCUIOnboardingStackedNotificationView *)self addSubview:self->_line1TextView];
  }
  if (!self->_line2TextView)
  {
    v28 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    line2TextView = self->_line2TextView;
    self->_line2TextView = v28;

    v30 = self->_line2TextView;
    v31 = [MEMORY[0x263F825C8] systemLightGrayColor];
    [(UIView *)v30 setBackgroundColor:v31];

    [(UIView *)self->_line2TextView _setContinuousCornerRadius:3.0];
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_line2TextView withStyle:1];
    v32 = self->_line2TextView;
    [(FCUIOnboardingStackedNotificationView *)self addSubview:v32];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2TextView, 0);
  objc_storeStrong((id *)&self->_line1TextView, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
  objc_storeStrong((id *)&self->_assetImageName, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end