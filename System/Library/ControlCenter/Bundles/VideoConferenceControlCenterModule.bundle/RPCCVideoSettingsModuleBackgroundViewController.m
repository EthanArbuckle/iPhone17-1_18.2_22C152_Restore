@interface RPCCVideoSettingsModuleBackgroundViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldLoadFromSensor;
- (CCUIContentModuleContentViewController)contentViewController;
- (double)CCUIMenuModuleViewHeight;
- (double)CCUIMenuModuleViewWidth;
- (id)getUnavailableString;
- (id)unavailableStringForReason:(unint64_t)a3 appName:(id)a4 forVideoEffect:(unint64_t)a5;
- (void)setContentModuleContext:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setupCameraEffectsInitialState;
- (void)setupUnavailableLabel;
- (void)updateSupportedLabelConstraints;
- (void)updateSupportedLabelFont;
- (void)updateUnavailableLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation RPCCVideoSettingsModuleBackgroundViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)RPCCVideoSettingsModuleBackgroundViewController;
  [(RPCCVideoSettingsModuleBackgroundViewController *)&v8 viewDidLoad];
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  supportedLabel = self->_supportedLabel;
  self->_supportedLabel = v3;

  if (!self->_shouldLoadFromSensor)
  {
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cameracapture.volatile"];
    v6 = [v5 stringForKey:@"show-system-ui-bundle-id"];
    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = v6;

    if (self->_applicationBundleID)
    {
      [(RPCCVideoSettingsModuleBackgroundViewController *)self setupCameraEffectsInitialState];
      [(RPCCVideoSettingsModuleBackgroundViewController *)self setupUnavailableLabel];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)RPCCVideoSettingsModuleBackgroundViewController;
  [(RPCCVideoSettingsModuleBackgroundViewController *)&v19 viewWillAppear:a3];
  id v5 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:1];
  v6 = [(CCUIContentModuleContext *)self->_contentModuleContext sensorActivityDataForActiveSensorType:0];
  v7 = v6;
  if (v6)
  {
    objc_super v8 = [v6 displayName];
    applicationDisplayName = self->_applicationDisplayName;
    self->_applicationDisplayName = v8;

    applicationBundleID = [v7 bundleIdentifier];
    unsigned __int8 v11 = [applicationBundleID isEqualToString:@"com.apple.TelephonyUtilities"];
    if (v11)
    {
      int v12 = 0;
      v13 = @"com.apple.facetime";
    }
    else
    {
      v3 = [v7 bundleIdentifier];
      v13 = @"com.apple.facetime";
      if ([v3 isEqualToString:@"com.apple.facetime"])
      {
        int v12 = 0;
      }
      else
      {
        v13 = [v7 bundleIdentifier];
        int v12 = 1;
      }
    }
    objc_storeStrong((id *)&self->_applicationBundleID, v13);
    if (v12) {

    }
    if ((v11 & 1) == 0) {
    goto LABEL_15;
    }
  }
  v14 = [v5 bundleIdentifier];
  if ([v14 isEqualToString:@"com.apple.TelephonyUtilities"])
  {

LABEL_9:
    v17 = [v5 displayName];
    v18 = self->_applicationDisplayName;
    self->_applicationDisplayName = v17;

    applicationBundleID = self->_applicationBundleID;
    self->_applicationBundleID = (NSString *)@"com.apple.facetime";
LABEL_15:

    goto LABEL_16;
  }
  v15 = [v5 bundleIdentifier];
  unsigned int v16 = [v15 isEqualToString:@"com.apple.facetime"];

  if (v16) {
    goto LABEL_9;
  }
LABEL_16:
  [(RPCCVideoSettingsModuleBackgroundViewController *)self setupCameraEffectsInitialState];
  [(RPCCVideoSettingsModuleBackgroundViewController *)self setupUnavailableLabel];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCVideoSettingsModuleBackgroundViewController;
  [(RPCCVideoSettingsModuleBackgroundViewController *)&v3 viewWillLayoutSubviews];
  [(RPCCVideoSettingsModuleBackgroundViewController *)self updateSupportedLabelConstraints];
}

