@interface RPCCVideoSettingsModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isVideoModuleEnabled;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldLoadFromSensor;
- (RPCCVideoSettingsModuleViewControllerDelegate)delegate;
- (double)preferredExpandedContentHeight;
- (id)_cameraIndicatorImage;
- (id)_cameraOffIndicatorImage;
- (id)_fontForTitleLabel;
- (id)_imageSymbolConfiguration;
- (id)_unexpandedSubtitleFont;
- (id)_unexpandedTitleFont;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)cinematicFrameButtonPressed:(id)a3;
- (void)gestureButtonPressed:(id)a3;
- (void)handleAVControlCenterNotification:(id)a3;
- (void)hideVideoConferenceButtons:(BOOL)a3;
- (void)layoutVideoConferenceSubviews;
- (void)portraitBlurButtonPressed:(id)a3;
- (void)setCinematicFrameButtonSubtitle:(BOOL)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureButtonSubtitle:(BOOL)a3;
- (void)setPortraitBlurButtonSubtitle:(BOOL)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setStudioLightButtonSubtitle:(BOOL)a3;
- (void)setupCameraEffectsInitialState;
- (void)setupCameraEffectsNotifications;
- (void)setupInitialModuleState;
- (void)setupInitialStateAndNotifications;
- (void)setupModuleButtons;
- (void)setupModuleImageView;
- (void)setupTitleLabelViews;
- (void)studioLightButtonPressed:(id)a3;
- (void)updateModuleImageView;
- (void)updateModuleSubtitle;
- (void)updateVideoButtonConstraints;
- (void)updateVideoImageViewWithCameraOn:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RPCCVideoSettingsModuleViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)RPCCVideoSettingsModuleViewController;
  [(RPCCVideoSettingsModuleViewController *)&v8 viewDidLoad];
  self->_shouldIlluminate = 0;
  self->_gesturesEnabled = _os_feature_enabled_impl();
  [(RPCCVideoSettingsModuleViewController *)self setupModuleImageView];
  [(RPCCVideoSettingsModuleViewController *)self setupTitleLabelViews];
  [(RPCCVideoSettingsModuleViewController *)self setupModuleButtons];
  if (!self->_shouldLoadFromSensor)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
    v4 = [v3 stringForKey:@"show-system-ui-app-name"];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v4;

    v6 = [v3 stringForKey:@"show-system-ui-bundle-id"];
    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = v6;

    [(UILabel *)self->_unexpandedTitleLabel removeFromSuperview];
    [(UILabel *)self->_unexpandedSubtitleLabel removeFromSuperview];
    [(RPCCVideoSettingsModuleViewController *)self updateVideoImageViewWithCameraOn:1];
    [(RPCCVideoSettingsModuleViewController *)self setGlyphImage:self->_expandedGlyphImage];
    [(RPCCVideoSettingsModuleViewController *)self setupCameraEffectsNotifications];
    [(RPCCVideoSettingsModuleViewController *)self setupCameraEffectsInitialState];
    [(RPCCVideoSettingsModuleViewController *)self setupInitialModuleState];
    [(RPCCVideoSettingsModuleViewController *)self setTitle:self->_applicationDisplayName];
    [(RPCCVideoSettingsModuleViewController *)self updateModuleSubtitle];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPCCVideoSettingsModuleViewController;
  [(RPCCVideoSettingsModuleViewController *)&v5 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)RPCCVideoSettingsModuleViewController;
  [(RPCCVideoSettingsModuleViewController *)&v28 viewWillAppear:a3];
  objc_super v5 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:1];
  v6 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:0];
  v7 = v6;
  if (v6)
  {
    objc_super v8 = [v6 displayName];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v8;

    v10 = [v7 bundleIdentifier];
    unsigned __int8 v11 = [v10 isEqualToString:@"com.apple.TelephonyUtilities"];
    if (v11)
    {
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      v15 = @"com.apple.facetime";
    }
    else
    {
      id v3 = [v7 bundleIdentifier];
      v15 = @"com.apple.facetime";
      if ([v3 isEqualToString:@"com.apple.facetime"])
      {
        int v12 = 0;
        int v13 = 0;
        int v14 = 0;
      }
      else
      {
        v27 = [v7 bundleIdentifier];
        if ([v27 isEqualToString:@"com.apple.mediaserverd"])
        {
          int v13 = 0;
          int v14 = 0;
          int v12 = 1;
        }
        else
        {
          v26 = [v7 bundleIdentifier];
          if ([v26 isEqualToString:@"com.apple.avconferenced"])
          {
            int v14 = 0;
            int v12 = 1;
            int v13 = 1;
          }
          else
          {
            v15 = [v7 bundleIdentifier];
            int v12 = 1;
            int v13 = 1;
            int v14 = 1;
          }
        }
      }
    }
    objc_storeStrong((id *)&self->_applicationBundleID, v15);
    if (v14)
    {

      if (!v13) {
        goto LABEL_17;
      }
    }
    else if (!v13)
    {
LABEL_17:
      if (v12) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }

    if (v12)
    {
LABEL_18:

      if (v11) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
LABEL_22:
    if (v11)
    {
LABEL_24:

      uint64_t v23 = [v7 usedRecently] ^ 1;
      v22 = self;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  v16 = [v5 bundleIdentifier];
  if (([v16 isEqualToString:@"com.apple.TelephonyUtilities"] & 1) == 0)
  {
    v17 = [v5 bundleIdentifier];
    if (([v17 isEqualToString:@"com.apple.facetime"] & 1) == 0)
    {
      v18 = [v5 bundleIdentifier];
      if (![v18 isEqualToString:@"com.apple.mediaserverd"])
      {
        v24 = [v5 bundleIdentifier];
        unsigned __int8 v25 = [v24 isEqualToString:@"com.apple.avconferenced"];

        if ((v25 & 1) == 0)
        {
          [(RPCCVideoSettingsModuleViewController *)self updateVideoImageViewWithCameraOn:0];
          self->_isVideoModuleOn = 0;
          goto LABEL_26;
        }
        goto LABEL_10;
      }
    }
  }

LABEL_10:
  v19 = [v5 displayName];
  v20 = self->_applicationDisplayName;
  self->_applicationDisplayName = v19;

  applicationBundleID = self->_applicationBundleID;
  self->_applicationBundleID = (NSString *)@"com.apple.facetime";

  v22 = self;
  uint64_t v23 = 0;
LABEL_25:
  [(RPCCVideoSettingsModuleViewController *)v22 updateVideoImageViewWithCameraOn:v23];
  [(RPCCVideoSettingsModuleViewController *)self setupInitialStateAndNotifications];
LABEL_26:
  [(RPCCVideoSettingsModuleViewController *)self updateModuleSubtitle];
}

- (void)setupInitialStateAndNotifications
{
  [(RPCCVideoSettingsModuleViewController *)self setupCameraEffectsNotifications];
  [(RPCCVideoSettingsModuleViewController *)self setupCameraEffectsInitialState];
  [(RPCCVideoSettingsModuleViewController *)self setTitle:self->_applicationDisplayName];

  [(RPCCVideoSettingsModuleViewController *)self setupInitialModuleState];
}

- (void)setupCameraEffectsNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification object:0];
}

