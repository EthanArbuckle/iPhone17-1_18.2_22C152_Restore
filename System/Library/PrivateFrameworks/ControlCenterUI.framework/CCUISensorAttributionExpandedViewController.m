@interface CCUISensorAttributionExpandedViewController
- (BOOL)_cacheTopmostSensorButtonIfNotAlreadySet:(id)a3 sensorData:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isExpanded;
- (CCUIAudioVideoControlsView)audioVideoControlsView;
- (CCUIContentModuleContentViewController)audioControlsContentViewController;
- (CCUIContentModuleContentViewController)videoControlsContentViewController;
- (CCUIHeaderPocketViewSensorAttributionDelegate)delegate;
- (CCUIModuleInstance)audioModuleInstance;
- (CCUIModuleInstance)videoModuleInstance;
- (CCUIModuleInstanceManager)moduleInstanceManager;
- (CCUISensorActivityData)audioVideoModeSelectionAttribution;
- (CCUISensorAttributionCompactControl)clonedCompactControl;
- (CCUISensorAttributionExpandedViewController)initWithModuleInstanceManager:(id)a3;
- (CCUISensorAttributionGameModeFooterView)gameModeFooterView;
- (CCUISensorAttributionPrivacyHeaderView)audioVideoHeaderView;
- (CCUISensorAttributionPrivacyHeaderView)privacyHeaderView;
- (CCUISensorAttributionSensorButton)topMostCameraButton;
- (CCUISensorAttributionSensorButton)topMostLocButton;
- (CCUISensorAttributionSensorButton)topMostMicButton;
- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3;
- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3;
- (MTMaterialView)materialView;
- (NSArray)entityAndWebsiteViews;
- (NSArray)interactiveViews;
- (NSArray)separatorViews;
- (NSArray)subsequentSensorButtons;
- (NSSet)activeAndRecentSensorActivityData;
- (NSString)audioModuleIdentifier;
- (NSString)videoModuleIdentifier;
- (UIEdgeInsets)edgeInsets;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)dismissTapGestureRecognizer;
- (UIView)audioControlsContainerView;
- (UIView)audioControlsView;
- (UIView)contentView;
- (UIView)videoControlsContainerView;
- (UIView)videoControlsView;
- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)gameModeActivityDataProvider;
- (id)_iconInCompactViewForSensorType:(unint64_t)a3;
- (id)_makeHeaderSeparatorView;
- (id)_topMostButtons;
- (void)_animateAllSensorButtonsForExpanded:(BOOL)a3;
- (void)_animateBackgroundBlurWeighting:(BOOL)a3;
- (void)_animateCompactControlAlpha:(BOOL)a3;
- (void)_animateEntityAndWebsiteViews:(BOOL)a3;
- (void)_animatePrivacyHeader:(BOOL)a3;
- (void)_animateSeparatorViews:(BOOL)a3;
- (void)_animateSubsequentSensorIcon:(id)a3 toExpanded:(BOOL)a4;
- (void)_animateTopmostSensorButton:(id)a3 toExpanded:(BOOL)a4;
- (void)_applyAlphaAndBlurToFirstEntityViewExpanded:(BOOL)a3;
- (void)_applyAlphaAndBlurToSubsequentEntityAndWebsiteViewsExpanded:(BOOL)a3;
- (void)_applyAlphaAndStylingToEntityOrWebsiteView:(id)a3 expanded:(BOOL)a4;
- (void)_applyCompactAlphaForSensorButton:(id)a3 isTopMost:(BOOL)a4;
- (void)_applyCompactAppearanceToAllViews;
- (void)_applyCompactLayoutToSensorButton:(id)a3;
- (void)_applyLayoutOfEntityAndWebsiteViewsExpanded:(BOOL)a3;
- (void)_applyPrivacyHeaderAlphaAndBlurRadius:(BOOL)a3;
- (void)_applyPrivacyHeaderLayoutExpanded:(BOOL)a3;
- (void)_applySeparatorAlphaExpanded:(BOOL)a3;
- (void)_applySeparatorsLayoutExpanded:(BOOL)a3;
- (void)_clonedPillButtonPressed:(id)a3;
- (void)_recreateViewsForAttributionsAndCacheExpandedFrames;
- (void)_reduceMotionPrepareForPresentation;
- (void)_reduceMotionSetExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)_removeClonedCompactPillViewAndNotifyDelegate;
- (void)_showClonedCompactControl:(id)a3;
- (void)gameModeStateDidChange:(unint64_t)a3;
- (void)prepareForInteractionWithClonedCompactControl:(id)a3;
- (void)recognizedDismissTapGesture:(id)a3;
- (void)sensorAttributionsChanged:(id)a3;
- (void)setActiveAndRecentSensorActivityData:(id)a3;
- (void)setAudioControlsContainerView:(id)a3;
- (void)setAudioControlsContentViewController:(id)a3;
- (void)setAudioControlsView:(id)a3;
- (void)setAudioModuleIdentifier:(id)a3;
- (void)setAudioModuleInstance:(id)a3;
- (void)setAudioVideoControlsEnabled:(BOOL)a3;
- (void)setAudioVideoControlsView:(id)a3;
- (void)setAudioVideoHeaderView:(id)a3;
- (void)setAudioVideoModeSelectionAttribution:(id)a3;
- (void)setClonedCompactControl:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissTapGestureRecognizer:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setEntityAndWebsiteViews:(id)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setGameModeActivityDataProvider:(id)a3;
- (void)setGameModeFooterView:(id)a3;
- (void)setInteractiveViews:(id)a3;
- (void)setMaterialView:(id)a3;
- (void)setModuleInstanceManager:(id)a3;
- (void)setPrivacyHeaderView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSeparatorViews:(id)a3;
- (void)setSubsequentSensorButtons:(id)a3;
- (void)setTopMostCameraButton:(id)a3;
- (void)setTopMostLocButton:(id)a3;
- (void)setTopMostMicButton:(id)a3;
- (void)setVideoControlsContainerView:(id)a3;
- (void)setVideoControlsContentViewController:(id)a3;
- (void)setVideoControlsView:(id)a3;
- (void)setVideoModuleIdentifier:(id)a3;
- (void)setVideoModuleInstance:(id)a3;
- (void)viewDidLoad;
@end

@implementation CCUISensorAttributionExpandedViewController

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  double v4 = a3.right + -5.0;
  if (self->_edgeInsets.left != a3.left + -5.0 || self->_edgeInsets.right != v4)
  {
    self->_edgeInsets.top = a3.top;
    self->_edgeInsets.left = a3.left + -5.0;
    self->_edgeInsets.bottom = a3.bottom;
    self->_edgeInsets.right = v4;
    CCUIEdgeInsetsRTLSwap();
    double v6 = v5;
    CCUIEdgeInsetsRTLSwap();
    double v8 = v7;
    v9 = [(CCUISensorAttributionExpandedViewController *)self view];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    v14 = [(CCUISensorAttributionExpandedViewController *)self view];
    [v14 bounds];
    double v16 = v15 - v6 - v8;

    v17 = [(CCUISensorAttributionExpandedViewController *)self contentView];
    objc_msgSend(v17, "setFrame:", v6, v11, v16, v13);

    [(CCUISensorAttributionExpandedViewController *)self _recreateViewsForAttributionsAndCacheExpandedFrames];
  }
}

- (void)setGameModeActivityDataProvider:(id)a3
{
}

- (void)setAudioVideoModeSelectionAttribution:(id)a3
{
  id v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v4 = (CCUISensorActivityData *)[v8 copy];
    audioVideoModeSelectionAttribution = self->_audioVideoModeSelectionAttribution;
    self->_audioVideoModeSelectionAttribution = v4;

    audioVideoHeaderView = self->_audioVideoHeaderView;
    double v7 = [v8 displayName];
    [(CCUISensorAttributionPrivacyHeaderView *)audioVideoHeaderView setTrailingText:v7];
  }
}

- (void)setAudioVideoControlsEnabled:(BOOL)a3
{
  BOOL v4 = !a3;
  [(CCUISensorAttributionPrivacyHeaderView *)self->_audioVideoHeaderView setHidden:v4];
  [(CCUIAudioVideoControlsView *)self->_audioVideoControlsView setHidden:v4];
  if (!v4)
  {
    double v5 = [(CCUIAudioVideoControlsView *)self->_audioVideoControlsView subviews];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v34 = [(CCUISensorAttributionExpandedViewController *)self audioModuleIdentifier];
      v31 = [(CCUISensorAttributionExpandedViewController *)self videoModuleIdentifier];
      v33 = [(CCUISensorAttributionExpandedViewController *)self audioModuleInstance];
      double v7 = [(CCUISensorAttributionExpandedViewController *)self videoModuleInstance];
      id v8 = [CCUIContentModuleContainerViewController alloc];
      id v9 = objc_alloc(MEMORY[0x1E4F29128]);
      double v10 = [v33 uniqueIdentifier];
      double v11 = (void *)[v9 initWithUUIDString:v10];
      double v12 = [v33 module];
      double v13 = [MEMORY[0x1E4F5ADF0] defaultControlCenterPresentationContext];
      v14 = [(CCUIContentModuleContainerViewController *)v8 initWithModuleIdentifier:v34 uniqueIdentifier:v11 contentModule:v12 presentationContext:v13];

      [(CCUIContentModuleContainerViewController *)v14 setDelegate:self];
      v32 = [(CCUIContentModuleContainerViewController *)v14 view];
      [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CCUISensorAttributionExpandedViewController *)self bs_addChildViewController:v14 withSuperview:self->_audioVideoControlsView];
      double v15 = [(CCUIContentModuleContainerViewController *)v14 contentViewController];
      objc_storeWeak((id *)&self->_audioControlsContentViewController, v15);

      double v16 = [(CCUIContentModuleContainerViewController *)v14 view];
      objc_storeWeak((id *)&self->_audioControlsContainerView, v16);

      v17 = [(CCUIContentModuleContainerViewController *)v14 contentViewController];
      v18 = [v17 view];
      objc_storeWeak((id *)&self->_audioControlsView, v18);

      v19 = [CCUIContentModuleContainerViewController alloc];
      id v20 = objc_alloc(MEMORY[0x1E4F29128]);
      v21 = [v7 uniqueIdentifier];
      v22 = (void *)[v20 initWithUUIDString:v21];
      v23 = [v7 module];
      v24 = [MEMORY[0x1E4F5ADF0] defaultControlCenterPresentationContext];
      v25 = [(CCUIContentModuleContainerViewController *)v19 initWithModuleIdentifier:v31 uniqueIdentifier:v22 contentModule:v23 presentationContext:v24];

      [(CCUIContentModuleContainerViewController *)v25 setDelegate:self];
      v26 = [(CCUIContentModuleContainerViewController *)v25 view];
      [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CCUISensorAttributionExpandedViewController *)self bs_addChildViewController:v25 withSuperview:self->_audioVideoControlsView];
      v27 = [(CCUIContentModuleContainerViewController *)v25 contentViewController];
      objc_storeWeak((id *)&self->_videoControlsContentViewController, v27);

      v28 = [(CCUIContentModuleContainerViewController *)v25 view];
      objc_storeWeak((id *)&self->_videoControlsContainerView, v28);

      v29 = [(CCUIContentModuleContainerViewController *)v25 contentViewController];
      v30 = [v29 view];
      objc_storeWeak((id *)&self->_videoControlsView, v30);
    }
  }
}

