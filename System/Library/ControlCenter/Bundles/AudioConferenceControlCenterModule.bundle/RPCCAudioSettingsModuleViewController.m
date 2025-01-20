@interface RPCCAudioSettingsModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isSupportedMicMode:(int64_t)a3;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldLoadFromSensor;
- (id)_audioIndicatorImage;
- (id)_audioOffIndicatorImage;
- (id)_fontForTitleLabel;
- (id)_imageSymbolConfiguration;
- (id)_unexpandedSubtitleFont;
- (id)_unexpandedTitleFont;
- (id)leadingImageForMenuItem:(id)a3;
- (id)menuImageWithImage:(id)a3 size:(CGSize)a4;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)disableAutoMicMode;
- (void)handleAVControlCenterNotification:(id)a3;
- (void)layoutVideoConferenceSubviews;
- (void)loadMenuImages;
- (void)setContentModuleContext:(id)a3;
- (void)setCurrentSelectedMode:(int64_t)a3;
- (void)setModeForBypass;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setupAudioFunctionItems;
- (void)setupInitialSelectedMicMode;
- (void)setupInitialStateAndNotifications;
- (void)setupMicModeColorTint;
- (void)setupMicModeInitialState;
- (void)setupMicModeNotifications;
- (void)setupModuleImageView;
- (void)setupTitleLabelViews;
- (void)updateAudioImageViewWithMicOn:(BOOL)a3;
- (void)updateModuleImageView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RPCCAudioSettingsModuleViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)RPCCAudioSettingsModuleViewController;
  [(RPCCAudioSettingsModuleViewController *)&v8 viewDidLoad];
  [(RPCCAudioSettingsModuleViewController *)self setMinimumMenuItems:3];
  [(RPCCAudioSettingsModuleViewController *)self setVisibleMenuItems:3.0];
  [(RPCCAudioSettingsModuleViewController *)self setIndentation:3];
  [(RPCCAudioSettingsModuleViewController *)self setUseTrailingCheckmarkLayout:1];
  [(RPCCAudioSettingsModuleViewController *)self setupModuleImageView];
  [(RPCCAudioSettingsModuleViewController *)self setupTitleLabelViews];
  [(RPCCAudioSettingsModuleViewController *)self loadMenuImages];
  if (!self->_shouldLoadFromSensor)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
    v4 = [v3 stringForKey:@"show-system-ui-app-name"];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v4;

    v6 = [v3 stringForKey:@"show-system-ui-bundle-id"];
    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = v6;

    [(RPCCAudioSettingsModuleViewController *)self updateAudioImageViewWithMicOn:1];
    [(RPCCAudioSettingsModuleViewController *)self setupMicModeInitialState];
    [(RPCCAudioSettingsModuleViewController *)self setupMicModeNotifications];
    [(RPCCAudioSettingsModuleViewController *)self setupMicModeColorTint];
    [(RPCCAudioSettingsModuleViewController *)self setTitle:self->_applicationDisplayName];
    [(RPCCAudioSettingsModuleViewController *)self setupInitialSelectedMicMode];
    [(UILabel *)self->_unexpandedTitleLabel removeFromSuperview];
    [(UILabel *)self->_unexpandedSubtitleLabel removeFromSuperview];
    [(RPCCAudioSettingsModuleViewController *)self setGlyphImage:self->_expandedGlyphImage];
  }
}

