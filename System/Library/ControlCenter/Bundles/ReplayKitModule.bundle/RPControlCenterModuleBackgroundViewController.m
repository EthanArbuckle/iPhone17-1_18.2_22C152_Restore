@interface RPControlCenterModuleBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isIPhoneLandscape;
- (BOOL)showsMicrophoneButton;
- (CCUIContentModuleContentViewController)contentViewController;
- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3;
- (RPControlCenterModuleBackgroundViewController)initWithClient:(id)a3;
- (double)CCUIMenuModuleViewHeight;
- (double)CCUIMenuModuleViewWidth;
- (double)_determineButtonWidth;
- (id)_determineButtonCategorySizeThreshold;
- (void)camButtonPressed:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didStartRecordingOrBroadcast;
- (void)didStopRecordingOrBroadcast;
- (void)didUpdateClientStateWithAvailableExtensions:(id)a3 completionHandler:(id)a4;
- (void)micButtonPressed:(id)a3;
- (void)sessionDidFailToStart;
- (void)sessionIsStarting;
- (void)setAvailableExtensions:(id)a3;
- (void)setCamButtonSubtitle:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setMicButtonSubtitle:(BOOL)a3;
- (void)setShowsMicrophoneButton:(BOOL)a3;
- (void)setupCameraButton;
- (void)setupDisclaimerLabel;
- (void)setupMicrophoneButton;
- (void)updateCameraButtonConstraints;
- (void)updateCameraState;
- (void)updateDisclaimerLabelConstraints;
- (void)updateDisclaimerLabelFont;
- (void)updateMicrophoneButtonConstraints;
- (void)updateMicrophoneState;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation RPControlCenterModuleBackgroundViewController

- (RPControlCenterModuleBackgroundViewController)initWithClient:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)RPControlCenterModuleBackgroundViewController;
  v5 = [(RPControlCenterModuleBackgroundViewController *)&v28 init];
  if (v5)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v30 = "-[RPControlCenterModuleBackgroundViewController initWithClient:]";
      __int16 v31 = 1024;
      int v32 = 57;
      __int16 v33 = 2048;
      v34 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    id v6 = objc_storeWeak((id *)&v5->_client, v4);
    [v4 addDegate:v5];

    uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
    RPCCModuleBundle = v5->_RPCCModuleBundle;
    v5->_RPCCModuleBundle = (NSBundle *)v7;

    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    disclaimerLabel = v5->_disclaimerLabel;
    v5->_disclaimerLabel = v9;

    v11 = +[UIImage imageNamed:@"Microphone" inBundle:v5->_RPCCModuleBundle];
    v12 = +[UIColor whiteColor];
    v13 = [v11 _flatImageWithColor:v12];

    id v14 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
    v15 = +[UIColor systemRedColor];
    v16 = (CCUILabeledRoundButtonViewController *)[v14 initWithGlyphImage:v13 highlightColor:v15];
    micButton = v5->_micButton;
    v5->_micButton = v16;

    v5->_showsMicrophoneButton = 1;
    v18 = [(CCUILabeledRoundButtonViewController *)v5->_micButton button];
    [v18 setEnabled:1];

    v19 = +[UIImage systemImageNamed:@"camera"];
    v20 = +[UIColor whiteColor];
    v21 = [v19 _flatImageWithColor:v20];

    id v22 = objc_alloc((Class)CCUILabeledRoundButtonViewController);
    v23 = +[UIColor systemRedColor];
    v24 = (CCUILabeledRoundButtonViewController *)[v22 initWithGlyphImage:v21 highlightColor:v23];
    camButton = v5->_camButton;
    v5->_camButton = v24;

    v26 = [(CCUILabeledRoundButtonViewController *)v5->_camButton button];
    [v26 setEnabled:1];
  }
  return v5;
}

