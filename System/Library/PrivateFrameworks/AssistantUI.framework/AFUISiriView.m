@interface AFUISiriView
+ (void)_animateView:(id)a3 fromYPosition:(double)a4 toYPosition:(double)a5 fade:(int64_t)a6 completion:(id)a7;
- (AFUISiriView)initWithFrame:(CGRect)a3;
- (AFUISiriView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (AFUISiriViewDataSource)dataSource;
- (AFUISiriViewDelegate)delegate;
- (BOOL)_helpButtonIsVisible;
- (BOOL)_isTextInputEnabled;
- (BOOL)_shouldIndicateHoldToTalkMode;
- (BOOL)_showsReportBugButton;
- (BOOL)_wantsBackdropView:(int64_t)a3;
- (BOOL)disabled;
- (BOOL)flamesViewPaused;
- (BOOL)passcodeView:(id)a3 attemptUnlockWithPassword:(id)a4;
- (CGRect)_lockViewFrame;
- (CGRect)_remoteContentViewFrame;
- (CGRect)_statusViewContainerFrame;
- (UIEdgeInsets)safeAreaInsets;
- (UIView)foregroundContainerView;
- (UIView)foregroundView;
- (UIView)remoteContentView;
- (_UIBackdropView)backgroundBlurView;
- (double)_buttonInset;
- (double)statusViewHeight;
- (float)audioLevelForSiriStatusView:(id)a3;
- (id)dimBackdropSettings;
- (int64_t)mode;
- (int64_t)siriSessionState;
- (void)_animateButtonsHidden:(BOOL)a3;
- (void)_animateLockViewIsAnimatingIn:(BOOL)a3 completion:(id)a4;
- (void)_audioRouteButtonTapped:(id)a3;
- (void)_configureEyesFreeLogo;
- (void)_configureHelpButton;
- (void)_configureReportBugButtonWithHoldToTalkState:(BOOL)a3;
- (void)_createAssistantVersionLabelIfNecessary;
- (void)_createReportBugButtonWithTemplateImage:(id)a3 andConfigureWithHoldToTalkState:(BOOL)a4;
- (void)_destroyAssistantVersionLabelIfNecessary;
- (void)_helpButtonTapped:(id)a3;
- (void)_layoutReportBugButton;
- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3;
- (void)_placeRemoteContentView;
- (void)_preferencesDidChange:(id)a3;
- (void)_reportBugButtonLongPressed;
- (void)_reportBugButtonTapped;
- (void)_setSafeAreaInsetsSuspended:(BOOL)a3;
- (void)_setupContentViews;
- (void)_setupVoiceActivationMaskView;
- (void)_updateControlsAppearance;
- (void)_updateSiriStatusViewForMode:(int64_t)a3;
- (void)cancelShowingPasscodeUnlock;
- (void)configureReportBugButtonToShowHoldToTalkState:(BOOL)a3;
- (void)dealloc;
- (void)fadeOutCurrentAura;
- (void)layoutSubviews;
- (void)passcodeView:(id)a3 animateShowPasscodeWithCompletionHandler:(id)a4;
- (void)passcodeView:(id)a3 hideLockViewWithResult:(int64_t)a4 unlockCompletionHandler:(id)a5;
- (void)pulseHelpButton;
- (void)reloadData;
- (void)setAudioRoutePickerBluetoothOn:(BOOL)a3;
- (void)setBackdropShouldRasterize:(BOOL)a3;
- (void)setBackdropVisible:(BOOL)a3;
- (void)setBugReportingAvailable:(BOOL)a3;
- (void)setContentViewsAlpha:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setFlamesViewDeferred:(BOOL)a3;
- (void)setFlamesViewPaused:(BOOL)a3;
- (void)setHelpButtonDeferred:(BOOL)a3;
- (void)setHelpButtonEmphasized:(BOOL)a3;
- (void)setInFluidDismissal:(BOOL)a3;
- (void)setInUITrackingMode:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setRemoteContentView:(id)a3;
- (void)setShowAudioRoutePicker:(BOOL)a3;
- (void)setSiriSessionState:(int64_t)a3;
- (void)setStatusViewHidden:(BOOL)a3;
- (void)setStatusViewUserInteractionEnabled:(BOOL)a3;
- (void)setVoiceActivationMaskViewVisible:(BOOL)a3;
- (void)setupOrbIfNeeded;
- (void)showPasscodeUnlockWithStatusText:(id)a3 subtitle:(id)a4 completionHandler:(id)a5 unlockCompletionHandler:(id)a6;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriStatusViewHoldDidBegin:(id)a3;
- (void)siriStatusViewHoldDidEnd:(id)a3;
- (void)siriStatusViewWasTapped:(id)a3;
- (void)teardownStatusView;
- (void)updateForPercentageRevealed:(double)a3;
@end

@implementation AFUISiriView

- (AFUISiriView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (AFUISiriView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFUISiriView;
  v11 = -[AFUISiriView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    v12->_mode = [v10 siriViewMode];
    v12->_remoteContentViewHidden = 0;
    v12->_lockViewHidden = 1;
    v12->_helpButtonDeferred = 1;
    [(AFUISiriView *)v12 _setupContentViews];
    [(AFUISiriView *)v12 _updateSiriStatusViewForMode:v12->_mode];
  }

  return v12;
}

- (void)_setupContentViews
{
  if ([(AFUISiriView *)self _wantsBackdropView:self->_mode])
  {
    v3 = (_UIBackdropView *)[objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:-2];
    backdropView = self->_backdropView;
    self->_backdropView = v3;

    if (![(AFUISiriView *)self _reducesMotionEffects]) {
      [(_UIBackdropView *)self->_backdropView setUsesZoom];
    }
    [(AFUISiriView *)self addSubview:self->_backdropView];
  }
  id v5 = objc_alloc(MEMORY[0x263F82E00]);
  [(AFUISiriView *)self frame];
  double v7 = v6;
  [(AFUISiriView *)self frame];
  v8 = (UIView *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7);
  foregroundContainerView = self->_foregroundContainerView;
  self->_foregroundContainerView = v8;

  id v10 = [(UIView *)self->_foregroundContainerView layer];
  [v10 setAllowsGroupOpacity:0];

  [(AFUISiriView *)self addSubview:self->_foregroundContainerView];
  id v11 = objc_alloc(MEMORY[0x263F82E00]);
  [(AFUISiriView *)self frame];
  v12 = (UIView *)objc_msgSend(v11, "initWithFrame:", 0.0, 0.0);
  foregroundView = self->_foregroundView;
  self->_foregroundView = v12;

  objc_super v14 = [(UIView *)self->_foregroundView layer];
  [v14 setAllowsGroupOpacity:0];

  [(UIView *)self->_foregroundContainerView addSubview:self->_foregroundView];
  id v15 = objc_alloc(MEMORY[0x263F82E00]);
  double v16 = *MEMORY[0x263F001A8];
  double v17 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v19 = *(double *)(MEMORY[0x263F001A8] + 24);
  v20 = (UIView *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x263F001A8], v17, v18, v19);
  dimmingAndLockContainer = self->_dimmingAndLockContainer;
  self->_dimmingAndLockContainer = v20;

  [(UIView *)self->_foregroundView addSubview:self->_dimmingAndLockContainer];
  v22 = -[AFUIPasscodeContainerView initWithFrame:backdropView:mode:passcodeViewFactoryClass:]([AFUIPasscodeContainerView alloc], "initWithFrame:backdropView:mode:passcodeViewFactoryClass:", self->_backdropView, self->_mode, objc_opt_class(), v16, v17, v18, v19);
  lockContainerView = self->_lockContainerView;
  self->_lockContainerView = v22;

  [(AFUIPasscodeContainerView *)self->_lockContainerView setDelegate:self];
  [(UIView *)self->_dimmingAndLockContainer addSubview:self->_lockContainerView];
  v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v16, v17, v18, v19);
  statusViewContainer = self->_statusViewContainer;
  self->_statusViewContainer = v24;

  v26 = self->_foregroundView;
  v27 = self->_statusViewContainer;

  [(UIView *)v26 addSubview:v27];
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(SiriUIHelpButton *)self->_helpButton removeFromSuperview];
    helpButton = self->_helpButton;
    self->_helpButton = 0;

    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView removeFromSuperview];
    siriStatusView = self->_siriStatusView;
    self->_siriStatusView = 0;

    [(UIView *)self->_voiceActivationMaskView removeFromSuperview];
    voiceActivationMaskView = self->_voiceActivationMaskView;
    self->_voiceActivationMaskView = 0;

    [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton removeFromSuperview];
    audioRoutePickerButton = self->_audioRoutePickerButton;
    self->_audioRoutePickerButton = 0;

    [(SiriUIContentButton *)self->_reportBugButton removeFromSuperview];
    reportBugButton = self->_reportBugButton;
    self->_reportBugButton = 0;

    [(AFUISiriView *)self _destroyAssistantVersionLabelIfNecessary];
    [(AFUISiriView *)self _updateSiriStatusViewForMode:a3];
    [(AFUISiriView *)self setNeedsLayout];
  }
}