- (void)setupCameraEffectsInitialState
{
  if (self->_applicationBundleID)
  {
    self->_int64_t currentBackgroundBlurState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentBackgroundBlurEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentBackgroundBlurSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentBackgroundBlurState = self->_currentBackgroundBlurState;
      BOOL currentBackgroundBlurEnabled = self->_currentBackgroundBlurEnabled;
      BOOL currentBackgroundBlurSupported = self->_currentBackgroundBlurSupported;
      int v16 = 136447234;
      v17 = "-[RPCCVideoSettingsModuleViewController setupCameraEffectsInitialState]";
      __int16 v18 = 1024;
      int v19 = 261;
      __int16 v20 = 2048;
      int64_t v21 = currentBackgroundBlurState;
      __int16 v22 = 1024;
      BOOL v23 = currentBackgroundBlurEnabled;
      __int16 v24 = 1024;
      BOOL v25 = currentBackgroundBlurSupported;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d _currentBackgroundBlurState=%zu _currentBackgroundBlurEnabled=%d _currentBackgroundBlurSupported=%d", (uint8_t *)&v16, 0x28u);
    }
    self->_int64_t currentCenterStageState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentCenterStageEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentCenterStageSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentCenterStageState = self->_currentCenterStageState;
      BOOL currentCenterStageEnabled = self->_currentCenterStageEnabled;
      BOOL currentCenterStageSupported = self->_currentCenterStageSupported;
      int v16 = 136447234;
      v17 = "-[RPCCVideoSettingsModuleViewController setupCameraEffectsInitialState]";
      __int16 v18 = 1024;
      int v19 = 265;
      __int16 v20 = 2048;
      int64_t v21 = currentCenterStageState;
      __int16 v22 = 1024;
      BOOL v23 = currentCenterStageEnabled;
      __int16 v24 = 1024;
      BOOL v25 = currentCenterStageSupported;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d _currentCenterStageState=%zu _currentCenterStageEnabled=%d _currentCenterStageSupported=%d", (uint8_t *)&v16, 0x28u);
    }
    self->_int64_t currentStudioLightState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentStudioLightEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentStudioLightSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentStudioLightState = self->_currentStudioLightState;
      BOOL currentStudioLightEnabled = self->_currentStudioLightEnabled;
      BOOL currentStudioLightSupported = self->_currentStudioLightSupported;
      int v16 = 136447234;
      v17 = "-[RPCCVideoSettingsModuleViewController setupCameraEffectsInitialState]";
      __int16 v18 = 1024;
      int v19 = 269;
      __int16 v20 = 2048;
      int64_t v21 = currentStudioLightState;
      __int16 v22 = 1024;
      BOOL v23 = currentStudioLightEnabled;
      __int16 v24 = 1024;
      BOOL v25 = currentStudioLightSupported;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d _currentStudioLightState=%zu _currentStudioLightEnabled=%d _currentStudioLightSupported=%d", (uint8_t *)&v16, 0x28u);
    }
    self->_int64_t currentGestureState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_BOOL currentGestureEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_BOOL currentGestureSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int64_t currentGestureState = self->_currentGestureState;
      BOOL currentGestureEnabled = self->_currentGestureEnabled;
      BOOL currentGestureSupported = self->_currentGestureSupported;
      int v16 = 136447234;
      v17 = "-[RPCCVideoSettingsModuleViewController setupCameraEffectsInitialState]";
      __int16 v18 = 1024;
      int v19 = 273;
      __int16 v20 = 2048;
      int64_t v21 = currentGestureState;
      __int16 v22 = 1024;
      BOOL v23 = currentGestureEnabled;
      __int16 v24 = 1024;
      BOOL v25 = currentGestureSupported;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d _currentGestureState=%zu _currentGestureEnabled=%d _currentGestureSupported=%d", (uint8_t *)&v16, 0x28u);
    }
  }
  else
  {
    NSLog(@"RPCCVideoSettingsModule: Unable to load initial state, no applicable application bundle ID found");
  }
  BOOL v15 = self->_currentBackgroundBlurSupported;
  if (v15)
  {
    BOOL v15 = self->_currentCenterStageSupported;
    if (v15)
    {
      BOOL v15 = self->_currentStudioLightSupported;
      if (v15) {
        BOOL v15 = self->_currentGestureSupported;
      }
    }
  }
  self->_shouldUseExpandedHeight = v15;
  self->_isVideoModuleOn = [(RPCCVideoSettingsModuleViewController *)self isVideoModuleEnabled];
}

- (void)updateVideoImageViewWithCameraOn:(BOOL)a3
{
  if (a3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  videoImageView = self->_videoImageView;
  if (a3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  [(UIImageView *)videoImageView setAlpha:v4];
  videoOffImageView = self->_videoOffImageView;

  [(UIImageView *)videoOffImageView setAlpha:v6];
}

- (void)updateModuleImageView
{
  id v3 = [(RPCCVideoSettingsModuleViewController *)self view];
  UIUserInterfaceLayoutDirection v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v3 semanticContentAttribute]);

  id v5 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v5 frame];
  if (v4 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v6) + -28.0;
    double v11 = -12.0;
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v6);
    double v11 = 12.0;
  }
  double v12 = MinX + v11;

  videoImageView = self->_videoImageView;
  int v14 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v14 frame];
  -[UIImageView setFrame:](videoImageView, "setFrame:", v12, CGRectGetMidY(v22) + -9.0, 28.0, 18.0);

  BOOL v15 = [(UIImage *)self->_videoImage imageWithRenderingMode:2];
  [(UIImageView *)self->_videoImageView setImage:v15];

  int v16 = [(RPCCVideoSettingsModuleViewController *)self buttonView];
  [v16 addSubview:self->_videoImageView];

  videoOffImageView = self->_videoOffImageView;
  __int16 v18 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v18 frame];
  -[UIImageView setFrame:](videoOffImageView, "setFrame:", v12, CGRectGetMidY(v23) + -11.0, 28.0, 23.0);

  int v19 = [(UIImage *)self->_videoOffImage imageWithRenderingMode:2];
  [(UIImageView *)self->_videoOffImageView setImage:v19];

  id v20 = [(RPCCVideoSettingsModuleViewController *)self buttonView];
  [v20 addSubview:self->_videoOffImageView];
}