- (void)viewDidLoad
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPControlCenterModuleBackgroundViewController viewDidLoad]";
    __int16 v14 = 1024;
    int v15 = 81;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v11.receiver = self;
  v11.super_class = (Class)RPControlCenterModuleBackgroundViewController;
  [(RPControlCenterModuleBackgroundViewController *)&v11 viewDidLoad];
  self->_currentMode = -1;
  [(RPControlCenterModuleBackgroundViewController *)self setupDisclaimerLabel];
  v3 = [(RPControlCenterModuleBackgroundViewController *)self view];
  [v3 addSubview:self->_disclaimerLabel];

  [(RPControlCenterModuleBackgroundViewController *)self setupMicrophoneButton];
  id v4 = [(RPControlCenterModuleBackgroundViewController *)self view];
  v5 = [(CCUILabeledRoundButtonViewController *)self->_micButton view];
  [v4 addSubview:v5];

  [(RPControlCenterModuleBackgroundViewController *)self setupCameraButton];
  id v6 = +[RPFeatureFlagUtility sharedInstance];
  LODWORD(v5) = [v6 screenRecordingCameraPip];

  if (v5)
  {
    uint64_t v7 = [(RPControlCenterModuleBackgroundViewController *)self view];
    v8 = [(CCUILabeledRoundButtonViewController *)self->_camButton view];
    [v7 addSubview:v8];
  }
  v9 = [(RPControlCenterModuleBackgroundViewController *)self view];
  [v9 setNeedsUpdateConstraints];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)dealloc
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v7 = "-[RPControlCenterModuleBackgroundViewController dealloc]";
    __int16 v8 = 1024;
    int v9 = 104;
    __int16 v10 = 2048;
    objc_super v11 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  [WeakRetained removeDelegate:self];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RPControlCenterModuleBackgroundViewController;
  [(RPControlCenterModuleBackgroundViewController *)&v5 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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

- (void)updateMicrophoneState
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  unsigned int v5 = [WeakRetained microphoneOn];
  unsigned int v6 = [(CCUILabeledRoundButtonViewController *)self->_micButton isEnabled];

  if (v5 != v6 && self->_showsMicrophoneButton)
  {
    id v7 = objc_loadWeakRetained((id *)p_client);
    unsigned int v8 = [v7 microphoneOn];

    if (v8)
    {
      if (__RPLogLevel > 1u || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v13 = 136446466;
      __int16 v14 = "-[RPControlCenterModuleBackgroundViewController updateMicrophoneState]";
      __int16 v15 = 1024;
      int v16 = 126;
      int v9 = " [INFO] %{public}s:%d [_micButton setEnabled:YES];";
    }
    else
    {
      if (__RPLogLevel > 1u || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v13 = 136446466;
      __int16 v14 = "-[RPControlCenterModuleBackgroundViewController updateMicrophoneState]";
      __int16 v15 = 1024;
      int v16 = 128;
      int v9 = " [INFO] %{public}s:%d [_micButton setEnabled:NO];";
    }
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0x12u);
LABEL_11:
    micButton = self->_micButton;
    id v11 = objc_loadWeakRetained((id *)p_client);
    -[CCUILabeledRoundButtonViewController setEnabled:](micButton, "setEnabled:", [v11 microphoneOn]);

    id v12 = objc_loadWeakRetained((id *)p_client);
    -[RPControlCenterModuleBackgroundViewController setMicButtonSubtitle:](self, "setMicButtonSubtitle:", [v12 microphoneOn]);
  }
}

- (void)updateCameraState
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  unsigned int v5 = [WeakRetained cameraOn];
  unsigned int v6 = [(CCUILabeledRoundButtonViewController *)self->_camButton isEnabled];

  if (v5 != v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_client);
    unsigned int v8 = [v7 cameraOn];

    if (v8)
    {
      if (__RPLogLevel > 1u || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      int v13 = 136446466;
      __int16 v14 = "-[RPControlCenterModuleBackgroundViewController updateCameraState]";
      __int16 v15 = 1024;
      int v16 = 139;
      int v9 = " [INFO] %{public}s:%d [_camButton setEnabled:YES];";
    }
    else
    {
      if (__RPLogLevel > 1u || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      int v13 = 136446466;
      __int16 v14 = "-[RPControlCenterModuleBackgroundViewController updateCameraState]";
      __int16 v15 = 1024;
      int v16 = 141;
      int v9 = " [INFO] %{public}s:%d [_camButton setEnabled:NO];";
    }
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 0x12u);
LABEL_10:
    camButton = self->_camButton;
    id v11 = objc_loadWeakRetained((id *)p_client);
    -[CCUILabeledRoundButtonViewController setEnabled:](camButton, "setEnabled:", [v11 cameraOn]);

    id v12 = objc_loadWeakRetained((id *)p_client);
    -[RPControlCenterModuleBackgroundViewController setCamButtonSubtitle:](self, "setCamButtonSubtitle:", [v12 cameraOn]);
  }
}