- (void)setupModuleImageView
{
  id v16 = +[UIImage systemImageNamed:@"mic.fill"];
  id v3 = +[UIImage systemImageNamed:@"mic.slash.fill"];
  v18.width = 29.0;
  v18.height = 35.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  objc_msgSend(v16, "drawInRect:", 0.0, 0.0, 29.0, 35.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  expandedGlyphImage = self->_expandedGlyphImage;
  self->_expandedGlyphImage = v4;

  UIGraphicsEndImageContext();
  v19.width = 29.0;
  v19.height = 35.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, 29.0, 35.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  expandedGlyphOffImage = self->_expandedGlyphOffImage;
  self->_expandedGlyphOffImage = v6;

  UIGraphicsEndImageContext();
  objc_super v8 = [(RPCCAudioSettingsModuleViewController *)self _audioIndicatorImage];
  audioImage = self->_audioImage;
  self->_audioImage = v8;

  v10 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_audioImage];
  audioImageView = self->_audioImageView;
  self->_audioImageView = v10;

  [(UIImageView *)self->_audioImageView setAlpha:0.0];
  v12 = [(RPCCAudioSettingsModuleViewController *)self _audioOffIndicatorImage];
  audioOffImage = self->_audioOffImage;
  self->_audioOffImage = v12;

  v14 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:self->_audioOffImage];
  audioOffImageView = self->_audioOffImageView;
  self->_audioOffImageView = v14;

  [(UIImageView *)self->_audioOffImageView setAlpha:0.0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RPCCAudioSettingsModuleViewController;
  [(RPCCAudioSettingsModuleViewController *)&v5 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)RPCCAudioSettingsModuleViewController;
  [(RPCCAudioSettingsModuleViewController *)&v26 viewWillAppear:a3];
  v4 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:1];
  objc_super v5 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:0];
  if (v4) {
    goto LABEL_2;
  }
  if (objc_opt_respondsToSelector())
  {
    v4 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataEligibleForInactiveMicModeSelection];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v28 = "-[RPCCAudioSettingsModuleViewController viewWillAppear:]";
      __int16 v29 = 1024;
      int v30 = 208;
      __int16 v31 = 2112;
      v32 = v4;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d replacing applicationMicData with %@", buf, 0x1Cu);
    }
    if (v4)
    {
LABEL_2:
      v6 = [v4 displayName];
      applicationDisplayName = self->_applicationDisplayName;
      self->_applicationDisplayName = v6;

      objc_super v8 = [v4 bundleIdentifier];
      unsigned __int8 v9 = [v8 isEqualToString:@"com.apple.TelephonyUtilities"];
      if (v9)
      {
        v10 = v5;
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        v14 = @"com.apple.facetime";
      }
      else
      {
        [v4 bundleIdentifier];
        v25 = v14 = @"com.apple.facetime";
        v10 = v5;
        if ([v25 isEqualToString:@"com.apple.facetime"])
        {
          int v11 = 0;
          int v12 = 0;
          int v13 = 0;
        }
        else
        {
          v24 = [v4 bundleIdentifier];
          if ([v24 isEqualToString:@"com.apple.mediaserverd"])
          {
            int v12 = 0;
            int v13 = 0;
            int v11 = 1;
          }
          else
          {
            v23 = [v4 bundleIdentifier];
            if ([v23 isEqualToString:@"com.apple.avconferenced"])
            {
              int v13 = 0;
              int v11 = 1;
              int v12 = 1;
            }
            else
            {
              v14 = [v4 bundleIdentifier];
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
            }
          }
        }
      }
      objc_storeStrong((id *)&self->_applicationBundleID, v14);
      if (v13)
      {

        if (!v12) {
          goto LABEL_22;
        }
      }
      else if (!v12)
      {
LABEL_22:
        if (!v11)
        {
LABEL_24:
          if ((v9 & 1) == 0) {

          }
          -[RPCCAudioSettingsModuleViewController updateAudioImageViewWithMicOn:](self, "updateAudioImageViewWithMicOn:", [v4 usedRecently] ^ 1);
          [(RPCCAudioSettingsModuleViewController *)self setupInitialStateAndNotifications];
          objc_super v5 = v10;
          goto LABEL_27;
        }
LABEL_23:

        goto LABEL_24;
      }

      if (!v11) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  v15 = [v5 bundleIdentifier];
  if ([v15 isEqualToString:@"com.apple.TelephonyUtilities"])
  {
LABEL_14:

LABEL_15:
    CGSize v18 = [v5 displayName];
    CGSize v19 = self->_applicationDisplayName;
    self->_applicationDisplayName = v18;

    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = (NSString *)@"com.apple.facetime";

    [(RPCCAudioSettingsModuleViewController *)self updateAudioImageViewWithMicOn:0];
    [(RPCCAudioSettingsModuleViewController *)self setupInitialStateAndNotifications];
    v4 = 0;
    goto LABEL_27;
  }
  id v16 = [v5 bundleIdentifier];
  if ([v16 isEqualToString:@"com.apple.facetime"])
  {
LABEL_13:

    goto LABEL_14;
  }
  v17 = [v5 bundleIdentifier];
  if ([v17 isEqualToString:@"com.apple.mediaserverd"])
  {

    goto LABEL_13;
  }
  v21 = [v5 bundleIdentifier];
  unsigned __int8 v22 = [v21 isEqualToString:@"com.apple.avconferenced"];

  if (v22) {
    goto LABEL_15;
  }
  [(RPCCAudioSettingsModuleViewController *)self updateAudioImageViewWithMicOn:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPCCAudioSettingsModuleViewController viewWillAppear:]";
    __int16 v29 = 1024;
    int v30 = 245;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d could not find mic or camera sensor data. bypassMode=YES", buf, 0x12u);
  }
  v4 = 0;
  self->_currentBypassMode = 1;