- (void)handleAVControlCenterNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:AVControlCenterModulesNotificationBundleIdentifierKey];

  if ([v6 isEqualToString:self->_applicationBundleID])
  {
    v7 = [v4 name];
    unsigned int v8 = [v7 isEqualToString:AVControlCenterVideoEffectsModuleEffectSupportedDidChangeNotification];

    if (v8)
    {
      self->_BOOL currentBackgroundBlurSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
      self->_BOOL currentCenterStageSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
      self->_BOOL currentStudioLightSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
      self->_BOOL currentGestureSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
      if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        BOOL currentBackgroundBlurSupported = self->_currentBackgroundBlurSupported;
        BOOL currentCenterStageSupported = self->_currentCenterStageSupported;
        BOOL currentStudioLightSupported = self->_currentStudioLightSupported;
        BOOL currentGestureSupported = self->_currentGestureSupported;
        *(_DWORD *)buf = 136447490;
        v29 = "-[RPCCVideoSettingsModuleViewController handleAVControlCenterNotification:]";
        __int16 v30 = 1024;
        int v31 = 320;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = currentBackgroundBlurSupported;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = currentCenterStageSupported;
        LOWORD(v34) = 1024;
        *(_DWORD *)((char *)&v34 + 2) = currentStudioLightSupported;
        HIWORD(v34) = 1024;
        *(_DWORD *)v35 = currentGestureSupported;
        int v13 = " [DEBUG] %{public}s:%d _currentBackgroundBlurSupported=%d _currentCenterStageSupported=%d _currentStudioLi"
              "ghtSupported=%d _currentGestureSupported=%d";
LABEL_14:
        uint32_t v20 = 42;
        goto LABEL_15;
      }
    }
    else
    {
      int v14 = [v4 name];
      unsigned int v15 = [v14 isEqualToString:AVControlCenterVideoEffectsModuleEffectControlModeDidChangeNotification];

      if (v15)
      {
        self->_int64_t currentBackgroundBlurState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
        self->_int64_t currentCenterStageState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
        self->_int64_t currentStudioLightState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
        self->_int64_t currentGestureState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
        if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int64_t currentBackgroundBlurState = self->_currentBackgroundBlurState;
          int64_t currentCenterStageState = self->_currentCenterStageState;
          int64_t currentStudioLightState = self->_currentStudioLightState;
          int64_t currentGestureState = self->_currentGestureState;
          *(_DWORD *)buf = 136447490;
          v29 = "-[RPCCVideoSettingsModuleViewController handleAVControlCenterNotification:]";
          __int16 v30 = 1024;
          int v31 = 327;
          __int16 v32 = 2048;
          *(void *)v33 = currentBackgroundBlurState;
          *(_WORD *)&v33[8] = 2048;
          int64_t v34 = currentCenterStageState;
          *(_WORD *)v35 = 2048;
          *(void *)&v35[2] = currentStudioLightState;
          __int16 v36 = 2048;
          int64_t v37 = currentGestureState;
          int v13 = " [DEBUG] %{public}s:%d _currentBackgroundBlurState=%zu _currentCenterStageState=%zu _currentStudioLightS"
                "tate=%zu _currentGestureState==%zu";
          uint32_t v20 = 58;
LABEL_15:
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, v20);
        }
      }
      else
      {
        int64_t v21 = [v4 name];
        unsigned int v22 = [v21 isEqualToString:AVControlCenterVideoEffectsModuleEffectEnabledDidChangeNotification];

        if (v22)
        {
          self->_BOOL currentCenterStageEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
          self->_BOOL currentBackgroundBlurEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
          self->_BOOL currentStudioLightEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
          self->_BOOL currentGestureEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
          if (!__RPLogLevel && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            BOOL currentBackgroundBlurEnabled = self->_currentBackgroundBlurEnabled;
            BOOL currentCenterStageEnabled = self->_currentCenterStageEnabled;
            BOOL currentStudioLightEnabled = self->_currentStudioLightEnabled;
            BOOL currentGestureEnabled = self->_currentGestureEnabled;
            *(_DWORD *)buf = 136447490;
            v29 = "-[RPCCVideoSettingsModuleViewController handleAVControlCenterNotification:]";
            __int16 v30 = 1024;
            int v31 = 334;
            __int16 v32 = 1024;
            *(_DWORD *)v33 = currentBackgroundBlurEnabled;
            *(_WORD *)&v33[4] = 1024;
            *(_DWORD *)&v33[6] = currentCenterStageEnabled;
            LOWORD(v34) = 1024;
            *(_DWORD *)((char *)&v34 + 2) = currentStudioLightEnabled;
            HIWORD(v34) = 1024;
            *(_DWORD *)v35 = currentGestureEnabled;
            int v13 = " [DEBUG] %{public}s:%d _currentBackgroundBlurEnabled=%d _currentCenterStageEnabled=%d _currentStudioLi"
                  "ghtEnabled=%d _currentGestureEnabled=%d";
            goto LABEL_14;
          }
        }
      }
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2F700;
  block[3] = &unk_68F10;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupInitialModuleState
{
  if (self->_currentCenterStageSupported)
  {
    id v3 = [(RPCCVideoSettingsModuleViewController *)self view];
    id v4 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton view];
    [v3 addSubview:v4];

    [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton setEnabled:self->_currentCenterStageEnabled];
    [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton setInoperative:self->_currentCenterStageState == 1];
    [(RPCCVideoSettingsModuleViewController *)self setCinematicFrameButtonSubtitle:self->_currentCenterStageEnabled];
  }
  else
  {
    [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton setEnabled:0];
    [(RPCCVideoSettingsModuleViewController *)self setCinematicFrameButtonSubtitle:0];
    id v5 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton view];
    [v5 removeFromSuperview];
  }
  if (self->_currentBackgroundBlurSupported)
  {
    uint64_t v6 = [(RPCCVideoSettingsModuleViewController *)self view];
    v7 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton view];
    [v6 addSubview:v7];

    [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton setEnabled:self->_currentBackgroundBlurEnabled];
    [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton setInoperative:self->_currentBackgroundBlurState == 1];
    [(RPCCVideoSettingsModuleViewController *)self setPortraitBlurButtonSubtitle:self->_currentBackgroundBlurEnabled];
  }
  else
  {
    [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton setEnabled:0];
    [(RPCCVideoSettingsModuleViewController *)self setPortraitBlurButtonSubtitle:0];
    unsigned int v8 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton view];
    [v8 removeFromSuperview];
  }
  if (self->_currentStudioLightSupported)
  {
    v9 = [(RPCCVideoSettingsModuleViewController *)self view];
    v10 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton view];
    [v9 addSubview:v10];

    [(CCUILabeledRoundButtonViewController *)self->_studioLightButton setEnabled:self->_currentStudioLightEnabled];
    [(CCUILabeledRoundButtonViewController *)self->_studioLightButton setInoperative:self->_currentStudioLightState == 1];
    [(RPCCVideoSettingsModuleViewController *)self setStudioLightButtonSubtitle:self->_currentStudioLightEnabled];
  }
  else
  {
    [(CCUILabeledRoundButtonViewController *)self->_studioLightButton setEnabled:0];
    [(RPCCVideoSettingsModuleViewController *)self setStudioLightButtonSubtitle:0];
    double v11 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton view];
    [v11 removeFromSuperview];
  }
  if (self->_currentGestureSupported && self->_gesturesEnabled)
  {
    double v12 = [(RPCCVideoSettingsModuleViewController *)self view];
    int v13 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton view];
    [v12 addSubview:v13];

    [(CCUILabeledRoundButtonViewController *)self->_gestureButton setEnabled:self->_currentGestureEnabled];
    [(CCUILabeledRoundButtonViewController *)self->_gestureButton setInoperative:self->_currentGestureState == 1];
    [(RPCCVideoSettingsModuleViewController *)self setGestureButtonSubtitle:self->_currentGestureEnabled];
  }
  else
  {
    [(CCUILabeledRoundButtonViewController *)self->_gestureButton setEnabled:0];
    [(RPCCVideoSettingsModuleViewController *)self setGestureButtonSubtitle:0];
    int v14 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton view];
    [v14 removeFromSuperview];
  }

  [(RPCCVideoSettingsModuleViewController *)self updateModuleSubtitle];
}

- (void)setupModuleImageView
{
  id v16 = +[UIImage systemImageNamed:@"video.fill"];
  id v3 = +[UIImage systemImageNamed:@"video.slash.fill"];
  v18.height = 24.0;
  v18.width = 38.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  objc_msgSend(v16, "drawInRect:", 0.0, 0.0, 38.0, 24.0);
  UIGraphicsGetImageFromCurrentImageContext();
  id v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  expandedGlyphImage = self->_expandedGlyphImage;
  self->_expandedGlyphImage = v4;

  UIGraphicsEndImageContext();
  v19.height = 30.0;
  v19.width = 38.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, 38.0, 30.0);
  UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  expandedOffGlyphImage = self->_expandedOffGlyphImage;
  self->_expandedOffGlyphImage = v6;

  UIGraphicsEndImageContext();
  unsigned int v8 = [(RPCCVideoSettingsModuleViewController *)self _cameraIndicatorImage];
  videoImage = self->_videoImage;
  self->_videoImage = v8;

  v10 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_videoImage];
  videoImageView = self->_videoImageView;
  self->_videoImageView = v10;

  [(UIImageView *)self->_videoImageView setAlpha:0.0];
  double v12 = [(RPCCVideoSettingsModuleViewController *)self _cameraOffIndicatorImage];
  videoOffImage = self->_videoOffImage;
  self->_videoOffImage = v12;

  int v14 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_videoOffImage];
  videoOffImageView = self->_videoOffImageView;
  self->_videoOffImageView = v14;

  [(UIImageView *)self->_videoOffImageView setAlpha:0.0];
}