- (void)setAvailableExtensions:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    if ([v6 count] && (unint64_t)objc_msgSend(v6, "count") < 3) {
      int v4 = 1;
    }
    else {
      int v4 = 2;
    }
  }
  else
  {
    int v4 = 0;
  }
  self->_currentMode = v4;
  [(RPControlCenterModuleBackgroundViewController *)self updateMicrophoneState];
  [(RPControlCenterModuleBackgroundViewController *)self updateCameraState];
  unsigned int v5 = [(RPControlCenterModuleBackgroundViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v5 = "-[RPControlCenterModuleBackgroundViewController viewWillLayoutSubviews]";
    __int16 v6 = 1024;
    int v7 = 169;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPControlCenterModuleBackgroundViewController;
  [(RPControlCenterModuleBackgroundViewController *)&v3 viewWillLayoutSubviews];
  [(RPControlCenterModuleBackgroundViewController *)self setupDisclaimerLabel];
  [(RPControlCenterModuleBackgroundViewController *)self setupMicrophoneButton];
  [(RPControlCenterModuleBackgroundViewController *)self setupCameraButton];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)RPControlCenterModuleBackgroundViewController;
  [(RPControlCenterModuleBackgroundViewController *)&v2 didReceiveMemoryWarning];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(RPControlCenterModuleBackgroundViewController *)self updateDisclaimerLabelFont];
  id v4 = [(RPControlCenterModuleBackgroundViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)setupDisclaimerLabel
{
  if (MGGetBoolAnswer()) {
    CFStringRef v3 = @"CONTROL_CENTER_DISCLAIMER_CHINA";
  }
  else {
    CFStringRef v3 = @"CONTROL_CENTER_DISCLAIMER";
  }
  id v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v3];
  [(UILabel *)self->_disclaimerLabel setText:v4];

  disclaimerLabel = self->_disclaimerLabel;
  __int16 v6 = +[UIColor whiteColor];
  [(UILabel *)disclaimerLabel setTextColor:v6];

  [(UILabel *)self->_disclaimerLabel setTextAlignment:1];
  [(UILabel *)self->_disclaimerLabel controlCenterApplyPrimaryContentShadow];
  [(RPControlCenterModuleBackgroundViewController *)self updateDisclaimerLabelFont];
  [(RPControlCenterModuleBackgroundViewController *)self updateDisclaimerLabelConstraints];
  double v7 = 0.0;
  if (self->_currentMode) {
    double v7 = 1.0;
  }
  unsigned int v8 = self->_disclaimerLabel;

  [(UILabel *)v8 setAlpha:v7];
}