LABEL_27:
  [(RPCCAudioSettingsModuleViewController *)self setupMicModeColorTint];
  [(RPCCAudioSettingsModuleViewController *)self setTitle:self->_applicationDisplayName];
  [(RPCCAudioSettingsModuleViewController *)self setupInitialSelectedMicMode];
}

- (void)setupInitialStateAndNotifications
{
  if (self->_applicationBundleID)
  {
    [(RPCCAudioSettingsModuleViewController *)self setupMicModeInitialState];
    [(RPCCAudioSettingsModuleViewController *)self setupMicModeNotifications];
  }
}

- (void)setupInitialSelectedMicMode
{
  if (self->_currentBypassMode) {
    [(RPCCAudioSettingsModuleViewController *)self setModeForBypass];
  }
  else {
    [(RPCCAudioSettingsModuleViewController *)self setCurrentSelectedMode:self->_currentMicMode];
  }
}

- (void)setupMicModeColorTint
{
  if (self->_currentBypassMode) {
    +[UIColor systemWhiteColor];
  }
  else {
  id v3 = +[UIColor systemOrangeColor];
  }
  [(UIImageView *)self->_audioImageView setTintColor:v3];

  if (self->_currentBypassMode) {
    +[UIColor systemWhiteColor];
  }
  else {
  id v4 = +[UIColor systemOrangeColor];
  }
  [(UIImageView *)self->_audioOffImageView setTintColor:v4];
}

- (void)setupMicModeNotifications
{
  if (!self->_currentBypassMode)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleMicrophoneModeDidChangeNotification object:0];

    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleVoiceProcessingBypassedDidChangeNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification;
    [v6 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification object:0];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"handleAVControlCenterNotification:" name:v7 object:0];
  }
}

- (void)setupMicModeInitialState
{
  if (self->_applicationBundleID)
  {
    self->_currentMicMode = AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID();
    self->_currentBypassMode = AVControlCenterMicrophoneModesModuleIsVoiceProcessingBypassedForBundleID();
    AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
    self->_supportedMicModes = (NSArray *)objc_claimAutoreleasedReturnValue();
    _objc_release_x1();
  }
  else
  {
    NSLog(@"RPCCAudioSettingsModule: Unable to load initial state, no applicable application bundle ID found", a2);
  }
}