- (void)setupTitleLabelViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  unexpandedTitleLabel = self->_unexpandedTitleLabel;
  self->_unexpandedTitleLabel = v7;

  v9 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v9 addSubview:self->_unexpandedTitleLabel];

  [(UILabel *)self->_unexpandedTitleLabel setNumberOfLines:1];
  [(UILabel *)self->_unexpandedTitleLabel setLineBreakMode:4];
  id v10 = objc_alloc((Class)UIVisualEffectView);
  double v11 = +[UIVibrancyEffect controlCenterPrimaryVibrancyEffect];
  double v12 = (UIVisualEffectView *)[v10 initWithEffect:v11];
  subtitleEffectView = self->_subtitleEffectView;
  self->_subtitleEffectView = v12;

  [(UIVisualEffectView *)self->_subtitleEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  int v14 = self->_subtitleEffectView;
  unsigned int v15 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v15 frame];
  -[UIVisualEffectView setFrame:](v14, "setFrame:");

  id v16 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v16 addSubview:self->_subtitleEffectView];

  [(UIVisualEffectView *)self->_subtitleEffectView setUserInteractionEnabled:0];
  v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  unexpandedSubtitleLabel = self->_unexpandedSubtitleLabel;
  self->_unexpandedSubtitleLabel = v17;

  CGSize v19 = [(UIVisualEffectView *)self->_subtitleEffectView contentView];
  [v19 addSubview:self->_unexpandedSubtitleLabel];

  [(UILabel *)self->_unexpandedSubtitleLabel setNumberOfLines:1];
  [(UILabel *)self->_unexpandedSubtitleLabel setLineBreakMode:4];
  id v20 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_VIDEO_EFFECTS"];
  [(RPCCVideoSettingsModuleViewController *)self setTitle:v20];
}

- (void)setupModuleButtons
{
  id v3 = +[UIImage systemImageNamed:@"person.crop.rectangle.fill"];
  id v4 = +[UIColor whiteColor];
  id v62 = [v3 _flatImageWithColor:v4];

  id v5 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
  uint64_t v6 = +[UIColor systemBlueColor];
  v7 = (CCUILabeledRoundButtonViewController *)[v5 initWithGlyphImage:v62 highlightColor:v6 useLightStyle:1];
  portraitBlurButton = self->_portraitBlurButton;
  self->_portraitBlurButton = v7;

  v9 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton button];
  [v9 setEnabled:1];

  id v10 = self->_portraitBlurButton;
  double v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_PORTRAIT"];
  [(CCUILabeledRoundButtonViewController *)v10 setTitle:v11];

  double v12 = self->_portraitBlurButton;
  int v13 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_MICROPHONE_OFF"];
  [(CCUILabeledRoundButtonViewController *)v12 setSubtitle:v13];

  [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton setLabelsVisible:1];
  int v14 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton button];
  [v14 setUserInteractionEnabled:1];

  unsigned int v15 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton button];
  [v15 addTarget:self action:"portraitBlurButtonPressed:" forControlEvents:64];

  id v16 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton view];
  [v16 setAlpha:0.0];

  v17 = +[UIImage systemImageNamed:@"person.fill.viewfinder"];
  CGSize v18 = +[UIColor whiteColor];
  CGSize v19 = [v17 _flatImageWithColor:v18];

  id v20 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
  int64_t v21 = +[UIColor systemBlueColor];
  unsigned int v22 = (CCUILabeledRoundButtonViewController *)[v20 initWithGlyphImage:v19 highlightColor:v21 useLightStyle:1];
  cinematicFrameButton = self->_cinematicFrameButton;
  self->_cinematicFrameButton = v22;

  __int16 v24 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton button];
  [v24 setEnabled:1];

  BOOL v25 = self->_cinematicFrameButton;
  v26 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_CINEMATIC_FRAMING"];
  [(CCUILabeledRoundButtonViewController *)v25 setTitle:v26];

  v27 = self->_cinematicFrameButton;
  objc_super v28 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_MICROPHONE_OFF"];
  [(CCUILabeledRoundButtonViewController *)v27 setSubtitle:v28];

  [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton setLabelsVisible:1];
  v29 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton button];
  [v29 setUserInteractionEnabled:1];

  __int16 v30 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton button];
  [v30 addTarget:self action:"cinematicFrameButtonPressed:" forControlEvents:64];

  int v31 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton view];
  [v31 setAlpha:0.0];

  __int16 v32 = +[UIImage systemImageNamed:@"rectangle.inset.filled.and.person.filled"];
  v33 = +[UIColor whiteColor];
  int64_t v34 = [v32 _flatImageWithColor:v33];

  id v35 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
  __int16 v36 = +[UIColor systemBlueColor];
  int64_t v37 = (CCUILabeledRoundButtonViewController *)[v35 initWithGlyphImage:v34 highlightColor:v36 useLightStyle:1];
  studioLightButton = self->_studioLightButton;
  self->_studioLightButton = v37;

  v39 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton button];
  [v39 setEnabled:1];

  v40 = self->_studioLightButton;
  v41 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_STUDIO_LIGHT"];
  [(CCUILabeledRoundButtonViewController *)v40 setTitle:v41];

  v42 = self->_studioLightButton;
  v43 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_MICROPHONE_OFF"];
  [(CCUILabeledRoundButtonViewController *)v42 setSubtitle:v43];

  [(CCUILabeledRoundButtonViewController *)self->_studioLightButton setLabelsVisible:1];
  v44 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton button];
  [v44 setUserInteractionEnabled:1];

  v45 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton button];
  [v45 addTarget:self action:"studioLightButtonPressed:" forControlEvents:64];

  v46 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton view];
  [v46 setAlpha:0.0];

  v47 = +[UIImage systemImageNamed:@"hand.raised.square"];
  v48 = +[UIColor whiteColor];
  v49 = [v47 _flatImageWithColor:v48];

  id v50 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
  v51 = +[UIColor systemBlueColor];
  v52 = (CCUILabeledRoundButtonViewController *)[v50 initWithGlyphImage:v49 highlightColor:v51 useLightStyle:1];
  gestureButton = self->_gestureButton;
  self->_gestureButton = v52;

  v54 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton button];
  [v54 setEnabled:1];

  v55 = self->_gestureButton;
  v56 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_GESTURES"];
  [(CCUILabeledRoundButtonViewController *)v55 setTitle:v56];

  v57 = self->_gestureButton;
  v58 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_MICROPHONE_OFF"];
  [(CCUILabeledRoundButtonViewController *)v57 setSubtitle:v58];

  [(CCUILabeledRoundButtonViewController *)self->_gestureButton setLabelsVisible:1];
  v59 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton button];
  [v59 setUserInteractionEnabled:1];

  v60 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton button];
  [v60 addTarget:self action:"gestureButtonPressed:" forControlEvents:64];

  v61 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton view];
  [v61 setAlpha:0.0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCVideoSettingsModuleViewController;
  [(RPCCVideoSettingsModuleViewController *)&v3 viewWillLayoutSubviews];
  [(RPCCVideoSettingsModuleViewController *)self updateModuleImageView];
  [(RPCCVideoSettingsModuleViewController *)self layoutVideoConferenceSubviews];
  if (!self->_shouldLoadFromSensor) {
    [(RPCCVideoSettingsModuleViewController *)self updateVideoButtonConstraints];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)RPCCVideoSettingsModuleViewController;
  id v7 = a4;
  -[RPCCVideoSettingsModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ([(RPCCVideoSettingsModuleViewController *)self isExpanded])
  {
    [(UILabel *)self->_unexpandedTitleLabel removeFromSuperview];
    [(UILabel *)self->_unexpandedSubtitleLabel removeFromSuperview];
    [(UIVisualEffectView *)self->_subtitleEffectView removeFromSuperview];
    [(UIImageView *)self->_videoImageView alpha];
    unsigned int v8 = &OBJC_IVAR___RPCCVideoSettingsModuleViewController__expandedGlyphImage;
    if (v9 == 0.0) {
      unsigned int v8 = &OBJC_IVAR___RPCCVideoSettingsModuleViewController__expandedOffGlyphImage;
    }
    uint64_t v10 = *(void *)&self->CCUIMenuModuleViewController_opaque[*v8];
  }
  else
  {
    [(RPCCVideoSettingsModuleViewController *)self updateModuleImageView];
    double v11 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v11 addSubview:self->_unexpandedTitleLabel];

    double v12 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v12 addSubview:self->_subtitleEffectView];

    int v13 = [(UIVisualEffectView *)self->_subtitleEffectView contentView];
    [v13 addSubview:self->_unexpandedSubtitleLabel];

    uint64_t v10 = 0;
  }
  [(RPCCVideoSettingsModuleViewController *)self setGlyphImage:v10];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_306C8;
  v14[3] = &unk_694D0;
  v14[4] = self;
  [v7 animateAlongsideTransition:v14 completion:0];
}

