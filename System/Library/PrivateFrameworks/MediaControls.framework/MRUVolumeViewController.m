@interface MRUVolumeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isGroupRenderingRequired;
- (BOOL)isOnScreen;
- (BOOL)pendingExpanded;
- (BOOL)primaryGlyphShouldBeTinted;
- (BOOL)primaryInteractionEnabled;
- (BOOL)providesOwnPlatter;
- (BOOL)secondaryInteractionEnabled;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (MRUAudioModuleController)audioModuleController;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeViewController)initWithAudioModuleController:(id)a3;
- (MRUVolumeViewControllerDelegate)delegate;
- (NSArray)punchOutRenderingViews;
- (NSString)volumeAudioCategory;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentWidth;
- (unint64_t)contentRenderingMode;
- (void)audioModuleController:(id)a3 hearingServiceController:(id)a4 didChangePrimaryAmplification:(float)a5;
- (void)audioModuleController:(id)a3 volumeController:(id)a4 didChangeVolumeControlCapabilities:(unsigned int)a5 effectiveVolumeValue:(float)a6 forType:(int64_t)a7;
- (void)dealloc;
- (void)decreaseTouchUpInside:(id)a3;
- (void)didTransitionToExpandedContentMode:(BOOL)a3;
- (void)environmentSliderValueDidChange:(id)a3;
- (void)increaseTouchUpInside:(id)a3;
- (void)loadView;
- (void)primarySliderValueDidChange:(id)a3;
- (void)secondarySliderValueDidChange:(id)a3;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingExpanded:(BOOL)a3;
- (void)setPrimaryGlyphShouldBeTinted:(BOOL)a3;
- (void)setPrimaryInteractionEnabled:(BOOL)a3;
- (void)setSecondaryInteractionEnabled:(BOOL)a3;
- (void)updateEnvironmentSliderValueAnimated:(BOOL)a3;
- (void)updatePrimarySliderVolumeValueAfterDelay;
- (void)updatePrimarySliderVolumeValueAnimated:(BOOL)a3;
- (void)updateSecondarySliderVolumeValueAnimated:(BOOL)a3;
- (void)updateSliderAsset;
- (void)updateSliderInteractionEnabled;
- (void)updateSliderTint;
- (void)updateVisibility;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation MRUVolumeViewController

- (void)updateVisibility
{
  v3 = [(MRUAudioModuleController *)self->_audioModuleController spatialAudioController];
  v4 = [v3 availableModes];
  unint64_t v5 = [v4 count];
  BOOL v6 = v5 > 1;

  v7 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
  int v8 = [v7 isSplitRoute];

  v9 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  char v10 = [v9 volumeCapabilitiesForType:0];

  BOOL v11 = +[MRUFeatureFlagProvider isRelativeVolumeUIEnabled];
  int v12 = (v10 & 5) != 0 && v11;
  v13 = [(MRUAudioModuleController *)self->_audioModuleController hearingServiceController];
  int v14 = [v13 primaryHearingAidEnabled] & (v8 ^ 1);

  v15 = [(MRUVolumeViewController *)self view];
  if (v8 != [v15 showSecondarySlider]) {
    goto LABEL_9;
  }
  v16 = [(MRUVolumeViewController *)self view];
  if (v12 != [v16 showStepper])
  {
LABEL_8:

LABEL_9:
LABEL_10:
    v19 = (void *)MEMORY[0x1E4F5ADE8];
    v20 = [(MRUVolumeViewController *)self view];
    v21 = [v20 window];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __43__MRUVolumeViewController_updateVisibility__block_invoke;
    v24[3] = &unk_1E5F0E2E8;
    v24[4] = self;
    char v25 = v8;
    char v26 = v14;
    char v27 = v12;
    BOOL v28 = v6;
    [v19 performWithoutAnimationWhileHiddenInWindow:v21 actions:v24];

    return;
  }
  int v17 = v5 > 1;
  v18 = [(MRUVolumeViewController *)self view];
  if (v17 != [v18 showSpatialAudioModeButton])
  {

    goto LABEL_8;
  }
  v22 = [(MRUVolumeViewController *)self view];
  int v23 = [v22 showEnvironmentSlider];

  if (v14 != v23) {
    goto LABEL_10;
  }
}

