@interface CAMSpotlightControlPanel
- ($F24F406B2B787EFB06265DBA3D28CBD5)_scrubberGradientEdgeInsets;
- (BOOL)isApertureSliderOpen;
- (BOOL)isApertureSliderVisible;
- (BOOL)isControlTypeOpen:(int64_t)a3;
- (BOOL)isControlTypeVisible:(int64_t)a3;
- (BOOL)isExposureSliderOpen;
- (BOOL)isExposureSliderVisible;
- (CAMExposureSlider)exposureSlider;
- (CAMSpotlightControlPanel)initWithFrame:(CGRect)a3;
- (CAMSpotlightControlPanelDelegate)delegate;
- (CEKApertureSlider)apertureSlider;
- (CGSize)intrinsicContentSize;
- (NSMutableDictionary)_openByControl;
- (UIButton)_controlIconView;
- (int64_t)orientation;
- (int64_t)spotlightControl;
- (unint64_t)_sliderFontStyle;
- (void)_apertureSliderDidChangeValue;
- (void)_applyTextOrientation:(int64_t)a3;
- (void)_configureAndInstallDiscreteSlider:(id)a3;
- (void)_exposureSliderDidChangeValue;
- (void)_handleIconViewReleased:(id)a3;
- (void)_layoutFullWidthCustomView:(id)a3;
- (void)_loadApertureSliderIfNeeded;
- (void)_loadExposureSliderIfNeeded;
- (void)_loadSliderIfNeededForControlType:(int64_t)a3;
- (void)_setControlType:(int64_t)a3 open:(BOOL)a4 animated:(BOOL)a5 notifyDelegate:(BOOL)a6;
- (void)_updateControlIcon;
- (void)_updateControlsVisibilityAnimated:(BOOL)a3;
- (void)_updateTextOrientation;
- (void)layoutSubviews;
- (void)setApertureSliderOpen:(BOOL)a3;
- (void)setApertureSliderOpen:(BOOL)a3 animated:(BOOL)a4;
- (void)setControlType:(int64_t)a3 open:(BOOL)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setExposureSliderOpen:(BOOL)a3;
- (void)setExposureSliderOpen:(BOOL)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setSpotlightControl:(int64_t)a3;
- (void)setSpotlightControl:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation CAMSpotlightControlPanel

- (CAMSpotlightControlPanel)initWithFrame:(CGRect)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)CAMSpotlightControlPanel;
  v3 = -[CAMSpotlightControlPanel initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F824E8] buttonWithType:1];
    controlIconView = v3->__controlIconView;
    v3->__controlIconView = (UIButton *)v4;

    v6 = [MEMORY[0x263F825C8] labelColor];
    [(UIButton *)v3->__controlIconView setTintColor:v6];

    [(UIButton *)v3->__controlIconView addTarget:v3 action:sel__handleIconViewReleased_ forControlEvents:64];
    [(CAMSpotlightControlPanel *)v3 addSubview:v3->__controlIconView];
    v12[0] = &unk_26BDDE538;
    v12[1] = &unk_26BDDE550;
    v13[0] = MEMORY[0x263EFFA80];
    v13[1] = MEMORY[0x263EFFA80];
    v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    uint64_t v8 = [v7 mutableCopy];
    openByControl = v3->__openByControl;
    v3->__openByControl = (NSMutableDictionary *)v8;
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(CAMSpotlightControlPanel *)self spotlightControl];
  if (v3 == 2)
  {
    uint64_t v4 = [(CAMSpotlightControlPanel *)self exposureSlider];
  }
  else
  {
    if (v3 != 3)
    {
      double v7 = *MEMORY[0x263F001B0];
      double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
      goto LABEL_7;
    }
    uint64_t v4 = [(CAMSpotlightControlPanel *)self apertureSlider];
  }
  v5 = v4;
  [v4 intrinsicContentSize];
  double v7 = v6;
  double v9 = v8;

