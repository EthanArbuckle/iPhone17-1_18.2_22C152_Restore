@interface MRUNowPlayingVolumeControlsView
- (BOOL)ignoreAnimationForVolumeEvents;
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (BOOL)isOnScreenForVolumeDisplay;
- (BOOL)sliderShouldAllowLongPress:(id)a3;
- (CGSize)sizeThatFits:(CGSize)result;
- (MPVolumeControllerDataSource)dataSource;
- (MRUGroupSlider)slider;
- (MRUNowPlayingVolumeControlsView)initWithFrame:(CGRect)a3;
- (MRUNowPlayingVolumeControlsViewDelegate)delegate;
- (MRUStepper)stepper;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeController)volumeController;
- (MRUVolumeGroupCoordinator)volumeGroupCoordinator;
- (NSString)volumeAudioCategory;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (double)contentScale;
- (int64_t)layout;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setContentScale:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setIgnoreAnimationForVolumeEvents:(BOOL)a3;
- (void)setLayout:(int64_t)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setSlider:(id)a3;
- (void)setStepper:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeGroupCoordinator:(id)a3;
- (void)sliderLongPressActionDidBegin:(id)a3;
- (void)sliderLongPressActionDidCancel:(id)a3;
- (void)sliderLongPressActionDidFinish:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)stepperDecrementHoldBegan:(id)a3;
- (void)stepperDecrementHoldEnded:(id)a3;
- (void)stepperDidDecrement:(id)a3;
- (void)stepperDidIncrement:(id)a3;
- (void)stepperIncrementHoldBegan:(id)a3;
- (void)stepperIncrementHoldEnded:(id)a3;
- (void)updateVisibility;
- (void)updateVisualStyling;
- (void)updateVolumeAnimated:(BOOL)a3;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MRUNowPlayingVolumeControlsView

- (MRUNowPlayingVolumeControlsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)MRUNowPlayingVolumeControlsView;
  v7 = -[MRUNowPlayingVolumeControlsView initWithFrame:](&v28, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_contentScale = 1.0;
    v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:14.0];
    v10 = [(MRUSlider *)[MRUGroupSlider alloc] initWithStyle:1];
    slider = v8->_slider;
    v8->_slider = v10;

    -[MRUSlider setHitRectInset:](v8->_slider, "setHitRectInset:", -24.0, -24.0, -24.0, -24.0);
    [(MRUSlider *)v8->_slider setExpansionFactor:1.71428571];
    [(MRUSlider *)v8->_slider setStretchLimit:12.0];
    [(MRUSlider *)v8->_slider setDelegate:v8];
    objc_initWeak(&location, v8);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __49__MRUNowPlayingVolumeControlsView_initWithFrame___block_invoke;
    v25 = &unk_1E5F0E120;
    objc_copyWeak(&v26, &location);
    [(MRUSlider *)v8->_slider setAnimations:&v22];
    v12 = +[MRUAssetsProvider volumeMin];
    v13 = [v12 imageWithConfiguration:v9];
    [(MRUGroupSlider *)v8->_slider setMinimumValueImage:v13];

    v14 = +[MRUAssetsProvider volumeMax];
    v15 = [v14 imageWithConfiguration:v9];
    [(MRUGroupSlider *)v8->_slider setMaximumValueImage:v15];

    [(MRUGroupSlider *)v8->_slider addTarget:v8 action:sel_sliderValueChanged_ forControlEvents:4096];
    [(MRUNowPlayingVolumeControlsView *)v8 addSubview:v8->_slider];
    v16 = -[MRUStepper initWithFrame:]([MRUStepper alloc], "initWithFrame:", x, y, width, height);
    stepper = v8->_stepper;
    v8->_stepper = v16;

    [(MRUStepper *)v8->_stepper setDelegate:v8];
    v18 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:14.0];
    [(MRUStepper *)v8->_stepper setPreferredSymbolConfiguration:v18];

    v19 = +[MRUAssetsProvider volumeRelativeMinus];
    [(MRUStepper *)v8->_stepper setDecrementImage:v19];

    v20 = +[MRUAssetsProvider volumeRelativePlus];
    [(MRUStepper *)v8->_stepper setIncrementImage:v20];

    [(MRUNowPlayingVolumeControlsView *)v8 addSubview:v8->_stepper];
    [(MRUNowPlayingVolumeControlsView *)v8 updateVisibility];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __49__MRUNowPlayingVolumeControlsView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVisualStyling];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v3 removeVolumeDisplay:self];

  v4.receiver = self;
  v4.super_class = (Class)MRUNowPlayingVolumeControlsView;
  [(MRUNowPlayingVolumeControlsView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)MRUNowPlayingVolumeControlsView;
  [(MRUNowPlayingVolumeControlsView *)&v24 layoutSubviews];
  [(MRUNowPlayingVolumeControlsView *)self bounds];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  double v7 = CGRectGetWidth(v25);
  double v8 = 28.0;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v26);
  if (v9 <= 28.0) {
    double v8 = v9;
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  -[MRUStepper setFrame:](self->_stepper, "setFrame:", MinX, CGRectGetMaxY(v28) - v8, v7, v8);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRectGetMinX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRectGetWidth(v30);
  v11 = [(MRUNowPlayingVolumeControlsView *)self traitCollection];
  [v11 displayScale];
  uint64_t v23 = v12;
  UIRectCenteredYInRectScale();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[MRUGroupSlider setFrame:](self->_slider, "setFrame:", v14, v16, v18, v20, v23);
  v31.origin.CGFloat x = v14;
  v31.origin.CGFloat y = v16;
  v31.size.CGFloat width = v18;
  v31.size.CGFloat height = v20;
  CGFloat v21 = -CGRectGetMinX(v31);
  v32.origin.CGFloat x = v14;
  v32.origin.CGFloat y = v16;
  v32.size.CGFloat width = v18;
  v32.size.CGFloat height = v20;
  double MaxX = CGRectGetMaxX(v32);
  [(MRUNowPlayingVolumeControlsView *)self bounds];
  -[MRUSlider setHitRectInset:](self->_slider, "setHitRectInset:", -24.0, v21, -24.0, MaxX - CGRectGetWidth(v33));
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->_layout == 1) {
    v3 = &MRUNowPlayingControlHeightCompact;
  }
  else {
    v3 = &MRUNowPlayingControlHeight;
  }
  double v4 = *(double *)v3 * self->_contentScale;
  result.CGFloat height = v4;
  return result;
}