- (void)_updateSiriStatusViewForMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 7) < 2 || a3 == 4)
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AFUISiriView _updateSiriStatusViewForMode:](v5);
    }
  }
  else if (a3 == 5)
  {
    double v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AFUISiriView _updateSiriStatusViewForMode:](v6);
    }
  }
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView setFlamesViewDeferred:self->_flamesViewDeferred];
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView sizeToFit];
  siriStatusView = self->_siriStatusView;
  if (siriStatusView)
  {
    [(SiriUISiriStatusViewProtocol *)siriStatusView setDisabledMicOpacity:0.25];
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView setDelegate:self];
    [(UIView *)self->_statusViewContainer addSubview:self->_siriStatusView];
  }
  [(AFUISiriView *)self _updateControlsAppearance];
  int64_t mode = self->_mode;
  BOOL v9 = mode == 8 || mode == 4;
  if (v9
    && +[AFUISiriSession availabilityState] != 1
    && +[AFUISiriSession availabilityState] != 3)
  {
    [(AFUISiriView *)self _configureEyesFreeLogo];
  }
}

- (void)_createAssistantVersionLabelIfNecessary
{
  if (!self->_assistantVersionLabel && AFUIShowServerVersionOnUI())
  {
    id v3 = objc_alloc(MEMORY[0x263F828E0]);
    v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    assistantVersionLabel = self->_assistantVersionLabel;
    self->_assistantVersionLabel = v4;

    id v6 = objc_alloc(MEMORY[0x263F753E0]);
    double v7 = (void *)MEMORY[0x263F82DF0];
    v8 = [MEMORY[0x263F824D8] effectWithStyle:2];
    BOOL v9 = [v7 effectForBlurEffect:v8];
    id v10 = (SiriUIVisualEffectView *)[v6 initWithEffect:v9];
    assistantVersionVisualEffectView = self->_assistantVersionVisualEffectView;
    self->_assistantVersionVisualEffectView = v10;

    v12 = self->_assistantVersionLabel;
    v13 = objc_msgSend(MEMORY[0x263F81708], "siriui_lightWeightFontWithSize:", 12.0);
    [(UILabel *)v12 setFont:v13];

    [(SiriUIVisualEffectView *)self->_assistantVersionVisualEffectView setCustomView:self->_assistantVersionLabel];
    statusViewContainer = self->_statusViewContainer;
    id v15 = self->_assistantVersionVisualEffectView;
    [(UIView *)statusViewContainer addSubview:v15];
  }
}

- (void)_destroyAssistantVersionLabelIfNecessary
{
  assistantVersionLabel = self->_assistantVersionLabel;
  if (assistantVersionLabel)
  {
    [(UILabel *)assistantVersionLabel removeFromSuperview];
    v4 = self->_assistantVersionLabel;
    self->_assistantVersionLabel = 0;

    [(SiriUIVisualEffectView *)self->_assistantVersionVisualEffectView removeFromSuperview];
    assistantVersionVisualEffectView = self->_assistantVersionVisualEffectView;
    self->_assistantVersionVisualEffectView = 0;
  }
}