- (void)updateAudioImageViewWithMicOn:(BOOL)a3
{
  if (a3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  audioImageView = self->_audioImageView;
  if (a3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  [(UIImageView *)audioImageView setAlpha:v4];
  audioOffImageView = self->_audioOffImageView;

  [(UIImageView *)audioOffImageView setAlpha:v6];
}

- (void)updateModuleImageView
{
  id v3 = [(RPCCAudioSettingsModuleViewController *)self view];
  UIUserInterfaceLayoutDirection v4 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", [v3 semanticContentAttribute]);

  objc_super v5 = [(RPCCAudioSettingsModuleViewController *)self view];
  [v5 frame];
  if (v4 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v6) + -22.0;
    double v11 = -12.0;
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v6);
    double v11 = 12.0;
  }
  double v12 = MinX + v11;

  int v13 = [(RPCCAudioSettingsModuleViewController *)self view];
  [v13 frame];
  CGFloat v14 = CGRectGetMidY(v20) + -13.0;

  -[UIImageView setFrame:](self->_audioImageView, "setFrame:", v12, v14, 22.0, 26.0);
  v15 = [(UIImage *)self->_audioImage imageWithRenderingMode:2];
  [(UIImageView *)self->_audioImageView setImage:v15];

  id v16 = [(RPCCAudioSettingsModuleViewController *)self buttonView];
  [v16 addSubview:self->_audioImageView];

  -[UIImageView setFrame:](self->_audioOffImageView, "setFrame:", v12, v14, 22.0, 26.0);
  v17 = [(UIImage *)self->_audioOffImage imageWithRenderingMode:2];
  [(UIImageView *)self->_audioOffImageView setImage:v17];

  id v18 = [(RPCCAudioSettingsModuleViewController *)self buttonView];
  [v18 addSubview:self->_audioOffImageView];
}

- (void)handleAVControlCenterNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:AVControlCenterModulesNotificationBundleIdentifierKey];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5680;
  block[3] = &unk_28AD8;
  id v10 = v6;
  double v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setModeForBypass
{
  if (self->_applicationBundleID)
  {
    AVControlCenterMicrophoneModesModuleSetMicrophoneModeForBundleID();
    self->_currentMicMode = 0;
  }
  id v3 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_MICROPHONE_OFF"];
  [(UILabel *)self->_unexpandedSubtitleLabel setText:v3];
}

- (void)setCurrentSelectedMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    objc_super v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:*(&off_28BA8 + a3)];
    [(UILabel *)self->_unexpandedSubtitleLabel setText:v5];
  }
  self->_currentMicMode = a3;
  if ([(RPCCAudioSettingsModuleViewController *)self isExpanded])
  {
    [(RPCCAudioSettingsModuleViewController *)self setupAudioFunctionItems];
  }
}

- (BOOL)isSupportedMicMode:(int64_t)a3
{
  applicationBundleID = self->_applicationBundleID;
  if (applicationBundleID)
  {
    objc_super v5 = AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
    uint64_t v6 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v7 = [v5 containsObject:v6];

    LOBYTE(applicationBundleID) = v7;
  }
  return (char)applicationBundleID;
}

- (void)disableAutoMicMode
{
  if (sub_76A8() && sub_7778())
  {
    uint64_t v6 = self->_applicationBundleID;
    id v3 = (void (*)(void, NSString *))sub_7778();
    if (v3)
    {
      v3(0, v6);
    }
    else
    {
      id v4 = (RPCCAudioSettingsModuleViewController *)sub_1DDAC();
      [(RPCCAudioSettingsModuleViewController *)v4 setupAudioFunctionItems];
    }
  }
}