- (MRUVolumeViewController)initWithAudioModuleController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVolumeViewController;
  BOOL v6 = [(MRUVolumeViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioModuleController, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v3 removeVolumeDisplay:self];

  v4.receiver = self;
  v4.super_class = (Class)MRUVolumeViewController;
  [(MRUVolumeViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [MRUVolumeView alloc];
  objc_super v4 = -[MRUVolumeView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MRUVolumeViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)MRUVolumeViewController;
  [(MRUVolumeViewController *)&v18 viewDidLoad];
  v3 = [(MRUVolumeViewController *)self view];
  objc_super v4 = [v3 primarySlider];
  [v4 addTarget:self action:sel_primarySliderValueDidChange_ forControlEvents:4096];

  id v5 = [(MRUVolumeViewController *)self view];
  BOOL v6 = [v5 secondarySlider];
  [v6 addTarget:self action:sel_secondarySliderValueDidChange_ forControlEvents:4096];

  v7 = [(MRUVolumeViewController *)self view];
  int v8 = [v7 environmentSlider];
  [v8 addTarget:self action:sel_environmentSliderValueDidChange_ forControlEvents:0x40000];

  objc_super v9 = [(MRUVolumeViewController *)self view];
  char v10 = [v9 stepper];
  BOOL v11 = [v10 increaseButton];
  [v11 addTarget:self action:sel_increaseTouchUpInside_ forControlEvents:64];

  int v12 = [(MRUVolumeViewController *)self view];
  v13 = [v12 stepper];
  int v14 = [v13 decreaseButton];
  [v14 addTarget:self action:sel_decreaseTouchUpInside_ forControlEvents:64];

  [(MRUVolumeViewController *)self compactContinuousCornerRadius];
  double v16 = v15;
  int v17 = [(MRUVolumeViewController *)self view];
  [v17 setCompactContinuousCornerRadius:v16];

  [(MRUAudioModuleController *)self->_audioModuleController addObserver:self];
  [(MRUVolumeViewController *)self updateSliderTint];
  [(MRUVolumeViewController *)self updateSliderAsset];
  [(MRUVolumeViewController *)self updateSliderInteractionEnabled];
  [(MRUVolumeViewController *)self updateVisibility];
  [(MRUVolumeViewController *)self setPrimaryInteractionEnabled:1];
  [(MRUVolumeViewController *)self setSecondaryInteractionEnabled:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MRUVolumeViewController;
  -[MRUVolumeViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  [(MRUVolumeViewController *)self updateSliderInteractionEnabled];
  [(MRUVolumeViewController *)self updatePrimarySliderVolumeValueAnimated:v3];
  id v5 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v5 addVolumeDisplay:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRUVolumeViewController;
  [(MRUVolumeViewController *)&v5 viewWillDisappear:a3];
  [(MRUVolumeViewController *)self updateSliderInteractionEnabled];
  objc_super v4 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v4 removeVolumeDisplay:self];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)MRUVolumeViewController;
  id v7 = a4;
  -[MRUVolumeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  char v8 = [v7 isAnimated];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5F0E298;
  v9[4] = self;
  char v10 = v8;
  [v7 animateAlongsideTransition:v9 completion:0];
}

uint64_t __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E5F0D8C0;
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966082, v4, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

void __78__MRUVolumeViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingExpanded];
  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 setExpanded:v2];

  [*(id *)(a1 + 32) updatePrimarySliderVolumeValueAnimated:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) updateSecondarySliderVolumeValueAnimated:*(unsigned __int8 *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MRUVisualStylingProvider)stylingProvider
{
  uint64_t v2 = [(MRUVolumeViewController *)self view];
  BOOL v3 = [v2 stylingProvider];

  return (MRUVisualStylingProvider *)v3;
}

- (void)setPrimaryInteractionEnabled:(BOOL)a3
{
  if (self->_primaryInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_primaryInteractionEnabled = a3;
    char v5 = [(MRUVolumeViewController *)self view];
    [v5 setPrimaryInteractionEnabled:v3];

    [(MRUVolumeViewController *)self updatePrimarySliderVolumeValueAnimated:0];
  }
}

- (void)setPrimaryGlyphShouldBeTinted:(BOOL)a3
{
  if (self->_primaryGlyphShouldBeTinted != a3)
  {
    self->_primaryGlyphShouldBeTinted = a3;
    [(MRUVolumeViewController *)self updateSliderTint];
  }
}

- (void)setSecondaryInteractionEnabled:(BOOL)a3
{
  if (self->_secondaryInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_secondaryInteractionEnabled = a3;
    char v5 = [(MRUVolumeViewController *)self view];
    [v5 setSecondaryInteractionEnabled:v3];

    [(MRUVolumeViewController *)self updateSecondarySliderVolumeValueAnimated:0];
  }
}

- (void)primarySliderValueDidChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(MRUVolumeViewController *)self view];
  if ([v5 isExpanded])
  {
    CAFrameRateRange v6 = [(MRUVolumeViewController *)self view];
    int v7 = [v6 showSecondarySlider];

    if (v7)
    {
      char v8 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
      [v4 value];
      objc_msgSend(v8, "setVolumeValue:forType:", 1);

      goto LABEL_8;
    }
  }
  else
  {
  }
  objc_super v9 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  [v4 value];
  objc_msgSend(v9, "setVolumeValue:forType:", 0);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v4 value];
  objc_msgSend(WeakRetained, "volumeViewController:didChangeSystemVolumeValue:", self);

  objc_super v11 = MCLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    v13 = NSNumber;
    [v4 value];
    int v14 = objc_msgSend(v13, "numberWithFloat:");
    int v16 = 138544130;
    uint64_t v17 = v12;
    __int16 v18 = 2114;
    v19 = v14;
    __int16 v20 = 1024;
    int v21 = [v4 isEditingValue];
    __int16 v22 = 1024;
    int v23 = [v4 isTracking];
    _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ slider value changed: %{public}@ | editing: %{BOOL}u | tracking: %{BOOL}u", (uint8_t *)&v16, 0x22u);
  }
  [(MRUVolumeViewController *)self updatePrimarySliderVolumeValueAfterDelay];
