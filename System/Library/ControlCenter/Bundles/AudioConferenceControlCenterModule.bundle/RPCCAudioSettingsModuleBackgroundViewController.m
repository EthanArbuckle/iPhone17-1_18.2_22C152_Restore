@interface RPCCAudioSettingsModuleBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)autoMicModeSupported;
- (BOOL)shouldLoadFromSensor;
- (CCUIContentModuleContentViewController)contentViewController;
- (double)CCUIMenuModuleViewHeight;
- (double)CCUIMenuModuleViewWidth;
- (void)automaticMicModeButtonTapped:(id)a3;
- (void)handleAVControlCenterNotification:(id)a3;
- (void)setAutomaticMicModeGlyphState:(BOOL)a3;
- (void)setAutomaticMicModeSubtitle:(BOOL)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setupAutomaticMicModeButton;
- (void)setupMicModeNotifications;
- (void)setupSupportedLabel;
- (void)updateAutoMicModeState;
- (void)updateAutomaticMicModeButtonConstraints;
- (void)updateSupportedLabelConstraints;
- (void)updateSupportedLabelFont;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation RPCCAudioSettingsModuleBackgroundViewController

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)RPCCAudioSettingsModuleBackgroundViewController;
  [(RPCCAudioSettingsModuleBackgroundViewController *)&v14 viewDidLoad];
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  supportedLabel = self->_supportedLabel;
  self->_supportedLabel = v3;

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  CCUIAudioModuleBundle = self->_CCUIAudioModuleBundle;
  self->_CCUIAudioModuleBundle = v5;

  if (!self->_shouldLoadFromSensor)
  {
    id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
    v8 = [v7 stringForKey:@"show-system-ui-bundle-id"];
    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = v8;

    if (self->_applicationBundleID)
    {
      [(RPCCAudioSettingsModuleBackgroundViewController *)self setupSupportedLabel];
      [(RPCCAudioSettingsModuleBackgroundViewController *)self setupMicModeNotifications];
      v10 = +[RPFeatureFlagUtility sharedInstance];
      unsigned int v11 = [v10 audioDSPAutomaticMicModeEnabled];

      if (v11)
      {
        [(RPCCAudioSettingsModuleBackgroundViewController *)self setupAutomaticMicModeButton];
        [(RPCCAudioSettingsModuleBackgroundViewController *)self updateAutoMicModeState];
      }
    }
  }
  v12 = +[CCUICAPackageDescription descriptionForPackageNamed:@"SpatialAudio" inBundle:self->_CCUIAudioModuleBundle];
  packageDescription = self->_packageDescription;
  self->_packageDescription = v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:1];
  v6 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:0];
  if (v5) {
    goto LABEL_2;
  }
  if (objc_opt_respondsToSelector())
  {
    v5 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataEligibleForInactiveMicModeSelection];
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136446722;
      v21 = "-[RPCCAudioSettingsModuleBackgroundViewController viewWillAppear:]";
      __int16 v22 = 1024;
      int v23 = 111;
      __int16 v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d replacing applicationMicData with %@", (uint8_t *)&v20, 0x1Cu);
    }
    if (v5)
    {
LABEL_2:
      id v7 = [v5 displayName];
      applicationDisplayName = self->_applicationDisplayName;
      self->_applicationDisplayName = v7;

      applicationBundleID = [v5 bundleIdentifier];
      unsigned __int8 v10 = [applicationBundleID isEqualToString:@"com.apple.TelephonyUtilities"];
      if (v10)
      {
        int v11 = 0;
        v12 = @"com.apple.facetime";
      }
      else
      {
        v3 = [v5 bundleIdentifier];
        v12 = @"com.apple.facetime";
        if ([v3 isEqualToString:@"com.apple.facetime"])
        {
          int v11 = 0;
        }
        else
        {
          v12 = [v5 bundleIdentifier];
          int v11 = 1;
        }
      }
      objc_storeStrong((id *)&self->_applicationBundleID, v12);
      if (v11) {

      }
      if ((v10 & 1) == 0) {
      goto LABEL_20;
      }
    }
  }
  v13 = [v6 bundleIdentifier];
  if ([v13 isEqualToString:@"com.apple.TelephonyUtilities"])
  {

LABEL_19:
    v16 = [v6 displayName];
    v17 = self->_applicationDisplayName;
    self->_applicationDisplayName = v16;

    v5 = 0;
    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = (NSString *)@"com.apple.facetime";
LABEL_20:

    goto LABEL_21;
  }
  objc_super v14 = [v6 bundleIdentifier];
  unsigned int v15 = [v14 isEqualToString:@"com.apple.facetime"];

  if (v15) {
    goto LABEL_19;
  }
  v5 = 0;