- (void)setupCameraEffectsInitialState
{
  if (self->_applicationBundleID)
  {
    self->_currentBackgroundBlurState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_currentBackgroundBlurEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_currentBackgroundBlurSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
    self->_currentCenterStageState = AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
    self->_currentCenterStageEnabled = AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
    self->_currentCenterStageSupported = AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
  }
  else
  {
    NSLog(@"RPCCVideoSettingsModule: Unable to load initial state, no applicable application bundle ID found");
  }
}

- (void)updateUnavailableLabel
{
  [(RPCCVideoSettingsModuleBackgroundViewController *)self setupCameraEffectsInitialState];
  [(RPCCVideoSettingsModuleBackgroundViewController *)self setupUnavailableLabel];
  id v3 = [(RPCCVideoSettingsModuleBackgroundViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)setupUnavailableLabel
{
  [(UILabel *)self->_supportedLabel removeFromSuperview];
  if (self->_applicationBundleID)
  {
    supportedLabel = self->_supportedLabel;
    v4 = [(RPCCVideoSettingsModuleBackgroundViewController *)self getUnavailableString];
    [(UILabel *)supportedLabel setText:v4];

    id v5 = self->_supportedLabel;
    v6 = +[UIColor whiteColor];
    [(UILabel *)v5 setTextColor:v6];

    [(UILabel *)self->_supportedLabel setTextAlignment:1];
    [(UILabel *)self->_supportedLabel controlCenterApplyPrimaryContentShadow];
    [(RPCCVideoSettingsModuleBackgroundViewController *)self updateSupportedLabelFont];
    [(RPCCVideoSettingsModuleBackgroundViewController *)self updateSupportedLabelConstraints];
    id v7 = [(RPCCVideoSettingsModuleBackgroundViewController *)self view];
    [v7 addSubview:self->_supportedLabel];
  }
}

- (id)getUnavailableString
{
  if (!self->_currentBackgroundBlurSupported)
  {
    if (!self->_currentCenterStageSupported) {
      goto LABEL_15;
    }
    if (self->_currentCenterStageEnabled)
    {
LABEL_14:
      uint64_t UnavailableReasons = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
      applicationDisplayName = self->_applicationDisplayName;
      id v7 = self;
      uint64_t v9 = 0;
      goto LABEL_18;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_19;
  }
  if (!self->_currentCenterStageSupported)
  {
    if (self->_currentBackgroundBlurEnabled)
    {
      uint64_t UnavailableReasons = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
      applicationDisplayName = self->_applicationDisplayName;
      id v7 = self;
LABEL_17:
      uint64_t v9 = 1;
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  BOOL currentCenterStageEnabled = self->_currentCenterStageEnabled;
  if (!self->_currentBackgroundBlurEnabled)
  {
    if (self->_currentCenterStageEnabled) {
      goto LABEL_14;
    }
LABEL_15:
    v10 = &stru_69FF8;
    goto LABEL_19;
  }
  uint64_t v4 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
  if (!currentCenterStageEnabled)
  {
    applicationDisplayName = self->_applicationDisplayName;
    id v7 = self;
    uint64_t UnavailableReasons = v4;
    goto LABEL_17;
  }
  uint64_t v5 = AVControlCenterVideoEffectsModuleGetUnavailableReasons();
  if (v4 == v5)
  {
    applicationDisplayName = self->_applicationDisplayName;
    id v7 = self;
    uint64_t UnavailableReasons = v4;
    uint64_t v9 = 2;
LABEL_18:
    v10 = [(RPCCVideoSettingsModuleBackgroundViewController *)v7 unavailableStringForReason:UnavailableReasons appName:applicationDisplayName forVideoEffect:v9];
    goto LABEL_19;
  }
  uint64_t v12 = v5;
  v13 = [(RPCCVideoSettingsModuleBackgroundViewController *)self unavailableStringForReason:v4 appName:self->_applicationDisplayName forVideoEffect:1];
  v14 = [(RPCCVideoSettingsModuleBackgroundViewController *)self unavailableStringForReason:v12 appName:self->_applicationDisplayName forVideoEffect:0];
  v10 = +[NSString stringWithFormat:@"%@ %@", v13, v14];

LABEL_19:

  return v10;
}

- (id)unavailableStringForReason:(unint64_t)a3 appName:(id)a4 forVideoEffect:(unint64_t)a5
{
  id v7 = a4;
  if (a3 == 16)
  {
    if (a5 == 1)
    {
      CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PORTRAIT_UNSUPPORTED_BACKEND";
    }
    else if (a5 == 2)
    {
      CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PLURAL_UNSUPPORTED_BACKEND";
    }
    else
    {
      CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_CENTER_STAGE_UNSUPPORTED_BACKEND";
    }
  }
  else
  {
    if (a3 != 4)
    {
      if (a3 == 1)
      {
        if (a5 == 1)
        {
          CFStringRef v8 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PORTRAIT_UNSUPPORTED_CAMERA";
        }
        else if (a5 == 2)
        {
          CFStringRef v8 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PLURAL_UNSUPPORTED_CAMERA";
        }
        else
        {
          CFStringRef v8 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_CENTER_STAGE_UNSUPPORTED_CAMERA";
        }
        v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v8];
      }
      else
      {
        v10 = &stru_69FF8;
      }
      goto LABEL_22;
    }
    if (a5 == 1)
    {
      CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PORTRAIT_UNSUPPORTED_OPTOUT";
    }
    else if (a5 == 2)
    {
      CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_PLURAL_UNSUPPORTED_OPTOUT";
    }
    else
    {
      CFStringRef v9 = @"CONTROL_CENTER_CAMERA_UNAVAILABLE_CENTER_STAGE_UNSUPPORTED_OPTOUT";
    }
  }
  unsigned __int8 v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:v9];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v7);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_22:

  return v10;
}

- (void)updateSupportedLabelFont
{
  id v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] == (char *)&dword_0 + 1)
  {

LABEL_3:
    uint64_t v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [v4 pointSize];
    double v6 = v5;

    double v7 = fmin(v6, 22.0);
    goto LABEL_11;
  }
  CFStringRef v8 = +[UIDevice currentDevice];
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
    v10 = +[UIDevice currentDevice];
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
  id v3 = [(RPCCVideoSettingsModuleBackgroundViewController *)self view];
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
  v14 = [(RPCCVideoSettingsModuleBackgroundViewController *)self view];
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
    v20 = [(RPCCVideoSettingsModuleBackgroundViewController *)self view];
    [v20 safeAreaInsets];
    double v22 = v21;
    double v39 = v21;

    v45.origin.x = v5;
    v45.origin.y = v7;
    v45.size.width = v9;
    v45.size.height = v11;
    double Height = CGRectGetHeight(v45);
    [(RPCCVideoSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    double v25 = (Height - v24) * 0.5 - v22 + -20.0;
    [(RPCCVideoSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewWidth];
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
    [(RPCCVideoSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewHeight];
    v47.origin.x = v5;
    v47.origin.y = v7;
    v47.size.width = v9;
    v47.size.height = v11;
    double Width = CGRectGetWidth(v47);
    [(RPCCVideoSettingsModuleBackgroundViewController *)self CCUIMenuModuleViewWidth];
    double v27 = (Width - v35) * 0.5 - v16 + -20.0;
    v36 = [(RPCCVideoSettingsModuleBackgroundViewController *)self view];
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
  objc_storeStrong((id *)&self->_applicationDisplayName, 0);
  objc_storeStrong((id *)&self->_applicationBundleID, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end