- (void)updateDisclaimerLabelConstraints
{
  CCUIScreenBounds();
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = +[UIDevice currentDevice];
  id v12 = (char *)[v11 userInterfaceIdiom];

  if (v12 == (unsigned char *)&dword_0 + 1)
  {
    int v13 = [(RPControlCenterModuleBackgroundViewController *)self view];
    [v13 bounds];
    CGFloat v4 = v14;
    CGFloat v6 = v15;
    CGFloat v8 = v16;
    CGFloat v10 = v17;
  }
  if (CCUIIsPortrait())
  {
    BOOL v18 = 1;
  }
  else
  {
    v19 = +[UIDevice currentDevice];
    BOOL v18 = [v19 userInterfaceIdiom] == (char *)&dword_0 + 1;
  }
  [(UILabel *)self->_disclaimerLabel setNumberOfLines:0];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 136446978;
    objc_super v28 = "-[RPControlCenterModuleBackgroundViewController updateDisclaimerLabelConstraints]";
    __int16 v29 = 1024;
    int v30 = 222;
    __int16 v31 = 1024;
    BOOL v32 = v18;
    __int16 v33 = 2048;
    id v34 = [UIApp activeInterfaceOrientation];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d portrait mode: %d, orientation: %ld", (uint8_t *)&v27, 0x22u);
  }
  v20 = [(RPControlCenterModuleBackgroundViewController *)self view];
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  double MidY = CGRectGetMidY(v35);
  v36.origin.x = v4;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  objc_msgSend(v20, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v36), 1.0);
  CGRectGetMinX(v37);

  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  CGRectGetMinX(v38);
  CGFloatIsValid();
  if (v18)
  {
    id v22 = [(RPControlCenterModuleBackgroundViewController *)self view];
    [v22 safeAreaInsets];

    v39.origin.x = v4;
    v39.origin.y = v6;
    v39.size.width = v8;
    v39.size.height = v10;
    CGRectGetHeight(v39);
    [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
  }
  else
  {
    [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.width = v8;
    v40.size.height = v10;
    CGRectGetWidth(v40);
  }
  [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewWidth];
  [(UILabel *)self->_disclaimerLabel frame];
  -[UILabel setFrame:](self->_disclaimerLabel, "setFrame:");
  [(UILabel *)self->_disclaimerLabel setClipsToBounds:0];
  CGFloat v23 = v4;
  CGFloat v24 = v6;
  CGFloat v25 = v8;
  CGFloat v26 = v10;
  if (v18) {
    CGRectGetWidth(*(CGRect *)&v23);
  }
  else {
    CGRectGetHeight(*(CGRect *)&v23);
  }
  UIPointRoundToViewScale();
  -[UILabel setCenter:](self->_disclaimerLabel, "setCenter:");
  [(UILabel *)self->_disclaimerLabel sizeToFit];
}

- (void)updateDisclaimerLabelFont
{
  double v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (char *)&dword_0 + 1)
  {
  }
  else
  {
    CGFloat v8 = +[UIDevice currentDevice];
    if ([v8 userInterfaceIdiom])
    {
    }
    else
    {
      CCUIReferenceScreenBounds();
      double Height = CGRectGetHeight(v24);

      if (Height > 667.0) {
        goto LABEL_3;
      }
    }
    double v7 = 18.0;
    if (!CCUIIsPortrait()) {
      goto LABEL_11;
    }
    CGFloat v10 = +[UIDevice currentDevice];
    if ([v10 userInterfaceIdiom])
    {

      goto LABEL_11;
    }
    CCUIReferenceScreenBounds();
    double v11 = CGRectGetHeight(v25);

    if (v11 <= 568.0) {
      goto LABEL_11;
    }
  }
LABEL_3:
  CGFloat v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  [v4 pointSize];
  double v6 = v5;

  double v7 = fmin(v6, 22.0);
LABEL_11:
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(UILabel *)self->_disclaimerLabel font];
    [v12 pointSize];
    int v16 = 136446978;
    double v17 = "-[RPControlCenterModuleBackgroundViewController updateDisclaimerLabelFont]";
    __int16 v18 = 1024;
    int v19 = 267;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2048;
    double v23 = v7;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting font size from %lf to font size %lf ", (uint8_t *)&v16, 0x26u);
  }
  disclaimerLabel = self->_disclaimerLabel;
  double v15 = +[UIFont systemFontOfSize:v7];
  [(UILabel *)disclaimerLabel setFont:v15];
}

- (void)micButtonPressed:(id)a3
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  uint64_t v6 = [WeakRetained microphoneOn] ^ 1;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    double v9 = "-[RPControlCenterModuleBackgroundViewController micButtonPressed:]";
    __int16 v10 = 1024;
    int v11 = 275;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d set microphoneOn set %i", (uint8_t *)&v8, 0x18u);
  }
  id v7 = objc_loadWeakRetained((id *)p_client);
  [v7 setMicrophoneOn:v6];

  [(CCUILabeledRoundButtonViewController *)self->_micButton setEnabled:v6];
  [(RPControlCenterModuleBackgroundViewController *)self setMicButtonSubtitle:v6];
}