LABEL_21:
  [(RPCCAudioSettingsModuleBackgroundViewController *)self setupSupportedLabel];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self setupMicModeNotifications];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self updateSupportedLabelConstraints];
  v18 = +[RPFeatureFlagUtility sharedInstance];
  unsigned int v19 = [v18 audioDSPAutomaticMicModeEnabled];

  if (v19)
  {
    [(RPCCAudioSettingsModuleBackgroundViewController *)self setupAutomaticMicModeButton];
    [(RPCCAudioSettingsModuleBackgroundViewController *)self updateAutoMicModeState];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCAudioSettingsModuleBackgroundViewController;
  [(RPCCAudioSettingsModuleBackgroundViewController *)&v3 viewWillLayoutSubviews];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self updateAutomaticMicModeButtonConstraints];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self updateSupportedLabelConstraints];
}

- (void)setupMicModeNotifications
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    unsigned __int8 v10 = "-[RPCCAudioSettingsModuleBackgroundViewController setupMicModeNotifications]";
    __int16 v11 = 1024;
    int v12 = 149;
    __int16 v13 = 2112;
    id v14 = (id)AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Registering for notification: %@", (uint8_t *)&v9, 0x1Cu);
  }
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification object:0];

  if (sub_B990() && sub_BA60())
  {
    if (__RPLogLevel <= 1u)
    {
      id v4 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5 = (id *)sub_BA60();
        if (!v5) {
          sub_1DDAC();
        }
        id v6 = *v5;
        int v9 = 136446722;
        unsigned __int8 v10 = "-[RPCCAudioSettingsModuleBackgroundViewController setupMicModeNotifications]";
        __int16 v11 = 1024;
        int v12 = 155;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Registering for notification: %@", (uint8_t *)&v9, 0x1Cu);
      }
    }
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"handleAVControlCenterNotification:" name:AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification object:0];
  }
}

- (void)handleAVControlCenterNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:AVControlCenterModulesNotificationBundleIdentifierKey];

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v16 = "-[RPCCAudioSettingsModuleBackgroundViewController handleAVControlCenterNotification:]";
    __int16 v17 = 1024;
    int v18 = 170;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Received Notification: %@", buf, 0x1Cu);
  }
  if (v6 && [v6 isEqualToString:self->_applicationBundleID])
  {
    id v7 = [v4 name];
    unsigned int v8 = [v7 isEqualToString:AVControlCenterMicrophoneModesModuleSupportedMicrophoneModesDidChangeNotification];

    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_A514;
      v14[3] = &unk_28C20;
      v14[4] = self;
      int v9 = v14;
LABEL_13:
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
      goto LABEL_14;
    }
    unsigned __int8 v10 = [v4 name];
    if ([v10 isEqualToString:AVControlCenterMicrophoneModesModuleAutoEnabledDidChangeNotification])
    {

LABEL_12:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_A5FC;
      v13[3] = &unk_28C20;
      v13[4] = self;
      int v9 = v13;
      goto LABEL_13;
    }
    __int16 v11 = [v4 name];
    unsigned int v12 = [v11 isEqualToString:AVControlCenterMicrophoneModesModuleActiveMicrophoneModeDidChangeNotification];

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
    NSLog(@"BundleID has changed on the notification vs the application using sensor data. CRITIAL FAILURE");
  }
LABEL_14:
}