- (void)sensorAttributionsChanged:(id)a3
{
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
  clonedCompactControl = self->_clonedCompactControl;
  if (clonedCompactControl) {
    [(CCUISensorAttributionCompactControl *)clonedCompactControl gameModeStateDidChange:a3];
  }
}

- (CCUISensorAttributionExpandedViewController)initWithModuleInstanceManager:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CCUISensorAttributionExpandedViewController;
  double v5 = [(CCUISensorAttributionExpandedViewController *)&v14 initWithNibName:0 bundle:0];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_moduleInstanceManager, v4);
    audioModuleIdentifier = v6->_audioModuleIdentifier;
    v6->_audioModuleIdentifier = (NSString *)@"com.apple.replaykit.AudioConferenceControlCenterModule";

    videoModuleIdentifier = v6->_videoModuleIdentifier;
    v6->_videoModuleIdentifier = (NSString *)@"com.apple.replaykit.VideoConferenceControlCenterModule";

    uint64_t v9 = [v4 obtainModuleWithBundleIdentifier:v6->_audioModuleIdentifier uniqueIdentifier:v6->_audioModuleIdentifier];
    audioModuleInstance = v6->_audioModuleInstance;
    v6->_audioModuleInstance = (CCUIModuleInstance *)v9;

    uint64_t v11 = [v4 obtainModuleWithBundleIdentifier:v6->_videoModuleIdentifier uniqueIdentifier:v6->_videoModuleIdentifier];
    videoModuleInstance = v6->_videoModuleInstance;
    v6->_videoModuleInstance = (CCUIModuleInstance *)v11;
  }
  return v6;
}

- (void)viewDidLoad
{
  v43.receiver = self;
  v43.super_class = (Class)CCUISensorAttributionExpandedViewController;
  [(CCUISensorAttributionExpandedViewController *)&v43 viewDidLoad];
  v3 = [(CCUISensorAttributionExpandedViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = (void *)MEMORY[0x1E4F743C8];
  double v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v14 = [v12 materialViewWithRecipeNamed:@"privacyCenterBackground" inBundle:v13 options:0 initialWeighting:&__block_literal_global_16 scaleAdjustment:0.0];
  materialView = self->_materialView;
  self->_materialView = v14;

  [(MTMaterialView *)self->_materialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:1];
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v5, v7, v9, v11);
  [(MTMaterialView *)self->_materialView setAutoresizingMask:18];
  double v16 = [(CCUISensorAttributionExpandedViewController *)self view];
  [v16 addSubview:self->_materialView];

  v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v7, v9, v11);
  contentView = self->_contentView;
  self->_contentView = v17;

  [(UIView *)self->_contentView setAutoresizingMask:18];
  v19 = [(CCUISensorAttributionExpandedViewController *)self view];
  [v19 addSubview:self->_contentView];

  id v20 = objc_alloc(MEMORY[0x1E4FB1BE0]);
  [(UIView *)self->_contentView bounds];
  v21 = (UIScrollView *)objc_msgSend(v20, "initWithFrame:");
  scrollView = self->_scrollView;
  self->_scrollView = v21;

  [(UIScrollView *)self->_scrollView setAutoresizingMask:18];
  [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  v23 = [(UIScrollView *)self->_scrollView layer];
  [v23 setAllowsGroupBlending:0];

  [(UIView *)self->_contentView addSubview:self->_scrollView];
  v24 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_recognizedDismissTapGesture_];
  dismissTapGestureRecognizer = self->_dismissTapGestureRecognizer;
  self->_dismissTapGestureRecognizer = v24;

  [(UITapGestureRecognizer *)self->_dismissTapGestureRecognizer setDelegate:self];
  v26 = [(CCUISensorAttributionExpandedViewController *)self view];
  [v26 addGestureRecognizer:self->_dismissTapGestureRecognizer];

  v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"CONTROL_CENTER_SENSOR_STATUS_PRIVACY" value:&stru_1F2F34F20 table:@"ControlCenterUI"];

  v29 = [[CCUISensorAttributionPrivacyHeaderView alloc] initWithTitle:v28 systemImageName:@"hand.raised.fill"];
  privacyHeaderView = self->_privacyHeaderView;
  self->_privacyHeaderView = v29;

  [(UIScrollView *)self->_scrollView addSubview:self->_privacyHeaderView];
  v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v32 = [v31 localizedStringForKey:@"CONTROL_CENTER_SENSOR_STATUS_AUDIO_AND_VIDEO" value:&stru_1F2F34F20 table:@"ControlCenterUI"];

  v33 = [[CCUISensorAttributionPrivacyHeaderView alloc] initWithTitle:v32 systemImageName:@"video.fill"];
  audioVideoHeaderView = self->_audioVideoHeaderView;
  self->_audioVideoHeaderView = v33;

  [(CCUISensorAttributionPrivacyHeaderView *)self->_audioVideoHeaderView setHidden:1];
  [(UIScrollView *)self->_scrollView addSubview:self->_audioVideoHeaderView];
  v35 = [CCUIAudioVideoControlsView alloc];
  v36 = -[CCUIAudioVideoControlsView initWithFrame:](v35, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  audioVideoControlsView = self->_audioVideoControlsView;
  self->_audioVideoControlsView = v36;

  [(UIScrollView *)self->_scrollView addSubview:self->_audioVideoControlsView];
  v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"CONTROL_CENTER_GAME_MODE_HINT" value:&stru_1F2F34F20 table:@"ControlCenterUI"];

  v40 = [[CCUISensorAttributionGameModeFooterView alloc] initWithLabel:v39];
  gameModeFooterView = self->_gameModeFooterView;
  self->_gameModeFooterView = v40;

  [(UIScrollView *)self->_scrollView addSubview:self->_gameModeFooterView];
  v42 = [(CCUISensorAttributionExpandedViewController *)self view];
  [v42 setAccessibilityIdentifier:@"CCUISensorAttributionExpandedViewController"];
}

double __58__CCUISensorAttributionExpandedViewController_viewDidLoad__block_invoke()
{
  return 0.33;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)prepareForInteractionWithClonedCompactControl:(id)a3
{
  if (!self->_prepared)
  {
    self->_prepared = 1;
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained willOpenExpandedSensorAttributionViewController];

    [(CCUISensorAttributionExpandedViewController *)self _showClonedCompactControl:v5];
    [(CCUISensorAttributionExpandedViewController *)self _recreateViewsForAttributionsAndCacheExpandedFrames];
    int v7 = CCUIFeatureEnabled();
    if (UIAccessibilityIsReduceMotionEnabled() || v7)
    {
      [(CCUISensorAttributionExpandedViewController *)self _reduceMotionPrepareForPresentation];
    }
    else
    {
      [(CCUISensorAttributionPrivacyHeaderView *)self->_privacyHeaderView setBlurRadius:0.0];
      [(CCUISensorAttributionGameModeFooterView *)self->_gameModeFooterView setBlurRadius:0.0];
      [(CCUISensorAttributionPrivacyHeaderView *)self->_audioVideoHeaderView setBlurRadius:0.0];
      [(CCUIAudioVideoControlsView *)self->_audioVideoControlsView setBlurRadius:0.0];
      double v8 = [(CCUISensorAttributionExpandedViewController *)self contentView];
      [v8 setAlpha:1.0];

      double v9 = [(CCUISensorAttributionExpandedViewController *)self materialView];
      [v9 setAlpha:1.0];

      double v10 = [(CCUISensorAttributionExpandedViewController *)self materialView];
      [v10 setWeighting:0.0];

      [(CCUISensorAttributionExpandedViewController *)self _applyCompactAppearanceToAllViews];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __93__CCUISensorAttributionExpandedViewController_prepareForInteractionWithClonedCompactControl___block_invoke;
      v11[3] = &unk_1E6A898F8;
      v11[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v11 usingSpringWithDamping:0 initialSpringVelocity:0.2 options:0.0 animations:50.0 completion:0.0];
    }
  }
}

uint64_t __93__CCUISensorAttributionExpandedViewController_prepareForInteractionWithClonedCompactControl___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:0.329];
}