- (void)setVolumeController:(id)a3
{
  double v4 = (MRUVolumeController *)a3;
  [(MRUVolumeController *)self->_volumeController setDelegate:0];
  volumeController = self->_volumeController;
  self->_volumeController = v4;
  v6 = v4;

  [(MRUVolumeController *)self->_volumeController setDelegate:self];
  self->_ignoreAnimationForVolumeEvents = 1;
  [(MRUNowPlayingVolumeControlsView *)self updateVolumeAnimated:0];

  [(MRUNowPlayingVolumeControlsView *)self updateVisibility];
}

- (MPVolumeControllerDataSource)dataSource
{
  return [(MPVolumeController *)self->_volumeController dataSource];
}

- (void)setDataSource:(id)a3
{
  self->_ignoreAnimationForVolumeEvents = 1;
  [(MPVolumeController *)self->_volumeController setDataSource:a3];
}

- (void)setStylingProvider:(id)a3
{
  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  double v7 = v5;
  if (stylingProvider != v5)
  {
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUNowPlayingVolumeControlsView *)self updateVisualStyling];
    [(MRUSlider *)self->_slider setStylingProvider:v7];
    [(MRUStepper *)self->_stepper setStylingProvider:v7];
  }
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    BOOL v3 = a3;
    self->_onScreen = a3;
    v5 = [MEMORY[0x1E4F31A90] sharedInstance];
    v6 = v5;
    if (v3) {
      [v5 addVolumeDisplay:self];
    }
    else {
      [v5 removeVolumeDisplay:self];
    }

    [(MRUNowPlayingVolumeControlsView *)self updateVolumeAnimated:0];
  }
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUSlider setDimmed:](self->_slider, "setDimmed:");
    [(MRUStepper *)self->_stepper setDimmed:self->_dimmed];
    [(MRUNowPlayingVolumeControlsView *)self updateVisualStyling];
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    [(MRUNowPlayingVolumeControlsView *)self updateVisibility];
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    [(MRUNowPlayingVolumeControlsView *)self setNeedsLayout];
  }
}

- (void)sliderValueChanged:(id)a3
{
  volumeController = self->_volumeController;
  [a3 value];

  -[MPVolumeController setVolume:withNotificationDelay:](volumeController, "setVolume:withNotificationDelay:");
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  if (([(MRUGroupSlider *)self->_slider isTracking] & 1) == 0)
  {
    [(MRUNowPlayingVolumeControlsView *)self updateVolumeAnimated:[(MRUNowPlayingVolumeControlsView *)self isOnScreen]];
    v6 = [(MRUNowPlayingVolumeControlsView *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v9 = [(MRUNowPlayingVolumeControlsView *)self delegate];
      *(float *)&double v8 = a4;
      [v9 volumeControlsView:self volumeValueDidChange:v8];
    }
  }
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  BOOL v5 = [(MRUNowPlayingVolumeControlsView *)self isOnScreen];

  [(MRUNowPlayingVolumeControlsView *)self updateVolumeAnimated:v5];
}

- (void)volumeController:(id)a3 volumeControlCapabilitiesDidChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = [(MRUNowPlayingVolumeControlsView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(MRUNowPlayingVolumeControlsView *)self delegate];
    [v8 volumeControlsView:self volumeCapabiltiesDidChange:v4];
  }

  [(MRUNowPlayingVolumeControlsView *)self updateVisibility];
}