- (void)setupSupportedLabel
{
  [(UILabel *)self->_supportedLabel removeFromSuperview];
  if (!self->_applicationBundleID) {
    return;
  }
  objc_super v3 = AVControlCenterMicrophoneModesModuleGetSupportedMicrophoneModesForBundleID();
  id v4 = +[NSNumber numberWithInt:0];
  if ([v3 containsObject:v4]) {
    goto LABEL_5;
  }
  v5 = +[NSNumber numberWithInt:2];
  if ([v3 containsObject:v5])
  {

LABEL_5:
    goto LABEL_6;
  }
  unsigned int v12 = +[NSNumber numberWithInt:1];
  unsigned int v13 = [v3 containsObject:v12];

  if (v13)
  {
    supportedLabel = self->_supportedLabel;
    CFStringRef v11 = @"CONTROL_CENTER_STANDARD_VOICE_ISO_UNSUPPORTED";
    goto LABEL_45;
  }
LABEL_6:
  id v6 = +[NSNumber numberWithInt:0];
  if ([v3 containsObject:v6])
  {
LABEL_13:

    goto LABEL_14;
  }
  id v7 = +[NSNumber numberWithInt:2];
  if (([v3 containsObject:v7] & 1) == 0)
  {

    goto LABEL_13;
  }
  unsigned int v8 = +[NSNumber numberWithInt:1];
  unsigned __int8 v9 = [v3 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    supportedLabel = self->_supportedLabel;
    CFStringRef v11 = @"CONTROL_CENTER_STANDARD_MUSIC_UNSUPPORTED";
LABEL_45:
    v30 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v11];
    [(UILabel *)supportedLabel setText:v30];
    int v32 = 1;
    goto LABEL_46;
  }
LABEL_14:
  id v14 = +[NSNumber numberWithInt:0];
  if (![v3 containsObject:v14])
  {
LABEL_17:

    goto LABEL_18;
  }
  unsigned int v15 = +[NSNumber numberWithInt:2];
  if ([v3 containsObject:v15])
  {

    goto LABEL_17;
  }
  id v20 = +[NSNumber numberWithInt:1];
  unsigned __int8 v21 = [v3 containsObject:v20];

  if ((v21 & 1) == 0)
  {
    supportedLabel = self->_supportedLabel;
    CFStringRef v11 = @"CONTROL_CENTER_VOICE_ISO_MUSIC_UNSUPPORTED";
    goto LABEL_45;
  }
LABEL_18:
  v16 = +[NSNumber numberWithInt:0];
  if ([v3 containsObject:v16])
  {
LABEL_25:

    goto LABEL_26;
  }
  __int16 v17 = +[NSNumber numberWithInt:2];
  if (([v3 containsObject:v17] & 1) == 0)
  {

    goto LABEL_25;
  }
  int v18 = +[NSNumber numberWithInt:1];
  unsigned int v19 = [v3 containsObject:v18];

  if (v19)
  {
    supportedLabel = self->_supportedLabel;
    CFStringRef v11 = @"CONTROL_CENTER_STANDARD_UNSUPPORTED";
    goto LABEL_45;
  }
LABEL_26:
  __int16 v22 = +[NSNumber numberWithInt:0];
  if (![v3 containsObject:v22])
  {
LABEL_29:

    goto LABEL_30;
  }
  int v23 = +[NSNumber numberWithInt:2];
  if ([v3 containsObject:v23])
  {

    goto LABEL_29;
  }
  v28 = +[NSNumber numberWithInt:1];
  unsigned int v29 = [v3 containsObject:v28];

  if (v29)
  {
    supportedLabel = self->_supportedLabel;
    CFStringRef v11 = @"CONTROL_CENTER_VOICE_ISO_UNSUPPORTED";
    goto LABEL_45;
  }
LABEL_30:
  __int16 v24 = +[NSNumber numberWithInt:0];
  if (![v3 containsObject:v24])
  {
LABEL_37:

    goto LABEL_38;
  }
  v25 = +[NSNumber numberWithInt:2];
  if (([v3 containsObject:v25] & 1) == 0)
  {

    goto LABEL_37;
  }
  v26 = +[NSNumber numberWithInt:1];
  unsigned __int8 v27 = [v3 containsObject:v26];

  if ((v27 & 1) == 0)
  {
    supportedLabel = self->_supportedLabel;
    CFStringRef v11 = @"CONTROL_CENTER_MUSIC_UNSUPPORTED";
    goto LABEL_45;
  }
