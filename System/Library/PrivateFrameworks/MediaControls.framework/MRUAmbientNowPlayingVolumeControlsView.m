@interface MRUAmbientNowPlayingVolumeControlsView
- (BOOL)ignoreAnimationForVolumeEvents;
- (BOOL)isOnScreen;
- (BOOL)isOnScreenForVolumeDisplay;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)sliderExpanded;
- (CGRect)hitRect;
- (CGSize)intrinsicContentSize;
- (MPVolumeControllerDataSource)dataSource;
- (MRUAmbientNowPlayingVolumeControlsView)initWithFrame:(CGRect)a3;
- (MRUCAPackageView)packageView;
- (MRUSlider)slider;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeController)volumeController;
- (MSVTimer)idleTimer;
- (NSString)volumeAudioCategory;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (double)sliderExpansionFactor;
- (double)sliderValueOnPanBegin;
- (id)_packageStateForVolume:(float)a3;
- (void)createConstraints;
- (void)dealloc;
- (void)invalidateIdleTimer;
- (void)resetIdleTimer;
- (void)setDataSource:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setIgnoreAnimationForVolumeEvents:(BOOL)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setPackageView:(id)a3;
- (void)setSliderExpanded:(BOOL)a3;
- (void)setSliderExpansionFactor:(double)a3;
- (void)setSliderValueOnPanBegin:(double)a3;
- (void)setStylingProvider:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)sliderTouchDown:(id)a3;
- (void)sliderTouchUp:(id)a3;
- (void)sliderValueChanged:(id)a3;
- (void)updatePackageWithValue:(float)a3;
- (void)updateVisibility;
- (void)updateVolumeAnimated:(BOOL)a3;
- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4;
- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MRUAmbientNowPlayingVolumeControlsView