- (BOOL)isExpanded
{
  v2 = [(CCUISensorAttributionExpandedViewController *)self view];
  v3 = [v2 superview];
  char v4 = [v3 isUserInteractionEnabled];

  return v4;
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = [(CCUISensorAttributionExpandedViewController *)self view];
  double v8 = [v7 superview];
  [v8 setUserInteractionEnabled:v5];

  id v11 = [(CCUISensorAttributionExpandedViewController *)self audioControlsContentViewController];
  double v9 = [(CCUISensorAttributionExpandedViewController *)self videoControlsContentViewController];
  objc_msgSend(v11, "ccui_safelyBeginAppearanceTransition:animated:", v5, v4);
  objc_msgSend(v9, "ccui_safelyBeginAppearanceTransition:animated:", v5, v4);
  int v10 = CCUIFeatureEnabled();
  if (UIAccessibilityIsReduceMotionEnabled() || v10)
  {
    [(CCUISensorAttributionExpandedViewController *)self _reduceMotionSetExpanded:v5 animated:v4];
  }
  else
  {
    [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl setExpanded:v5 animated:v4];
    if (v4)
    {
      [(CCUISensorAttributionExpandedViewController *)self _animatePrivacyHeader:v5];
      [(CCUISensorAttributionExpandedViewController *)self _animateAllSensorButtonsForExpanded:v5];
      [(CCUISensorAttributionExpandedViewController *)self _animateEntityAndWebsiteViews:v5];
      [(CCUISensorAttributionExpandedViewController *)self _animateSeparatorViews:v5];
      [(CCUISensorAttributionExpandedViewController *)self _animateCompactControlAlpha:v5];
      [(CCUISensorAttributionExpandedViewController *)self _animateBackgroundBlurWeighting:v5];
    }
    else if (!v5)
    {
      [(CCUISensorAttributionExpandedViewController *)self _removeClonedCompactPillViewAndNotifyDelegate];
    }
    objc_msgSend(v11, "ccui_safelyEndAppearanceTransition");
    objc_msgSend(v9, "ccui_safelyEndAppearanceTransition");
  }
}

- (void)recognizedDismissTapGesture:(id)a3
{
  -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  [(CCUISensorAttributionExpandedViewController *)self setExpanded:0 animated:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = self->_interactiveViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v12 = objc_msgSend(v5, "view", (void)v15);
        LOBYTE(v11) = [v12 isDescendantOfView:v11];

        if (v11)
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (void)_clonedPillButtonPressed:(id)a3
{
}

- (void)_animateAllSensorButtonsForExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(CCUISensorAttributionExpandedViewController *)self _topMostButtons];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CCUISensorAttributionExpandedViewController *)self _animateTopmostSensorButton:*(void *)(*((void *)&v19 + 1) + 8 * v9++) toExpanded:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v10 = self->_subsequentSensorButtons;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[CCUISensorAttributionExpandedViewController _animateSubsequentSensorIcon:toExpanded:](self, "_animateSubsequentSensorIcon:toExpanded:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), v3, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_animateBackgroundBlurWeighting:(BOOL)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke;
  aBlock[3] = &unk_1E6A89920;
  BOOL v14 = a3;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_2;
  v11[3] = &unk_1E6A8A660;
  BOOL v12 = a3;
  v11[4] = self;
  uint64_t v6 = _Block_copy(v11);
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
  if (IsReduceTransparencyEnabled)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v5 usingSpringWithDamping:v6 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_3;
    v9[3] = &unk_1E6A8A7E8;
    id v10 = v6;
    [v8 _animateUsingSpringWithTension:0 friction:v5 interactive:v9 animations:300.0 completion:30.0];
  }
}

uint64_t __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1008) setWeighting:v1];
}

uint64_t __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    if (!*(unsigned char *)(result + 40)) {
      return [*(id *)(result + 32) _removeClonedCompactPillViewAndNotifyDelegate];
    }
  }
  return result;
}

uint64_t __79__CCUISensorAttributionExpandedViewController__animateBackgroundBlurWeighting___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_animateCompactControlAlpha:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__CCUISensorAttributionExpandedViewController__animateCompactControlAlpha___block_invoke;
  v3[3] = &unk_1E6A898F8;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v3 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
}

uint64_t __75__CCUISensorAttributionExpandedViewController__animateCompactControlAlpha___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:1.0];
}

- (void)_animateSeparatorViews:(BOOL)a3
{
  BOOL v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke;
  v8[3] = &unk_1E6A89920;
  v8[4] = self;
  BOOL v9 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
  double v5 = 0.33;
  if (v3) {
    double v5 = 0.66;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke_2;
  v6[3] = &unk_1E6A89920;
  v6[4] = self;
  BOOL v7 = v3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:v5 options:0.0 animations:50.0 completion:0.0];
}

uint64_t __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applySeparatorsLayoutExpanded:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __70__CCUISensorAttributionExpandedViewController__animateSeparatorViews___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applySeparatorAlphaExpanded:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_animateEntityAndWebsiteViews:(BOOL)a3
{
  BOOL v3 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke;
  v11[3] = &unk_1E6A89920;
  v11[4] = self;
  BOOL v12 = a3;
  double v5 = 0.0;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v11 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
  if (v3) {
    double v5 = 0.0770128355;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_2;
  v9[3] = &unk_1E6A89920;
  void v9[4] = self;
  BOOL v10 = v3;
  if (v3) {
    double v6 = 0.66;
  }
  else {
    double v6 = 0.33;
  }
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v9 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:v5 animations:50.0 completion:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_3;
  v7[3] = &unk_1E6A89920;
  v7[4] = self;
  BOOL v8 = v3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v7 usingSpringWithDamping:0 initialSpringVelocity:v6 options:v5 animations:50.0 completion:0.0];
}

uint64_t __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyLayoutOfEntityAndWebsiteViewsExpanded:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyAlphaAndBlurToFirstEntityViewExpanded:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __77__CCUISensorAttributionExpandedViewController__animateEntityAndWebsiteViews___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyAlphaAndBlurToSubsequentEntityAndWebsiteViewsExpanded:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_animatePrivacyHeader:(BOOL)a3
{
  double v5 = 0.0;
  if (a3) {
    double v5 = 0.066;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke;
  v8[3] = &unk_1E6A89920;
  v8[4] = self;
  BOOL v9 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:v5 animations:50.0 completion:0.0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke_2;
  v6[3] = &unk_1E6A89920;
  v6[4] = self;
  BOOL v7 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
}

uint64_t __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyPrivacyHeaderAlphaAndBlurRadius:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __69__CCUISensorAttributionExpandedViewController__animatePrivacyHeader___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyPrivacyHeaderLayoutExpanded:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_animateTopmostSensorButton:(id)a3 toExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  BOOL v8 = (void *)MEMORY[0x1E4FB1EB0];
  if (v4)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke;
    v22[3] = &unk_1E6A898F8;
    id v9 = v6;
    id v23 = v9;
    [v8 animateWithDuration:4 delay:v22 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
    BOOL v10 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_2;
    v20[3] = &unk_1E6A898F8;
    id v21 = v9;
    id v11 = v9;
    [v10 animateWithDuration:4 delay:v20 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.10801964 animations:50.0 completion:0.0];

    BOOL v12 = v23;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_3;
    v18[3] = &unk_1E6A89968;
    v18[4] = self;
    id v13 = v6;
    id v19 = v13;
    [v8 animateWithDuration:4 delay:v18 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
    BOOL v14 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_4;
    v16[3] = &unk_1E6A898F8;
    id v17 = v13;
    id v15 = v13;
    [v14 animateWithDuration:4 delay:v16 usingSpringWithDamping:0 initialSpringVelocity:0.22 options:0.0 animations:50.0 completion:0.0];

    BOOL v12 = v19;
  }
}

void __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 cachedExpandedRect];
  objc_msgSend(v2, "setFrame:");
  id v3 = [*(id *)(a1 + 32) sensorIconView];
  [v3 setAlpha:1.0];
}

void __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) descriptionLabel];
  [v1 setAlpha:0.5];
}

uint64_t __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyCompactLayoutToSensorButton:*(void *)(a1 + 40)];
}

void __86__CCUISensorAttributionExpandedViewController__animateTopmostSensorButton_toExpanded___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) descriptionLabel];
  [v1 setAlpha:0.0];
}

- (void)_animateSubsequentSensorIcon:(id)a3 toExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  BOOL v8 = (void *)MEMORY[0x1E4FB1EB0];
  if (v4)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke;
    v30[3] = &unk_1E6A898F8;
    id v9 = v6;
    id v31 = v9;
    [v8 animateWithDuration:4 delay:v30 usingSpringWithDamping:0 initialSpringVelocity:0.540983607 options:0.04 animations:50.0 completion:0.0];
    BOOL v10 = (void *)MEMORY[0x1E4FB1EB0];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_2;
    v28[3] = &unk_1E6A898F8;
    id v11 = v9;
    id v29 = v11;
    [v10 animateWithDuration:4 delay:v28 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.1 animations:50.0 completion:0.0];
    BOOL v12 = (void *)MEMORY[0x1E4FB1EB0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_3;
    v26[3] = &unk_1E6A898F8;
    id v27 = v11;
    id v13 = v11;
    [v12 animateWithDuration:4 delay:v26 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.16 animations:50.0 completion:0.0];

    BOOL v14 = v31;
  }
  else
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_4;
    v24[3] = &unk_1E6A89968;
    v24[4] = self;
    id v15 = v6;
    id v25 = v15;
    [v8 animateWithDuration:4 delay:v24 usingSpringWithDamping:0 initialSpringVelocity:0.66 options:0.0 animations:50.0 completion:0.0];
    long long v16 = (void *)MEMORY[0x1E4FB1EB0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_5;
    v22[3] = &unk_1E6A898F8;
    id v17 = v15;
    id v23 = v17;
    [v16 animateWithDuration:4 delay:v22 usingSpringWithDamping:0 initialSpringVelocity:0.22 options:0.0 animations:50.0 completion:0.0];
    long long v18 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_6;
    v20[3] = &unk_1E6A898F8;
    id v21 = v17;
    id v19 = v17;
    [v18 animateWithDuration:4 delay:v20 usingSpringWithDamping:0 initialSpringVelocity:0.33 options:0.0 animations:50.0 completion:0.0];

    BOOL v14 = v25;
  }
}

uint64_t __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [v1 cachedExpandedRect];

  return objc_msgSend(v1, "setFrame:");
}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sensorIconView];
  [v1 setAlpha:1.0];
}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) descriptionLabel];
  [v1 setAlpha:0.5];
}

uint64_t __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyCompactLayoutToSensorButton:*(void *)(a1 + 40)];
}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sensorIconView];
  [v1 setAlpha:0.0];
}

void __87__CCUISensorAttributionExpandedViewController__animateSubsequentSensorIcon_toExpanded___block_invoke_6(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) descriptionLabel];
  [v1 setAlpha:0.0];
}