LABEL_8:
  [v4 value];
  double v15 = +[MRUSystemVolumeController packageStateForVolumeValue:](MRUSystemVolumeController, "packageStateForVolumeValue:");
  [v4 setGlyphState:v15];
}

- (void)secondarySliderValueDidChange:(id)a3
{
  audioModuleController = self->_audioModuleController;
  id v4 = a3;
  id v8 = [(MRUAudioModuleController *)audioModuleController volumeController];
  [v4 value];
  int v6 = v5;

  LODWORD(v7) = v6;
  [v8 setVolumeValue:2 forType:v7];
}

- (void)environmentSliderValueDidChange:(id)a3
{
  [a3 value];
  int v5 = v4;
  id v7 = [(MRUAudioModuleController *)self->_audioModuleController hearingServiceController];
  LODWORD(v6) = v5;
  [v7 setPrimaryAmplification:v6];
}

- (void)increaseTouchUpInside:(id)a3
{
  id v3 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  [v3 increaseVolume];
}

- (void)decreaseTouchUpInside:(id)a3
{
  id v3 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  [v3 decreaseVolume];
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (double)preferredExpandedContentWidth
{
  id v3 = [(MRUVolumeViewController *)self view];
  BOOL ShouldBeVertical = MRULayoutShouldBeVertical();
  if (ShouldBeVertical)
  {
    double Width = MRUDefaultExpandedWidth(ShouldBeVertical);
  }
  else
  {
    double v6 = [(MRUVolumeViewController *)self view];
    id v7 = [v6 window];
    [v7 bounds];
    double Width = CGRectGetWidth(v9);
  }
  return Width;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  if (self->_compactContinuousCornerRadius != a3)
  {
    self->_compactContinuousCornerRadius = a3;
    id v4 = [(MRUVolumeViewController *)self viewIfLoaded];
    [v4 setCompactContinuousCornerRadius:a3];
  }
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  self->_contentRenderingMode = a3;
  [(MRUVolumeViewController *)self updateSliderAsset];
  [(MRUVolumeViewController *)self updatePrimarySliderVolumeValueAnimated:0];

  [(MRUVolumeViewController *)self updateSliderInteractionEnabled];
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  self->_pendingExpanded = a3;
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x1E4F77180];
    id v3 = +[MRUSystemOutputDeviceRouteController outputContextDescription];
    v8[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

    double v6 = v4;
    id v5 = v4;
    MRAnalyticsSendEvent();
  }
}

id __62__MRUVolumeViewController_didTransitionToExpandedContentMode___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isGroupRenderingRequired
{
  uint64_t v2 = [(MRUVolumeViewController *)self view];
  char v3 = [v2 isGroupRenderingRequired];

  return v3;
}

- (NSArray)punchOutRenderingViews
{
  uint64_t v2 = [(MRUVolumeViewController *)self view];
  char v3 = [v2 punchOutRenderingViews];

  return (NSArray *)v3;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  uint64_t v2 = [(MRUVolumeViewController *)self viewIfLoaded];
  char v3 = [v2 window];
  id v4 = [v3 windowScene];

  return (UIWindowScene *)v4;
}

- (BOOL)isOnScreen
{
  return [(MRUVolumeViewController *)self _appearState] == 2
      || [(MRUVolumeViewController *)self _appearState] == 1;
}

- (NSString)volumeAudioCategory
{
  uint64_t v2 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  char v3 = [v2 volumeAudioCategory];

  return (NSString *)v3;
}