- (BOOL)_wantsBackdropView:(int64_t)a3
{
  if (a3) {
    BOOL v3 = (unint64_t)(a3 - 8) >= 0xFFFFFFFFFFFFFFFELL;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F28318] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriView;
  [(AFUISiriView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  *(void *)&rect.size.double width = self;
  *(void *)&rect.size.double height = AFUISiriView;
  [(CGSize *)(objc_super *)&rect.size layoutSubviews];
  [(AFUISiriView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  if (self->_eyesFreeEffectView)
  {
    -[UIImageView setFrame:](self->_eyesFreeLogoView, "setFrame:", 0.0, 0.0, 133.0, 133.0);
    -[SiriUIVisualEffectView setFrame:](self->_eyesFreeEffectView, "setFrame:", v8 * 0.5 + -66.5, v10 * 0.42 + -133.0, 133.0, 133.0);
  }
  -[UIView setFrame:](self->_foregroundView, "setFrame:", v4, v6, v8, v10);
  remoteContentView = self->_remoteContentView;
  [(AFUISiriView *)self _remoteContentViewFrame];
  -[UIView setFrame:](remoteContentView, "setFrame:");
  if (!self->_inFluidDismissal) {
    -[UIView setFrame:](self->_foregroundContainerView, "setFrame:", v4, v6, v8, v10);
  }
  -[UIView setFrame:](self->_dimmingAndLockContainer, "setFrame:", v4, v6, v8, v10);
  lockContainerView = self->_lockContainerView;
  [(AFUISiriView *)self _lockViewFrame];
  -[AFUIPasscodeContainerView setFrame:](lockContainerView, "setFrame:");
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView setFlamesViewWidth:v8];
  statusViewContainer = self->_statusViewContainer;
  [(AFUISiriView *)self _statusViewContainerFrame];
  -[UIView setFrame:](statusViewContainer, "setFrame:");
  [(UIView *)self->_statusViewContainer bounds];
  rect.origin.double x = v14;
  rect.origin.double y = v15;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[SiriUISiriStatusViewProtocol setFrame:](self->_siriStatusView, "setFrame:", v4, v6, v8, v10);
  CGFloat v68 = v6;
  CGFloat v69 = v4;
  -[UIView setFrame:](self->_voiceActivationMaskView, "setFrame:", v4, v6, v8, v10);
  [(AFUISiriView *)self _buttonInset];
  double v21 = v20;
  audioRoutePickerButton = self->_audioRoutePickerButton;
  uint64_t v23 = MEMORY[0x263F001A8];
  double v24 = -v20;
  if (audioRoutePickerButton)
  {
    CGFloat v62 = *(double *)(MEMORY[0x263F001A8] + 8);
    -[SiriUIAudioRoutePickerButton sizeThatFits:](audioRoutePickerButton, "sizeThatFits:", v8, v10);
    double v64 = v8;
    CGFloat v25 = v19;
    double v27 = v26;
    double v61 = v28;
    v71.origin.double x = rect.origin.x;
    v71.origin.double y = v17;
    v71.size.double width = v25;
    v71.size.double height = rect.origin.y;
    double v63 = v21;
    CGFloat v29 = CGRectGetMaxX(v71) - v21 - v27;
    [(AFUISiriView *)self safeAreaInsets];
    CGFloat v31 = v29 - v30;
    v72.origin.double x = rect.origin.x;
    v72.origin.double y = v17;
    v72.size.double width = v25;
    v72.size.double height = rect.origin.y;
    double v66 = v17;
    double MaxY = CGRectGetMaxY(v72);
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView statusViewHeight];
    double v33 = v10;
    double v35 = v34;
    v73.origin.double x = v31;
    v73.origin.double y = v62;
    v73.size.double width = v27;
    v73.size.double height = v61;
    double v36 = v35 + CGRectGetHeight(v73);
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView safeAreaInsets];
    double v38 = v36 + v37;
    double v10 = v33;
    double v39 = MaxY + v38 * -0.5;
    double v40 = v31;
    double v21 = v63;
    double v41 = v27;
    CGFloat v19 = v25;
    double v8 = v64;
    CGFloat v17 = v66;
    -[SiriUIAudioRoutePickerButton setFrame:](self->_audioRoutePickerButton, "setFrame:", v40, v39, v41, v61);
    -[SiriUIAudioRoutePickerButton setHitTestEdgeInsets:](self->_audioRoutePickerButton, "setHitTestEdgeInsets:", v24, v24, v24, v24);
  }
  helpButton = self->_helpButton;
  if (helpButton)
  {
    CGFloat v65 = *(double *)(v23 + 8);
    -[SiriUIHelpButton sizeThatFits:](helpButton, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v44 = v43;
    double v67 = v10;
    CGFloat v46 = v45;
    [(AFUISiriView *)self safeAreaInsets];
    CGFloat v47 = v17;
    CGFloat v49 = v21 + v48;
    v74.origin.double x = rect.origin.x;
    v74.origin.double y = v47;
    v74.size.double width = v19;
    v74.size.double height = rect.origin.y;
    rect.origin.double y = CGRectGetMaxY(v74);
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView statusViewHeight];
    double v51 = v50;
    v75.origin.double x = v49;
    v75.origin.double y = v65;
    v75.size.double width = v44;
    v75.size.double height = v46;
    double v52 = v51 + CGRectGetHeight(v75);
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView safeAreaInsets];
    double v54 = v46;
    double v10 = v67;
    -[SiriUIHelpButton setFrame:](self->_helpButton, "setFrame:", v49, rect.origin.y + (v52 + v53) * -0.5, v44, v54);
    -[SiriUIHelpButton setHitTestEdgeInsets:](self->_helpButton, "setHitTestEdgeInsets:", v24, v24, v24, v24);
  }
  [(AFUISiriView *)self _layoutReportBugButton];
  if (self->_assistantVersionVisualEffectView)
  {
    [(AFUISiriView *)self safeAreaInsets];
    rect.origin.double y = v55;
    -[SiriUIVisualEffectView sizeThatFits:](self->_assistantVersionVisualEffectView, "sizeThatFits:", v8, v10);
    double v57 = v56;
    double v59 = v58;
    v76.origin.double x = v69;
    v76.origin.double y = v68;
    v76.size.double width = v8;
    v76.size.double height = v10;
    CGFloat v60 = CGRectGetMaxX(v76) - v57 + -6.0;
    v77.origin.double x = v69;
    v77.origin.double y = v68;
    v77.size.double width = v8;
    v77.size.double height = v10;
    -[SiriUIVisualEffectView setFrame:](self->_assistantVersionVisualEffectView, "setFrame:", v60, CGRectGetMaxY(v77) - v59 + -6.0 - rect.origin.y, v57, v59);
  }
}

- (void)_layoutReportBugButton
{
  [(AFUISiriView *)self _buttonInset];
  double v4 = v3;
  double v5 = [(SiriUIContentButton *)self->_reportBugButton superview];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  reportBugButton = self->_reportBugButton;
  if (reportBugButton)
  {
    CGFloat rect_8 = v9;
    CGFloat rect_16 = v7;
    double rect_24 = v4;
    CGFloat v16 = *MEMORY[0x263F001A8];
    CGFloat v15 = *(double *)(MEMORY[0x263F001A8] + 8);
    -[SiriUIContentButton sizeThatFits:](reportBugButton, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v18 = v17;
    double v20 = v19;
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView frame];
    double MaxY = CGRectGetMaxY(v38);
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView statusViewHeight];
    double v23 = v22;
    v39.origin.double x = v16;
    v39.origin.double y = v15;
    v39.size.double width = v18;
    v39.size.double height = v20;
    double v24 = v23 + CGRectGetHeight(v39);
    [(SiriUISiriStatusViewProtocol *)self->_siriStatusView safeAreaInsets];
    double v26 = MaxY + (v24 + v25) * -0.5;
    audioRoutePickerButton = self->_audioRoutePickerButton;
    if (audioRoutePickerButton
      && ([(SiriUIAudioRoutePickerButton *)audioRoutePickerButton isHidden] & 1) == 0)
    {
      [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton frame];
      double v28 = rect_24;
      CGFloat v32 = CGRectGetMinX(v41) - rect_24;
      v42.origin.double x = v16;
      v42.origin.double y = v26;
      v42.size.double width = v18;
      v42.size.double height = v20;
      double v31 = v32 - CGRectGetWidth(v42);
    }
    else
    {
      v40.origin.double y = rect_8;
      v40.origin.double x = rect_16;
      v40.size.double width = v11;
      v40.size.double height = v13;
      double v28 = rect_24;
      CGFloat v29 = CGRectGetMaxX(v40) - rect_24 - v18;
      [(AFUISiriView *)self safeAreaInsets];
      double v31 = v29 - v30;
    }
    -[SiriUIContentButton setFrame:](self->_reportBugButton, "setFrame:", v31, v26, v18, v20, *(void *)&v16);
    double v33 = self->_reportBugButton;
    -[SiriUIContentButton setHitTestEdgeInsets:](v33, "setHitTestEdgeInsets:", -v28, -v28, -v28, -v28);
  }
}