- (void)_applyAlphaAndBlurToFirstEntityViewExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NSArray *)self->_entityAndWebsiteViews firstObject];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = [(CCUISensorAttributionExpandedViewController *)self _applyAlphaAndStylingToEntityOrWebsiteView:v5 expanded:v3];
    uint64_t v6 = v7;
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_applyAlphaAndBlurToSubsequentEntityAndWebsiteViewsExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSArray *)self->_entityAndWebsiteViews firstObject];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_entityAndWebsiteViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (v11 != v5) {
          -[CCUISensorAttributionExpandedViewController _applyAlphaAndStylingToEntityOrWebsiteView:expanded:](self, "_applyAlphaAndStylingToEntityOrWebsiteView:expanded:", v11, v3, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_applySeparatorsLayoutExpanded:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v4 = self->_separatorViews;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [v9 cachedExpandedRect];
          objc_msgSend(v9, "setFrame:");
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl frame];
    double v11 = v10;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v4 = self->_separatorViews;
    uint64_t v12 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      double v14 = v11 + -5.0;
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        double v17 = v14;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v4);
          }
          long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
          objc_msgSend(v18, "cachedExpandedRect", (void)v19);
          CGRect v31 = CGRectInset(v30, 10.0, 0.0);
          double v14 = v17 + 10.0;
          objc_msgSend(v18, "setFrame:", v31.origin.x, v17, v31.size.width, v31.size.height);
          ++v16;
          double v17 = v17 + 10.0;
        }
        while (v13 != v16);
        uint64_t v13 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v13);
    }
  }
}

- (void)_applySeparatorAlphaExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = self->_separatorViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    if (v3) {
      double v8 = 0.5;
    }
    else {
      double v8 = 0.0;
    }
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setAlpha:", v8, (void)v10);
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_applyPrivacyHeaderLayoutExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CCUISensorAttributionExpandedViewController *)self privacyHeaderView];
  [v5 cachedExpandedRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = (long long *)MEMORY[0x1E4F1DAB8];
  privacyHeaderView = self->_privacyHeaderView;
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v59 = *MEMORY[0x1E4F1DAB8];
  long long v60 = v16;
  long long v61 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CCUISensorAttributionPrivacyHeaderView *)privacyHeaderView setTransform:&v59];
  if (v3)
  {
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_privacyHeaderView, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl frame];
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_privacyHeaderView, "setFrame:", v7, v17 + -10.0, v11, v13);
    long long v18 = self->_privacyHeaderView;
    CGAffineTransformMakeScale(&v58, 0.43, 0.43);
    [(CCUISensorAttributionPrivacyHeaderView *)v18 setTransform:&v58];
  }
  long long v19 = [(CCUISensorAttributionExpandedViewController *)self audioVideoHeaderView];
  [v19 cachedExpandedRect];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  audioVideoHeaderView = self->_audioVideoHeaderView;
  long long v29 = v14[1];
  long long v59 = *v14;
  long long v60 = v29;
  long long v61 = v14[2];
  [(CCUISensorAttributionPrivacyHeaderView *)audioVideoHeaderView setTransform:&v59];
  if (v3)
  {
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_audioVideoHeaderView, "setFrame:", v21, v23, v25, v27);
  }
  else
  {
    [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl frame];
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](self->_audioVideoHeaderView, "setFrame:", v21, v30 + -10.0, v25, v27);
    CGRect v31 = self->_audioVideoHeaderView;
    CGAffineTransformMakeScale(&v57, 0.43, 0.43);
    [(CCUISensorAttributionPrivacyHeaderView *)v31 setTransform:&v57];
  }
  v32 = [(CCUISensorAttributionExpandedViewController *)self audioVideoControlsView];
  [v32 cachedExpandedRect];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  audioVideoControlsView = self->_audioVideoControlsView;
  long long v42 = v14[1];
  long long v59 = *v14;
  long long v60 = v42;
  long long v61 = v14[2];
  [(CCUIAudioVideoControlsView *)audioVideoControlsView setTransform:&v59];
  -[CCUIAudioVideoControlsView setFrame:](self->_audioVideoControlsView, "setFrame:", v34, v36, v38, v40);
  objc_super v43 = [(CCUISensorAttributionExpandedViewController *)self gameModeFooterView];
  [v43 cachedExpandedRect];
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;

  gameModeFooterView = self->_gameModeFooterView;
  long long v53 = v14[1];
  long long v59 = *v14;
  long long v60 = v53;
  long long v61 = v14[2];
  [(CCUISensorAttributionGameModeFooterView *)gameModeFooterView setTransform:&v59];
  if (v3)
  {
    -[CCUISensorAttributionGameModeFooterView setFrame:](self->_gameModeFooterView, "setFrame:", v45, v47, v49, v51);
  }
  else
  {
    [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl frame];
    -[CCUISensorAttributionGameModeFooterView setFrame:](self->_gameModeFooterView, "setFrame:", v45, v54 + -10.0, v49, v51);
    v55 = self->_gameModeFooterView;
    CGAffineTransformMakeScale(&v56, 0.43, 0.43);
    [(CCUISensorAttributionGameModeFooterView *)v55 setTransform:&v56];
  }
}

- (void)_applyPrivacyHeaderAlphaAndBlurRadius:(BOOL)a3
{
  privacyHeaderView = self->_privacyHeaderView;
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 5.0;
  }
  if (a3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  if (a3) {
    double v7 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoHeaderView;
  }
  else {
    double v7 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__gameModeFooterView;
  }
  if (a3) {
    double v8 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoControlsView;
  }
  else {
    double v8 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoHeaderView;
  }
  if (a3) {
    double v9 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__gameModeFooterView;
  }
  else {
    double v9 = &OBJC_IVAR___CCUISensorAttributionExpandedViewController__audioVideoControlsView;
  }
  [(CCUISensorAttributionPrivacyHeaderView *)privacyHeaderView setBlurRadius:v5];
  [(CCUISensorAttributionPrivacyHeaderView *)self->_privacyHeaderView setAlpha:v6];
  uint64_t v10 = *v7;
  [*(id *)((char *)&self->super.super.super.isa + v10) setBlurRadius:v5];
  [*(id *)((char *)&self->super.super.super.isa + v10) setAlpha:v6];
  uint64_t v11 = *v8;
  [*(id *)((char *)&self->super.super.super.isa + v11) setBlurRadius:v5];
  [*(id *)((char *)&self->super.super.super.isa + v11) setAlpha:v6];
  uint64_t v12 = *v9;
  [*(id *)((char *)&self->super.super.super.isa + v12) setBlurRadius:v5];
  double v13 = *(Class *)((char *)&self->super.super.super.isa + v12);

  [v13 setAlpha:v6];
}

- (void)_applyLayoutOfEntityAndWebsiteViewsExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v5 = self->_entityAndWebsiteViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "cachedExpandedRect", (void)v26);
        if (v3)
        {
          [v10 cachedExpandedRect];
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
        }
        else
        {
          double v20 = v11;
          [v10 cachedExpandedRect];
          double v17 = v21;
          double v19 = v22;
          [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl frame];
          double v15 = v23;
          double v24 = [MEMORY[0x1E4FB1438] sharedApplication];
          if ([v24 userInterfaceLayoutDirection] == 1) {
            double v25 = -20.0;
          }
          else {
            double v25 = 20.0;
          }
          double v13 = v20 + v25;
        }
        objc_msgSend(v10, "setFrame:", v13, v15, v17, v19);
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }
}

- (void)_applyAlphaAndStylingToEntityOrWebsiteView:(id)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v8 = v5;
  double v6 = 1.0;
  if (v4)
  {
    double v7 = 0.0;
  }
  else
  {
    double v6 = 0.0;
    double v7 = 5.0;
  }
  [v5 setAlpha:v6];
  [v8 setBlurRadius:v7];
}

- (void)_applyCompactLayoutToSensorButton:(id)a3
{
  id v33 = a3;
  if (v33)
  {
    BOOL v4 = -[CCUISensorAttributionExpandedViewController _iconInCompactViewForSensorType:](self, "_iconInCompactViewForSensorType:", [v33 sensorType]);
    clonedCompactControl = self->_clonedCompactControl;
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(CCUISensorAttributionExpandedViewController *)self contentView];
    -[CCUISensorAttributionCompactControl convertRect:toView:](clonedCompactControl, "convertRect:toView:", v14, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;

    [v33 frame];
    double v20 = v19;
    double v22 = v21;
    double v23 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v24 = [v23 userInterfaceLayoutDirection];

    if (v24 == 1)
    {
      [v33 bounds];
      double v26 = v16 - v25;
      [v4 bounds];
      double v16 = v26 + v27;
    }
    [v33 bounds];
    double v29 = v28;
    double v30 = [v33 sensorIconView];
    [v30 bounds];
    double v32 = v29 - v31;

    objc_msgSend(v33, "setFrame:", v16, v18 + v32 * -0.5, v20, v22);
  }
}

- (void)_applyCompactAlphaForSensorButton:(id)a3 isTopMost:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = [v5 descriptionLabel];
  [v6 setAlpha:0.0];

  id v8 = [v5 sensorIconView];

  double v7 = 0.329;
  if (!v4) {
    double v7 = 0.0;
  }
  [v8 setAlpha:v7];
}

- (void)_applyCompactAppearanceToAllViews
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(CCUISensorAttributionExpandedViewController *)self _applyLayoutOfEntityAndWebsiteViewsExpanded:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v3 = self->_entityAndWebsiteViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) setAlpha:0.0];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v5);
  }

  [(CCUISensorAttributionExpandedViewController *)self _applySeparatorsLayoutExpanded:0];
  [(CCUISensorAttributionExpandedViewController *)self _applySeparatorAlphaExpanded:0];
  [(CCUISensorAttributionExpandedViewController *)self _applyPrivacyHeaderLayoutExpanded:0];
  [(CCUISensorAttributionExpandedViewController *)self _applyPrivacyHeaderAlphaAndBlurRadius:0];
  id v8 = [(CCUISensorAttributionExpandedViewController *)self _topMostButtons];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        [(CCUISensorAttributionExpandedViewController *)self _applyCompactLayoutToSensorButton:v13];
        [(CCUISensorAttributionExpandedViewController *)self _applyCompactAlphaForSensorButton:v13 isTopMost:1];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v10);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v14 = self->_subsequentSensorButtons;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v20 + 1) + 8 * k);
        -[CCUISensorAttributionExpandedViewController _applyCompactLayoutToSensorButton:](self, "_applyCompactLayoutToSensorButton:", v19, (void)v20);
        [(CCUISensorAttributionExpandedViewController *)self _applyCompactAlphaForSensorButton:v19 isTopMost:0];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v16);
  }
}

