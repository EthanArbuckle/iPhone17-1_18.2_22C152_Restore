@interface MRUVolumeView
- (BOOL)isExpanded;
- (BOOL)isGroupRenderingRequired;
- (BOOL)primaryInteractionEnabled;
- (BOOL)secondaryInteractionEnabled;
- (BOOL)showEnvironmentSlider;
- (BOOL)showSecondarySlider;
- (BOOL)showSpatialAudioModeButton;
- (BOOL)showStepper;
- (CCUIContinuousSliderView)environmentSlider;
- (MRUContinuousSliderView)primarySlider;
- (MRUContinuousSliderView)secondarySlider;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeStepperView)stepper;
- (MRUVolumeView)initWithFrame:(CGRect)a3;
- (NSArray)punchOutRenderingViews;
- (double)compactContinuousCornerRadius;
- (void)layoutSubviews;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setPrimaryInteractionEnabled:(BOOL)a3;
- (void)setSecondaryInteractionEnabled:(BOOL)a3;
- (void)setShowEnvironmentSlider:(BOOL)a3;
- (void)setShowSecondarySlider:(BOOL)a3;
- (void)setShowSpatialAudioModeButton:(BOOL)a3;
- (void)setShowStepper:(BOOL)a3;
- (void)updateSymbolConfiguration;
- (void)updateVisibility;
@end

@implementation MRUVolumeView

- (BOOL)showStepper
{
  return self->_showStepper;
}

- (BOOL)showSpatialAudioModeButton
{
  return self->_showSpatialAudioModeButton;
}

- (BOOL)showSecondarySlider
{
  return self->_showSecondarySlider;
}

- (BOOL)showEnvironmentSlider
{
  return self->_showEnvironmentSlider;
}