- (MRUAmbientNowPlayingVolumeControlsView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MRUAmbientNowPlayingVolumeControlsView;
  v3 = -[MRUAmbientNowPlayingVolumeControlsView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[MRUSlider alloc] initWithStyle:1];
    slider = v3->_slider;
    v3->_slider = v4;

    [(MRUSlider *)v3->_slider setExpansionFactor:1.78571429];
    -[MRUSlider setHitRectInset:](v3->_slider, "setHitRectInset:", -24.0, -24.0, -24.0, 0.0);
    [(MRUSlider *)v3->_slider addTarget:v3 action:sel_sliderTouchUp_ forControlEvents:64];
    [(MRUSlider *)v3->_slider addTarget:v3 action:sel_sliderTouchDown_ forControlEvents:1];
    [(MRUSlider *)v3->_slider addTarget:v3 action:sel_sliderValueChanged_ forControlEvents:4096];
    [(MRUAmbientNowPlayingVolumeControlsView *)v3 addSubview:v3->_slider];
    v6 = objc_alloc_init(MRUCAPackageView);
    packageView = v3->_packageView;
    v3->_packageView = v6;

    v8 = [(MRUAmbientNowPlayingVolumeControlsView *)v3 traitCollection];
    uint64_t v9 = [v8 layoutDirection];

    memset(&v19, 0, sizeof(v19));
    if (v9 == 1)
    {
      CATransform3DMakeScale(&v19, -1.0, 1.0, 1.0);
    }
    else
    {
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v19.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v19.m33 = v10;
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v19.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v19.m43 = v11;
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v19.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v19.m13 = v12;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v19.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v19.m23 = v13;
    }
    v14 = +[MRUAssetsProvider volumeBoldPackageName];
    CATransform3D v18 = v19;
    v15 = +[MRUCAPackageAsset packageNamed:v14 glyphState:0 permanentTransform:&v18];
    [(MRUCAPackageView *)v3->_packageView setAsset:v15];

    [(MRUCAPackageView *)v3->_packageView setScale:1.25];
    [(MRUSlider *)v3->_slider setMaximumValueView:v3->_packageView];
    v3->_sliderExpanded = 0;
    v3->_ignoreAnimationForVolumeEvents = 1;
    [(MRUAmbientNowPlayingVolumeControlsView *)v3 createConstraints];
    [(MRUAmbientNowPlayingVolumeControlsView *)v3 updateVisibility];
    v16 = [MEMORY[0x1E4F31A90] sharedInstance];
    [v16 addVolumeDisplay:v3];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v3 removeVolumeDisplay:self];

  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientNowPlayingVolumeControlsView;
  [(MRUAmbientNowPlayingVolumeControlsView *)&v4 dealloc];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 32.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (void)createConstraints
{
  v16[4] = *MEMORY[0x1E4F143B8];
  [(MRUSlider *)self->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v13 = (void *)MEMORY[0x1E4F28DC8];
  v15 = [(MRUSlider *)self->_slider leadingAnchor];
  v14 = [(MRUAmbientNowPlayingVolumeControlsView *)self leadingAnchor];
  double v3 = [v15 constraintEqualToAnchor:v14];
  v16[0] = v3;
  objc_super v4 = [(MRUSlider *)self->_slider trailingAnchor];
  v5 = [(MRUAmbientNowPlayingVolumeControlsView *)self trailingAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  v16[1] = v6;
  v7 = [(MRUSlider *)self->_slider centerYAnchor];
  v8 = [(MRUAmbientNowPlayingVolumeControlsView *)self centerYAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  v16[2] = v9;
  long long v10 = [(MRUSlider *)self->_slider heightAnchor];
  long long v11 = [v10 constraintEqualToConstant:14.0];
  v16[3] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  [v13 activateConstraints:v12];
}

- (CGRect)hitRect
{
  v10.receiver = self;
  v10.super_class = (Class)MRUAmbientNowPlayingVolumeControlsView;
  [(MRUAmbientNowPlayingVolumeControlsView *)&v10 hitRect];
  double v3 = v2 + -24.0;
  double v5 = v4 + -24.0;
  double v7 = v6 - (-24.0 + 0.0);
  double v9 = v8 - (-24.0 + -24.0);
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v5;
  result.origin.x = v3;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MRUAmbientNowPlayingVolumeControlsView *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)setSliderExpanded:(BOOL)a3
{
  if (self->_sliderExpanded != a3)
  {
    self->_sliderExpanded = a3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__MRUAmbientNowPlayingVolumeControlsView_setSliderExpanded___block_invoke;
    v4[3] = &unk_1E5F0D7F8;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithSpringDuration:4 bounce:v4 initialSpringVelocity:0 delay:0.25 options:0.25 animations:0.0 completion:0.0];
    [(MRUAmbientNowPlayingVolumeControlsView *)self resetIdleTimer];
  }
}

uint64_t __60__MRUAmbientNowPlayingVolumeControlsView_setSliderExpanded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

- (void)setVolumeController:(id)a3
{
  double v4 = (MRUVolumeController *)a3;
  [(MRUVolumeController *)self->_volumeController setDelegate:0];
  volumeController = self->_volumeController;
  self->_volumeController = v4;
  uint64_t v6 = v4;

  [(MRUVolumeController *)self->_volumeController setDelegate:self];
  self->_ignoreAnimationForVolumeEvents = 1;
  [(MRUAmbientNowPlayingVolumeControlsView *)self updateVolumeAnimated:0];

  [(MRUAmbientNowPlayingVolumeControlsView *)self updateVisibility];
}

- (MPVolumeControllerDataSource)dataSource
{
  return [(MPVolumeController *)self->_volumeController dataSource];
}

- (void)setDataSource:(id)a3
{
  [(MPVolumeController *)self->_volumeController setDataSource:a3];
  BOOL onScreen = self->_onScreen;

  [(MRUAmbientNowPlayingVolumeControlsView *)self updateVolumeAnimated:onScreen];
}

- (void)setStylingProvider:(id)a3
{
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_BOOL onScreen = a3;
    [(MRUAmbientNowPlayingVolumeControlsView *)self updateVolumeAnimated:0];
    id v3 = [MEMORY[0x1E4F31A90] sharedInstance];
    [v3 setNeedsUpdate];
  }
}

- (void)volumeController:(id)a3 volumeValueDidChange:(float)a4
{
  id v5 = a3;
  if (([(MRUSlider *)self->_slider isTracking] & 1) == 0) {
    [(MRUAmbientNowPlayingVolumeControlsView *)self updateVolumeAnimated:[(MRUAmbientNowPlayingVolumeControlsView *)self isOnScreen]];
  }
  if ([v5 isVolumeControlAvailable])
  {
    if (self->_sliderExpanded && self->_idleTimer) {
      [(MRUAmbientNowPlayingVolumeControlsView *)self resetIdleTimer];
    }
  }
  else
  {
    [(MRUAmbientNowPlayingVolumeControlsView *)self setSliderExpanded:0];
  }
}

- (void)volumeController:(id)a3 volumeControlAvailableDidChange:(BOOL)a4
{
  BOOL v5 = [(MRUAmbientNowPlayingVolumeControlsView *)self isOnScreen];

  [(MRUAmbientNowPlayingVolumeControlsView *)self updateVolumeAnimated:v5];
}

- (BOOL)isOnScreenForVolumeDisplay
{
  return self->_onScreen;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  double v2 = [(MRUAmbientNowPlayingVolumeControlsView *)self window];
  id v3 = [v2 windowScene];

  return (UIWindowScene *)v3;
}

- (NSString)volumeAudioCategory
{
  double v2 = [(MPVolumeController *)self->_volumeController volumeAudioCategory];
  id v3 = v2;
  if (!v2) {
    double v2 = @"Audio/Video";
  }
  double v4 = v2;

  return v4;
}

- (void)updateVolumeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MPVolumeController *)self->_volumeController isVolumeControlAvailable];
  [(MRUVolumeController *)self->_volumeController volumeValue];
  float v7 = v6;
  [(MRUSlider *)self->_slider value];
  *(float *)&double v8 = *(float *)&v8 - v7;
  if (*(float *)&v8 < 0.0) {
    *(float *)&double v8 = -*(float *)&v8;
  }
  BOOL v9 = v3 && !self->_ignoreAnimationForVolumeEvents;
  if (*(float *)&v8 > 0.00000011921)
  {
    *(float *)&double v8 = v7;
    [(MRUSlider *)self->_slider setValue:v9 animated:v8];
    if (self->_ignoreAnimationForVolumeEvents) {
      self->_ignoreAnimationForVolumeEvents = 0;
    }
    else {
      [(MRUAmbientNowPlayingVolumeControlsView *)self setSliderExpanded:[(MPVolumeController *)self->_volumeController isVolumeControlAvailable]];
    }
  }
  BOOL v10 = self->_onScreen && v5;
  [(MRUAmbientNowPlayingVolumeControlsView *)self setUserInteractionEnabled:v10];
  *(float *)&double v11 = v7;

  [(MRUAmbientNowPlayingVolumeControlsView *)self updatePackageWithValue:v11];
}