- (void)_showClonedCompactControl:(id)a3
{
  uint64_t v4 = (CCUISensorAttributionCompactControl *)a3;
  [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl removeFromSuperview];
  clonedCompactControl = self->_clonedCompactControl;
  self->_clonedCompactControl = v4;
  uint64_t v11 = v4;

  uint64_t v6 = [(CCUISensorAttributionExpandedViewController *)self contentView];
  [v6 addSubview:v11];

  [(CCUISensorAttributionCompactControl *)v11 setNeedsLayout];
  [(CCUISensorAttributionCompactControl *)v11 layoutIfNeeded];
  double v7 = [(CCUISensorAttributionExpandedViewController *)self contentView];
  [v7 bounds];
  double v9 = v8 * 0.5;

  [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl center];
  [(CCUISensorAttributionCompactControl *)v11 setCenter:v9];
  uint64_t v10 = [(CCUISensorAttributionExpandedViewController *)self contentView];
  [v10 bringSubviewToFront:v11];

  [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl setHidden:0];
}

- (void)_removeClonedCompactPillViewAndNotifyDelegate
{
  self->_prepared = 0;
  [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl removeFromSuperview];
  clonedCompactControl = self->_clonedCompactControl;
  self->_clonedCompactControl = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didCloseExpandedSensorAttributionViewController];
}