- (void)setupAudioFunctionItems
{
  objc_initWeak(location, self);
  id v3 = objc_alloc((Class)CCUIMenuModuleItem);
  id v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_STANDARD_AUDIO"];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_600C;
  v25[3] = &unk_28B00;
  objc_copyWeak(&v26, location);
  v25[4] = self;
  id v5 = [v3 initWithTitle:v4 identifier:@"defaultAudioAction" handler:v25];

  id v6 = objc_alloc((Class)CCUIMenuModuleItem);
  unsigned __int8 v7 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_VOICE_ISO"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_6138;
  v23[3] = &unk_28B00;
  objc_copyWeak(&v24, location);
  v23[4] = self;
  id v8 = [v6 initWithTitle:v7 identifier:@"voiceIsoAudioAction" handler:v23];

  id v9 = objc_alloc((Class)CCUIMenuModuleItem);
  id v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_WIDE_SPECTRUM_MODE"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_6264;
  v21[3] = &unk_28B00;
  objc_copyWeak(&v22, location);
  v21[4] = self;
  id v11 = [v9 initWithTitle:v10 identifier:@"musicModeAudioAction" handler:v21];

  int64_t currentMicMode = self->_currentMicMode;
  int v13 = v8;
  if (currentMicMode != 2)
  {
    if (currentMicMode == 1)
    {
      int v13 = v11;
    }
    else
    {
      int v13 = v5;
      if (currentMicMode) {
        goto LABEL_7;
      }
    }
  }
  [v13 setSelected:1];
LABEL_7:
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6390;
  v17[3] = &unk_28B28;
  v17[4] = self;
  id v14 = v5;
  id v18 = v14;
  id v15 = v8;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  +[UIView performWithoutAnimation:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(location);
}

- (void)loadMenuImages
{
  id v11 = +[UIImage systemImageNamed:@"mic.fill"];
  id v3 = +[UIImage systemImageNamed:@"person.wave.2.fill"];
  id v4 = +[UIImage systemImageNamed:@"waveform.and.mic"];
  -[RPCCAudioSettingsModuleViewController menuImageWithImage:size:](self, "menuImageWithImage:size:", v11, 23.0, 29.0);
  id v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  standardImage = self->_standardImage;
  self->_standardImage = v5;

  -[RPCCAudioSettingsModuleViewController menuImageWithImage:size:](self, "menuImageWithImage:size:", v3, 27.0, 29.0);
  unsigned __int8 v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
  voiceIsoImage = self->_voiceIsoImage;
  self->_voiceIsoImage = v7;

  -[RPCCAudioSettingsModuleViewController menuImageWithImage:size:](self, "menuImageWithImage:size:", v4, 32.0, 30.0);
  id v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
  wideSpectrumImage = self->_wideSpectrumImage;
  self->_wideSpectrumImage = v9;
}

- (id)menuImageWithImage:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  unsigned __int8 v7 = +[UIColor whiteColor];
  id v8 = [v6 _flatImageWithColor:v7];

  v12.double width = width;
  v12.double height = height;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  objc_msgSend(v8, "drawInRect:", 0.0, 0.0, width, height);
  id v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v9;
}

- (id)leadingImageForMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  unsigned __int8 v6 = [v5 isEqualToString:@"defaultAudioAction"];

  if (v6)
  {
    unsigned __int8 v7 = &OBJC_IVAR___RPCCAudioSettingsModuleViewController__standardImage;
  }
  else
  {
    id v8 = [v4 identifier];
    unsigned int v9 = [v8 isEqualToString:@"voiceIsoAudioAction"];

    unsigned __int8 v7 = &OBJC_IVAR___RPCCAudioSettingsModuleViewController__wideSpectrumImage;
    if (v9) {
      unsigned __int8 v7 = &OBJC_IVAR___RPCCAudioSettingsModuleViewController__voiceIsoImage;
    }
  }
  id v10 = *(id *)&self->CCUIMenuModuleViewController_opaque[*v7];

  return v10;
}