- (double)statusViewHeight
{
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView statusViewHeight];
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  if (self->_safeAreaInsetsSuspended)
  {
    double top = self->_suspendedSafeAreaInsets.top;
    double left = self->_suspendedSafeAreaInsets.left;
    double bottom = self->_suspendedSafeAreaInsets.bottom;
    double right = self->_suspendedSafeAreaInsets.right;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AFUISiriView;
    [(AFUISiriView *)&v6 safeAreaInsets];
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_setSafeAreaInsetsSuspended:(BOOL)a3
{
  if (self->_safeAreaInsetsSuspended != a3)
  {
    if (a3)
    {
      p_suspendedSafeAreaInsets = &self->_suspendedSafeAreaInsets;
      v10.receiver = self;
      v10.super_class = (Class)AFUISiriView;
      [(AFUISiriView *)&v10 safeAreaInsets];
      p_suspendedSafeAreaInsets->double top = v6;
      self->_suspendedSafeAreaInsets.double left = v7;
      self->_suspendedSafeAreaInsets.double bottom = v8;
      self->_suspendedSafeAreaInsets.double right = v9;
      self->_safeAreaInsetsSuspended = a3;
    }
    else
    {
      self->_safeAreaInsetsSuspended = 0;
      [(AFUISiriView *)self safeAreaInsetsDidChange];
    }
  }
}

- (void)setInFluidDismissal:(BOOL)a3
{
  self->_inFluidDismissal = a3;
  -[AFUISiriView _setSafeAreaInsetsSuspended:](self, "_setSafeAreaInsetsSuspended:");
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(AFUISiriView *)self _updateControlsAppearance];
  }
}

- (void)setStatusViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ((a3 || !self->_inShowUnlockViewAnimation && (self->_inHideUnlockViewAnimation || self->_lockViewHidden))
    && self->_statusViewHidden != a3
    && (!self->_keepStatusViewHidden || a3))
  {
    [(AFUISiriView *)self _statusViewContainerFrame];
    double MinY = CGRectGetMinY(v12);
    self->_statusViewHidden = v3;
    CGFloat v7 = objc_opt_class();
    statusViewContainer = self->_statusViewContainer;
    [(AFUISiriView *)self _statusViewContainerFrame];
    double v9 = CGRectGetMinY(v13);
    if (v3) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    [v7 _animateView:statusViewContainer fromYPosition:v10 toYPosition:0 fade:MinY completion:v9];
    [(AFUISiriView *)self _updateControlsAppearance];
  }
}

- (void)_updateControlsAppearance
{
  if (self->_disabled)
  {
LABEL_2:
    int64_t siriSessionState = 4;
  }
  else
  {
    uint64_t v4 = 0;
    int64_t siriSessionState = 0;
    switch(self->_siriSessionState)
    {
      case 0:
      case 4:
        goto LABEL_7;
      case 1:
      case 2:
        uint64_t v4 = 1;
        goto LABEL_6;
      case 3:
        uint64_t v4 = 0;
LABEL_6:
        int64_t siriSessionState = self->_siriSessionState;
LABEL_7:
        [(AFUISiriView *)self _animateButtonsHidden:v4];
        break;
      default:
        goto LABEL_2;
    }
  }
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView setMode:siriSessionState];
  double v5 = 0.0;
  if (!self->_statusViewHidden) {
    double v5 = 1.0;
  }
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView setAlpha:v5];
  BOOL v6 = self->_disabled || [(AFUISiriView *)self _isTextInputEnabled];
  [(SiriUIHelpButton *)self->_helpButton setHidden:v6];
  [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton setHidden:v6];
  reportBugButton = self->_reportBugButton;

  [(SiriUIContentButton *)reportBugButton setHidden:v6];
}

- (void)_animateButtonsHidden:(BOOL)a3
{
  if (self->_helpButtonDeferred || a3)
  {
    if (self->_helpButtonDeferred) {
      return;
    }
  }
  else
  {
    [(AFUISiriView *)self _setupButtonsIfNecessary];
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__AFUISiriView__animateButtonsHidden___block_invoke;
  v5[3] = &unk_2646919B0;
  BOOL v6 = a3;
  v5[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:0.25 options:0.0 animations:1.0 completion:0.0];
}

uint64_t __38__AFUISiriView__animateButtonsHidden___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 488);
  if (v2) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [v3 setAlpha:v4];
  [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:v4];
  double v5 = *(void **)(*(void *)(a1 + 32) + 496);

  return [v5 setAlpha:v4];
}

- (void)setStatusViewUserInteractionEnabled:(BOOL)a3
{
}

- (void)setFlamesViewDeferred:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = @"NO";
    if (v3) {
      BOOL v6 = @"YES";
    }
    int v7 = 136315394;
    CGFloat v8 = "-[AFUISiriView setFlamesViewDeferred:]";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  self->_flamesViewDeferred = v3;
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView setFlamesViewDeferred:v3];
}

- (BOOL)flamesViewPaused
{
  return [(SiriUISiriStatusViewProtocol *)self->_siriStatusView paused];
}

- (void)setFlamesViewPaused:(BOOL)a3
{
}

- (void)teardownStatusView
{
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView removeFromSuperview];
  siriStatusView = self->_siriStatusView;
  self->_siriStatusView = 0;
}

- (void)setInUITrackingMode:(BOOL)a3
{
}

- (void)setupOrbIfNeeded
{
}

- (void)fadeOutCurrentAura
{
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    [(AFUISiriView *)self reloadData];
    double v5 = obj;
  }
}