- (void)layoutVideoConferenceSubviews
{
  if ([(RPCCVideoSettingsModuleViewController *)self isExpanded])
  {
    objc_super v3 = [(RPCCVideoSettingsModuleViewController *)self buttonView];
    objc_msgSend(v3, "setContentEdgeInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);

    [(UIImageView *)self->_videoImageView setHidden:1];
    [(UIImageView *)self->_videoOffImageView setHidden:1];
    [(RPCCVideoSettingsModuleViewController *)self hideVideoConferenceButtons:0];
    [(RPCCVideoSettingsModuleViewController *)self setSelected:0];
  }
  else
  {
    [(RPCCVideoSettingsModuleViewController *)self setSelected:self->_shouldIlluminate];
    if (self->_shouldIlluminate) {
      +[UIVibrancyEffect controlCenterKeyLineOnLightVibrancyEffect];
    }
    else {
    id v4 = +[UIVibrancyEffect controlCenterSecondaryVibrancyEffect];
    }
    [(UIVisualEffectView *)self->_subtitleEffectView setEffect:v4];

    if (self->_shouldIlluminate) {
      +[UIColor systemGreenColor];
    }
    else {
    id v5 = +[UIColor systemWhiteColor];
    }
    [(UIImageView *)self->_videoImageView setTintColor:v5];

    if (self->_shouldIlluminate) {
      +[UIColor systemGreenColor];
    }
    else {
    uint64_t v6 = +[UIColor systemWhiteColor];
    }
    [(UIImageView *)self->_videoOffImageView setTintColor:v6];

    [(UIImageView *)self->_videoImageView setHidden:0];
    [(UIImageView *)self->_videoOffImageView setHidden:0];
    [(RPCCVideoSettingsModuleViewController *)self hideVideoConferenceButtons:1];
    id v37 = [(RPCCVideoSettingsModuleViewController *)self _unexpandedTitleFont];
    [(UILabel *)self->_unexpandedTitleLabel setAlpha:1.0];
    [(UILabel *)self->_unexpandedTitleLabel setFont:v37];
    if (self->_shouldIlluminate) {
      +[UIColor systemBlackColor];
    }
    else {
    id v7 = +[UIColor systemWhiteColor];
    }
    [(UILabel *)self->_unexpandedTitleLabel setTextColor:v7];

    unsigned int v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_VIDEO_EFFECTS"];
    [(UILabel *)self->_unexpandedTitleLabel setText:v8];

    double v9 = [(RPCCVideoSettingsModuleViewController *)self _unexpandedSubtitleFont];
    [(UILabel *)self->_unexpandedSubtitleLabel setFont:v9];
    uint64_t v10 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    CGSize v19 = [(RPCCVideoSettingsModuleViewController *)self traitCollection];
    id v20 = [v19 preferredContentSizeCategory];

    if (UIContentSizeCategoryCompareToCategory(v20, UIContentSizeCategoryExtraExtraExtraLarge) == NSOrderedAscending) {
      double v21 = 12.0;
    }
    else {
      double v21 = 10.0;
    }
    v39.origin.CGFloat x = v12;
    CGFloat v22 = v14;
    v39.origin.CGFloat y = v14;
    v39.size.CGFloat width = v16;
    v39.size.CGFloat height = v18;
    CGRect v40 = CGRectInset(v39, v21, 0.0);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
    CGRectGetWidth(v40);
    v27 = [(RPCCVideoSettingsModuleViewController *)self view];
    if ([v27 _shouldReverseLayoutDirection])
    {
      v41.origin.CGFloat x = v12;
      v41.origin.CGFloat y = v22;
      v41.size.CGFloat width = v16;
      v41.size.CGFloat height = v18;
      CGRectGetWidth(v41);
    }
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGRectGetMinY(v42);
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    CGRectGetHeight(v43);

    objc_super v28 = [(RPCCVideoSettingsModuleViewController *)self view];
    if ([v28 _shouldReverseLayoutDirection])
    {
      v44.size.CGFloat height = v18;
      v44.origin.CGFloat x = v12;
      v44.origin.CGFloat y = v22;
      v44.size.CGFloat width = v16;
      CGRectGetWidth(v44);
    }
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    CGRectGetMinY(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    CGRectGetHeight(v46);

    unexpandedTitleLabel = self->_unexpandedTitleLabel;
    UIRectIntegralWithScale();
    -[UILabel setFrame:](unexpandedTitleLabel, "setFrame:");
    __int16 v30 = self->_unexpandedTitleLabel;
    int v31 = [(RPCCVideoSettingsModuleViewController *)self view];
    if ([v31 _shouldReverseLayoutDirection]) {
      uint64_t v32 = 2;
    }
    else {
      uint64_t v32 = 0;
    }
    [(UILabel *)v30 setTextAlignment:v32];

    unexpandedSubtitleLabel = self->_unexpandedSubtitleLabel;
    UIRectIntegralWithScale();
    -[UILabel setFrame:](unexpandedSubtitleLabel, "setFrame:");
    int64_t v34 = self->_unexpandedSubtitleLabel;
    id v35 = [(RPCCVideoSettingsModuleViewController *)self view];
    if ([v35 _shouldReverseLayoutDirection]) {
      uint64_t v36 = 2;
    }
    else {
      uint64_t v36 = 0;
    }
    [(UILabel *)v34 setTextAlignment:v36];
  }
}

- (BOOL)isVideoModuleEnabled
{
  return self->_currentCenterStageSupported || self->_currentBackgroundBlurSupported;
}

- (id)_unexpandedTitleFont
{
  v2 = [(RPCCVideoSettingsModuleViewController *)self traitCollection];
  objc_super v3 = [v2 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {
    id v4 = UIContentSizeCategoryAccessibilityMedium;

    objc_super v3 = v4;
  }
  id v5 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleLargeTitle];
  uint64_t v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
  UIFontDescriptorTraitKey v13 = UIFontWeightTrait;
  id v7 = +[NSNumber numberWithDouble:UIFontWeightBlack];
  CGFloat v14 = v7;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  double v9 = [v6 fontDescriptorByAddingAttributes:v8];

  uint64_t v10 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v3];
  [v5 scaledValueForValue:v10 compatibleWithTraitCollection:14.0];
  double v11 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9);

  return v11;
}

- (id)_unexpandedSubtitleFont
{
  v2 = [(RPCCVideoSettingsModuleViewController *)self traitCollection];
  objc_super v3 = [v2 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {
    id v4 = UIContentSizeCategoryAccessibilityMedium;

    objc_super v3 = v4;
  }
  id v5 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleSubheadline];
  uint64_t v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  UIFontDescriptorTraitKey v13 = UIFontWeightTrait;
  id v7 = +[NSNumber numberWithDouble:UIFontWeightBold];
  CGFloat v14 = v7;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  double v9 = [v6 fontDescriptorByAddingAttributes:v8];

  uint64_t v10 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v3];
  [v5 scaledValueForValue:v10 compatibleWithTraitCollection:13.0];
  double v11 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9);

  return v11;
}