- (void)_recreateViewsForAttributionsAndCacheExpandedFrames
{
  v2 = self;
  uint64_t v302 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CCUISensorAttributionExpandedViewController *)self traitCollection];
  uint64_t v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  uint64_t v5 = [(CCUISensorAttributionExpandedViewController *)v2 traitCollection];
  [v5 displayScale];
  uint64_t v232 = v6;

  double v7 = v2->_activeAndRecentSensorActivityData;
  CCUIUniqueSensorAttributionEntitiesForSensorActivityData(v7);
  long long v289 = 0u;
  long long v290 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v289 objects:v301 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v254 = 0;
    char v10 = 0;
    uint64_t v11 = *(void *)v290;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v290 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = CCUISortedAttributionsForEntity(*(void **)(*((void *)&v289 + 1) + 8 * i), v7);
        long long v285 = 0u;
        long long v286 = 0u;
        long long v287 = 0u;
        long long v288 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v285 objects:v300 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v286;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v286 != v16) {
                objc_enumerationMutation(v13);
              }
              BOOL v18 = CCUISectionForSensorType(objc_msgSend(*(id *)(*((void *)&v285 + 1) + 8 * j), "sensorType", v232));
              if (v18)
              {
                char v254 = 1;
              }
              else if (!v18)
              {
                char v10 = 1;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v285 objects:v300 count:16];
          }
          while (v15);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v289 objects:v301 count:16];
    }
    while (v9);
  }
  else
  {
    char v254 = 0;
    char v10 = 0;
  }

  -[UIScrollView setContentOffset:animated:](v2->_scrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  long long v283 = 0u;
  long long v284 = 0u;
  long long v281 = 0u;
  long long v282 = 0u;
  uint64_t v19 = [(UIScrollView *)v2->_scrollView subviews];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v281 objects:v299 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v282;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v282 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v281 + 1) + 8 * k);
        if (v24 != v2->_privacyHeaderView
          && v24 != v2->_gameModeFooterView
          && v24 != v2->_audioVideoHeaderView
          && v24 != v2->_audioVideoControlsView)
        {
          [v24 removeFromSuperview];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v281 objects:v299 count:16];
    }
    while (v21);
  }

  topMostCameraButtouint64_t n = v2->_topMostCameraButton;
  v2->_topMostCameraButtouint64_t n = 0;

  topMostMicButtouint64_t n = v2->_topMostMicButton;
  v2->_topMostMicButtouint64_t n = 0;

  topMostLocButtouint64_t n = v2->_topMostLocButton;
  v2->_topMostLocButtouint64_t n = 0;

  v253 = [MEMORY[0x1E4F1CA48] array];
  v247 = [MEMORY[0x1E4F1CA48] array];
  v243 = [MEMORY[0x1E4F1CA48] array];
  v252 = [MEMORY[0x1E4F1CA48] array];
  privacyHeaderView = v2->_privacyHeaderView;
  unint64_t v29 = 0x1E4FB1000uLL;
  p_isa = (id *)&v2->super.super.super.isa;
  v242 = v7;
  if (v10)
  {
    long long v30 = [(CCUISensorAttributionExpandedViewController *)v2 scrollView];
    [v30 bounds];
    double v32 = v31;
    double v34 = v33;
    LODWORD(v31) = 1148846080;
    LODWORD(v33) = 1132068864;
    -[CCUISensorAttributionPrivacyHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](privacyHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v32, v34, v31, v33);
    double v36 = v35;
    double v38 = v37;

    double v39 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v40 = 2.0;
    if ([v39 userInterfaceLayoutDirection] == 1)
    {
      v41 = [(CCUISensorAttributionExpandedViewController *)v2 scrollView];
      [v41 bounds];
      double v40 = v42 - v36 + -2.0;
    }
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](v2->_privacyHeaderView, "setFrame:", v40, 80.0, v36, v38);
    -[CCUISensorAttributionPrivacyHeaderView setCachedExpandedRect:](v2->_privacyHeaderView, "setCachedExpandedRect:", v40, 80.0, v36, v38);
    [(CCUISensorAttributionPrivacyHeaderView *)v2->_privacyHeaderView setHidden:0];
    v303.origin.x = v40;
    v303.origin.y = 80.0;
    v303.size.width = v36;
    v303.size.height = v38;
    long long v277 = 0u;
    long long v278 = 0u;
    double v43 = CGRectGetMaxY(v303) + 25.0;
    long long v279 = 0u;
    long long v280 = 0u;
    id v233 = obj;
    uint64_t v235 = [v233 countByEnumeratingWithState:&v277 objects:v298 count:16];
    if (v235)
    {
      uint64_t v234 = *(void *)v278;
      do
      {
        for (uint64_t m = 0; m != v235; ++m)
        {
          if (*(void *)v278 != v234) {
            objc_enumerationMutation(v233);
          }
          double v45 = *(void **)(*((void *)&v277 + 1) + 8 * m);
          double v46 = CCUISortedAttributionsForEntity(v45, v7);
          long long v273 = 0u;
          long long v274 = 0u;
          long long v275 = 0u;
          long long v276 = 0u;
          id v47 = v46;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v273 objects:v297 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v274;
            while (2)
            {
              for (uint64_t n = 0; n != v49; ++n)
              {
                if (*(void *)v274 != v50) {
                  objc_enumerationMutation(v47);
                }
                if (!CCUISectionForSensorType(objc_msgSend(*(id *)(*((void *)&v273 + 1) + 8 * n), "sensorType", v232)))
                {

                  long long v53 = [(CCUISensorAttributionExpandedViewController *)v2 _makeHeaderSeparatorView];
                  double v54 = [(CCUISensorAttributionExpandedViewController *)v2 contentView];
                  [v54 bounds];
                  double v56 = v55;

                  objc_msgSend(v53, "setFrame:", 0.0, v43 + -15.0, v56, 1.0);
                  [v53 frame];
                  objc_msgSend(v53, "setCachedExpandedRect:");
                  [v243 addObject:v53];
                  v237 = v53;
                  [(UIScrollView *)v2->_scrollView addSubview:v53];
                  CGAffineTransform v57 = [(CCUISensorAttributionExpandedViewController *)v2 contentView];
                  [v57 bounds];
                  double v59 = v58;
                  if (!IsAccessibilityCategory)
                  {
                    UIRoundToScale();
                    double v59 = v60;
                  }

                  double v61 = v59 + -10.0;
                  +[CCUISensorEntityNameAndIconView iconSize];
                  double v63 = v62
                      * (double)(+[CCUISensorEntityNameAndIconView maximumNumberOfLines]+ 1);
                  v64 = -[CCUISensorEntityNameAndIconView initWithSensorEntity:maxSize:]([CCUISensorEntityNameAndIconView alloc], "initWithSensorEntity:maxSize:", v45, v59 + -10.0, v63);
                  id v65 = objc_alloc_init(MEMORY[0x1E4FB1938]);
                  [(CCUISensorEntityNameAndIconView *)v64 addInteraction:v65];

                  [v253 addObject:v64];
                  [(UIScrollView *)v2->_scrollView addSubview:v64];
                  [(CCUISensorEntityNameAndIconView *)v64 frame];
                  double v67 = v66;
                  double v69 = v68;
                  v70 = [*(id *)(v29 + 1080) sharedApplication];
                  uint64_t v71 = [v70 userInterfaceLayoutDirection];

                  double v72 = 2.0;
                  if (v71 == 1)
                  {
                    v73 = [(CCUISensorAttributionExpandedViewController *)v2 contentView];
                    [v73 bounds];
                    double v72 = v74 - v67 + -2.0;
                  }
                  uint64_t v240 = m;
                  -[CCUISensorEntityNameAndIconView setFrame:](v64, "setFrame:", v72, v43, v67, v69);
                  -[CCUISensorEntityNameAndIconView setCachedExpandedRect:](v64, "setCachedExpandedRect:", v72, v43, v67, v69);
                  v250 = [MEMORY[0x1E4F1CA80] set];
                  BOOL v75 = IsAccessibilityCategory;
                  if (!IsAccessibilityCategory) {
                    double v59 = v59 + 5.0;
                  }
                  double v76 = 0.0;
                  double v77 = 0.0;
                  if (!IsAccessibilityCategory)
                  {
                    v78 = [*(id *)(v29 + 1080) sharedApplication];
                    if ([v78 userInterfaceLayoutDirection] == 1) {
                      double v77 = 0.0;
                    }
                    else {
                      double v77 = v61;
                    }
                  }
                  long long v271 = 0u;
                  long long v272 = 0u;
                  long long v269 = 0u;
                  long long v270 = 0u;
                  id v238 = v47;
                  id v79 = v47;
                  uint64_t v80 = [v79 countByEnumeratingWithState:&v269 objects:v296 count:16];
                  if (v80)
                  {
                    uint64_t v81 = v80;
                    int v82 = 0;
                    uint64_t v83 = *(void *)v270;
                    v84 = v250;
                    v248 = v64;
                    do
                    {
                      for (iuint64_t i = 0; ii != v81; ++ii)
                      {
                        if (*(void *)v270 != v83) {
                          objc_enumerationMutation(v79);
                        }
                        v86 = *(void **)(*((void *)&v269 + 1) + 8 * ii);
                        if (!CCUISectionForSensorType([v86 sensorType]))
                        {
                          v87 = [v86 website];

                          if (v87)
                          {
                            [(CCUISensorEntityNameAndIconView *)v64 frame];
                            if (v43 < CGRectGetMaxY(v304))
                            {
                              [(CCUISensorEntityNameAndIconView *)v64 frame];
                              double v89 = v88;
                              [(id)objc_opt_class() iconSize];
                              double v43 = v43 + v89 - v90;
                            }
                            if (![v84 count])
                            {
                              v91 = [v79 firstObject];

                              if (v86 == v91) {
                                double v43 = v43 + 25.0;
                              }
                            }
                            v92 = [v86 website];
                            v93 = v84;
                            char v94 = [v84 containsObject:v92];

                            if ((v94 & 1) == 0)
                            {
                              v95 = [v86 website];
                              [v93 addObject:v95];

                              v96 = [p_isa contentView];
                              [v96 bounds];
                              double v98 = v97;

                              +[CCUISensorEntityNameAndIconView iconSize];
                              double v100 = v99 + 2.0;
                              +[CCUISensorEntityNameAndIconView horizontalPaddingBetweenIconAndLabel];
                              double v102 = v100 + v101;
                              v103 = [MEMORY[0x1E4FB1438] sharedApplication];
                              uint64_t v104 = [v103 userInterfaceLayoutDirection];

                              double v105 = v98 - v102 - (v98 * 0.5 + 5.0 + 5.0);
                              if (v104 == 1) {
                                double v106 = v98 * 0.5 + 5.0 + 5.0;
                              }
                              else {
                                double v106 = v102;
                              }
                              if (v104 == 1) {
                                double v107 = v105;
                              }
                              else {
                                double v107 = v77 + -5.0 - v102;
                              }
                              v108 = -[CCUISensorAttributionWebsiteView initWithSensorActivityData:maxSize:]([CCUISensorAttributionWebsiteView alloc], "initWithSensorActivityData:maxSize:", v86, v107, 20.0);
                              BOOL v75 = IsAccessibilityCategory;
                              [p_isa[128] addSubview:v108];
                              -[CCUISensorAttributionWebsiteView setFrame:](v108, "setFrame:", v106, v43, v107, 20.0);
                              -[CCUISensorAttributionWebsiteView setCachedExpandedRect:](v108, "setCachedExpandedRect:", v106, v43, v107, 20.0);
                              [v253 addObject:v108];
                            }
                            v64 = v248;
                          }
                          v109 = [[CCUISensorAttributionSensorButton alloc] initWithSensorActivityData:v86];
                          id v110 = objc_alloc_init(MEMORY[0x1E4FB1938]);
                          [(CCUISensorAttributionSensorButton *)v109 addInteraction:v110];

                          if (([p_isa _cacheTopmostSensorButtonIfNotAlreadySet:v109 sensorData:v86] & 1) == 0) {
                            [v247 addObject:v109];
                          }
                          if (v82) {
                            BOOL v111 = 0;
                          }
                          else {
                            BOOL v111 = v75;
                          }
                          if (v111)
                          {
                            [(CCUISensorEntityNameAndIconView *)v64 bounds];
                            double v43 = v43 + v112;
                          }
                          v84 = v250;
                          -[CCUISensorAttributionSensorButton sizeThatFits:](v109, "sizeThatFits:", v59, v63);
                          double v114 = v113;
                          double v115 = 0.0;
                          if (!v75)
                          {
                            [(id)objc_opt_class() iconSize];
                            double v115 = (v116 - v114) * 0.5;
                          }
                          -[CCUISensorAttributionSensorButton setFrame:](v109, "setFrame:", v77, v43 + v115, v59, v114);
                          -[CCUISensorAttributionSensorButton setCachedExpandedRect:](v109, "setCachedExpandedRect:", v77, v43 + v115, v59, v114);
                          [(CCUISensorAttributionSensorButton *)v109 bounds];
                          double v76 = v43 + v115 + v117 + 5.0;
                          [p_isa[128] addSubview:v109];
                          ++v82;

                          double v43 = v76;
                        }
                      }
                      uint64_t v81 = [v79 countByEnumeratingWithState:&v269 objects:v296 count:16];
                    }
                    while (v81);
                  }

                  [(CCUISensorEntityNameAndIconView *)v64 frame];
                  if (v76 < CGRectGetMaxY(v305))
                  {
                    [(CCUISensorEntityNameAndIconView *)v64 frame];
                    double v43 = v43 + CGRectGetMaxY(v306) - v76;
                  }
                  unint64_t v29 = 0x1E4FB1000;
                  id v47 = v238;
                  uint64_t m = v240;
                  v52 = v237;
                  double v43 = v43 + 25.0;

                  v2 = (CCUISensorAttributionExpandedViewController *)p_isa;
                  double v7 = v242;
                  goto LABEL_97;
                }
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v273 objects:v297 count:16];
              if (v49) {
                continue;
              }
              break;
            }
          }
          v52 = v47;
LABEL_97:
        }
        uint64_t v235 = [v233 countByEnumeratingWithState:&v277 objects:v298 count:16];
      }
      while (v235);
    }

    double v118 = v43 + -25.0 + 25.0;
  }
  else
  {
    [(CCUISensorAttributionPrivacyHeaderView *)privacyHeaderView setHidden:1];
    double v118 = 80.0;
  }
  if (([(CCUISensorAttributionPrivacyHeaderView *)v2->_audioVideoHeaderView isHidden] & 1) == 0)
  {
    audioVideoHeaderView = v2->_audioVideoHeaderView;
    v120 = [(CCUISensorAttributionExpandedViewController *)v2 scrollView];
    [v120 bounds];
    double v122 = v121;
    double v124 = v123;
    LODWORD(v121) = 1148846080;
    LODWORD(v123) = 1132068864;
    -[CCUISensorAttributionPrivacyHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](audioVideoHeaderView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v122, v124, v121, v123);
    double v126 = v125;
    double v128 = v127;

    v129 = [*(id *)(v29 + 1080) sharedApplication];
    double v130 = 2.0;
    if ([v129 userInterfaceLayoutDirection] == 1)
    {
      v131 = [(CCUISensorAttributionExpandedViewController *)v2 scrollView];
      [v131 bounds];
      double v130 = v132 - v126 + -2.0;
    }
    -[CCUISensorAttributionPrivacyHeaderView setFrame:](v2->_audioVideoHeaderView, "setFrame:", v130, v118, v126, v128);
    -[CCUISensorAttributionPrivacyHeaderView setCachedExpandedRect:](v2->_audioVideoHeaderView, "setCachedExpandedRect:", v130, v118, v126, v128);
    double v133 = v118 + v128 + 25.0;
    v134 = [(CCUISensorAttributionExpandedViewController *)v2 _makeHeaderSeparatorView];
    v135 = [(CCUISensorAttributionExpandedViewController *)v2 contentView];
    [v135 bounds];
    double v137 = v136;

    objc_msgSend(v134, "setFrame:", 0.0, v133 + -15.0, v137, 1.0);
    [v134 frame];
    objc_msgSend(v134, "setCachedExpandedRect:");
    [v243 addObject:v134];
    [(UIScrollView *)v2->_scrollView addSubview:v134];
    v138 = [(CCUISensorAttributionExpandedViewController *)v2 scrollView];
    [v138 bounds];
    double v140 = v139;

    id WeakRetained = objc_loadWeakRetained((id *)&v2->_audioControlsView);
    if (WeakRetained
      && (v142 = WeakRetained,
          id v143 = objc_loadWeakRetained((id *)&v2->_videoControlsView),
          v143,
          v142,
          v143))
    {
      v144 = [(CCUISensorAttributionExpandedViewController *)v2 audioControlsContentViewController];
      v145 = [(CCUISensorAttributionExpandedViewController *)v2 videoControlsContentViewController];
      v146 = [v144 view];
      v147 = [v145 view];
      [v146 intrinsicContentSize];
      double v149 = v148;
      [v147 intrinsicContentSize];
      double v151 = v150;
      [v252 addObject:v146];
      [v252 addObject:v147];
      double v152 = v140 + 0.0;
      -[CCUIAudioVideoControlsView setFrame:](v2->_audioVideoControlsView, "setFrame:");
      -[CCUIAudioVideoControlsView setCachedExpandedRect:](v2->_audioVideoControlsView, "setCachedExpandedRect:", 0.0, v133, v152, v151 + v149 + 0.0 + 20.0);
      id v153 = objc_loadWeakRetained((id *)&v2->_audioControlsContainerView);
      objc_msgSend(v153, "setFrame:", 0.0, 0.0, v152, v149);

      id v154 = objc_loadWeakRetained((id *)&v2->_videoControlsContainerView);
      objc_msgSend(v154, "setFrame:", 0.0, v149 + 0.0 + 20.0, v152, v151);

      [(CCUIAudioVideoControlsView *)v2->_audioVideoControlsView frame];
      double v133 = v133 + v155;

      double v7 = v242;
    }
    else
    {
      -[CCUIAudioVideoControlsView setFrame:](v2->_audioVideoControlsView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    double v118 = v133 + 25.0;
  }
  if (v254)
  {
    long long v267 = 0u;
    long long v268 = 0u;
    long long v265 = 0u;
    long long v266 = 0u;
    id v156 = obj;
    uint64_t v244 = [v156 countByEnumeratingWithState:&v265 objects:v295 count:16];
    if (v244)
    {
      char v157 = 0;
      id v239 = v156;
      uint64_t v241 = *(void *)v266;
      do
      {
        for (juint64_t j = 0; jj != v244; ++jj)
        {
          if (*(void *)v266 != v241) {
            objc_enumerationMutation(v239);
          }
          v159 = *(void **)(*((void *)&v265 + 1) + 8 * jj);
          v160 = CCUISortedAttributionsForEntity(v159, v7);
          long long v261 = 0u;
          long long v262 = 0u;
          long long v263 = 0u;
          long long v264 = 0u;
          v161 = v160;
          uint64_t v162 = [(CCUISensorEntityHeaderView *)v161 countByEnumeratingWithState:&v261 objects:v294 count:16];
          if (v162)
          {
            uint64_t v163 = v162;
            v255 = v161;
            uint64_t v251 = jj;
            uint64_t v164 = *(void *)v262;
            while (2)
            {
              for (kuint64_t k = 0; kk != v163; ++kk)
              {
                if (*(void *)v262 != v164) {
                  objc_enumerationMutation(v255);
                }
                if (CCUISectionForSensorType([*(id *)(*((void *)&v261 + 1) + 8 * kk) sensorType]))
                {

                  v167 = [(CCUISensorAttributionExpandedViewController *)v2 contentView];
                  [v167 bounds];
                  double v169 = v168;

                  +[CCUISensorEntityHeaderView iconSize];
                  v171 = -[CCUISensorEntityHeaderView initWithSensorEntity:maxSize:]([CCUISensorEntityHeaderView alloc], "initWithSensorEntity:maxSize:", v159, v169 + -10.0, v170* (double)(+[CCUISensorEntityHeaderView maximumNumberOfLines](CCUISensorEntityHeaderView, "maximumNumberOfLines")+ 1));
                  id v172 = objc_alloc_init(MEMORY[0x1E4FB1938]);
                  [(CCUISensorEntityHeaderView *)v171 addInteraction:v172];

                  [v253 addObject:v171];
                  [(UIScrollView *)v2->_scrollView addSubview:v171];
                  [(CCUISensorEntityHeaderView *)v171 frame];
                  double v174 = v173;
                  double v176 = v175;
                  v177 = [MEMORY[0x1E4FB1438] sharedApplication];
                  uint64_t v178 = [v177 userInterfaceLayoutDirection];

                  double v179 = 2.0;
                  if (v178 == 1)
                  {
                    v180 = [(CCUISensorAttributionExpandedViewController *)v2 contentView];
                    [v180 bounds];
                    double v179 = v181 - v174 + -2.0;
                  }
                  -[CCUISensorEntityHeaderView setFrame:](v171, "setFrame:", v179, v118, v174, v176);
                  v249 = v171;
                  -[CCUISensorEntityHeaderView setCachedExpandedRect:](v171, "setCachedExpandedRect:", v179, v118, v174, v176);
                  double v118 = v118 + v176 + 25.0;
                  v182 = [(CCUISensorAttributionExpandedViewController *)v2 _makeHeaderSeparatorView];
                  v183 = [(CCUISensorAttributionExpandedViewController *)v2 contentView];
                  [v183 bounds];
                  double v185 = v184;

                  objc_msgSend(v182, "setFrame:", 0.0, v118 + -15.0, v185, 1.0);
                  [v182 frame];
                  objc_msgSend(v182, "setCachedExpandedRect:");
                  [v243 addObject:v182];
                  v246 = v182;
                  [(UIScrollView *)v2->_scrollView addSubview:v182];
                  long long v259 = 0u;
                  long long v260 = 0u;
                  long long v257 = 0u;
                  long long v258 = 0u;
                  v186 = v255;
                  uint64_t v187 = [(CCUISensorEntityHeaderView *)v186 countByEnumeratingWithState:&v257 objects:v293 count:16];
                  if (v187)
                  {
                    uint64_t v188 = v187;
                    uint64_t v189 = *(void *)v258;
                    do
                    {
                      for (muint64_t m = 0; mm != v188; ++mm)
                      {
                        if (*(void *)v258 != v189) {
                          objc_enumerationMutation(v186);
                        }
                        v191 = *(void **)(*((void *)&v257 + 1) + 8 * mm);
                        if ([v191 sensorType] == 3)
                        {
                          v192 = [CCUIGameModeControlsView alloc];
                          id v193 = objc_loadWeakRetained(p_isa + 140);
                          v194 = [p_isa contentView];
                          [v194 bounds];
                          v195 = -[CCUIGameModeControlsView initWithProvider:activityData:frame:](v192, "initWithProvider:activityData:frame:", v193, v191, 0.0, v118);

                          [(CCUIGameModeControlsView *)v195 frame];
                          double v197 = v196;
                          double v199 = v198;
                          double v201 = v200;
                          double v203 = v202;
                          -[CCUIGameModeControlsView setFrame:](v195, "setFrame:");
                          -[CCUIGameModeControlsView setCachedExpandedRect:](v195, "setCachedExpandedRect:", v197, v199, v201, v203);
                          id v204 = objc_alloc_init(MEMORY[0x1E4FB1938]);
                          [(CCUIGameModeControlsView *)v195 addInteraction:v204];

                          [v252 addObject:v195];
                          [v253 addObject:v195];
                          [p_isa[128] addSubview:v195];
                          [(CCUIGameModeControlsView *)v195 bounds];
                          double v118 = v118 + v205 + 25.0;

                          char v157 = 1;
                        }
                      }
                      uint64_t v188 = [(CCUISensorEntityHeaderView *)v186 countByEnumeratingWithState:&v257 objects:v293 count:16];
                    }
                    while (v188);
                  }

                  v161 = v255;
                  v2 = (CCUISensorAttributionExpandedViewController *)p_isa;
                  double v7 = v242;
                  v166 = v249;
                  juint64_t j = v251;
                  goto LABEL_137;
                }
              }
              uint64_t v163 = [(CCUISensorEntityHeaderView *)v255 countByEnumeratingWithState:&v261 objects:v294 count:16];
              if (v163) {
                continue;
              }
              break;
            }
            v161 = v255;
            v166 = v255;
            juint64_t j = v251;
          }
          else
          {
            v166 = v161;
          }
LABEL_137:
        }
        uint64_t v244 = [v239 countByEnumeratingWithState:&v265 objects:v295 count:16];
      }
      while (v244);

      if (v157)
      {
        v206 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v207 = [v206 localizedStringForKey:@"CONTROL_CENTER_GAME_MODE_HINT" value:&stru_1F2F34F20 table:@"ControlCenterUI"];

        [(CCUISensorAttributionGameModeFooterView *)v2->_gameModeFooterView setText:v207];
        gameModeFooterView = v2->_gameModeFooterView;
        v209 = [(CCUISensorAttributionExpandedViewController *)v2 scrollView];
        [v209 bounds];
        double v211 = v210;
        double v213 = v212;
        LODWORD(v210) = 1148846080;
        LODWORD(v212) = 1132068864;
        -[CCUISensorAttributionGameModeFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](gameModeFooterView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v211, v213, v210, v212);
        double v215 = v214;
        double v217 = v216;

        v218 = [MEMORY[0x1E4FB1438] sharedApplication];
        double v219 = 2.0;
        if ([v218 userInterfaceLayoutDirection] == 1)
        {
          v220 = [(CCUISensorAttributionExpandedViewController *)v2 scrollView];
          [v220 bounds];
          double v219 = v221 - v215 + -2.0;
        }
        -[CCUISensorAttributionGameModeFooterView setFrame:](v2->_gameModeFooterView, "setFrame:", v219, v118, v215, v217);
        -[CCUISensorAttributionGameModeFooterView setCachedExpandedRect:](v2->_gameModeFooterView, "setCachedExpandedRect:", v219, v118, v215, v217);
        [(CCUISensorAttributionGameModeFooterView *)v2->_gameModeFooterView setHidden:0];
        double v118 = v118 + v217;

        goto LABEL_146;
      }
    }
    else
    {
    }
    [(CCUISensorAttributionGameModeFooterView *)v2->_gameModeFooterView setHidden:1];
LABEL_146:
    double v118 = v118 + 25.0;
    goto LABEL_147;
  }
  [(CCUISensorAttributionGameModeFooterView *)v2->_gameModeFooterView setHidden:1];
LABEL_147:
  scrollView = v2->_scrollView;
  [(UIScrollView *)scrollView bounds];
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v223, v118);
  uint64_t v224 = [v253 copy];
  entityAndWebsiteViews = v2->_entityAndWebsiteViews;
  v2->_entityAndWebsiteViews = (NSArray *)v224;

  uint64_t v226 = [v247 copy];
  subsequentSensorButtons = v2->_subsequentSensorButtons;
  v2->_subsequentSensorButtons = (NSArray *)v226;

  uint64_t v228 = [v243 copy];
  separatorViews = v2->_separatorViews;
  v2->_separatorViews = (NSArray *)v228;

  uint64_t v230 = [v252 copy];
  interactiveViews = v2->_interactiveViews;
  v2->_interactiveViews = (NSArray *)v230;
}