- (void)reloadData
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v5 = [WeakRetained userAccountCountForSiriView:self];

  if (v5 < 2)
  {
    [(AFUISiriView *)self _destroyAssistantVersionLabelIfNecessary];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)p_dataSource);
    int v7 = [v6 assistantVersionForSiriView:self];
    id v8 = objc_loadWeakRetained((id *)p_dataSource);
    __int16 v9 = [v8 activeAccountForSiriView:self];
    uint64_t v10 = AFUIDisplayStringForVersionAndAccount(v7, v9);

    if (v10 && [v10 length])
    {
      [(AFUISiriView *)self _createAssistantVersionLabelIfNecessary];
      [(UILabel *)self->_assistantVersionLabel setText:v10];
    }
  }

  [(AFUISiriView *)self setNeedsLayout];
}

- (_UIBackdropView)backgroundBlurView
{
  return self->_backdropView;
}

- (void)setBackdropVisible:(BOOL)a3
{
  self->_backdropViewVisible = a3;
  if (a3)
  {
    id v5 = [(AFUISiriView *)self dimBackdropSettings];
    [(_UIBackdropView *)self->_backdropView transitionToSettings:v5];
  }
  else
  {
    backdropView = self->_backdropView;
    [(_UIBackdropView *)backdropView transitionToPrivateStyle:-2];
  }
}

- (void)setBackdropShouldRasterize:(BOOL)a3
{
}

- (id)dimBackdropSettings
{
  int v2 = (void *)MEMORY[0x263F82EC0];
  if ([(AFUISiriView *)self _reducesMotionEffects]) {
    uint64_t v3 = 2050;
  }
  else {
    uint64_t v3 = 2032;
  }
  double v4 = [v2 settingsForPrivateStyle:v3];
  [v4 setBlurRadius:24.0];
  [v4 setScale:0.5];

  return v4;
}

- (void)setRemoteContentView:(id)a3
{
  double v4 = (UIView *)a3;
  [(UIView *)self->_remoteContentView removeFromSuperview];
  remoteContentView = self->_remoteContentView;
  self->_remoteContentView = v4;

  [(AFUISiriView *)self _placeRemoteContentView];
}

- (void)_placeRemoteContentView
{
  remoteContentView = self->_remoteContentView;
  if (remoteContentView)
  {
    [(AFUISiriView *)self _remoteContentViewFrame];
    -[UIView setFrame:](remoteContentView, "setFrame:");
    [(UIView *)self->_foregroundView insertSubview:self->_remoteContentView aboveSubview:self->_dimmingAndLockContainer];
    foregroundView = self->_foregroundView;
    id v5 = [(SiriUISiriStatusViewProtocol *)self->_siriStatusView flamesContainerView];
    [(UIView *)foregroundView insertSubview:v5 belowSubview:self->_remoteContentView];
  }
  voiceActivationMaskView = self->_voiceActivationMaskView;
  if (voiceActivationMaskView)
  {
    int v7 = self->_foregroundView;
    id v8 = [(SiriUISiriStatusViewProtocol *)self->_siriStatusView flamesContainerView];
    [(UIView *)v7 insertSubview:voiceActivationMaskView below:v8];
  }
}

- (void)setVoiceActivationMaskViewVisible:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int64_t mode = self->_mode;
  if (mode == 4 || mode == 8)
  {
    if (a3)
    {
      [(AFUISiriView *)self _setupVoiceActivationMaskView];
    }
    else if (self->_voiceActivationMaskView)
    {
      self->_remoteContentViewHidden = 0;
      [(AFUISiriView *)self _placeRemoteContentView];
      objc_initWeak((id *)buf, self);
      uint64_t v10 = (void *)MEMORY[0x263F82E00];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke;
      v13[3] = &unk_2646919D8;
      objc_copyWeak(&v14, (id *)buf);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke_2;
      v11[3] = &unk_264691A00;
      objc_copyWeak(&v12, (id *)buf);
      [v10 animateWithDuration:v13 animations:v11 completion:0.4];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v6 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      __int16 v9 = SiriUINSStringFromSiriUIViewMode();
      *(_DWORD *)buf = 136315394;
      CGFloat v16 = "-[AFUISiriView setVoiceActivationMaskViewVisible:]";
      __int16 v17 = 2112;
      double v18 = v9;
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s Not showing voiceActivationMaskView for mode - %@", buf, 0x16u);
    }
  }
}

void __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = WeakRetained;
    [WeakRetained[63] setAlpha:0.0];
    id WeakRetained = v2;
  }
}

void __50__AFUISiriView_setVoiceActivationMaskViewVisible___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained setStatusViewHidden:0];
    [v3[63] removeFromSuperview];
    id v2 = v3[63];
    v3[63] = 0;

    id WeakRetained = v3;
  }
}

- (void)_setupVoiceActivationMaskView
{
  self->_remoteContentViewHidden = 1;
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  voiceActivationMaskView = self->_voiceActivationMaskView;
  self->_voiceActivationMaskView = v4;

  id v6 = self->_voiceActivationMaskView;
  int v7 = [MEMORY[0x263F825C8] blackColor];
  [(UIView *)v6 setBackgroundColor:v7];

  foregroundView = self->_foregroundView;
  __int16 v9 = self->_voiceActivationMaskView;
  remoteContentView = self->_remoteContentView;

  [(UIView *)foregroundView insertSubview:v9 below:remoteContentView];
}