LABEL_7:
  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  int64_t v3 = [(CAMSpotlightControlPanel *)self exposureSlider];
  [(CAMSpotlightControlPanel *)self _layoutFullWidthCustomView:v3];

  uint64_t v4 = [(CAMSpotlightControlPanel *)self apertureSlider];
  [(CAMSpotlightControlPanel *)self _layoutFullWidthCustomView:v4];

  id v24 = [(CAMSpotlightControlPanel *)self _controlIconView];
  CAMViewAlignmentSize(v24);
  CEKRectWithSize();
  double v22 = v6;
  double v23 = v5;
  double v21 = v7;
  double v9 = v8;
  [(CAMSpotlightControlPanel *)self bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v18 = [(CAMSpotlightControlPanel *)self traitCollection];
  [v18 displayScale];
  uint64_t v20 = v19;
  UIRectCenteredXInRectScale();

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  CGRectGetMaxY(v26);
  UIRectGetCenter();
  [v24 setCenter:v20];
  objc_msgSend(v24, "setBounds:", v23, v22, v21, v9);
  [(CAMSpotlightControlPanel *)self _updateControlsVisibilityAnimated:0];
}

- (void)setSpotlightControl:(int64_t)a3
{
}

- (void)setSpotlightControl:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_spotlightControl != a3)
  {
    BOOL v4 = a4;
    if (-[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:")) {
      [(CAMSpotlightControlPanel *)self _loadSliderIfNeededForControlType:a3];
    }
    self->_spotlightControl = a3;
    [(CAMSpotlightControlPanel *)self _updateControlsVisibilityAnimated:v4];
    [(CAMSpotlightControlPanel *)self _updateControlIcon];
  }
}

- (BOOL)isExposureSliderVisible
{
  return [(CAMSpotlightControlPanel *)self isControlTypeVisible:2];
}

- (BOOL)isApertureSliderVisible
{
  return [(CAMSpotlightControlPanel *)self isControlTypeVisible:3];
}

- (BOOL)isExposureSliderOpen
{
  return [(CAMSpotlightControlPanel *)self isControlTypeOpen:2];
}

- (void)setExposureSliderOpen:(BOOL)a3
{
}

- (void)setExposureSliderOpen:(BOOL)a3 animated:(BOOL)a4
{
}

- (BOOL)isApertureSliderOpen
{
  return [(CAMSpotlightControlPanel *)self isControlTypeOpen:3];
}

- (void)setApertureSliderOpen:(BOOL)a3
{
}

- (void)setApertureSliderOpen:(BOOL)a3 animated:(BOOL)a4
{
}

- (BOOL)isControlTypeVisible:(int64_t)a3
{
  if ([(CAMSpotlightControlPanel *)self spotlightControl] != a3) {
    return 0;
  }
  return [(CAMSpotlightControlPanel *)self isControlTypeOpen:a3];
}

- (BOOL)isControlTypeOpen:(int64_t)a3
{
  BOOL v4 = [(CAMSpotlightControlPanel *)self _openByControl];
  double v5 = [NSNumber numberWithInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (void)setControlType:(int64_t)a3 open:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)_setControlType:(int64_t)a3 open:(BOOL)a4 animated:(BOOL)a5 notifyDelegate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  if (-[CAMSpotlightControlPanel isControlTypeOpen:](self, "isControlTypeOpen:") != a4)
  {
    if ([(CAMSpotlightControlPanel *)self spotlightControl] == a3) {
      [(CAMSpotlightControlPanel *)self _loadSliderIfNeededForControlType:a3];
    }
    CGFloat v11 = [NSNumber numberWithBool:v8];
    double v12 = [(CAMSpotlightControlPanel *)self _openByControl];
    CGFloat v13 = [NSNumber numberWithInteger:a3];
    [v12 setObject:v11 forKeyedSubscript:v13];

    [(CAMSpotlightControlPanel *)self _updateControlsVisibilityAnimated:v7];
    if (v6)
    {
      id v14 = [(CAMSpotlightControlPanel *)self delegate];
      [v14 spotlightControlPanel:self didChangeOpenForSpotlight:a3];
    }
  }
}