- (MRUVolumeView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)MRUVolumeView;
  v3 = -[MRUVolumeView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MRUContinuousSliderView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[CCUIContinuousSliderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    primarySlider = v3->_primarySlider;
    v3->_primarySlider = (MRUContinuousSliderView *)v9;

    [(MRUContinuousSliderView *)v3->_primarySlider setGlyphScale:MRUVolumeSliderGlyphScale()];
    [(CCUIBaseSliderView *)v3->_primarySlider setName:@"MRUVolumeIdentifierPrimaryMultiCategoryVolumeSlider"];
    [(CCUIBaseSliderView *)v3->_primarySlider setShouldIncludeVolumeButtonsInput:+[MRUFeatureFlagProvider isVolumeInputControlCenterEnabled]];
    [(CCUIBaseSliderView *)v3->_primarySlider setInteractiveWhenUnexpanded:1];
    [(MRUContinuousSliderView *)v3->_primarySlider setAccessibilityIdentifier:@"cc-volume-slider"];
    [(MRUVolumeView *)v3 addSubview:v3->_primarySlider];
    v11 = -[CCUIContinuousSliderView initWithFrame:]([MRUContinuousSliderView alloc], "initWithFrame:", v5, v6, v7, v8);
    secondarySlider = v3->_secondarySlider;
    v3->_secondarySlider = v11;

    [(MRUContinuousSliderView *)v3->_secondarySlider setAccessibilityIdentifier:@"cc-secondary-volume-slider"];
    [(MRUVolumeView *)v3 addSubview:v3->_secondarySlider];
    v13 = (CCUIContinuousSliderView *)objc_alloc_init(MEMORY[0x1E4F5AE00]);
    environmentSlider = v3->_environmentSlider;
    v3->_environmentSlider = v13;

    [(MRUVolumeView *)v3 addSubview:v3->_environmentSlider];
    v15 = -[MRUVolumeStepperView initWithFrame:]([MRUVolumeStepperView alloc], "initWithFrame:", v5, v6, v7, v8);
    stepper = v3->_stepper;
    v3->_stepper = v15;

    [(MRUVolumeStepperView *)v3->_stepper setAccessibilityIdentifier:@"cc-volume-stepper"];
    [(MRUVolumeView *)v3 addSubview:v3->_stepper];
    v17 = [(MRUContinuousSliderView *)v3->_primarySlider materialView];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v19 = [(MRUContinuousSliderView *)v3->_primarySlider materialView];
      v20 = [v19 visualStylingProviderForCategory:1];

      v21 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v20];
      stylingProvider = v3->_stylingProvider;
      v3->_stylingProvider = v21;
    }
    [(MRUVolumeView *)v3 updateSymbolConfiguration];
    [(MRUVolumeView *)v3 updateVisibility];
  }
  return v3;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)MRUVolumeView;
  [(MRUVolumeView *)&v27 layoutSubviews];
  [(MRUVolumeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = CCUISliderExpandedContentModuleWidth();
  double v13 = v12;
  double v14 = MRUDefaultExpandedWidth(v11);
  if (self->_expanded)
  {
    if (!MRULayoutShouldBeVertical() && self->_showSpatialAudioModeButton && self->_showSecondarySlider)
    {
      MRUExpandedContentInsets();
      MRUHortizonalScreenInset(self);
      UIRectInset();
      CGRectGetWidth(v28);
    }
    else
    {
      v29.origin.CGFloat x = v4;
      v29.origin.CGFloat y = v6;
      v29.size.CGFloat width = v8;
      v29.size.CGFloat height = v10;
      CGRectGetWidth(v29);
    }
    UIRectInset();
    CGFloat x = v30.origin.x;
    CGFloat y = v30.origin.y;
    CGFloat width = v30.size.width;
    CGFloat height = v30.size.height;
    CGRectGetHeight(v30);
    double v6 = 0.0;
    UIRectCenteredRect();
    -[MRUVolumeStepperView setFrame:](self->_stepper, "setFrame:");
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double v20 = CGRectGetHeight(v32);
    if (self->_showSecondarySlider || self->_showEnvironmentSlider)
    {
      double v21 = v13;
      double v22 = 0.0;
    }
    else
    {
      UIRectCenteredRect();
      double MinX = v26;
    }
    -[MRUContinuousSliderView setFrame:](self->_primarySlider, "setFrame:", MinX, v22, v21, v20);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v23 = CGRectGetMaxX(v33) - v13;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double v10 = CGRectGetHeight(v34);
    -[MRUContinuousSliderView setFrame:](self->_secondarySlider, "setFrame:", v23, 0.0, v13, v10);
  }
  else
  {
    -[MRUVolumeStepperView setFrame:](self->_stepper, "setFrame:", v4, v6, v8, v10);
    -[MRUContinuousSliderView setFrame:](self->_primarySlider, "setFrame:", v4, v6, v8, v10);
    double v24 = v14 + v13 * -2.0;
    v35.origin.CGFloat x = v4;
    v35.origin.CGFloat y = v6;
    v35.size.CGFloat width = v8;
    v35.size.CGFloat height = v10;
    CGFloat v25 = CGRectGetWidth(v35) / v13;
    v36.origin.CGFloat x = v4;
    v36.origin.CGFloat y = v6;
    v36.size.CGFloat width = v8;
    v36.size.CGFloat height = v10;
    double v23 = CGRectGetWidth(v36) + v24 * v25;
    -[MRUContinuousSliderView setFrame:](self->_secondarySlider, "setFrame:", v23, v6, v8, v10);
    double v13 = v8;
  }
  -[CCUIContinuousSliderView setFrame:](self->_environmentSlider, "setFrame:", v23, v6, v13, v10);
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    [(MRUVolumeView *)self updateSymbolConfiguration];
    [(MRUVolumeView *)self updateVisibility];
    [(MRUVolumeView *)self setNeedsLayout];
  }
}

- (void)setShowSecondarySlider:(BOOL)a3
{
  if (self->_showSecondarySlider != a3)
  {
    self->_showSecondarySlider = a3;
    [(MRUVolumeView *)self updateVisibility];
    [(MRUVolumeView *)self setNeedsLayout];
  }
}

- (void)setShowEnvironmentSlider:(BOOL)a3
{
  if (self->_showEnvironmentSlider != a3)
  {
    self->_showEnvironmentSlider = a3;
    [(MRUVolumeView *)self updateVisibility];
    [(MRUVolumeView *)self setNeedsLayout];
  }
}

- (void)setShowStepper:(BOOL)a3
{
  if (self->_showStepper != a3)
  {
    self->_showStepper = a3;
    [(MRUVolumeView *)self updateVisibility];
    [(MRUVolumeView *)self setNeedsLayout];
  }
}

- (void)setShowSpatialAudioModeButton:(BOOL)a3
{
  if (self->_showSpatialAudioModeButton != a3)
  {
    self->_showSpatialAudioModeButton = a3;
    [(MRUVolumeView *)self setNeedsLayout];
  }
}

- (void)setPrimaryInteractionEnabled:(BOOL)a3
{
  if (self->_primaryInteractionEnabled != a3)
  {
    self->_primaryInteractionEnabled = a3;
    [(MRUVolumeView *)self updateVisibility];
  }
}

- (void)setSecondaryInteractionEnabled:(BOOL)a3
{
  if (self->_secondaryInteractionEnabled != a3)
  {
    self->_secondaryInteractionEnabled = a3;
    [(MRUVolumeView *)self updateVisibility];
  }
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    [(MRUVolumeView *)self updateVisibility];
  }
}