- (void)setMicButtonSubtitle:(BOOL)a3
{
  micButton = self->_micButton;
  if (a3) {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_ON";
  }
  else {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
  [(CCUILabeledRoundButtonViewController *)micButton setSubtitle:v5];
}

- (void)updateMicrophoneButtonConstraints
{
  double v3 = [(CCUILabeledRoundButtonViewController *)self->_micButton view];
  [v3 sizeToFit];
  CFStringRef v4 = [(RPControlCenterModuleBackgroundViewController *)self view];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  if (CCUIIsPortrait())
  {
    BOOL v13 = 1;
  }
  else
  {
    double v14 = +[UIDevice currentDevice];
    BOOL v13 = [v14 userInterfaceIdiom] == (char *)&dword_0 + 1;
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v33 = "-[RPControlCenterModuleBackgroundViewController updateMicrophoneButtonConstraints]";
    __int16 v34 = 1024;
    int v35 = 296;
    __int16 v36 = 1024;
    BOOL v37 = v13;
    __int16 v38 = 2048;
    id v39 = [UIApp activeInterfaceOrientation];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d portrait mode: %d, orientation: %ld", buf, 0x22u);
  }
  double v15 = [(RPControlCenterModuleBackgroundViewController *)self view];
  v40.origin.x = v6;
  v40.origin.y = v8;
  v40.size.width = v10;
  v40.size.height = v12;
  double MidY = CGRectGetMidY(v40);
  v41.origin.x = v6;
  v41.origin.y = v8;
  v41.size.width = v10;
  v41.size.height = v12;
  double v17 = 0.0;
  objc_msgSend(v15, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v41), 1.0);
  double MaxX = CGRectGetMaxX(v42);

  v43.origin.x = v6;
  v43.origin.y = v8;
  v43.size.width = v10;
  v43.size.height = v12;
  double v19 = CGRectGetMaxX(v43);
  if (MaxX >= v19) {
    double MaxX = v19;
  }
  if (CGFloatIsValid())
  {
    v44.origin.x = v6;
    v44.origin.y = v8;
    v44.size.width = v10;
    v44.size.height = v12;
    double v17 = CGRectGetMaxX(v44) - MaxX;
  }
  if (v13)
  {
    v45.origin.x = v6;
    v45.origin.y = v8;
    v45.size.width = v10;
    v45.size.height = v12;
    double Height = CGRectGetHeight(v45);
    [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    double v31 = (Height - v21) * 0.5;
  }
  else
  {
    [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    double v31 = v22;
    v46.origin.x = v6;
    v46.origin.y = v8;
    v46.size.width = v10;
    v46.size.height = v12;
    CGRectGetWidth(v46);
  }
  [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewWidth];
  objc_msgSend(v3, "frame", *(void *)&v31, *(void *)&v17);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(RPControlCenterModuleBackgroundViewController *)self _determineButtonWidth];
  objc_msgSend(v3, "setFrame:", v24, v26, v29, v28);
  int v30 = +[RPFeatureFlagUtility sharedInstance];
  [v30 screenRecordingCameraPip];

  v47.origin.x = v6;
  v47.origin.y = v8;
  v47.size.width = v10;
  v47.size.height = v12;
  CGRectGetWidth(v47);
  v48.origin.x = v6;
  v48.origin.y = v8;
  v48.size.width = v10;
  v48.size.height = v12;
  CGRectGetHeight(v48);
  UIPointRoundToViewScale();
  objc_msgSend(v3, "setCenter:");
}

- (void)setupMicrophoneButton
{
  micButton = self->_micButton;
  CFStringRef v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_MICROPHONE"];
  [(CCUILabeledRoundButtonViewController *)micButton setTitle:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  unsigned int v6 = [WeakRetained microphoneOn];

  if (v6) {
    NSLog(@"[_micButton setEnabled:YES];");
  }
  else {
    NSLog(@"[_micButton setEnabled:NO];");
  }
  id v7 = objc_loadWeakRetained((id *)&self->_client);
  -[RPControlCenterModuleBackgroundViewController setMicButtonSubtitle:](self, "setMicButtonSubtitle:", [v7 microphoneOn]);

  [(CCUILabeledRoundButtonViewController *)self->_micButton setLabelsVisible:1];
  CGFloat v8 = self->_micButton;
  id v9 = objc_loadWeakRetained((id *)&self->_client);
  -[CCUILabeledRoundButtonViewController setEnabled:](v8, "setEnabled:", [v9 microphoneOn]);

  CGFloat v10 = [(CCUILabeledRoundButtonViewController *)self->_micButton button];
  [v10 setUserInteractionEnabled:1];

  double v11 = [(CCUILabeledRoundButtonViewController *)self->_micButton button];
  [v11 addTarget:self action:"micButtonPressed:" forEvents:64];

  [(RPControlCenterModuleBackgroundViewController *)self updateMicrophoneButtonConstraints];
  if (!self->_showsMicrophoneButton)
  {
    CGFloat v12 = [(CCUILabeledRoundButtonViewController *)self->_micButton view];
    [v12 setAlpha:0.0];
  }
  BOOL v13 = self->_micButton;
  id v14 = [(RPControlCenterModuleBackgroundViewController *)self _determineButtonCategorySizeThreshold];
  [(CCUILabeledRoundButtonViewController *)v13 setContentSizeCategoryThreshold:v14];
}

- (void)camButtonPressed:(id)a3
{
  p_client = &self->_client;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  uint64_t v6 = [WeakRetained cameraOn] ^ 1;

  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    id v9 = "-[RPControlCenterModuleBackgroundViewController camButtonPressed:]";
    __int16 v10 = 1024;
    int v11 = 361;
    __int16 v12 = 1024;
    int v13 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d set cameraOn set %i", (uint8_t *)&v8, 0x18u);
  }
  id v7 = objc_loadWeakRetained((id *)p_client);
  [v7 setCameraOn:v6];

  [(CCUILabeledRoundButtonViewController *)self->_camButton setEnabled:v6];
  [(RPControlCenterModuleBackgroundViewController *)self setCamButtonSubtitle:v6];
}

- (void)setCamButtonSubtitle:(BOOL)a3
{
  camButton = self->_camButton;
  if (a3) {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_ON";
  }
  else {
    CFStringRef v4 = @"CONTROL_CENTER_MICROPHONE_OFF";
  }
  id v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v4];
  [(CCUILabeledRoundButtonViewController *)camButton setSubtitle:v5];
}