- (void)setupTitleLabelViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  unsigned __int8 v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  unexpandedTitleLabel = self->_unexpandedTitleLabel;
  self->_unexpandedTitleLabel = v7;

  unsigned int v9 = [(RPCCAudioSettingsModuleViewController *)self view];
  [v9 addSubview:self->_unexpandedTitleLabel];

  [(UILabel *)self->_unexpandedTitleLabel setNumberOfLines:1];
  [(UILabel *)self->_unexpandedTitleLabel setLineBreakMode:4];
  id v10 = objc_alloc((Class)UIVisualEffectView);
  id v11 = +[UIVibrancyEffect controlCenterPrimaryVibrancyEffect];
  CGSize v12 = (UIVisualEffectView *)[v10 initWithEffect:v11];
  subtitleEffectView = self->_subtitleEffectView;
  self->_subtitleEffectView = v12;

  [(UIVisualEffectView *)self->_subtitleEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = self->_subtitleEffectView;
  id v15 = [(RPCCAudioSettingsModuleViewController *)self view];
  [v15 frame];
  -[UIVisualEffectView setFrame:](v14, "setFrame:");

  id v16 = [(RPCCAudioSettingsModuleViewController *)self view];
  [v16 addSubview:self->_subtitleEffectView];

  [(UIVisualEffectView *)self->_subtitleEffectView setUserInteractionEnabled:0];
  v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  unexpandedSubtitleLabel = self->_unexpandedSubtitleLabel;
  self->_unexpandedSubtitleLabel = v17;

  id v19 = [(UIVisualEffectView *)self->_subtitleEffectView contentView];
  [v19 addSubview:self->_unexpandedSubtitleLabel];

  [(UILabel *)self->_unexpandedSubtitleLabel setNumberOfLines:1];
  id v20 = self->_unexpandedSubtitleLabel;

  [(UILabel *)v20 setLineBreakMode:4];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCAudioSettingsModuleViewController;
  [(RPCCAudioSettingsModuleViewController *)&v3 viewWillLayoutSubviews];
  [(RPCCAudioSettingsModuleViewController *)self updateModuleImageView];
  [(RPCCAudioSettingsModuleViewController *)self layoutVideoConferenceSubviews];
  if (!self->_shouldLoadFromSensor) {
    [(RPCCAudioSettingsModuleViewController *)self setupAudioFunctionItems];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)RPCCAudioSettingsModuleViewController;
  id v7 = a4;
  -[RPCCAudioSettingsModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ([(RPCCAudioSettingsModuleViewController *)self isExpanded])
  {
    [(UILabel *)self->_unexpandedTitleLabel removeFromSuperview];
    [(UILabel *)self->_unexpandedSubtitleLabel removeFromSuperview];
    [(UIVisualEffectView *)self->_subtitleEffectView removeFromSuperview];
    [(UIImageView *)self->_audioImageView alpha];
    id v8 = &OBJC_IVAR___RPCCAudioSettingsModuleViewController__expandedGlyphImage;
    if (v9 == 0.0) {
      id v8 = &OBJC_IVAR___RPCCAudioSettingsModuleViewController__expandedGlyphOffImage;
    }
    uint64_t v10 = *(void *)&self->CCUIMenuModuleViewController_opaque[*v8];
  }
  else
  {
    [(RPCCAudioSettingsModuleViewController *)self updateModuleImageView];
    id v11 = [(RPCCAudioSettingsModuleViewController *)self view];
    [v11 addSubview:self->_unexpandedTitleLabel];

    CGSize v12 = [(RPCCAudioSettingsModuleViewController *)self view];
    [v12 addSubview:self->_subtitleEffectView];

    int v13 = [(UIVisualEffectView *)self->_subtitleEffectView contentView];
    [v13 addSubview:self->_unexpandedSubtitleLabel];

    uint64_t v10 = 0;
  }
  [(RPCCAudioSettingsModuleViewController *)self setGlyphImage:v10];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_6AAC;
  v14[3] = &unk_28B50;
  v14[4] = self;
  [v7 animateAlongsideTransition:v14 completion:0];
}

- (void)layoutVideoConferenceSubviews
{
  if ([(RPCCAudioSettingsModuleViewController *)self isExpanded])
  {
    [(UIImageView *)self->_audioImageView setHidden:1];
    [(UIImageView *)self->_audioOffImageView setHidden:1];
    [(RPCCAudioSettingsModuleViewController *)self setSelected:0];
  }
  else
  {
    [(RPCCAudioSettingsModuleViewController *)self setSelected:!self->_currentBypassMode];
    if ([(RPCCAudioSettingsModuleViewController *)self isSelected]) {
      +[UIVibrancyEffect controlCenterKeyLineOnLightVibrancyEffect];
    }
    else {
    objc_super v3 = +[UIVibrancyEffect controlCenterSecondaryVibrancyEffect];
    }
    [(UIVisualEffectView *)self->_subtitleEffectView setEffect:v3];

    [(UIImageView *)self->_audioImageView setHidden:0];
    [(UIImageView *)self->_audioOffImageView setHidden:0];
    id v34 = [(RPCCAudioSettingsModuleViewController *)self _unexpandedTitleFont];
    [(UILabel *)self->_unexpandedTitleLabel setAlpha:1.0];
    [(UILabel *)self->_unexpandedTitleLabel setFont:v34];
    if (self->_currentBypassMode) {
      +[UIColor systemWhiteColor];
    }
    else {
    id v4 = +[UIColor systemBlackColor];
    }
    [(UILabel *)self->_unexpandedTitleLabel setTextColor:v4];

    id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_AUDIO_MODULE_TITLE"];
    [(UILabel *)self->_unexpandedTitleLabel setText:v5];

    unsigned __int8 v6 = [(RPCCAudioSettingsModuleViewController *)self _unexpandedSubtitleFont];
    [(UILabel *)self->_unexpandedSubtitleLabel setFont:v6];
    id v7 = [(RPCCAudioSettingsModuleViewController *)self view];
    [v7 bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    id v16 = [(RPCCAudioSettingsModuleViewController *)self traitCollection];
    v17 = [v16 preferredContentSizeCategory];

    if (UIContentSizeCategoryCompareToCategory(v17, UIContentSizeCategoryExtraExtraExtraLarge) == NSOrderedAscending) {
      double v18 = 12.0;
    }
    else {
      double v18 = 10.0;
    }
    v36.origin.CGFloat x = v9;
    CGFloat v19 = v11;
    v36.origin.CGFloat y = v11;
    v36.size.CGFloat width = v13;
    v36.size.CGFloat height = v15;
    CGRect v37 = CGRectInset(v36, v18, 0.0);
    CGFloat x = v37.origin.x;
    CGFloat y = v37.origin.y;
    CGFloat width = v37.size.width;
    CGFloat height = v37.size.height;
    CGRectGetWidth(v37);
    id v24 = [(RPCCAudioSettingsModuleViewController *)self view];
    if ([v24 _shouldReverseLayoutDirection])
    {
      v38.origin.CGFloat x = v9;
      v38.origin.CGFloat y = v19;
      v38.size.CGFloat width = v13;
      v38.size.CGFloat height = v15;
      CGRectGetWidth(v38);
    }
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGRectGetMinY(v39);
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    CGRectGetHeight(v40);

    v25 = [(RPCCAudioSettingsModuleViewController *)self view];
    if ([v25 _shouldReverseLayoutDirection])
    {
      v41.size.CGFloat height = v15;
      v41.origin.CGFloat x = v9;
      v41.origin.CGFloat y = v19;
      v41.size.CGFloat width = v13;
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

    unexpandedTitleLabel = self->_unexpandedTitleLabel;
    UIRectIntegralWithScale();
    -[UILabel setFrame:](unexpandedTitleLabel, "setFrame:");
    v27 = self->_unexpandedTitleLabel;
    v28 = [(RPCCAudioSettingsModuleViewController *)self view];
    if ([v28 _shouldReverseLayoutDirection]) {
      uint64_t v29 = 2;
    }
    else {
      uint64_t v29 = 0;
    }
    [(UILabel *)v27 setTextAlignment:v29];

    unexpandedSubtitleLabel = self->_unexpandedSubtitleLabel;
    UIRectIntegralWithScale();
    -[UILabel setFrame:](unexpandedSubtitleLabel, "setFrame:");
    __int16 v31 = self->_unexpandedSubtitleLabel;
    v32 = [(RPCCAudioSettingsModuleViewController *)self view];
    if ([v32 _shouldReverseLayoutDirection]) {
      uint64_t v33 = 2;
    }
    else {
      uint64_t v33 = 0;
    }
    [(UILabel *)v31 setTextAlignment:v33];
  }
}

- (id)_unexpandedTitleFont
{
  v2 = [(RPCCAudioSettingsModuleViewController *)self traitCollection];
  objc_super v3 = [v2 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {
    id v4 = UIContentSizeCategoryAccessibilityMedium;

    objc_super v3 = v4;
  }
  id v5 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleLargeTitle];
  unsigned __int8 v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleLargeTitle];
  UIFontDescriptorTraitKey v13 = UIFontWeightTrait;
  id v7 = +[NSNumber numberWithDouble:UIFontWeightBlack];
  double v14 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  CGFloat v9 = [v6 fontDescriptorByAddingAttributes:v8];

  double v10 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v3];
  [v5 scaledValueForValue:v10 compatibleWithTraitCollection:14.0];
  CGFloat v11 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9);

  return v11;
}