- (void)_layoutFullWidthCustomView:(id)a3
{
  id v4 = a3;
  [(CAMSpotlightControlPanel *)self bounds];
  [v4 intrinsicContentSize];
  id v7 = [(CAMSpotlightControlPanel *)self traitCollection];
  [v7 displayScale];
  uint64_t v6 = v5;
  UIRectCenteredYInRectScale();
  [v4 setFrame:v6];
}

- (void)_updateControlsVisibilityAnimated:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 0.5;
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__CAMSpotlightControlPanel__updateControlsVisibilityAnimated___block_invoke;
  v4[3] = &unk_263FA0208;
  v4[4] = self;
  +[CAMView animateIfNeededWithDuration:2 usingSpringWithDamping:v4 initialSpringVelocity:0 options:v3 animations:1.0 completion:1.0];
}

void __62__CAMSpotlightControlPanel__updateControlsVisibilityAnimated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isApertureSliderVisible]) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  double v3 = [*(id *)(a1 + 32) apertureSlider];
  [v3 setAlpha:v2];

  if ([*(id *)(a1 + 32) isExposureSliderVisible]) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  uint64_t v5 = [*(id *)(a1 + 32) exposureSlider];
  [v5 setAlpha:v4];

  unint64_t v6 = [*(id *)(a1 + 32) spotlightControl];
  if (v6 - 2 < 2)
  {
    id v7 = [*(id *)(a1 + 32) _controlIconView];
    double v8 = 1.0;
  }
  else
  {
    if (v6 > 1) {
      return;
    }
    id v7 = [*(id *)(a1 + 32) _controlIconView];
    double v8 = 0.0;
  }
  id v9 = v7;
  [v7 setAlpha:v8];
}

- (void)_updateControlIcon
{
  int64_t v3 = [(CAMSpotlightControlPanel *)self spotlightControl];
  if (v3 == 3)
  {
    double v4 = @"f.cursive";
  }
  else
  {
    if (v3 != 2) {
      return;
    }
    double v4 = @"plusminus.circle";
  }
  id v7 = [MEMORY[0x263F82818] configurationWithScale:3];
  uint64_t v5 = [MEMORY[0x263F827E8] systemImageNamed:v4 withConfiguration:v7];
  unint64_t v6 = [(CAMSpotlightControlPanel *)self _controlIconView];
  [v6 setImage:v5 forState:0];

  [(CAMSpotlightControlPanel *)self setNeedsLayout];
}

- (void)_configureAndInstallDiscreteSlider:(id)a3
{
  id v4 = a3;
  [(CAMSpotlightControlPanel *)self _scrubberGradientEdgeInsets];
  objc_msgSend(v4, "setGradientInsets:");
  [v4 setTitleAlignment:2];
  objc_msgSend(v4, "setFontStyle:", -[CAMSpotlightControlPanel _sliderFontStyle](self, "_sliderFontStyle"));
  [v4 setUseTextLegibilityShadows:1];
  [v4 setUseTickMarkLegibilityShadows:1];
  [v4 setTitleText:&stru_26BD78BA0];
  [v4 setTransparentGradients];
  [(CAMSpotlightControlPanel *)self insertSubview:v4 atIndex:0];
  [(CAMSpotlightControlPanel *)self _layoutFullWidthCustomView:v4];

  [(CAMSpotlightControlPanel *)self _updateControlsVisibilityAnimated:0];
  [(CAMSpotlightControlPanel *)self _updateTextOrientation];
}

- (void)_loadSliderIfNeededForControlType:(int64_t)a3
{
  if (a3 == 3)
  {
    [(CAMSpotlightControlPanel *)self _loadApertureSliderIfNeeded];
  }
  else if (a3 == 2)
  {
    [(CAMSpotlightControlPanel *)self _loadExposureSliderIfNeeded];
  }
}