- (CGRect)_remoteContentViewFrame
{
  [(AFUISiriView *)self bounds];
  double v7 = v3;
  double v8 = v5;
  double v9 = v6;
  if (self->_remoteContentViewHidden) {
    double v10 = -CGRectGetHeight(*(CGRect *)&v3);
  }
  else {
    double v10 = 0.0;
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v10;
  result.origin.double x = v11;
  return result;
}

- (void)updateForPercentageRevealed:(double)a3
{
  if (!self->_backdropViewVisible) {
    [(AFUISiriView *)self setBackdropVisible:1];
  }
  [(SiriUISiriStatusViewProtocol *)self->_siriStatusView forceMicVisible:1];
  siriStatusView = self->_siriStatusView;
  if (a3 <= 0.2) {
    double v6 = a3 * 5.0;
  }
  else {
    double v6 = 1.0;
  }

  [(SiriUISiriStatusViewProtocol *)siriStatusView setAlpha:v6];
}

- (CGRect)_lockViewFrame
{
  [(AFUISiriView *)self bounds];
  double v7 = v3;
  double v8 = v5;
  double v9 = v6;
  if (self->_lockViewHidden) {
    double Height = CGRectGetHeight(*(CGRect *)&v3);
  }
  else {
    double Height = 0.0;
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = Height;
  result.origin.double x = v11;
  return result;
}

- (CGRect)_statusViewContainerFrame
{
  [(AFUISiriView *)self bounds];
  double v7 = v3;
  double v8 = v5;
  double v9 = v6;
  if (self->_statusViewHidden) {
    double Height = CGRectGetHeight(*(CGRect *)&v3);
  }
  else {
    double Height = 0.0;
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = Height;
  result.origin.double x = v11;
  return result;
}

- (double)_buttonInset
{
  int v2 = SiriUIIsCompactWidth();
  double result = 26.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (void)setShowAudioRoutePicker:(BOOL)a3
{
  if (a3 && !self->_audioRoutePickerButton)
  {
    id v5 = objc_alloc(MEMORY[0x263F75380]);
    double v6 = (SiriUIAudioRoutePickerButton *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    audioRoutePickerButton = self->_audioRoutePickerButton;
    self->_audioRoutePickerButton = v6;

    [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton addTarget:self action:sel__audioRouteButtonTapped_ forControlEvents:64];
    [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton setAlpha:0.0];
    -[SiriUIAudioRoutePickerButton _setTouchInsets:](self->_audioRoutePickerButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    [(SiriUIAudioRoutePickerButton *)self->_audioRoutePickerButton setHidden:[(AFUISiriView *)self _isTextInputEnabled]];
    [(UIView *)self->_statusViewContainer insertSubview:self->_audioRoutePickerButton above:self->_siriStatusView];
    [(AFUISiriView *)self setNeedsLayout];
  }
  double v8 = self->_audioRoutePickerButton;
  if (v8 && self->_siriSessionState != 1)
  {
    double v9 = v8;
    double v10 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __40__AFUISiriView_setShowAudioRoutePicker___block_invoke;
    v17[3] = &unk_2646919B0;
    double v18 = v9;
    BOOL v19 = a3;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_2;
    v13[3] = &unk_264691A28;
    BOOL v16 = a3;
    double v11 = v18;
    id v14 = v11;
    CGFloat v15 = self;
    [v10 animateWithDuration:v17 animations:v13 completion:0.2];
    if ([(AFUISiriView *)self _showsReportBugButton])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_3;
      v12[3] = &unk_264691A50;
      v12[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v12 animations:0.2];
    }
  }
}

uint64_t __40__AFUISiriView_setShowAudioRoutePicker___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
}

void __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    uint64_t v2 = *(void *)(a1 + 40);
    double v3 = *(void **)(v2 + 480);
    if (v3 == *(void **)(a1 + 32))
    {
      *(void *)(v2 + 480) = 0;
    }
  }
}

uint64_t __40__AFUISiriView_setShowAudioRoutePicker___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutReportBugButton];
}

- (void)setAudioRoutePickerBluetoothOn:(BOOL)a3
{
}

- (void)_audioRouteButtonTapped:(id)a3
{
  id v4 = [(AFUISiriView *)self delegate];
  [v4 siriViewDidReceiveAudioRouteAction:self];
}

- (void)_preferencesDidChange:(id)a3
{
  uint64_t v4 = [(AFUISiriView *)self _showsReportBugButton] ^ 1;
  [(SiriUIContentButton *)self->_reportBugButton setHidden:v4];
  assistantVersionVisualEffectView = self->_assistantVersionVisualEffectView;

  [(SiriUIVisualEffectView *)assistantVersionVisualEffectView setHidden:v4];
}

- (BOOL)_showsReportBugButton
{
  if (!AFIsInternalInstall()) {
    return 0;
  }
  double v3 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v3 debugButtonIsEnabled]) {
    BOOL v4 = self->_mode != 5;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldIndicateHoldToTalkMode
{
  int v2 = AFIsInternalInstall();
  if (v2)
  {
    double v3 = [MEMORY[0x263F285A0] sharedPreferences];
    char v4 = [v3 showsHoldToTalkIndicator];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)configureReportBugButtonToShowHoldToTalkState:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AFUISiriView *)self _showsReportBugButton];
  reportBugButton = self->_reportBugButton;
  if (v5)
  {
    if (reportBugButton)
    {
      [(AFUISiriView *)self _configureReportBugButtonWithHoldToTalkState:v3];
    }
    else
    {
      objc_initWeak(&location, self);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke;
      v7[3] = &unk_264691AA0;
      objc_copyWeak(&v8, &location);
      BOOL v9 = v3;
      [(AFUISiriView *)self _loadReportBugButtonTemplateImageInBackgroundWithCompletion:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(SiriUIContentButton *)reportBugButton setHidden:1];
  }
}

void __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke_2;
  block[3] = &unk_264691A78;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  char v8 = *(unsigned char *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v7);
}

void __62__AFUISiriView_configureReportBugButtonToShowHoldToTalkState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _createReportBugButtonWithTemplateImage:*(void *)(a1 + 32) andConfigureWithHoldToTalkState:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_createReportBugButtonWithTemplateImage:(id)a3 andConfigureWithHoldToTalkState:(BOOL)a4
{
  BOOL v4 = a4;
  if (!self->_reportBugButton)
  {
    id v6 = [MEMORY[0x263F753A8] buttonWithImageTemplate:a3 style:0];
    reportBugButton = self->_reportBugButton;
    self->_reportBugButton = v6;

    -[SiriUIContentButton _setTouchInsets:](self->_reportBugButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    [(SiriUIContentButton *)self->_reportBugButton setAlpha:0.0];
    [(SiriUIContentButton *)self->_reportBugButton addTarget:self action:sel__reportBugButtonTapped forControlEvents:64];
    char v8 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__reportBugButtonLongPressed];
    [(SiriUIContentButton *)self->_reportBugButton addGestureRecognizer:v8];
    [(SiriUIContentButton *)self->_reportBugButton setHidden:0];
    [(UIView *)self->_statusViewContainer insertSubview:self->_reportBugButton above:self->_siriStatusView];
    [(AFUISiriView *)self setNeedsLayout];
  }
  [(AFUISiriView *)self _configureReportBugButtonWithHoldToTalkState:v4];

  [(AFUISiriView *)self _updateControlsAppearance];
}

- (void)_configureReportBugButtonWithHoldToTalkState:(BOOL)a3
{
  if ([(AFUISiriView *)self _shouldIndicateHoldToTalkMode])
  {
    BOOL v5 = [MEMORY[0x263F825C8] colorWithRed:0.7 green:1.0 blue:0.4 alpha:1.0];
    id v8 = v5;
    if (a3)
    {
      id v6 = [v5 colorWithAlphaComponent:0.6];
      [v8 colorWithAlphaComponent:0.2];
    }
    else
    {
      id v6 = objc_msgSend(MEMORY[0x263F825C8], "siriui_transparantButtonColor");
      objc_msgSend(MEMORY[0x263F825C8], "siriui_transparantHighlightedButtonColor");
    id v7 = };
    [(SiriUIContentButton *)self->_reportBugButton setDefaultColorForTemplate:v6];
    [(SiriUIContentButton *)self->_reportBugButton setHighlightColorForTemplate:v7];
  }
}

- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3
{
  id v3 = a3;
  BOOL v4 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__AFUISiriView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke;
  block[3] = &unk_264691AC8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __76__AFUISiriView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
  if (objc_claimAutoreleasedReturnValue())
  {
    int v2 = objc_msgSend(MEMORY[0x263F827E8], "imageNamed:inBundle:", @"radarBug");
    id v3 = [v2 imageWithRenderingMode:2];

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }

  return MEMORY[0x270F9A828]();
}

- (void)_reportBugButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriViewDidReceiveReportBugAction:self];
}

- (void)_reportBugButtonLongPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriViewDidReceiveBugButtonLongPress:self];
}

- (void)setSiriSessionState:(int64_t)a3
{
  if (self->_siriSessionState != a3)
  {
    self->_int64_t siriSessionState = a3;
    [(AFUISiriView *)self _updateControlsAppearance];
  }
}

- (void)setBugReportingAvailable:(BOOL)a3
{
}

- (void)_configureHelpButton
{
  if (!self->_helpButton)
  {
    id v3 = [MEMORY[0x263F753B0] buttonWithHelpImageMask];
    helpButton = self->_helpButton;
    self->_helpButton = v3;

    [(SiriUIHelpButton *)self->_helpButton setAlpha:0.0];
    -[SiriUIHelpButton _setTouchInsets:](self->_helpButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
    [(SiriUIHelpButton *)self->_helpButton addTarget:self action:sel__helpButtonTapped_ forControlEvents:64];
    statusViewContainer = self->_statusViewContainer;
    id v6 = self->_helpButton;
    siriStatusView = self->_siriStatusView;
    [(UIView *)statusViewContainer insertSubview:v6 above:siriStatusView];
  }
}

- (void)_helpButtonTapped:(id)a3
{
  id v4 = [(AFUISiriView *)self delegate];
  [v4 siriViewDidReceiveHelpAction:self];
}

- (void)setHelpButtonEmphasized:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AFUISiriView *)self _helpButtonIsVisible])
  {
    helpButton = self->_helpButton;
    [(SiriUIHelpButton *)helpButton setEmphasized:v3];
  }
}

- (void)setHelpButtonDeferred:(BOOL)a3
{
  if (self->_helpButtonDeferred != a3) {
    self->_helpButtonDeferred = a3;
  }
}

- (void)pulseHelpButton
{
  if ([(AFUISiriView *)self _helpButtonIsVisible])
  {
    helpButton = self->_helpButton;
    [(SiriUIHelpButton *)helpButton pulse];
  }
}

- (BOOL)_helpButtonIsVisible
{
  if ([(SiriUIHelpButton *)self->_helpButton isHidden]) {
    return 0;
  }
  [(SiriUIHelpButton *)self->_helpButton alpha];
  return v4 > 2.22044605e-16;
}

- (void)_configureEyesFreeLogo
{
  id v3 = objc_alloc(MEMORY[0x263F753E0]);
  double v4 = objc_msgSend(MEMORY[0x263F82DF0], "siriui_platterVibrancyEffect");
  uint64_t v5 = (SiriUIVisualEffectView *)[v3 initWithEffect:v4];
  eyesFreeEffectView = self->_eyesFreeEffectView;
  self->_eyesFreeEffectView = v5;

  id v7 = (void *)MEMORY[0x263F827E8];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v9 = [MEMORY[0x263F82B60] mainScreen];
  double v10 = [v9 traitCollection];
  double v11 = [v7 imageNamed:@"DnDwDSiri" inBundle:v8 compatibleWithTraitCollection:v10];
  double v12 = [MEMORY[0x263F825C8] whiteColor];
  id v15 = [v11 _flatImageWithColor:v12];

  double v13 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v15];
  eyesFreeLogoView = self->_eyesFreeLogoView;
  self->_eyesFreeLogoView = v13;

  [(SiriUIVisualEffectView *)self->_eyesFreeEffectView setCustomView:self->_eyesFreeLogoView];
  [(UIView *)self->_statusViewContainer insertSubview:self->_eyesFreeEffectView above:self->_backdropView];
}

- (void)showPasscodeUnlockWithStatusText:(id)a3 subtitle:(id)a4 completionHandler:(id)a5 unlockCompletionHandler:(id)a6
{
}

- (void)_animateLockViewIsAnimatingIn:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v16 = a4;
  [MEMORY[0x263F158F8] begin];
  if (v16) {
    [MEMORY[0x263F158F8] setCompletionBlock:v16];
  }
  [(AFUISiriView *)self _remoteContentViewFrame];
  double MinY = CGRectGetMinY(v18);
  self->_remoteContentViewHidden = v4;
  id v7 = objc_opt_class();
  remoteContentView = self->_remoteContentView;
  [(AFUISiriView *)self _remoteContentViewFrame];
  double v9 = CGRectGetMinY(v19);
  if (self->_remoteContentViewHidden) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  [v7 _animateView:remoteContentView fromYPosition:v10 toYPosition:0 fade:MinY completion:v9];
  [(AFUISiriView *)self _lockViewFrame];
  double v11 = CGRectGetMinY(v20);
  self->_lockViewHidden = !v4;
  double v12 = objc_opt_class();
  lockContainerView = self->_lockContainerView;
  [(AFUISiriView *)self _lockViewFrame];
  double v14 = CGRectGetMinY(v21);
  if (self->_lockViewHidden) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  [v12 _animateView:lockContainerView fromYPosition:v15 toYPosition:0 fade:v11 completion:v14];
  [(AFUISiriView *)self setStatusViewHidden:v4];
  [MEMORY[0x263F158F8] commit];
}

- (void)cancelShowingPasscodeUnlock
{
}