- (BOOL)_cacheTopmostSensorButtonIfNotAlreadySet:(id)a3 sensorData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 sensorType] || self->_topMostCameraButton)
  {
    BOOL v9 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_topMostCameraButton, a3);
    BOOL v9 = 1;
  }
  if ([v8 sensorType] == 1 && !self->_topMostMicButton)
  {
    objc_storeStrong((id *)&self->_topMostMicButton, a3);
    BOOL v9 = 1;
  }
  if ([v8 sensorType] == 2 && !self->_topMostLocButton)
  {
    objc_storeStrong((id *)&self->_topMostLocButton, a3);
    BOOL v9 = 1;
  }

  return v9;
}

- (id)_iconInCompactViewForSensorType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v5 = [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl cameraIndicatorView];
      goto LABEL_9;
    case 1uLL:
      uint64_t v5 = [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl micIndicatorView];
      goto LABEL_9;
    case 2uLL:
      uint64_t v5 = [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl locationIndicatorView];
      goto LABEL_9;
    case 3uLL:
      uint64_t v5 = [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl gameModeIndicatorView];
LABEL_9:
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (id)_topMostButtons
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = v3;
  if (self->_topMostCameraButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_topMostMicButton) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_topMostLocButton) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (id)_makeHeaderSeparatorView
{
  v2 = objc_alloc_init(_CCUIPositionRememberingSeparator);
  uint64_t v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [(_CCUIPositionRememberingSeparator *)v2 setBackgroundColor:v3];

  uint64_t v4 = [(_CCUIPositionRememberingSeparator *)v2 layer];
  [v4 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  uint64_t v5 = [(_CCUIPositionRememberingSeparator *)v2 layer];
  [v5 setCornerRadius:0.5];

  uint64_t v6 = [(_CCUIPositionRememberingSeparator *)v2 layer];
  [v6 setCompositingFilter:*MEMORY[0x1E4F3A2C8]];

  id v7 = [(_CCUIPositionRememberingSeparator *)v2 layer];
  [v7 setAllowsGroupBlending:0];

  [(_CCUIPositionRememberingSeparator *)v2 setAlpha:0.0];

  return v2;
}

- (void)_reduceMotionPrepareForPresentation
{
  uint64_t v3 = [(CCUISensorAttributionExpandedViewController *)self contentView];
  [v3 setAlpha:0.0];

  [(MTMaterialView *)self->_materialView setAlpha:0.0];
  [(CCUISensorAttributionCompactControl *)self->_clonedCompactControl setAlpha:0.0];
  [(CCUISensorAttributionPrivacyHeaderView *)self->_privacyHeaderView setBlurRadius:0.0];
  [(CCUISensorAttributionPrivacyHeaderView *)self->_privacyHeaderView setAlpha:1.0];
  [(CCUISensorAttributionPrivacyHeaderView *)self->_audioVideoHeaderView setBlurRadius:0.0];
  [(CCUISensorAttributionPrivacyHeaderView *)self->_audioVideoHeaderView setAlpha:1.0];
  [(CCUISensorAttributionGameModeFooterView *)self->_gameModeFooterView setBlurRadius:0.0];
  [(CCUISensorAttributionGameModeFooterView *)self->_gameModeFooterView setAlpha:1.0];
  [(MTMaterialView *)self->_materialView setWeighting:1.0];
  [(CCUISensorAttributionExpandedViewController *)self _applyPrivacyHeaderLayoutExpanded:1];
  [(CCUISensorAttributionExpandedViewController *)self _applySeparatorAlphaExpanded:1];

  [(CCUISensorAttributionExpandedViewController *)self _applySeparatorsLayoutExpanded:1];
}

- (void)_reduceMotionSetExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke;
  aBlock[3] = &unk_1E6A89920;
  BOOL v12 = a3;
  aBlock[4] = self;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke_2;
  v9[3] = &unk_1E6A8A660;
  BOOL v10 = a3;
  void v9[4] = self;
  id v8 = (void (**)(void *, uint64_t))_Block_copy(v9);
  if (v4)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v8 completion:0.33];
  }
  else
  {
    v7[2](v7);
    v8[2](v8, 1);
  }
}