- (void)updateCameraButtonConstraints
{
  double v3 = [(CCUILabeledRoundButtonViewController *)self->_camButton view];
  [v3 sizeToFit];
  CFStringRef v4 = [(RPControlCenterModuleBackgroundViewController *)self view];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  if (CCUIIsPortrait())
  {
    BOOL v13 = 1;
  }
  else
  {
    id v14 = +[UIDevice currentDevice];
    BOOL v13 = [v14 userInterfaceIdiom] == (char *)&dword_0 + 1;
  }
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v32 = "-[RPControlCenterModuleBackgroundViewController updateCameraButtonConstraints]";
    __int16 v33 = 1024;
    int v34 = 382;
    __int16 v35 = 1024;
    BOOL v36 = v13;
    __int16 v37 = 2048;
    id v38 = [UIApp activeInterfaceOrientation];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d portrait mode: %d, orientation: %ld", buf, 0x22u);
  }
  double v15 = [(RPControlCenterModuleBackgroundViewController *)self view];
  v39.origin.x = v6;
  v39.origin.y = v8;
  v39.size.width = v10;
  v39.size.height = v12;
  double MidY = CGRectGetMidY(v39);
  v40.origin.x = v6;
  v40.origin.y = v8;
  v40.size.width = v10;
  v40.size.height = v12;
  double v17 = 0.0;
  objc_msgSend(v15, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:", 10, 1, 0.0, MidY, CGRectGetWidth(v40), 1.0);
  double MaxX = CGRectGetMaxX(v41);

  v42.origin.x = v6;
  v42.origin.y = v8;
  v42.size.width = v10;
  v42.size.height = v12;
  double v19 = CGRectGetMaxX(v42);
  if (MaxX >= v19) {
    double MaxX = v19;
  }
  if (CGFloatIsValid())
  {
    v43.origin.x = v6;
    v43.origin.y = v8;
    v43.size.width = v10;
    v43.size.height = v12;
    double v17 = CGRectGetMaxX(v43) - MaxX;
  }
  if (v13)
  {
    v44.origin.x = v6;
    v44.origin.y = v8;
    v44.size.width = v10;
    v44.size.height = v12;
    double Height = CGRectGetHeight(v44);
    [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    double v30 = (Height - v21) * 0.5;
  }
  else
  {
    [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    double v30 = v22;
    v45.origin.x = v6;
    v45.origin.y = v8;
    v45.size.width = v10;
    v45.size.height = v12;
    CGRectGetWidth(v45);
  }
  [(RPControlCenterModuleBackgroundViewController *)self CCUIMenuModuleViewWidth];
  objc_msgSend(v3, "frame", *(void *)&v30, *(void *)&v17);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(RPControlCenterModuleBackgroundViewController *)self _determineButtonWidth];
  objc_msgSend(v3, "setFrame:", v24, v26, v29, v28);
  v46.origin.x = v6;
  v46.origin.y = v8;
  v46.size.width = v10;
  v46.size.height = v12;
  CGRectGetWidth(v46);
  v47.origin.x = v6;
  v47.origin.y = v8;
  v47.size.width = v10;
  v47.size.height = v12;
  CGRectGetHeight(v47);
  UIPointRoundToViewScale();
  objc_msgSend(v3, "setCenter:");
}

- (void)setupCameraButton
{
  camButton = self->_camButton;
  CFStringRef v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"CONTROL_CENTER_CAMERA"];
  [(CCUILabeledRoundButtonViewController *)camButton setTitle:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  unsigned int v6 = [WeakRetained cameraOn];

  if (v6) {
    NSLog(@"[_micButton setEnabled:YES];");
  }
  else {
    NSLog(@"[_micButton setEnabled:NO];");
  }
  id v7 = objc_loadWeakRetained((id *)&self->_client);
  -[RPControlCenterModuleBackgroundViewController setCamButtonSubtitle:](self, "setCamButtonSubtitle:", [v7 cameraOn]);

  [(CCUILabeledRoundButtonViewController *)self->_camButton setLabelsVisible:1];
  CGFloat v8 = self->_camButton;
  id v9 = objc_loadWeakRetained((id *)&self->_client);
  -[CCUILabeledRoundButtonViewController setEnabled:](v8, "setEnabled:", [v9 cameraOn]);

  CGFloat v10 = [(CCUILabeledRoundButtonViewController *)self->_camButton button];
  [v10 setUserInteractionEnabled:1];

  double v11 = [(CCUILabeledRoundButtonViewController *)self->_camButton button];
  [v11 addTarget:self action:"camButtonPressed:" forEvents:64];

  [(RPControlCenterModuleBackgroundViewController *)self updateCameraButtonConstraints];
  CGFloat v12 = [(CCUILabeledRoundButtonViewController *)self->_camButton view];
  [v12 setAlpha:1.0];

  BOOL v13 = self->_camButton;
  id v14 = [(RPControlCenterModuleBackgroundViewController *)self _determineButtonCategorySizeThreshold];
  [(CCUILabeledRoundButtonViewController *)v13 setContentSizeCategoryThreshold:v14];
}

- (void)sessionIsStarting
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    unsigned int v6 = "-[RPControlCenterModuleBackgroundViewController sessionIsStarting]";
    __int16 v7 = 1024;
    int v8 = 438;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  double v3 = [(CCUILabeledRoundButtonViewController *)self->_micButton button];
  [v3 setEnabled:0];

  CFStringRef v4 = [(CCUILabeledRoundButtonViewController *)self->_camButton button];
  [v4 setEnabled:0];
}