- (id)_fontForTitleLabel
{
  return +[UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
}

- (id)_imageSymbolConfiguration
{
  v2 = [(RPCCVideoSettingsModuleViewController *)self _fontForTitleLabel];
  objc_super v3 = +[UIImageSymbolConfiguration configurationWithFont:v2 scale:3];

  return v3;
}

- (id)_cameraIndicatorImage
{
  v2 = [(RPCCVideoSettingsModuleViewController *)self _imageSymbolConfiguration];
  objc_super v3 = +[UIImage systemImageNamed:@"video.fill" withConfiguration:v2];

  return v3;
}

- (id)_cameraOffIndicatorImage
{
  v2 = [(RPCCVideoSettingsModuleViewController *)self _imageSymbolConfiguration];
  objc_super v3 = +[UIImage systemImageNamed:@"video.slash.fill" withConfiguration:v2];

  return v3;
}

- (void)updateModuleSubtitle
{
  if (self->_isVideoModuleOn)
  {
    objc_super v3 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton button];
    unsigned int v4 = [v3 isSelected];

    id v5 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton button];
    unsigned int v6 = [v5 isSelected];

    BOOL v7 = 1;
    if (v4) {
      int v8 = 2;
    }
    else {
      int v8 = 1;
    }
    if (v6) {
      unsigned int v9 = v8;
    }
    else {
      unsigned int v9 = v4;
    }
    uint64_t v10 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton button];
    unsigned int v11 = [v10 isSelected];

    CGFloat v12 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton button];
    unsigned int v13 = [v12 isSelected];

    CFStringRef v14 = @"CONTROL_CENTER_VIDEO_EFFECTS_2_ON";
    switch(v9 + v11 + v13)
    {
      case 1u:
        double v15 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton button];
        unsigned __int8 v16 = [v15 isSelected];

        if (v16)
        {
          CFStringRef v14 = @"CONTROL_CENTER_PORTRAIT";
          break;
        }
        double v17 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton button];
        unsigned __int8 v18 = [v17 isSelected];

        if (v18)
        {
          CFStringRef v14 = @"CONTROL_CENTER_CINEMATIC_FRAMING";
          break;
        }
        CGSize v19 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton button];
        unsigned __int8 v20 = [v19 isSelected];

        if ((v20 & 1) == 0) {
          return;
        }
        CFStringRef v14 = @"CONTROL_CENTER_STUDIO_LIGHT";
        break;
      case 2u:
        break;
      case 3u:
        CFStringRef v14 = @"CONTROL_CENTER_VIDEO_EFFECTS_3_ON";
        break;
      case 4u:
        CFStringRef v14 = @"CONTROL_CENTER_VIDEO_EFFECTS_4_ON";
        break;
      default:
        BOOL v7 = 0;
        CFStringRef v14 = @"CONTROL_CENTER_VIDEO_NO_EFFECTS";
        break;
    }
  }
  else
  {
    BOOL v7 = 0;
    CFStringRef v14 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  double v21 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v14];
  [(UILabel *)self->_unexpandedSubtitleLabel setText:v21];

  self->_shouldIlluminate = v7;
}