- (BOOL)isGroupRenderingRequired
{
  if (self->_showStepper) {
    return 0;
  }
  if ([(CCUIBaseSliderView *)self->_primarySlider isGroupRenderingRequired]) {
    return 1;
  }
  secondarySlider = self->_secondarySlider;

  return [(CCUIBaseSliderView *)secondarySlider isGroupRenderingRequired];
}

- (NSArray)punchOutRenderingViews
{
  double v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  double v4 = [(CCUIBaseSliderView *)self->_primarySlider punchOutRenderingViews];
  [v3 addObjectsFromArray:v4];

  double v5 = [(CCUIBaseSliderView *)self->_secondarySlider punchOutRenderingViews];
  [v3 addObjectsFromArray:v5];

  double v6 = (void *)[v3 copy];

  return (NSArray *)v6;
}

- (void)updateSymbolConfiguration
{
  double v3 = 35.0;
  if (!self->_expanded) {
    double v3 = 25.0;
  }
  id v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:2 scale:v3];
  [(MRUContinuousSliderView *)self->_primarySlider setImageSymbolConfiguration:v6];
  double v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hearingdevice.ear"];
  double v5 = [v4 imageByApplyingSymbolConfiguration:v6];
  [(CCUIContinuousSliderView *)self->_environmentSlider setGlyphImage:v5];
}

- (void)updateVisibility
{
  BOOL showStepper = self->_showStepper;
  stepper = self->_stepper;
  if (showStepper)
  {
    [(MRUVolumeStepperView *)stepper setAlpha:1.0];
    [(MRUContinuousSliderView *)self->_primarySlider setAlpha:0.0];
    [(MRUContinuousSliderView *)self->_secondarySlider setAlpha:0.0];
  }
  else
  {
    [(MRUVolumeStepperView *)stepper setAlpha:0.0];
    BOOL v5 = !self->_expanded || self->_showEnvironmentSlider;
    [(CCUIBaseSliderView *)self->_primarySlider setGlyphVisible:v5];
    double v6 = 1.0;
    if (!self->_primaryInteractionEnabled)
    {
      double v6 = 0.5;
      if (!self->_expanded) {
        double v6 = 1.0;
      }
    }
    [(MRUContinuousSliderView *)self->_primarySlider setAlpha:v6];
    if (self->_expanded && self->_showSecondarySlider)
    {
      if (self->_secondaryInteractionEnabled)
      {
        secondarySlider = self->_secondarySlider;
        double v8 = 1.0;
      }
      else
      {
        double v8 = 0.5;
        secondarySlider = self->_secondarySlider;
      }
      [(MRUContinuousSliderView *)secondarySlider setAlpha:v8];
    }
    else
    {
      [(MRUContinuousSliderView *)self->_secondarySlider setAlpha:0.0];
    }
  }
  if (self->_expanded)
  {
    double v9 = 1.0;
    if (!self->_showEnvironmentSlider) {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }
  [(CCUIContinuousSliderView *)self->_environmentSlider setAlpha:v9];
  if (self->_expanded)
  {
    CCUISliderExpandedModuleContinuousCornerRadius();
    double compactContinuousCornerRadius = v10;
  }
  else
  {
    double compactContinuousCornerRadius = self->_compactContinuousCornerRadius;
  }
  [(CCUIContinuousSliderView *)self->_primarySlider setContinuousSliderCornerRadius:compactContinuousCornerRadius];
  [(CCUIContinuousSliderView *)self->_secondarySlider setContinuousSliderCornerRadius:compactContinuousCornerRadius];
  [(CCUIContinuousSliderView *)self->_environmentSlider setContinuousSliderCornerRadius:compactContinuousCornerRadius];
  double v12 = self->_stepper;

  [(MRUVolumeStepperView *)v12 setContinuousButtonCornerRadius:compactContinuousCornerRadius];
}

- (MRUContinuousSliderView)primarySlider
{
  return self->_primarySlider;
}

- (MRUContinuousSliderView)secondarySlider
{
  return self->_secondarySlider;
}

- (CCUIContinuousSliderView)environmentSlider
{
  return self->_environmentSlider;
}

- (MRUVolumeStepperView)stepper
{
  return self->_stepper;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)primaryInteractionEnabled
{
  return self->_primaryInteractionEnabled;
}

- (BOOL)secondaryInteractionEnabled
{
  return self->_secondaryInteractionEnabled;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_environmentSlider, 0);
  objc_storeStrong((id *)&self->_secondarySlider, 0);

  objc_storeStrong((id *)&self->_primarySlider, 0);
}

@end