- (void)audioModuleController:(id)a3 volumeController:(id)a4 didChangeVolumeControlCapabilities:(unsigned int)a5 effectiveVolumeValue:(float)a6 forType:(int64_t)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if ((unint64_t)a7 >= 2)
  {
    if (a7 == 2)
    {
      uint64_t v24 = [(MRUVolumeViewController *)self view];
      char v25 = [v24 secondarySlider];
      char v26 = [v25 isEditingValue];

      if ((v26 & 1) == 0) {
        [(MRUVolumeViewController *)self updateSecondarySliderVolumeValueAnimated:1];
      }
    }
  }
  else
  {
    v13 = [(MRUVolumeViewController *)self view];
    int v14 = [v13 primarySlider];
    char v15 = [v14 isEditingValue];

    if ((v15 & 1) == 0) {
      [(MRUVolumeViewController *)self updatePrimarySliderVolumeValueAnimated:1];
    }
    int v16 = MCLogCategoryDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_opt_class();
      *(float *)&double v17 = a6;
      __int16 v18 = [NSNumber numberWithFloat:v17];
      v19 = [(MRUVolumeViewController *)self view];
      __int16 v20 = [v19 primarySlider];
      int v21 = [v20 isEditingValue];
      __int16 v22 = [(MRUVolumeViewController *)self view];
      int v23 = [v22 primarySlider];
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v27;
      __int16 v30 = 2114;
      v31 = v18;
      __int16 v32 = 1024;
      int v33 = v21;
      __int16 v34 = 1024;
      int v35 = [v23 isTracking];
      _os_log_impl(&dword_1AE7DF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ system volume changed: %{public}@ | editing: %{BOOL}u | tracking: %{BOOL}u", buf, 0x22u);
    }
  }
  [(MRUVolumeViewController *)self updateVisibility];
}

- (void)audioModuleController:(id)a3 hearingServiceController:(id)a4 didChangePrimaryAmplification:(float)a5
{
  double v6 = [(MRUVolumeViewController *)self view];
  uint64_t v7 = [v6 environmentSlider];
  char v8 = [v7 isEditingValue];

  if ((v8 & 1) == 0)
  {
    [(MRUVolumeViewController *)self updateEnvironmentSliderValueAnimated:1];
  }
}

- (void)updateSliderAsset
{
  if (self->_contentRenderingMode == 1)
  {
    id v11 = +[MRUOutputDeviceAsset speakerAsset];
  }
  else
  {
    char v3 = [(MRUAudioModuleController *)self->_audioModuleController outputDeviceRouteController];
    id v11 = [v3 systemOutputDeviceAssetWithInCall];
  }
  id v4 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  [v4 volumeValueForType:0];
  int v6 = v5;

  LODWORD(v7) = v6;
  char v8 = +[MRUSystemVolumeController packageStateForVolumeValue:v7];
  CGRect v9 = [(MRUVolumeViewController *)self view];
  char v10 = [v9 primarySlider];
  objc_msgSend(v10, "setOutputDeviceAsset:state:animated:", v11, v8, -[MRUVolumeViewController isOnScreen](self, "isOnScreen"));
}

- (void)updateSliderTint
{
  if ([(MRUVolumeViewController *)self primaryGlyphShouldBeTinted])
  {
    id v7 = [MEMORY[0x1E4FB1618] systemCyanColor];
  }
  else
  {
    id v7 = 0;
  }
  char v3 = [(MRUVolumeViewController *)self view];
  id v4 = [v3 primarySlider];
  [v4 setGlyphTintColor:v7];

  int v5 = [(MRUVolumeViewController *)self view];
  int v6 = [v5 environmentSlider];
  [v6 setGlyphTintColor:v7];
}

- (void)updateSliderInteractionEnabled
{
  uint64_t v3 = [(MRUVolumeViewController *)self bs_isAppearingOrAppeared];
  if (v3) {
    BOOL v4 = self->_contentRenderingMode != 1;
  }
  else {
    BOOL v4 = 0;
  }
  int v5 = [(MRUVolumeViewController *)self view];
  int v6 = [v5 primarySlider];
  [v6 setUserInteractionEnabled:v4];

  id v8 = [(MRUVolumeViewController *)self view];
  id v7 = [v8 secondarySlider];
  [v7 setUserInteractionEnabled:v3];
}