- (void)updateVideoButtonConstraints
{
  id v102 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton view];
  [v102 sizeToFit];
  objc_super v3 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton view];
  [v3 sizeToFit];
  unsigned int v4 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton view];
  [v4 sizeToFit];
  id v5 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton view];
  [v5 sizeToFit];
  [v102 frame];
  objc_msgSend(v102, "setFrame:");
  [v3 frame];
  objc_msgSend(v3, "setFrame:");
  [v4 frame];
  objc_msgSend(v4, "setFrame:");
  [v5 frame];
  objc_msgSend(v5, "setFrame:");
  if (!self->_currentStudioLightSupported) {
    goto LABEL_76;
  }
  if (self->_currentCenterStageSupported && self->_currentBackgroundBlurSupported && self->_currentGestureSupported)
  {
    unsigned int v6 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v6 frame];
    CGFloat v7 = CGRectGetMinX(v104) + 68.0;
    int v8 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v8 frame];
    objc_msgSend(v102, "setCenter:", v7, CGRectGetMidY(v105));

    unsigned int v9 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v9 frame];
    double MidX = CGRectGetMidX(v106);
    unsigned int v11 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v11 frame];
    objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v107));

    CGFloat v12 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v12 frame];
    CGFloat v13 = CGRectGetMaxX(v108) + -68.0;
    CFStringRef v14 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v14 frame];
    objc_msgSend(v4, "setCenter:", v13, CGRectGetMidY(v109));

    double v15 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v15 frame];
    double v16 = CGRectGetMidX(v110);
    double v17 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v17 frame];
    objc_msgSend(v5, "setCenter:", v16, CGRectGetMidY(v111) + 105.0);

    if (!self->_currentStudioLightSupported)
    {
LABEL_76:
      if (!self->_currentCenterStageSupported) {
        goto LABEL_75;
      }
      if (!self->_currentBackgroundBlurSupported) {
        goto LABEL_75;
      }
      if (!self->_currentGestureSupported) {
        goto LABEL_75;
      }
      unsigned __int8 v18 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v18 frame];
      CGFloat v19 = CGRectGetMinX(v112) + 68.0;
      unsigned __int8 v20 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v20 frame];
      objc_msgSend(v102, "setCenter:", v19, CGRectGetMidY(v113) + 45.0);

      double v21 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v21 frame];
      double v22 = CGRectGetMidX(v114);
      CGRect v23 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v23 frame];
      objc_msgSend(v3, "setCenter:", v22, CGRectGetMidY(v115) + 45.0);

      __int16 v24 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v24 frame];
      CGFloat v25 = CGRectGetMaxX(v116) + -68.0;
      v26 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v26 frame];
      objc_msgSend(v5, "setCenter:", v25, CGRectGetMidY(v117) + 45.0);

      if (!self->_currentStudioLightSupported) {
        goto LABEL_75;
      }
    }
  }
  if (!self->_currentCenterStageSupported && self->_currentBackgroundBlurSupported && self->_currentGestureSupported)
  {
    uint64_t v36 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v36 frame];
    CGFloat v37 = CGRectGetMinX(v124) + 68.0;
    v38 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v38 frame];
    objc_msgSend(v102, "setCenter:", v37, CGRectGetMidY(v125) + 45.0);

    CGRect v39 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v39 frame];
    double v40 = CGRectGetMidX(v126);
    CGRect v41 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v41 frame];
    objc_msgSend(v4, "setCenter:", v40, CGRectGetMidY(v127) + 45.0);

    CGRect v42 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v42 frame];
    CGFloat v43 = CGRectGetMaxX(v128) + -68.0;
    CGRect v44 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v44 frame];
    objc_msgSend(v5, "setCenter:", v43, CGRectGetMidY(v129) + 45.0);

    if (!self->_currentStudioLightSupported) {
      goto LABEL_75;
    }
  }
  if (self->_currentCenterStageSupported && !self->_currentBackgroundBlurSupported && self->_currentGestureSupported)
  {
    CGRect v45 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v45 frame];
    CGFloat v46 = CGRectGetMinX(v130) + 68.0;
    v47 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v47 frame];
    objc_msgSend(v3, "setCenter:", v46, CGRectGetMidY(v131) + 45.0);

    v48 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v48 frame];
    double v49 = CGRectGetMidX(v132);
    id v50 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v50 frame];
    objc_msgSend(v4, "setCenter:", v49, CGRectGetMidY(v133) + 45.0);

    v51 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v51 frame];
    CGFloat v52 = CGRectGetMaxX(v134) + -68.0;
    v53 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v53 frame];
    objc_msgSend(v5, "setCenter:", v52, CGRectGetMidY(v135) + 45.0);

    if (!self->_currentStudioLightSupported) {
      goto LABEL_75;
    }
  }
  if (self->_currentCenterStageSupported && self->_currentBackgroundBlurSupported && !self->_currentGestureSupported)
  {
    v27 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v27 frame];
    CGFloat v28 = CGRectGetMinX(v118) + 68.0;
    v29 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v29 frame];
    objc_msgSend(v102, "setCenter:", v28, CGRectGetMidY(v119) + 45.0);

    __int16 v30 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v30 frame];
    double v31 = CGRectGetMidX(v120);
    uint64_t v32 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v32 frame];
    objc_msgSend(v3, "setCenter:", v31, CGRectGetMidY(v121) + 45.0);

    v33 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v33 frame];
    CGFloat v34 = CGRectGetMaxX(v122) + -68.0;
    id v35 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v35 frame];
    objc_msgSend(v4, "setCenter:", v34, CGRectGetMidY(v123) + 45.0);

    if (!self->_currentStudioLightSupported)
    {
LABEL_75:
      if (self->_currentCenterStageSupported) {
        goto LABEL_29;
      }
      if (!self->_currentBackgroundBlurSupported) {
        goto LABEL_28;
      }
      if (!self->_currentGestureSupported) {
        goto LABEL_28;
      }
      v54 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v54 frame];
      CGFloat v55 = CGRectGetMidX(v136) + -68.0;
      v56 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v56 frame];
      objc_msgSend(v102, "setCenter:", v55, CGRectGetMidY(v137) + 45.0);

      v57 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v57 frame];
      CGFloat v58 = CGRectGetMidX(v138) + 68.0;
      v59 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v59 frame];
      objc_msgSend(v5, "setCenter:", v58, CGRectGetMidY(v139) + 45.0);

      if (!self->_currentStudioLightSupported)
      {
LABEL_28:
        if (!self->_currentCenterStageSupported) {
          goto LABEL_50;
        }
LABEL_29:
        if (self->_currentBackgroundBlurSupported) {
          goto LABEL_77;
        }
        if (!self->_currentGestureSupported) {
          goto LABEL_77;
        }
        v66 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v66 frame];
        CGFloat v67 = CGRectGetMidX(v144) + -68.0;
        v68 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v68 frame];
        objc_msgSend(v3, "setCenter:", v67, CGRectGetMidY(v145) + 45.0);

        v69 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v69 frame];
        CGFloat v70 = CGRectGetMidX(v146) + 68.0;
        v71 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v71 frame];
        objc_msgSend(v5, "setCenter:", v70, CGRectGetMidY(v147) + 45.0);

        if (!self->_currentStudioLightSupported)
        {
LABEL_77:
          if (!self->_currentCenterStageSupported) {
            goto LABEL_50;
          }
          if (!self->_currentBackgroundBlurSupported) {
            goto LABEL_50;
          }
          if (self->_currentGestureSupported) {
            goto LABEL_50;
          }
          v60 = [(RPCCVideoSettingsModuleViewController *)self view];
          [v60 frame];
          CGFloat v61 = CGRectGetMidX(v140) + -68.0;
          id v62 = [(RPCCVideoSettingsModuleViewController *)self view];
          [v62 frame];
          objc_msgSend(v102, "setCenter:", v61, CGRectGetMidY(v141) + 45.0);

          v63 = [(RPCCVideoSettingsModuleViewController *)self view];
          [v63 frame];
          CGFloat v64 = CGRectGetMidX(v142) + 68.0;
          v65 = [(RPCCVideoSettingsModuleViewController *)self view];
          [v65 frame];
          objc_msgSend(v3, "setCenter:", v64, CGRectGetMidY(v143) + 45.0);

          if (!self->_currentStudioLightSupported) {
            goto LABEL_50;
          }
        }
      }
    }
  }
  if (!self->_currentCenterStageSupported)
  {
    if (!self->_currentBackgroundBlurSupported && self->_currentGestureSupported)
    {
      v84 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v84 frame];
      CGFloat v85 = CGRectGetMidX(v156) + -68.0;
      v86 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v86 frame];
      objc_msgSend(v4, "setCenter:", v85, CGRectGetMidY(v157) + 45.0);

      v87 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v87 frame];
      CGFloat v88 = CGRectGetMidX(v158) + 68.0;
      v89 = [(RPCCVideoSettingsModuleViewController *)self view];
      [v89 frame];
      objc_msgSend(v5, "setCenter:", v88, CGRectGetMidY(v159) + 45.0);

      if (!self->_currentStudioLightSupported) {
        goto LABEL_50;
      }
    }
    if (!self->_currentCenterStageSupported)
    {
      if (self->_currentBackgroundBlurSupported && !self->_currentGestureSupported)
      {
        v72 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v72 frame];
        CGFloat v73 = CGRectGetMidX(v148) + -68.0;
        v74 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v74 frame];
        objc_msgSend(v102, "setCenter:", v73, CGRectGetMidY(v149) + 45.0);

        v75 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v75 frame];
        CGFloat v76 = CGRectGetMidX(v150) + 68.0;
        v77 = [(RPCCVideoSettingsModuleViewController *)self view];
        [v77 frame];
        objc_msgSend(v4, "setCenter:", v76, CGRectGetMidY(v151) + 45.0);

        if (!self->_currentStudioLightSupported) {
          goto LABEL_50;
        }
      }
      if (!self->_currentCenterStageSupported) {
        goto LABEL_60;
      }
    }
  }
  if (self->_currentBackgroundBlurSupported) {
    goto LABEL_60;
  }
  if (self->_currentGestureSupported) {
    goto LABEL_60;
  }
  v78 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v78 frame];
  CGFloat v79 = CGRectGetMidX(v152) + -68.0;
  v80 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v80 frame];
  objc_msgSend(v3, "setCenter:", v79, CGRectGetMidY(v153) + 45.0);

  v81 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v81 frame];
  CGFloat v82 = CGRectGetMidX(v154) + 68.0;
  v83 = [(RPCCVideoSettingsModuleViewController *)self view];
  [v83 frame];
  objc_msgSend(v4, "setCenter:", v82, CGRectGetMidY(v155) + 45.0);

  if (self->_currentStudioLightSupported) {
    goto LABEL_60;
  }
LABEL_50:
  if (self->_currentCenterStageSupported)
  {
    if (self->_currentBackgroundBlurSupported) {
      goto LABEL_78;
    }
    if (self->_currentGestureSupported) {
      goto LABEL_78;
    }
    if (self->_currentCenterStageState == 1) {
      goto LABEL_78;
    }
    v90 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v90 frame];
    double v91 = CGRectGetMidX(v160);
    v92 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v92 frame];
    objc_msgSend(v3, "setCenter:", v91, CGRectGetMidY(v161) + 45.0);

    if (!self->_currentStudioLightSupported)
    {
LABEL_78:
      if (self->_currentCenterStageSupported) {
        goto LABEL_65;
      }
      goto LABEL_56;
    }
LABEL_60:
    if (self->_currentCenterStageSupported) {
      goto LABEL_67;
    }
    if (self->_currentBackgroundBlurSupported) {
      goto LABEL_67;
    }
    if (self->_currentGestureSupported) {
      goto LABEL_67;
    }
    if (self->_currentStudioLightState == 1) {
      goto LABEL_67;
    }
    v96 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v96 frame];
    double v97 = CGRectGetMidX(v164);
    v98 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v98 frame];
    objc_msgSend(v4, "setCenter:", v97, CGRectGetMidY(v165) + 45.0);

    if (self->_currentStudioLightSupported) {
      goto LABEL_67;
    }
    goto LABEL_65;
  }