+ (void)_animateView:(id)a3 fromYPosition:(double)a4 toYPosition:(double)a5 fade:(int64_t)a6 completion:(id)a7
{
  id v28 = a3;
  id v11 = a7;
  [MEMORY[0x263F158F8] begin];
  if (v11) {
    [MEMORY[0x263F158F8] setCompletionBlock:v11];
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263F15890]);
  [v13 setKeyPath:@"position.y"];
  double v14 = [NSNumber numberWithDouble:a4];
  [v13 setFromValue:v14];

  uint64_t v15 = [NSNumber numberWithDouble:a5];
  [v13 setToValue:v15];

  [v13 setMass:4.0];
  [v13 setStiffness:600.0];
  [v13 setDamping:800.0];
  [v12 addObject:v13];
  if (a6)
  {
    BOOL v16 = a6 == 2;
    BOOL v17 = a6 != 2;
    uint64_t v18 = v16;
    if (v16) {
      double v19 = 0.1;
    }
    else {
      double v19 = 32.0;
    }
    CGRect v20 = [NSNumber numberWithInt:v18];
    a6 = [NSNumber numberWithInt:v17];
    id v21 = objc_alloc_init(MEMORY[0x263F15890]);
    [v21 setKeyPath:@"opacity"];
    [v21 setFromValue:v20];
    [v21 setToValue:a6];
    [v21 setMass:v19];
    [v21 setStiffness:600.0];
    [v21 setDamping:800.0];
    [v12 addObject:v21];
  }
  id v22 = objc_alloc_init(MEMORY[0x263F15750]);
  [v22 setRemovedOnCompletion:1];
  double v23 = [MEMORY[0x263F74478] defaultTimingFunction];
  [v22 setTimingFunction:v23];

  [MEMORY[0x263F74478] defaultAnimationDuration];
  objc_msgSend(v22, "setDuration:");
  [v22 setBeginTime:CACurrentMediaTime()];
  [v22 setFillMode:*MEMORY[0x263F15AA0]];
  [v22 setAnimations:v12];
  double v24 = [v28 layer];
  [v24 addAnimation:v22 forKey:@"Animation Group"];

  [MEMORY[0x263F158F8] commit];
  if (a6)
  {
    double v25 = [v28 layer];
    [(id)a6 floatValue];
    objc_msgSend(v25, "setOpacity:");
  }
  double v26 = [v28 layer];
  objc_msgSend(v26, "setAnchorPoint:", 0.0, 0.0);

  double v27 = [v28 layer];
  objc_msgSend(v27, "setPosition:", 0.0, a5);
}

- (float)audioLevelForSiriStatusView:(id)a3
{
  BOOL v4 = [(AFUISiriView *)self delegate];
  [v4 audioRecordingPowerLevelForSiriView:self];
  float v6 = v5;

  return v6;
}

- (void)siriStatusViewWasTapped:(id)a3
{
  id v4 = [(AFUISiriView *)self delegate];
  [v4 siriViewDidRecieveStatusViewTappedAction:self];
}

- (void)siriStatusViewHoldDidBegin:(id)a3
{
  id v4 = [(AFUISiriView *)self delegate];
  [v4 siriViewDidRecieveStatusViewHoldDidBeginAction:self];
}

- (void)siriStatusViewHoldDidEnd:(id)a3
{
  id v4 = [(AFUISiriView *)self delegate];
  [v4 siriViewDidRecieveStatusViewHoldDidEndAction:self];
}

- (BOOL)_isTextInputEnabled
{
  int v2 = self;
  id v3 = [(AFUISiriView *)self delegate];
  LOBYTE(v2) = [v3 siriViewShouldSupportTextInput:v2];

  return (char)v2;
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (+[AFUISiriSession availabilityState] == 2)
  {
    float v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[AFUISiriView siriDidActivateFromSource:]";
      _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s Not dismissing lock view since we're at first unlock stage", buf, 0xCu);
    }
  }
  else
  {
    if ((unint64_t)a3 <= 0x17 && ((1 << a3) & 0x8C0000) != 0) {
      [(SiriUISiriStatusViewProtocol *)self->_siriStatusView forceMicVisible:1];
    }
    id v6 = [(AFUISiriView *)self delegate];
    [v6 siriView:self didReceiveSiriActivationMessageWithSource:a3];
  }
}

- (void)passcodeView:(id)a3 hideLockViewWithResult:(int64_t)a4 unlockCompletionHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  if (v7)
  {
    [MEMORY[0x263F74478] defaultAnimationDuration];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 0.15 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke;
    block[3] = &unk_264691AF0;
    id v12 = v7;
    int64_t v13 = a4;
    dispatch_after(v9, MEMORY[0x263EF83A0], block);
  }
  self->_inHideUnlockViewAnimation = 1;
  self->_inShowUnlockViewAnimation = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2;
  v10[3] = &unk_264691A50;
  v10[4] = self;
  [(AFUISiriView *)self _animateLockViewIsAnimatingIn:0 completion:v10];
}

uint64_t __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __76__AFUISiriView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 529) = 0;
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (BOOL)passcodeView:(id)a3 attemptUnlockWithPassword:(id)a4
{
  id v4 = self;
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v4) = [WeakRetained siriView:v4 attemptUnlockWithPassword:v6];

  return (char)v4;
}

- (void)passcodeView:(id)a3 animateShowPasscodeWithCompletionHandler:(id)a4
{
  id v5 = a4;
  self->_inShowUnlockViewAnimation = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke;
  v11[3] = &unk_264691A50;
  void v11[4] = self;
  [(AFUISiriView *)self _animateLockViewIsAnimatingIn:1 completion:v11];
  [MEMORY[0x263F74478] defaultAnimationDuration];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 0.15 * 1000000000.0));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_264691AC8;
  id v10 = v5;
  id v8 = v5;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

void __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 528) = 0;
  [*(id *)(a1 + 32) setNeedsLayout];
  id v1 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v1 logEventWithType:1433 context:0];
}

uint64_t __70__AFUISiriView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)setContentViewsAlpha:(double)a3
{
  id v4 = [(AFUISiriView *)self foregroundContainerView];
  [v4 setAlpha:a3];
}

- (UIView)remoteContentView
{
  return self->_remoteContentView;
}

- (int64_t)siriSessionState
{
  return self->_siriSessionState;
}

- (int64_t)mode
{
  return self->_mode;
}

- (AFUISiriViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (AFUISiriViewDataSource *)WeakRetained;
}

- (AFUISiriViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISiriViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)foregroundContainerView
{
  return self->_foregroundContainerView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_remoteContentView, 0);
  objc_storeStrong((id *)&self->_siriStatusView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_assistantVersionVisualEffectView, 0);
  objc_storeStrong((id *)&self->_assistantVersionLabel, 0);
  objc_storeStrong((id *)&self->_eyesFreeLogoView, 0);
  objc_storeStrong((id *)&self->_eyesFreeEffectView, 0);
  objc_storeStrong((id *)&self->_lockContainerView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_voiceActivationMaskView, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_storeStrong((id *)&self->_helpButton, 0);
  objc_storeStrong((id *)&self->_audioRoutePickerButton, 0);
  objc_storeStrong((id *)&self->_statusViewContainer, 0);
  objc_storeStrong((id *)&self->_dimmingAndLockContainer, 0);

  objc_storeStrong((id *)&self->_backdropView, 0);
}

- (void)_updateSiriStatusViewForMode:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[AFUISiriView _updateSiriStatusViewForMode:]";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s AFUISiriView's mode set to SiriUIViewModeCompact. This should use AFUISiriViewCompact instead", (uint8_t *)&v1, 0xCu);
}

- (void)_updateSiriStatusViewForMode:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "-[AFUISiriView _updateSiriStatusViewForMode:]";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s AFUISiriView's mode set to SiriUIViewModeCarPlay. This should use AFUISiriCarPlayView instead", (uint8_t *)&v1, 0xCu);
}

@end