- (void)updatePrimarySliderVolumeValueAfterDelay
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updatePrimarySliderVolumeValueAfterDelay object:0];
  uint64_t v3 = [(MRUVolumeViewController *)self view];
  BOOL v4 = [v3 primarySlider];
  int v5 = [v4 isEditingValue];

  if (v5)
  {
    [(MRUVolumeViewController *)self performSelector:sel_updatePrimarySliderVolumeValueAfterDelay withObject:0 afterDelay:0.25];
  }
  else
  {
    [(MRUVolumeViewController *)self updatePrimarySliderVolumeValueAnimated:1];
  }
}

- (void)updatePrimarySliderVolumeValueAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(MRUVolumeViewController *)self view];
  if ([v5 isExpanded])
  {
    int v6 = [(MRUVolumeViewController *)self view];
    uint64_t v7 = [v6 showSecondarySlider];
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v8 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  [v8 volumeValueForType:v7];
  float v10 = v9;

  id v11 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  char v12 = [v11 volumeCapabilitiesForType:v7];

  if (self->_contentRenderingMode == 1)
  {
    CCUISliderPreviewRenderingModeValue();
    float v10 = v13;
  }
  else if ((v12 & 2) == 0)
  {
    BOOL v14 = 1;
    goto LABEL_9;
  }
  BOOL v14 = !self->_primaryInteractionEnabled;
LABEL_9:
  char v15 = [(MRUVolumeViewController *)self view];
  int v16 = [v15 primarySlider];
  *(float *)&double v17 = v10;
  [v16 setValue:v3 animated:v17];

  __int16 v18 = [(MRUVolumeViewController *)self view];
  v19 = [v18 primarySlider];
  [v19 setInoperative:v14];

  *(float *)&double v20 = v10;
  int v21 = +[MRUSystemVolumeController packageStateForVolumeValue:v20];
  __int16 v22 = [(MRUVolumeViewController *)self view];
  int v23 = [v22 primarySlider];
  [v23 setGlyphState:v21];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&double v24 = v10;
  [WeakRetained volumeViewController:self didChangeSystemVolumeValue:v24];
}

- (void)updateSecondarySliderVolumeValueAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  [v5 volumeValueForType:2];
  int v7 = v6;

  id v8 = [(MRUAudioModuleController *)self->_audioModuleController volumeController];
  char v9 = [v8 volumeCapabilitiesForType:2];

  BOOL v10 = (v9 & 2) == 0 || !self->_secondaryInteractionEnabled;
  id v11 = [(MRUVolumeViewController *)self view];
  char v12 = [v11 secondarySlider];
  LODWORD(v13) = v7;
  [v12 setValue:v3 animated:v13];

  id v15 = [(MRUVolumeViewController *)self view];
  BOOL v14 = [v15 secondarySlider];
  [v14 setInoperative:v10];
}

- (void)updateEnvironmentSliderValueAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(MRUAudioModuleController *)self->_audioModuleController hearingServiceController];
  [v5 primaryAmplification];
  int v7 = v6;

  id v10 = [(MRUVolumeViewController *)self view];
  id v8 = [v10 environmentSlider];
  LODWORD(v9) = v7;
  [v8 setValue:v3 animated:v9];
}

uint64_t __43__MRUVolumeViewController_updateVisibility__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__MRUVolumeViewController_updateVisibility__block_invoke_2;
  v2[3] = &unk_1E5F0E2E8;
  v2[4] = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 40);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.25];
}

void __43__MRUVolumeViewController_updateVisibility__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = [*(id *)(a1 + 32) view];
  [v3 setShowSecondarySlider:v2];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
  int v5 = [*(id *)(a1 + 32) view];
  [v5 setShowEnvironmentSlider:v4];

  uint64_t v6 = *(unsigned __int8 *)(a1 + 42);
  int v7 = [*(id *)(a1 + 32) view];
  [v7 setShowStepper:v6];

  uint64_t v8 = *(unsigned __int8 *)(a1 + 43);
  double v9 = [*(id *)(a1 + 32) view];
  [v9 setShowSpatialAudioModeButton:v8];

  id v10 = [*(id *)(a1 + 32) view];
  [v10 layoutIfNeeded];
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (MRUAudioModuleController)audioModuleController
{
  return self->_audioModuleController;
}

- (MRUVolumeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUVolumeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)primaryInteractionEnabled
{
  return self->_primaryInteractionEnabled;
}

- (BOOL)primaryGlyphShouldBeTinted
{
  return self->_primaryGlyphShouldBeTinted;
}

- (BOOL)secondaryInteractionEnabled
{
  return self->_secondaryInteractionEnabled;
}

- (BOOL)pendingExpanded
{
  return self->_pendingExpanded;
}

- (void)setPendingExpanded:(BOOL)a3
{
  self->_pendingExpanded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_audioModuleController, 0);
}

@end