void __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)*(unint64_t *)&a2;
  BOOL v4 = [*(id *)(a1 + 32) contentView];
  [v4 setAlpha:v3];

  id v5 = [*(id *)(a1 + 32) materialView];
  [v5 setAlpha:v3];
}

uint64_t __81__CCUISensorAttributionExpandedViewController__reduceMotionSetExpanded_animated___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _removeClonedCompactPillViewAndNotifyDelegate];
  }
  return result;
}

- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4
{
  return 1;
}

- (CCUIHeaderPocketViewSensorAttributionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUIHeaderPocketViewSensorAttributionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  bottouint64_t m = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.bottouint64_t m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CCUISensorActivityData)audioVideoModeSelectionAttribution
{
  return self->_audioVideoModeSelectionAttribution;
}

- (UITapGestureRecognizer)dismissTapGestureRecognizer
{
  return self->_dismissTapGestureRecognizer;
}

- (void)setDismissTapGestureRecognizer:(id)a3
{
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (CCUISensorAttributionCompactControl)clonedCompactControl
{
  return self->_clonedCompactControl;
}

- (void)setClonedCompactControl:(id)a3
{
}

- (CCUISensorAttributionPrivacyHeaderView)privacyHeaderView
{
  return self->_privacyHeaderView;
}

- (void)setPrivacyHeaderView:(id)a3
{
}

- (CCUISensorAttributionPrivacyHeaderView)audioVideoHeaderView
{
  return self->_audioVideoHeaderView;
}

- (void)setAudioVideoHeaderView:(id)a3
{
}

- (CCUIAudioVideoControlsView)audioVideoControlsView
{
  return self->_audioVideoControlsView;
}

- (void)setAudioVideoControlsView:(id)a3
{
}

- (CCUIContentModuleContentViewController)audioControlsContentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioControlsContentViewController);

  return (CCUIContentModuleContentViewController *)WeakRetained;
}

- (void)setAudioControlsContentViewController:(id)a3
{
}

- (UIView)audioControlsContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioControlsContainerView);

  return (UIView *)WeakRetained;
}

- (void)setAudioControlsContainerView:(id)a3
{
}

- (UIView)audioControlsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioControlsView);

  return (UIView *)WeakRetained;
}

- (void)setAudioControlsView:(id)a3
{
}

- (CCUIContentModuleContentViewController)videoControlsContentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoControlsContentViewController);

  return (CCUIContentModuleContentViewController *)WeakRetained;
}

- (void)setVideoControlsContentViewController:(id)a3
{
}

- (UIView)videoControlsContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoControlsContainerView);

  return (UIView *)WeakRetained;
}

- (void)setVideoControlsContainerView:(id)a3
{
}

- (UIView)videoControlsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoControlsView);

  return (UIView *)WeakRetained;
}

- (void)setVideoControlsView:(id)a3
{
}

- (CCUISensorAttributionGameModeFooterView)gameModeFooterView
{
  return self->_gameModeFooterView;
}

- (void)setGameModeFooterView:(id)a3
{
}

- (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider)gameModeActivityDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gameModeActivityDataProvider);

  return (_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider *)WeakRetained;
}

- (CCUIModuleInstanceManager)moduleInstanceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_moduleInstanceManager);

  return (CCUIModuleInstanceManager *)WeakRetained;
}

- (void)setModuleInstanceManager:(id)a3
{
}

- (NSSet)activeAndRecentSensorActivityData
{
  return self->_activeAndRecentSensorActivityData;
}

- (void)setActiveAndRecentSensorActivityData:(id)a3
{
}

- (NSArray)entityAndWebsiteViews
{
  return self->_entityAndWebsiteViews;
}

- (void)setEntityAndWebsiteViews:(id)a3
{
}

- (NSArray)separatorViews
{
  return self->_separatorViews;
}

- (void)setSeparatorViews:(id)a3
{
}

- (NSArray)interactiveViews
{
  return self->_interactiveViews;
}

- (void)setInteractiveViews:(id)a3
{
}

- (CCUISensorAttributionSensorButton)topMostCameraButton
{
  return self->_topMostCameraButton;
}

- (void)setTopMostCameraButton:(id)a3
{
}

- (CCUISensorAttributionSensorButton)topMostMicButton
{
  return self->_topMostMicButton;
}

- (void)setTopMostMicButton:(id)a3
{
}

- (CCUISensorAttributionSensorButton)topMostLocButton
{
  return self->_topMostLocButton;
}

- (void)setTopMostLocButton:(id)a3
{
}

- (NSArray)subsequentSensorButtons
{
  return self->_subsequentSensorButtons;
}

- (void)setSubsequentSensorButtons:(id)a3
{
}

- (NSString)audioModuleIdentifier
{
  return self->_audioModuleIdentifier;
}

- (void)setAudioModuleIdentifier:(id)a3
{
}

- (NSString)videoModuleIdentifier
{
  return self->_videoModuleIdentifier;
}

- (void)setVideoModuleIdentifier:(id)a3
{
}

- (CCUIModuleInstance)audioModuleInstance
{
  return self->_audioModuleInstance;
}

- (void)setAudioModuleInstance:(id)a3
{
}

- (CCUIModuleInstance)videoModuleInstance
{
  return self->_videoModuleInstance;
}

- (void)setVideoModuleInstance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoModuleInstance, 0);
  objc_storeStrong((id *)&self->_audioModuleInstance, 0);
  objc_storeStrong((id *)&self->_videoModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_audioModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_subsequentSensorButtons, 0);
  objc_storeStrong((id *)&self->_topMostLocButton, 0);
  objc_storeStrong((id *)&self->_topMostMicButton, 0);
  objc_storeStrong((id *)&self->_topMostCameraButton, 0);
  objc_storeStrong((id *)&self->_interactiveViews, 0);
  objc_storeStrong((id *)&self->_separatorViews, 0);
  objc_storeStrong((id *)&self->_entityAndWebsiteViews, 0);
  objc_storeStrong((id *)&self->_activeAndRecentSensorActivityData, 0);
  objc_destroyWeak((id *)&self->_moduleInstanceManager);
  objc_destroyWeak((id *)&self->_gameModeActivityDataProvider);
  objc_storeStrong((id *)&self->_gameModeFooterView, 0);
  objc_destroyWeak((id *)&self->_videoControlsView);
  objc_destroyWeak((id *)&self->_videoControlsContainerView);
  objc_destroyWeak((id *)&self->_videoControlsContentViewController);
  objc_destroyWeak((id *)&self->_audioControlsView);
  objc_destroyWeak((id *)&self->_audioControlsContainerView);
  objc_destroyWeak((id *)&self->_audioControlsContentViewController);
  objc_storeStrong((id *)&self->_audioVideoControlsView, 0);
  objc_storeStrong((id *)&self->_audioVideoHeaderView, 0);
  objc_storeStrong((id *)&self->_privacyHeaderView, 0);
  objc_storeStrong((id *)&self->_clonedCompactControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_dismissTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_audioVideoModeSelectionAttribution, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end