- (void)_loadApertureSliderIfNeeded
{
  if (!self->_apertureSlider)
  {
    int64_t v3 = (CEKApertureSlider *)objc_alloc_init(MEMORY[0x263F30680]);
    apertureSlider = self->_apertureSlider;
    self->_apertureSlider = v3;

    [(CAMSpotlightControlPanel *)self _configureAndInstallDiscreteSlider:self->_apertureSlider];
    [(CEKApertureSlider *)self->_apertureSlider addTarget:self action:sel__apertureSliderDidChangeValue forControlEvents:4096];
    id v5 = [(CAMSpotlightControlPanel *)self delegate];
    [v5 spotlightControlPanelDidCreateApertureSlider:self];
  }
}

- (void)_loadExposureSliderIfNeeded
{
  if (!self->_exposureSlider)
  {
    int64_t v3 = objc_alloc_init(CAMExposureSlider);
    exposureSlider = self->_exposureSlider;
    self->_exposureSlider = v3;

    [(CAMSpotlightControlPanel *)self _configureAndInstallDiscreteSlider:self->_exposureSlider];
    [(CAMExposureSlider *)self->_exposureSlider addTarget:self action:sel__exposureSliderDidChangeValue forControlEvents:4096];
    id v5 = [(CAMSpotlightControlPanel *)self delegate];
    [v5 spotlightControlPanelDidCreateExposureSlider:self];
  }
}

- (void)_handleIconViewReleased:(id)a3
{
  int64_t v4 = [(CAMSpotlightControlPanel *)self spotlightControl];
  uint64_t v5 = [(CAMSpotlightControlPanel *)self isControlTypeOpen:v4] ^ 1;
  [(CAMSpotlightControlPanel *)self _setControlType:v4 open:v5 animated:1 notifyDelegate:1];
}

- (void)_apertureSliderDidChangeValue
{
  id v3 = [(CAMSpotlightControlPanel *)self delegate];
  [v3 spotlightControlPanel:self didChangeValueForSpotlight:3];
}

- (void)_exposureSliderDidChangeValue
{
  id v3 = [(CAMSpotlightControlPanel *)self delegate];
  [v3 spotlightControlPanel:self didChangeValueForSpotlight:2];
}

- (unint64_t)_sliderFontStyle
{
  double v2 = +[CAMCaptureCapabilities capabilities];
  unint64_t v3 = [v2 sfCameraFontSupported];

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_scrubberGradientEdgeInsets
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    [(CAMSpotlightControlPanel *)self _updateTextOrientation];
    [(CAMSpotlightControlPanel *)self setNeedsLayout];
    id v7 = [(CAMSpotlightControlPanel *)self _controlIconView];
    +[CAMView rotateView:v7 toInterfaceOrientation:a3 animated:v4];
  }
}

- (void)_updateTextOrientation
{
  int64_t v3 = [(CAMSpotlightControlPanel *)self orientation];
  switch(v3)
  {
    case 1:
      uint64_t v4 = 0;
      break;
    case 3:
      uint64_t v4 = 2;
      break;
    case 4:
      uint64_t v4 = 1;
      break;
    default:
      return;
  }
  [(CAMSpotlightControlPanel *)self _applyTextOrientation:v4];
}

- (void)_applyTextOrientation:(int64_t)a3
{
  uint64_t v5 = [(CAMSpotlightControlPanel *)self apertureSlider];
  [v5 setTextOrientation:a3];

  id v6 = [(CAMSpotlightControlPanel *)self exposureSlider];
  [v6 setTextOrientation:a3];
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)spotlightControl
{
  return self->_spotlightControl;
}

- (CAMSpotlightControlPanelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSpotlightControlPanelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAMExposureSlider)exposureSlider
{
  return self->_exposureSlider;
}

- (CEKApertureSlider)apertureSlider
{
  return self->_apertureSlider;
}

- (UIButton)_controlIconView
{
  return self->__controlIconView;
}

- (NSMutableDictionary)_openByControl
{
  return self->__openByControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__openByControl, 0);
  objc_storeStrong((id *)&self->__controlIconView, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_exposureSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end