- (BOOL)sliderShouldAllowLongPress:(id)a3
{
  return [(MRUVolumeGroupCoordinator *)self->_volumeGroupCoordinator shouldAllowEqualization];
}

- (void)sliderLongPressActionDidBegin:(id)a3
{
}

- (void)sliderLongPressActionDidCancel:(id)a3
{
}

- (void)sliderLongPressActionDidFinish:(id)a3
{
  [(MRUVolumeGroupCoordinator *)self->_volumeGroupCoordinator equalizeVolumes];
  volumeGroupCoordinator = self->_volumeGroupCoordinator;

  [(MRUVolumeGroupCoordinator *)volumeGroupCoordinator finishEqualization];
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return self->_onScreen;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  v2 = [(MRUNowPlayingVolumeControlsView *)self window];
  BOOL v3 = [v2 windowScene];

  return (UIWindowScene *)v3;
}

- (NSString)volumeAudioCategory
{
  v2 = [(MPVolumeController *)self->_volumeController volumeAudioCategory];
  BOOL v3 = v2;
  if (!v2) {
    v2 = @"Audio/Video";
  }
  uint64_t v4 = v2;

  return v4;
}

- (void)stepperDidDecrement:(id)a3
{
}

- (void)stepperDidIncrement:(id)a3
{
}

- (void)stepperDecrementHoldBegan:(id)a3
{
}

- (void)stepperDecrementHoldEnded:(id)a3
{
}

- (void)stepperIncrementHoldBegan:(id)a3
{
}

- (void)stepperIncrementHoldEnded:(id)a3
{
}

- (void)updateVolumeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MPVolumeController *)self->_volumeController isVolumeControlAvailable];
  [(MRUVolumeController *)self->_volumeController volumeValue];
  float v7 = v6;
  [(MRUGroupSlider *)self->_slider value];
  *(float *)&double v8 = *(float *)&v8 - v7;
  if (*(float *)&v8 < 0.0) {
    *(float *)&double v8 = -*(float *)&v8;
  }
  BOOL v9 = !self->_ignoreAnimationForVolumeEvents && v3;
  if (self->_ignoreAnimationForVolumeEvents && *(float *)&v8 > 0.00000011921)
  {
    BOOL v9 = 0;
    self->_ignoreAnimationForVolumeEvents = 0;
  }
  if (*(float *)&v8 > 0.00000011921)
  {
    *(float *)&double v8 = v7;
    [(MRUGroupSlider *)self->_slider setValue:v9 animated:v8];
  }
  BOOL v10 = self->_onScreen && v5;
  slider = self->_slider;

  [(MRUGroupSlider *)slider setEnabled:v10];
}

- (void)updateVisibility
{
  char v3 = [(MPVolumeController *)self->_volumeController volumeCapabilities];
  BOOL v4 = (v3 & 5) == 0;
  [(MRUGroupSlider *)self->_slider setHidden:(v3 & 5) != 0];
  [(MRUStepper *)self->_stepper setHidden:v4];
  id v5 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v5 setNeedsUpdate];
}

- (void)updateVisualStyling
{
  if ([(MRUGroupSlider *)self->_slider isTracking])
  {
    stylingProvider = self->_stylingProvider;
    uint64_t v4 = 0;
  }
  else
  {
    stylingProvider = self->_stylingProvider;
    if (self->_dimmed) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  id v5 = [(MRUVisualStylingProvider *)stylingProvider blendColorForStyle:v4];
  [(MRUGroupSlider *)self->_slider setTintColor:v5];
}

- (MRUNowPlayingVolumeControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUNowPlayingVolumeControlsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUVolumeController)volumeController
{
  return self->_volumeController;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (void)setVolumeGroupCoordinator:(id)a3
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (MRUGroupSlider)slider
{
  return self->_slider;
}

- (void)setSlider:(id)a3
{
}

- (MRUStepper)stepper
{
  return self->_stepper;
}

- (void)setStepper:(id)a3
{
}

- (BOOL)ignoreAnimationForVolumeEvents
{
  return self->_ignoreAnimationForVolumeEvents;
}

- (void)setIgnoreAnimationForVolumeEvents:(BOOL)a3
{
  self->_ignoreAnimationForVolumeEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepper, 0);
  objc_storeStrong((id *)&self->_slider, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end