LABEL_38:
  v30 = +[NSNumber numberWithInt:0];
  if (([v3 containsObject:v30] & 1) == 0)
  {
    v31 = +[NSNumber numberWithInt:2];
    if (![v3 containsObject:v31])
    {
      v33 = +[NSNumber numberWithInt:1];
      unsigned __int8 v34 = [v3 containsObject:v33];

      if (v34)
      {
        int v32 = 0;
        goto LABEL_47;
      }
      supportedLabel = self->_supportedLabel;
      CFStringRef v11 = @"CONTROL_CENTER_NO_MODES_SUPPORTED";
      goto LABEL_45;
    }
  }
  int v32 = 0;
LABEL_46:

LABEL_47:
  v35 = self->_supportedLabel;
  v36 = +[UIColor whiteColor];
  [(UILabel *)v35 setTextColor:v36];

  [(UILabel *)self->_supportedLabel setTextAlignment:1];
  [(UILabel *)self->_supportedLabel controlCenterApplyPrimaryContentShadow];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self updateSupportedLabelFont];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self updateSupportedLabelConstraints];

  if (v32)
  {
    id v37 = [(RPCCAudioSettingsModuleBackgroundViewController *)self view];
    [v37 addSubview:self->_supportedLabel];
  }
}

- (void)updateSupportedLabelFont
{
  objc_super v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (char *)&dword_0 + 1)
  {

LABEL_3:
    id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [v4 pointSize];
    double v6 = v5;

    double v7 = fmin(v6, 22.0);
    goto LABEL_11;
  }
  unsigned int v8 = +[UIDevice currentDevice];
  if ([v8 userInterfaceIdiom])
  {
  }
  else
  {
    CCUIReferenceScreenBounds();
    double Height = CGRectGetHeight(v15);

    if (Height > 667.0) {
      goto LABEL_3;
    }
  }
  double v7 = 18.0;
  if (CCUIIsPortrait())
  {
    unsigned __int8 v10 = +[UIDevice currentDevice];
    if ([v10 userInterfaceIdiom])
    {
    }
    else
    {
      CCUIReferenceScreenBounds();
      double v11 = CGRectGetHeight(v16);

      if (v11 > 568.0) {
        goto LABEL_3;
      }
    }
  }
LABEL_11:
  supportedLabel = self->_supportedLabel;
  id v13 = +[UIFont systemFontOfSize:v7];
  [(UILabel *)supportedLabel setFont:v13];
}