LABEL_56:
  if (self->_currentBackgroundBlurSupported
    && !self->_currentGestureSupported
    && self->_currentBackgroundBlurState != 1)
  {
    v93 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v93 frame];
    double v94 = CGRectGetMidX(v162);
    v95 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v95 frame];
    objc_msgSend(v102, "setCenter:", v94, CGRectGetMidY(v163) + 45.0);

    if (self->_currentStudioLightSupported) {
      goto LABEL_60;
    }
  }
LABEL_65:
  if (!self->_currentCenterStageSupported
    && !self->_currentBackgroundBlurSupported
    && self->_currentGestureSupported
    && self->_currentGestureState != 1)
  {
    v99 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v99 frame];
    double v100 = CGRectGetMidX(v166);
    v101 = [(RPCCVideoSettingsModuleViewController *)self view];
    [v101 frame];
    objc_msgSend(v5, "setCenter:", v100, CGRectGetMidY(v167) + 45.0);
  }
LABEL_67:
}

- (void)portraitBlurButtonPressed:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    CGFloat v7 = "-[RPCCVideoSettingsModuleViewController portraitBlurButtonPressed:]";
    __int16 v8 = 1024;
    int v9 = 857;
    __int16 v10 = 1024;
    unsigned int v11 = [v4 isSelected];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d button.selected=%d", (uint8_t *)&v6, 0x18u);
  }
  -[RPCCVideoSettingsModuleViewController setPortraitBlurButtonSubtitle:](self, "setPortraitBlurButtonSubtitle:", [v4 isSelected]);
  [(RPCCVideoSettingsModuleViewController *)self updateModuleSubtitle];
  [v4 isSelected];
  AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID();
  id v5 = [(RPCCVideoSettingsModuleViewController *)self delegate];
  [v5 updateBackgroundViewControllerAvailableLabel];
}

- (void)cinematicFrameButtonPressed:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    CGFloat v7 = "-[RPCCVideoSettingsModuleViewController cinematicFrameButtonPressed:]";
    __int16 v8 = 1024;
    int v9 = 869;
    __int16 v10 = 1024;
    unsigned int v11 = [v4 isSelected];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d button.selected=%d", (uint8_t *)&v6, 0x18u);
  }
  -[RPCCVideoSettingsModuleViewController setCinematicFrameButtonSubtitle:](self, "setCinematicFrameButtonSubtitle:", [v4 isSelected]);
  [(RPCCVideoSettingsModuleViewController *)self updateModuleSubtitle];
  [v4 isSelected];
  AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID();
  id v5 = [(RPCCVideoSettingsModuleViewController *)self delegate];
  [v5 updateBackgroundViewControllerAvailableLabel];
}

- (void)studioLightButtonPressed:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    CGFloat v7 = "-[RPCCVideoSettingsModuleViewController studioLightButtonPressed:]";
    __int16 v8 = 1024;
    int v9 = 881;
    __int16 v10 = 1024;
    unsigned int v11 = [v4 isSelected];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d button.selected=%d", (uint8_t *)&v6, 0x18u);
  }
  -[RPCCVideoSettingsModuleViewController setStudioLightButtonSubtitle:](self, "setStudioLightButtonSubtitle:", [v4 isSelected]);
  [(RPCCVideoSettingsModuleViewController *)self updateModuleSubtitle];
  [v4 isSelected];
  AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID();
  id v5 = [(RPCCVideoSettingsModuleViewController *)self delegate];
  [v5 updateBackgroundViewControllerAvailableLabel];
}

- (void)gestureButtonPressed:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    CGFloat v7 = "-[RPCCVideoSettingsModuleViewController gestureButtonPressed:]";
    __int16 v8 = 1024;
    int v9 = 893;
    __int16 v10 = 1024;
    unsigned int v11 = [v4 isSelected];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d button.selected=%d", (uint8_t *)&v6, 0x18u);
  }
  -[RPCCVideoSettingsModuleViewController setGestureButtonSubtitle:](self, "setGestureButtonSubtitle:", [v4 isSelected]);
  [(RPCCVideoSettingsModuleViewController *)self updateModuleSubtitle];
  id v5 = [(RPCCVideoSettingsModuleViewController *)self delegate];
  [v5 updateBackgroundViewControllerAvailableLabel];
}

- (void)setPortraitBlurButtonSubtitle:(BOOL)a3
{
  portraitBlurButton = self->_portraitBlurButton;
  if (a3) {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_ON";
  }
  else {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
  [(CCUILabeledRoundButtonViewController *)portraitBlurButton setSubtitle:v5];
}

- (void)setCinematicFrameButtonSubtitle:(BOOL)a3
{
  cinematicFrameButton = self->_cinematicFrameButton;
  if (a3) {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_ON";
  }
  else {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
  [(CCUILabeledRoundButtonViewController *)cinematicFrameButton setSubtitle:v5];
}

- (void)setStudioLightButtonSubtitle:(BOOL)a3
{
  studioLightButton = self->_studioLightButton;
  if (a3) {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_ON";
  }
  else {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
  [(CCUILabeledRoundButtonViewController *)studioLightButton setSubtitle:v5];
}

- (void)setGestureButtonSubtitle:(BOOL)a3
{
  gestureButton = self->_gestureButton;
  if (a3) {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_ON";
  }
  else {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
  [(CCUILabeledRoundButtonViewController *)gestureButton setSubtitle:v5];
}

- (void)hideVideoConferenceButtons:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CCUILabeledRoundButtonViewController *)self->_portraitBlurButton view];
  int v6 = v5;
  if (v3)
  {
    [v5 setAlpha:0.0];

    CGFloat v7 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton view];
    [v7 setAlpha:0.0];

    __int16 v8 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton view];
    [v8 setAlpha:0.0];

    int v9 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton view];
    double v10 = 0.0;
  }
  else
  {
    [v5 setAlpha:1.0];

    unsigned int v11 = [(CCUILabeledRoundButtonViewController *)self->_cinematicFrameButton view];
    [v11 setAlpha:1.0];

    CGFloat v12 = [(CCUILabeledRoundButtonViewController *)self->_studioLightButton view];
    [v12 setAlpha:1.0];

    int v9 = [(CCUILabeledRoundButtonViewController *)self->_gestureButton view];
    double v10 = 1.0;
  }
  id v13 = v9;
  [v9 setAlpha:v10];
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return self->_isVideoModuleOn;
}

- (double)preferredExpandedContentHeight
{
  double result = 320.0;
  if (!self->_shouldUseExpandedHeight) {
    return 260.0;
  }
  return result;
}

- (void)setContentModuleContext:(id)a3
{
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  if (self->_isVideoModuleOn) {
    [(CCUIContentModuleContext *)self->_contentModuleContext requestExpandModule];
  }
}

- (RPCCVideoSettingsModuleViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RPCCVideoSettingsModuleViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldLoadFromSensor
{
  return self->_shouldLoadFromSensor;
}

- (void)setShouldLoadFromSensor:(BOOL)a3
{
  self->_shouldLoadFromSensor = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationContainerPath, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_expandedOffGlyphImage, 0);
  objc_storeStrong((id *)&self->_expandedGlyphImage, 0);
  objc_storeStrong((id *)&self->_gestureButton, 0);
  objc_storeStrong((id *)&self->_studioLightButton, 0);
  objc_storeStrong((id *)&self->_cinematicFrameButton, 0);
  objc_storeStrong((id *)&self->_portraitBlurButton, 0);
  objc_storeStrong((id *)&self->_videoOffImage, 0);
  objc_storeStrong((id *)&self->_videoImage, 0);
  objc_storeStrong((id *)&self->_videoOffImageView, 0);
  objc_storeStrong((id *)&self->_videoImageView, 0);
  objc_storeStrong((id *)&self->_subtitleEffectView, 0);
  objc_storeStrong((id *)&self->_unexpandedSubtitleLabel, 0);

  objc_storeStrong((id *)&self->_unexpandedTitleLabel, 0);
}

@end