- (id)_unexpandedSubtitleFont
{
  v2 = [(RPCCAudioSettingsModuleViewController *)self traitCollection];
  objc_super v3 = [v2 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v3))
  {
    id v4 = UIContentSizeCategoryAccessibilityMedium;

    objc_super v3 = v4;
  }
  id v5 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleSubheadline];
  unsigned __int8 v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubheadline];
  UIFontDescriptorTraitKey v13 = UIFontWeightTrait;
  id v7 = +[NSNumber numberWithDouble:UIFontWeightBold];
  double v14 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  CGFloat v9 = [v6 fontDescriptorByAddingAttributes:v8];

  double v10 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v3];
  [v5 scaledValueForValue:v10 compatibleWithTraitCollection:13.0];
  CGFloat v11 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v9);

  return v11;
}

- (id)_fontForTitleLabel
{
  return +[UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
}

- (id)_imageSymbolConfiguration
{
  v2 = [(RPCCAudioSettingsModuleViewController *)self _fontForTitleLabel];
  objc_super v3 = +[UIImageSymbolConfiguration configurationWithFont:v2 scale:1];

  return v3;
}

- (id)_audioIndicatorImage
{
  v2 = [(RPCCAudioSettingsModuleViewController *)self _imageSymbolConfiguration];
  objc_super v3 = +[UIImage systemImageNamed:@"mic.fill" withConfiguration:v2];

  return v3;
}

- (id)_audioOffIndicatorImage
{
  v2 = [(RPCCAudioSettingsModuleViewController *)self _imageSymbolConfiguration];
  objc_super v3 = +[UIImage systemImageNamed:@"mic.slash.fill" withConfiguration:v2];

  return v3;
}

- (void)setContentModuleContext:(id)a3
{
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return !self->_currentBypassMode;
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  if (!self->_currentBypassMode) {
    [(CCUIContentModuleContext *)self->_contentModuleContext requestExpandModule];
  }
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
  objc_storeStrong((id *)&self->_supportedMicModes, 0);
  objc_storeStrong((id *)&self->_defaultChatFlavorKey, 0);
  objc_storeStrong((id *)&self->_defaultBypassKey, 0);
  objc_storeStrong((id *)&self->_applicationKeyString, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
  objc_storeStrong((id *)&self->_wideSpectrumImage, 0);
  objc_storeStrong((id *)&self->_voiceIsoImage, 0);
  objc_storeStrong((id *)&self->_standardImage, 0);
  objc_storeStrong((id *)&self->_expandedGlyphOffImage, 0);
  objc_storeStrong((id *)&self->_expandedGlyphImage, 0);
  objc_storeStrong((id *)&self->_audioFunctionsArray, 0);
  objc_storeStrong((id *)&self->_audioOffImage, 0);
  objc_storeStrong((id *)&self->_audioImage, 0);
  objc_storeStrong((id *)&self->_audioOffImageView, 0);
  objc_storeStrong((id *)&self->_audioImageView, 0);
  objc_storeStrong((id *)&self->_subtitleEffectView, 0);
  objc_storeStrong((id *)&self->_unexpandedSubtitleLabel, 0);

  objc_storeStrong((id *)&self->_unexpandedTitleLabel, 0);
}

@end