- (void)sessionDidFailToStart
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    unsigned int v6 = "-[RPControlCenterModuleBackgroundViewController sessionDidFailToStart]";
    __int16 v7 = 1024;
    int v8 = 445;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  double v3 = [(CCUILabeledRoundButtonViewController *)self->_micButton button];
  [v3 setEnabled:1];

  CFStringRef v4 = [(CCUILabeledRoundButtonViewController *)self->_camButton button];
  [v4 setEnabled:1];
}

- (void)didStartRecordingOrBroadcast
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    unsigned int v6 = "-[RPControlCenterModuleBackgroundViewController didStartRecordingOrBroadcast]";
    __int16 v7 = 1024;
    int v8 = 452;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  double v3 = [(CCUILabeledRoundButtonViewController *)self->_micButton button];
  [v3 setEnabled:1];

  CFStringRef v4 = [(CCUILabeledRoundButtonViewController *)self->_camButton button];
  [v4 setEnabled:0];
}

- (void)didStopRecordingOrBroadcast
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[RPControlCenterModuleBackgroundViewController didStopRecordingOrBroadcast]";
    __int16 v6 = 1024;
    int v7 = 462;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  double v3 = [(CCUILabeledRoundButtonViewController *)self->_camButton button];
  [v3 setEnabled:1];
}