- (void)updatePackageWithValue:(float)a3
{
  -[MRUAmbientNowPlayingVolumeControlsView _packageStateForVolume:](self, "_packageStateForVolume:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = [(MRUCAPackageView *)self->_packageView glyphState];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(MRUCAPackageView *)self->_packageView setGlyphState:v6];
  }
}

- (void)updateVisibility
{
  uint64_t v3 = [(MRUAmbientNowPlayingVolumeControlsView *)self sliderExpanded] ^ 1;
  slider = self->_slider;

  [(MRUSlider *)slider setFluidTrackHidden:v3];
}

- (void)invalidateIdleTimer
{
  [(MSVTimer *)self->_idleTimer invalidate];
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;
}

- (void)resetIdleTimer
{
  [(MRUAmbientNowPlayingVolumeControlsView *)self invalidateIdleTimer];
  if (self->_sliderExpanded && ([(MRUSlider *)self->_slider isTracking] & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__MRUAmbientNowPlayingVolumeControlsView_resetIdleTimer__block_invoke;
    v5[3] = &unk_1E5F0D7F8;
    v5[4] = self;
    uint64_t v3 = [MEMORY[0x1E4F77A30] timerWithInterval:0 repeats:v5 block:5.0];
    idleTimer = self->_idleTimer;
    self->_idleTimer = v3;
  }
}

uint64_t __56__MRUAmbientNowPlayingVolumeControlsView_resetIdleTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSliderExpanded:0];
}

- (void)sliderTouchDown:(id)a3
{
  [(MRUAmbientNowPlayingVolumeControlsView *)self setSliderExpanded:1];

  [(MRUAmbientNowPlayingVolumeControlsView *)self invalidateIdleTimer];
}

- (void)sliderValueChanged:(id)a3
{
  volumeController = self->_volumeController;
  id v5 = a3;
  [v5 value];
  -[MPVolumeController setVolume:withNotificationDelay:](volumeController, "setVolume:withNotificationDelay:");
  [v5 value];
  int v7 = v6;

  LODWORD(v8) = v7;

  [(MRUAmbientNowPlayingVolumeControlsView *)self updatePackageWithValue:v8];
}

- (void)sliderTouchUp:(id)a3
{
  volumeController = self->_volumeController;
  [a3 value];
  -[MPVolumeController setVolume:withNotificationDelay:](volumeController, "setVolume:withNotificationDelay:");

  [(MRUAmbientNowPlayingVolumeControlsView *)self resetIdleTimer];
}

- (id)_packageStateForVolume:(float)a3
{
  if ([(MPVolumeController *)self->_volumeController isVolumeControlAvailable])
  {
    *(float *)&double v4 = a3;
    id v5 = +[MRUSystemVolumeController packageStateForVolumeValue:v4];
  }
  else
  {
    id v5 = @"off";
  }

  return v5;
}

- (MRUSlider)slider
{
  return self->_slider;
}

- (MRUVolumeController)volumeController
{
  return self->_volumeController;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (double)sliderExpansionFactor
{
  return self->_sliderExpansionFactor;
}

- (void)setSliderExpansionFactor:(double)a3
{
  self->_sliderExpansionFactor = a3;
}

- (MRUCAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
}

- (double)sliderValueOnPanBegin
{
  return self->_sliderValueOnPanBegin;
}

- (void)setSliderValueOnPanBegin:(double)a3
{
  self->_sliderValueOnPanBegin = a3;
}

- (BOOL)sliderExpanded
{
  return self->_sliderExpanded;
}

- (BOOL)ignoreAnimationForVolumeEvents
{
  return self->_ignoreAnimationForVolumeEvents;
}

- (void)setIgnoreAnimationForVolumeEvents:(BOOL)a3
{
  self->_ignoreAnimationForVolumeEvents = a3;
}

- (MSVTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);

  objc_storeStrong((id *)&self->_slider, 0);
}

@end