- (void)updateSupportedLabelConstraints
{
  objc_super v3 = [(RPCCAudioSettingsModuleBackgroundViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  if (CCUIIsPortrait())
  {
    BOOL v12 = 1;
  }
  else
  {
    id v13 = +[UIDevice currentDevice];
    BOOL v12 = [v13 userInterfaceIdiom] == (char *)&dword_0 + 1;
  }
  [(UILabel *)self->_supportedLabel setNumberOfLines:0];
  id v14 = [(RPCCAudioSettingsModuleBackgroundViewController *)self view];
  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  double MidY = CGRectGetMidY(v41);
  v42.origin.x = v5;
  v42.origin.y = v7;
  v42.size.width = v9;
  v42.size.height = v11;
  double v16 = 0.0;
  objc_msgSend(v14, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v42), 1.0);
  double MinX = CGRectGetMinX(v43);

  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  double v18 = CGRectGetMinX(v44);
  if (MinX < v18) {
    double MinX = v18;
  }
  int IsValid = CGFloatIsValid();
  if (v12)
  {
    id v20 = [(RPCCAudioSettingsModuleBackgroundViewController *)self view];
    [v20 safeAreaInsets];
    double v22 = v21;
    double v39 = v21;

    v45.origin.x = v5;
    v45.origin.y = v7;
    v45.size.width = v9;
    v45.size.height = v11;
    double Height = CGRectGetHeight(v45);
    [(RPCCAudioSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    double v25 = (Height - v24) * 0.5 - v22 + -20.0;
    [(RPCCAudioSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewWidth];
    double v27 = v26;
    v46.origin.x = v5;
    v46.origin.y = v7;
    v46.size.width = v9;
    v46.size.height = v11;
    CGFloat v28 = CGRectGetWidth(v46) * 0.5;
    [(UILabel *)self->_supportedLabel frame];
    double v30 = v28 - v29 * 0.5;
    double v31 = v39 + v25 * 0.5 + 10.0;
    [(UILabel *)self->_supportedLabel frame];
    double v33 = v32;
  }
  else
  {
    if (IsValid) {
      double v16 = MinX;
    }
    [(RPCCAudioSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    v47.origin.x = v5;
    v47.origin.y = v7;
    v47.size.width = v9;
    v47.size.height = v11;
    double Width = CGRectGetWidth(v47);
    [(RPCCAudioSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewWidth];
    double v27 = (Width - v35) * 0.5 - v16 + -20.0;
    v36 = [(RPCCAudioSettingsModuleBackgroundViewController *)self view];
    [v36 frame];
    double v30 = v16 + CGRectGetMinX(v48) + 10.0;
    v49.origin.x = v5;
    v49.origin.y = v7;
    v49.size.width = v9;
    v49.size.height = v11;
    double v31 = CGRectGetHeight(v49) * 0.5;
    [(UILabel *)self->_supportedLabel frame];
    double v33 = v37;
  }
  -[UILabel setFrame:](self->_supportedLabel, "setFrame:", v30, v31, v27, v33);
  [(UILabel *)self->_supportedLabel setClipsToBounds:0];
  supportedLabel = self->_supportedLabel;

  [(UILabel *)supportedLabel sizeToFit];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupAutomaticMicModeButton
{
  if (self->_applicationBundleID
    && !self->_automaticMicModeButton
    && [(RPCCAudioSettingsModuleBackgroundViewController *)self autoMicModeSupported])
  {
    id v14 = +[UIImage systemImageNamed:@"mic"];
    id v3 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
    double v4 = +[UIColor systemBlueColor];
    CGFloat v5 = (CCUILabeledRoundButtonViewController *)[v3 initWithGlyphImage:v14 highlightColor:v4];
    automaticMicModeButton = self->_automaticMicModeButton;
    self->_automaticMicModeButton = v5;

    CGFloat v7 = [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton button];
    [v7 setEnabled:1];

    [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton setTitle:@"Automatic Mic Mode"];
    double v8 = self->_automaticMicModeButton;
    CGFloat v9 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_MICROPHONE_OFF"];
    [(CCUILabeledRoundButtonViewController *)v8 setSubtitle:v9];

    [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton setLabelsVisible:1];
    [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton setGlyphState:@"Base State"];
    double v10 = [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton button];
    [v10 setUserInteractionEnabled:1];

    CGFloat v11 = [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton button];
    [v11 addTarget:self action:"automaticMicModeButtonTapped:" forControlEvents:64];

    BOOL v12 = [(RPCCAudioSettingsModuleBackgroundViewController *)self view];
    id v13 = [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton view];
    [v12 addSubview:v13];
  }
}

- (BOOL)autoMicModeSupported
{
  if (!sub_B990()) {
    return 0;
  }
  if (!sub_BC70()) {
    return 0;
  }
  applicationBundleID = self->_applicationBundleID;
  if (!applicationBundleID) {
    return 0;
  }
  double v4 = applicationBundleID;
  CGFloat v5 = (uint64_t (*)(NSString *))sub_BC70();
  if (v5)
  {
    char v6 = v5(v4);

    return v6;
  }
  else
  {
    double v8 = (RPCCAudioSettingsModuleBackgroundViewController *)sub_1DDAC();
    [(RPCCAudioSettingsModuleBackgroundViewController *)v8 updateAutoMicModeState];
  }
  return result;
}

- (void)updateAutoMicModeState
{
  unsigned int v3 = [(RPCCAudioSettingsModuleBackgroundViewController *)self autoMicModeSupported];
  if (v3)
  {
    if (sub_B990())
    {
      if (sub_BDB0())
      {
        applicationBundleID = self->_applicationBundleID;
        if (applicationBundleID)
        {
          CGFloat v5 = applicationBundleID;
          char v6 = (uint64_t (*)(NSString *))sub_BDB0();
          if (!v6)
          {
            SEL v9 = (RPCCAudioSettingsModuleBackgroundViewController *)sub_1DDAC();
            [(RPCCAudioSettingsModuleBackgroundViewController *)v9 updateAutomaticMicModeButtonConstraints];
            return;
          }
          uint64_t v7 = v6(v5);

          [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton setEnabled:v7];
          [(RPCCAudioSettingsModuleBackgroundViewController *)self setAutomaticMicModeSubtitle:[(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton isEnabled]];
        }
      }
    }
  }
  automaticMicModeButton = self->_automaticMicModeButton;

  [(CCUILabeledRoundButtonViewController *)automaticMicModeButton setInoperative:v3 ^ 1];
}

- (void)updateAutomaticMicModeButtonConstraints
{
  automaticMicModeButton = self->_automaticMicModeButton;
  if (automaticMicModeButton)
  {
    id v14 = [(CCUILabeledRoundButtonViewController *)automaticMicModeButton view];
    [v14 sizeToFit];
    double v4 = [(RPCCAudioSettingsModuleBackgroundViewController *)self view];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    [v14 frame];
    objc_msgSend(v14, "setFrame:");
    id v13 = +[UIDevice currentDevice];
    [v13 userInterfaceIdiom];

    v16.origin.x = v6;
    v16.origin.y = v8;
    v16.size.width = v10;
    v16.size.height = v12;
    CGRectGetWidth(v16);
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.width = v10;
    v17.size.height = v12;
    CGRectGetHeight(v17);
    UIPointRoundToViewScale();
    objc_msgSend(v14, "setCenter:");
  }
}

- (void)automaticMicModeButtonTapped:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    CGFloat v10 = "-[RPCCAudioSettingsModuleBackgroundViewController automaticMicModeButtonTapped:]";
    __int16 v11 = 1024;
    int v12 = 376;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton setEnabled:[(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton isEnabled] ^ 1];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self setAutomaticMicModeSubtitle:[(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton isEnabled]];
  [(RPCCAudioSettingsModuleBackgroundViewController *)self setAutomaticMicModeGlyphState:[(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton isEnabled]];
  if (sub_B990() && sub_BEF0())
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton isEnabled];
      int v9 = 136446722;
      CGFloat v10 = "-[RPCCAudioSettingsModuleBackgroundViewController automaticMicModeButtonTapped:]";
      __int16 v11 = 1024;
      int v12 = 387;
      __int16 v13 = 1024;
      unsigned int v14 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %d", (uint8_t *)&v9, 0x18u);
    }
    id v6 = [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton isEnabled];
    double v7 = self->_applicationBundleID;
    CGFloat v8 = (void (*)(id, NSString *))sub_BEF0();
    if (!v8) {
      sub_1DDAC();
    }
    v8(v6, v7);
  }
}

- (void)setAutomaticMicModeSubtitle:(BOOL)a3
{
  if (a3) {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_ON";
  }
  else {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
  [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton setSubtitle:v5];
}

- (void)setAutomaticMicModeGlyphState:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"animating";
  }
  else {
    CFStringRef v3 = @"Base State";
  }
  [(CCUILabeledRoundButtonViewController *)self->_automaticMicModeButton setGlyphState:v3];
}

- (void)setContentModuleContext:(id)a3
{
}

- (double)CCUIMenuModuleViewHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  [WeakRetained preferredExpandedContentHeight];
  double v4 = v3;

  return v4;
}

- (double)CCUIMenuModuleViewWidth
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  [WeakRetained preferredExpandedContentWidth];
  double v4 = v3;

  return v4;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);

  return (CCUIContentModuleContentViewController *)WeakRetained;
}

- (void)setContentViewController:(id)a3
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
  objc_destroyWeak((id *)&self->_contentViewController);
  objc_storeStrong((id *)&self->_supportedLabel, 0);
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
  objc_storeStrong((id *)&self->_CCUIAudioModuleBundle, 0);
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);
  objc_storeStrong((id *)&self->_packageDescription, 0);
  objc_storeStrong((id *)&self->_automaticMicModeButton, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end