- (void)didUpdateClientStateWithAvailableExtensions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    id v9 = "-[RPControlCenterModuleBackgroundViewController didUpdateClientStateWithAvailableExtensions:completionHandler:]";
    __int16 v10 = 1024;
    int v11 = 467;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  [(RPControlCenterModuleBackgroundViewController *)self setAvailableExtensions:v6];
  [(RPControlCenterModuleBackgroundViewController *)self updateMicrophoneState];
  [(RPControlCenterModuleBackgroundViewController *)self updateCameraState];
}

- (CGRect)effectiveContentFrameForContainerFrame:(CGRect)a3
{
  int v4 = [(CCUILabeledRoundButtonViewController *)self->_micButton view];
  [(UILabel *)self->_disclaimerLabel frame];
  double v6 = v5;
  [(UILabel *)self->_disclaimerLabel frame];
  double v8 = v7;
  [v4 center];
  double v10 = v9;
  [(UILabel *)self->_disclaimerLabel frame];
  double v12 = v11;
  [v4 center];
  double v14 = v13;
  [v4 frame];
  double v16 = v15;
  double v17 = [(RPControlCenterModuleBackgroundViewController *)self traitCollection];
  __int16 v18 = [v17 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

  if (IsAccessibilityCategory)
  {
    __int16 v20 = +[UIScreen mainScreen];
    [v20 bounds];
    double v22 = v21;
  }
  else
  {
    double v22 = v14 + v16 * 0.5 - v8;
  }

  double v23 = v6;
  double v24 = v8;
  double v25 = v10 + v12 * 0.5 - v6;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)_isIPhoneLandscape
{
  objc_super v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (char *)&dword_0 + 1) {
    LOBYTE(v3) = 0;
  }
  else {
    int v3 = CCUIIsPortrait() ^ 1;
  }

  return v3;
}

- (double)_determineButtonWidth
{
  int v3 = [(RPControlCenterModuleBackgroundViewController *)self traitCollection];
  int v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory) {
    return 85.0;
  }
  unsigned int v6 = [(RPControlCenterModuleBackgroundViewController *)self _isIPhoneLandscape];
  double result = 212.0;
  if (v6) {
    return 173.0;
  }
  return result;
}

- (id)_determineButtonCategorySizeThreshold
{
  if ([(RPControlCenterModuleBackgroundViewController *)self _isIPhoneLandscape])
  {
    objc_super v2 = &UIContentSizeCategoryExtraExtraLarge;
  }
  else
  {
    int v3 = +[RPFeatureFlagUtility sharedInstance];
    unsigned int v4 = [v3 screenRecordingCameraPip];

    objc_super v2 = &UIContentSizeCategoryAccessibilityMedium;
    if (v4) {
      objc_super v2 = &UIContentSizeCategoryExtraExtraExtraLarge;
    }
  }
  UIContentSizeCategory v5 = *v2;

  return v5;
}

- (BOOL)showsMicrophoneButton
{
  return self->_showsMicrophoneButton;
}

- (void)setShowsMicrophoneButton:(BOOL)a3
{
  self->_showsMicrophoneButton = a3;
}

- (CCUIContentModuleContentViewController)contentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);

  return (CCUIContentModuleContentViewController *)WeakRetained;
}

- (void)setContentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentViewController);
  objc_storeStrong((id *)&self->_camButton, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_RPCCModuleBundle, 0);
  objc_storeStrong((id *)&self->_micButton, 0);

  objc_destroyWeak((id *)&self->_client);
}

@end