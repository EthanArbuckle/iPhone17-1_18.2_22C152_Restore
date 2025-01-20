@interface PasscodeViewController
- (BOOL)_hasBlurredBackground;
- (BOOL)_hasTranslucentBackground;
- (BOOL)_useWhitePasscodeScreen;
- (BOOL)isFullScreenController;
- (id)_style;
- (int64_t)_backgroundStyle;
- (int64_t)preferredStatusBarStyle;
- (void)_clearTimer;
- (void)_layoutGlyph;
- (void)_processPasscodeEntryResult:(int64_t)a3;
- (void)_scheduleTimerIfNecessaryAndUpdateSubtitle;
- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setupGlyph;
- (void)_setupView;
- (void)_showBackoffScreenWithMinsUntilUnblocked:(int)a3;
- (void)_showGlyph:(BOOL)a3 animated:(BOOL)a4;
- (void)_showPasscodeScreen;
- (void)_switchToBackoffScreen:(id)a3;
- (void)_switchToBackoffScreen:(id)a3 animated:(BOOL)a4;
- (void)_updateStyle;
- (void)didReceiveAuthenticationData;
- (void)loadView;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)passcodeViewPasscodeDidChange:(id)a3;
- (void)passcodeViewPasscodeEntered:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PasscodeViewController

- (void)didReceiveAuthenticationData
{
  v38.receiver = self;
  v38.super_class = (Class)PasscodeViewController;
  [(TransitionViewController *)&v38 didReceiveAuthenticationData];
  v3 = [(TransitionViewController *)self options];
  v4 = [v3 objectForKeyedSubscript:&off_10008A540];

  if (v4)
  {
    [(TransitionViewController *)self setAuthenticationTitle:v4];
    goto LABEL_9;
  }
  if ((+[LAUtils isApplePayPolicy:](LAUtils, "isApplePayPolicy:", -[TransitionViewController policy](self, "policy")) & 1) != 0|| (-[TransitionViewController options](self, "options"), v5 = objc_claimAutoreleasedReturnValue(), [v5 objectForKeyedSubscript:&off_10008A558], v6 = objc_claimAutoreleasedReturnValue(), unsigned int v7 = objc_msgSend(v6, "BOOLValue"), v6, v5, v7))
  {
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = v8;
    CFStringRef v10 = @"PAY";
LABEL_6:
    v11 = [v8 localizedStringForKey:v10 value:&stru_100088CF0 table:@"MobileUI"];
    [(TransitionViewController *)self setAuthenticationTitle:v11];
    goto LABEL_7;
  }
  if ((id)[(TransitionViewController *)self policy] == (id)1010)
  {
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = v8;
    CFStringRef v10 = @"ENTER_PASSCODE_UPDATE";
    goto LABEL_6;
  }
  v29 = [(TransitionViewController *)self authenticationTitle];
  id v30 = [v29 length];

  if (!v30)
  {
    v31 = [(TransitionViewController *)self callerBundleId];
    if (v31 || [(TransitionViewController *)self callerNameOverride])
    {
      v32 = [(TransitionViewController *)self callerName];

      if (v32)
      {
        v9 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"APP_ASKING_PASSCODE"];
        v33 = +[NSBundle bundleForClass:objc_opt_class()];
        v34 = [v33 localizedStringForKey:v9 value:&stru_100088CF0 table:@"MobileUI"];
        v35 = [(TransitionViewController *)self callerName];
        v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v35);
        [(TransitionViewController *)self setAuthenticationTitle:v36];

        goto LABEL_8;
      }
    }
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ENTER_PASSCODE"];
    v37 = [v9 localizedStringForKey:v11 value:&stru_100088CF0 table:@"MobileUI"];
    [(TransitionViewController *)self setAuthenticationTitle:v37];

LABEL_7:
LABEL_8:
  }
LABEL_9:
  v12 = [(TransitionViewController *)self internalInfo];
  v13 = [v12 objectForKeyedSubscript:@"FallbackReason"];

  if (!+[LACError error:v13 hasCode:LACErrorCodeSystemCancel])
  {
    v20 = 0;
    goto LABEL_19;
  }
  v14 = [v13 userInfo];
  v15 = [v14 objectForKeyedSubscript:LAErrorSubcodeKey];

  if (v15)
  {
    id v16 = [v15 integerValue];
    if (v16 == (id)14)
    {
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = v17;
      CFStringRef v19 = @"PEARL_HW_ISSUE_LOW_TEMPERATURE";
      goto LABEL_17;
    }
    if (v16 == (id)13)
    {
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = v17;
      CFStringRef v19 = @"PEARL_HW_ISSUE_HIGH_TEMPERATURE";
LABEL_17:
      v20 = [v17 localizedStringForKey:v19 value:&stru_100088CF0 table:@"MobileUI"];

      goto LABEL_18;
    }
  }
  v20 = 0;
LABEL_18:

LABEL_19:
  v21 = [(TransitionViewController *)self options];
  v22 = [v21 objectForKeyedSubscript:&off_10008A570];

  if (v20)
  {
    v23 = +[LAUtils truncateString:v20 maxLength:512];
    [(TransitionViewController *)self setAuthenticationSubtitle:v23];
LABEL_23:

    goto LABEL_24;
  }
  if (v22)
  {
    v23 = [(TransitionViewController *)self options];
    v24 = [v23 objectForKeyedSubscript:&off_10008A570];
    v25 = +[LAUtils truncateString:v24 maxLength:512];
    [(TransitionViewController *)self setAuthenticationSubtitle:v25];

    goto LABEL_23;
  }
LABEL_24:
  v26 = [(TransitionViewController *)self options];
  v27 = [v26 objectForKey:&off_10008A588];
  failureLimit = self->_failureLimit;
  self->_failureLimit = v27;

  self->_failures = 0;
  self->_currentInterfaceStyle = 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isFullScreenController
{
  return 1;
}

- (void)_setupView
{
  v3 = LACLogPasscodeUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[Passcode currentPasscode];
    [v4 type];
    v5 = NSStringFromLACPasscodeType();
    *(_DWORD *)buf = 138412290;
    v37 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "lockStyle: %@", buf, 0xCu);
  }
  v6 = +[NSNumber numberWithInt:[(TransitionViewController *)self isRemoteViewController] ^ 1];
  v35 = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];

  v8 = +[Passcode currentPasscode];
  v9 = +[PasscodeContentViewControllerFactory passcodeContentViewControllerForPasscode:v8 options:v7];
  passcodeView = self->_passcodeView;
  self->_passcodeView = v9;

  [(PasscodeView *)self->_passcodeView setDelegate:self];
  v11 = [(PasscodeViewController *)self view];
  v12 = [(PasscodeView *)self->_passcodeView view];
  [v11 addSubview:v12];

  v13 = [(PasscodeView *)self->_passcodeView view];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(PasscodeView *)self->_passcodeView view];
  v15 = [v14 topAnchor];
  id v16 = [(PasscodeViewController *)self view];
  v17 = [v16 topAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  CFStringRef v19 = [(PasscodeView *)self->_passcodeView view];
  v20 = [v19 bottomAnchor];
  v21 = [(PasscodeViewController *)self view];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [(PasscodeView *)self->_passcodeView view];
  v25 = [v24 leadingAnchor];
  v26 = [(PasscodeViewController *)self view];
  v27 = [v26 leadingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  v29 = [(PasscodeView *)self->_passcodeView view];
  id v30 = [v29 trailingAnchor];
  v31 = [(PasscodeViewController *)self view];
  v32 = [v31 trailingAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  [(PasscodeViewController *)self addChildViewController:self->_passcodeView];
  [(PasscodeView *)self->_passcodeView didMoveToParentViewController:self];
}

- (void)_setupGlyph
{
  v3 = [(TransitionViewController *)self internalInfo];
  v4 = [v3 objectForKeyedSubscript:@"FaceIdAtPasscode"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = +[LACSecureFaceIDUIUtilities sharedInstance];
    if ([v6 isSupported] && objc_msgSend(v6, "isEnabled"))
    {
      if ((sub_10001E3DC() & 1) == 0)
      {
        v18 = LACLogPasscodeUI();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "no glyph on passcode screen without dynamic island", (uint8_t *)&v25, 2u);
        }
        goto LABEL_13;
      }
      id v7 = +[LAUIPearlGlyphStaticConfiguration createSystemApertureConfiguration];
      [v7 setInitialStyle:4];
      [v7 setSecureVariantEnabled:1];
      v8 = (LAUIPearlGlyphView *)[objc_alloc((Class)LAUIPearlGlyphView) initWithConfiguration:v7];
      glyphView = self->_glyphView;
      self->_glyphView = v8;

      CFStringRef v10 = [FaceIdToastViewController alloc];
      v11 = self->_glyphView;
      v12 = +[NSBundle bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"PEARL" value:&stru_100088CF0 table:@"MobileUI"];
      v14 = [(FaceIdToastViewController *)v10 initWithGlyph:v11 presentingController:self title:v13 lightweightUIMode:LACLightweightUIModeNone];
      toastController = self->_toastController;
      self->_toastController = v14;

      id v16 = LACLogPasscodeUI();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_toastController;
        int v25 = 138412290;
        v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "glyph created on passcode screen: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    v18 = +[LAUIPearlGlyphStaticConfiguration createDefaultConfiguration];
    [v18 setInitialStyle:3];
    CFStringRef v19 = (LAUIPearlGlyphView *)[objc_alloc((Class)LAUIPearlGlyphView) initWithConfiguration:v18];
    v20 = self->_glyphView;
    self->_glyphView = v19;

    int v21 = sub_10001E3DC();
    double v22 = 56.0;
    if (!v21) {
      double v22 = 48.0;
    }
    -[LAUIPearlGlyphView setFrame:](self->_glyphView, "setFrame:", 0.0, v22, 32.0, 32.0);
    [(PasscodeViewController *)self _setGlyphState:1 animated:0];
    v23 = LACLogPasscodeUI();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_glyphView;
      int v25 = 138412290;
      v26 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "glyph created on passcode screen: %@", (uint8_t *)&v25, 0xCu);
    }

LABEL_13:
  }
}

- (void)_showGlyph:(BOOL)a3 animated:(BOOL)a4
{
  toastController = self->_toastController;
  if (toastController)
  {
    if (a3) {
      [(PresentationViewController *)toastController presentOnParentViewController:self animated:a4 completionHandler:&stru_1000867B8];
    }
    else {
      -[FaceIdToastViewController dismissWithDelay:completion:](toastController, "dismissWithDelay:completion:", &stru_1000867D8, a4, 0.0);
    }
  }
  else
  {
    -[LAUIPearlGlyphView setHidden:](self->_glyphView, "setHidden:", !a3, a4);
  }
}

- (void)_setGlyphState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_toastController) {
    [(FaceIdToastViewController *)self->_toastController setGlyphState:a3 animated:a4];
  }
  else {
    [(LAUIPearlGlyphView *)self->_glyphView setState:a3 animated:a4];
  }
}

- (void)_layoutGlyph
{
  if (!self->_toastController)
  {
    [(LAUIPearlGlyphView *)self->_glyphView frame];
    id v6 = [(PasscodeViewController *)self view];
    [v6 bounds];
    v3 = +[UIScreen mainScreen];
    [v3 scale];
    uint64_t v5 = v4;
    UIRectCenteredXInRectScale();
    [(LAUIPearlGlyphView *)self->_glyphView setFrame:v5];
  }
}

- (void)passcodeViewPasscodeDidChange:(id)a3
{
  if (!self->_startedTypingPasscode)
  {
    self->_startedTypingPasscode = 1;
    [(PasscodeViewController *)self _showGlyph:0 animated:1];
    [(TransitionViewController *)self uiEvent:7 options:0];
  }
}

- (void)passcodeViewPasscodeEntered:(id)a3
{
  if (!self->_passcodeEntered)
  {
    self->_passcodeEntered = 1;
    uint64_t v4 = [(PasscodeView *)self->_passcodeView passcode];
    uint64_t v5 = +[LACSecureData secureDataWithString:v4];

    unsigned int v6 = +[LAUtils isSharedIPad];
    char v7 = v6;
    if (v6)
    {
      v8 = [(PasscodeView *)self->_passcodeView passcode];
      v9 = [v8 dataUsingEncoding:4];

      int v10 = MKBUnlockDevice();
      v11 = LACLogPasscodeUI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MKBUnlockDevice: %d", buf, 8u);
      }
    }
    else
    {
      int v10 = 0;
    }
    v12 = [(TransitionViewController *)self backoffCounter];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001A008;
    v14[3] = &unk_100086828;
    char v17 = v7;
    int v16 = v10;
    v14[4] = self;
    id v15 = v5;
    id v13 = v5;
    [v12 currentBackoffErrorWithReply:v14];
  }
}

- (void)_processPasscodeEntryResult:(int64_t)a3
{
  if (!a3)
  {
    char v7 = [(TransitionViewController *)self mechanism];
    CFStringRef v27 = @"uptime";
    v8 = +[NSProcessInfo processInfo];
    [v8 systemUptime];
    v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v28 = v9;
    int v10 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    [v7 uiEvent:8 options:v10];

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A63C;
    block[3] = &unk_1000860D8;
    objc_copyWeak(&v21, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v11 = [(TransitionViewController *)self backoffCounter];
    [v11 actionSuccess];

    CFStringRef v25 = @"Result";
    v23 = &off_10008A5B8;
    v24 = &__kCFBooleanTrue;
    v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v26 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [(TransitionViewController *)self uiSuccessWithResult:v13];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    return;
  }
  self->_passcodeEntered = 0;
  uint64_t v5 = [(TransitionViewController *)self mechanism];
  [v5 uiEvent:9 options:0];

  if (a3 == 1)
  {
    if (!self->_failureLimit
      || (unint64_t v14 = self->_failures + 1,
          self->_failures = v14,
          v14 <= [(NSNumber *)self->_failureLimit unsignedIntegerValue]))
    {
      int v16 = [(TransitionViewController *)self backoffCounter];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001A684;
      v19[3] = &unk_100086690;
      v19[4] = self;
      [v16 actionFailureWithReply:v19];

      return;
    }
    uint64_t v15 = +[LACError errorWithCode:LACErrorCodeAuthenticationFailed debugDescription:@"Application retry limit exceeded."];
  }
  else
  {
    if (a3 == 2)
    {
      unsigned int v6 = [(TransitionViewController *)self backoffCounter];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001A880;
      v18[3] = &unk_100086690;
      v18[4] = self;
      [v6 actionBackoffWithReply:v18];

      return;
    }
    uint64_t v15 = +[LACError errorWithCode:LACErrorCodeInternal debugDescription:@"Unexpected error while attempting to verify the entered password."];
  }
  -[TransitionViewController uiFailureWithError:](self, "uiFailureWithError:", v15, v15);
}

- (void)loadView
{
  v3 = objc_opt_new();
  [(PasscodeViewController *)self setView:v3];

  [(PasscodeViewController *)self _setupView];
  [(PasscodeViewController *)self _setupGlyph];
  if (+[LAUtils isSharedIPad])
  {
    id v4 = (id)objc_opt_new();
    [(TransitionViewController *)self setBackoffCounter:v4];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PasscodeViewController;
  [(TransitionViewController *)&v8 viewWillAppear:a3];
  if (self->_toastController)
  {
    [(PasscodeViewController *)self _showGlyph:1 animated:1];
    [(PasscodeViewController *)self _setGlyphState:1 animated:1];
  }
  objc_initWeak(&location, self);
  id v4 = [(TransitionViewController *)self backoffCounter];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AC20;
  v5[3] = &unk_100086468;
  objc_copyWeak(&v6, &location);
  [v4 currentBackoffErrorWithReply:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PasscodeViewController;
  [(TransitionViewController *)&v5 viewDidAppear:a3];
  if (!self->_isBlocked) {
    [(PasscodeView *)self->_passcodeView becomeFirstResponder];
  }
  if ((id)[(TransitionViewController *)self policy] == (id)1010)
  {
    id v4 = +[TransitionViewController rootController];
    [v4 idleTimerDisable:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PasscodeViewController;
  [(PasscodeViewController *)&v6 viewWillDisappear:a3];
  [(PasscodeViewController *)self _showGlyph:0 animated:0];
  if ([(PasscodeViewController *)self _hasBlurredBackground])
  {
    id v4 = +[TransitionViewController rootController];
    objc_super v5 = [v4 _remoteViewControllerProxy];

    [v5 setWallpaperTunnelActive:0];
    [v5 setWallpaperStyle:1 withDuration:0.0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PasscodeViewController;
  [(TransitionViewController *)&v5 viewDidDisappear:a3];
  if ((id)[(TransitionViewController *)self policy] == (id)1010)
  {
    id v4 = +[TransitionViewController rootController];
    [v4 idleTimerDisable:0];
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PasscodeViewController;
  [(PasscodeViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(PasscodeViewController *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (self->_currentInterfaceStyle != v4)
  {
    self->_currentInterfaceStyle = (int64_t)v4;
    [(PasscodeViewController *)self setNeedsStatusBarAppearanceUpdate];
    [(PasscodeViewController *)self _updateStyle];
  }
  [(PasscodeViewController *)self _layoutGlyph];
}

- (void)_updateStyle
{
  if (!self->_toastController)
  {
    glyphView = self->_glyphView;
    if ([(PasscodeViewController *)self _useWhitePasscodeScreen])
    {
      id v4 = +[UIColor blackColor];
      [(LAUIPearlGlyphView *)glyphView setFinishedColor:v4 animated:1];
    }
    else
    {
      [(LAUIPearlGlyphView *)glyphView setFinishedColor:0 animated:1];
    }
  }
  id v7 = [(PasscodeView *)self->_passcodeView state];
  objc_super v5 = [(PasscodeViewController *)self _style];
  objc_super v6 = [v7 withStyle:v5];
  [(PasscodeView *)self->_passcodeView setState:v6];
}

- (id)_style
{
  unsigned int v3 = [(PasscodeViewController *)self _useWhitePasscodeScreen];
  int64_t v4 = [(PasscodeViewController *)self _backgroundStyle];
  if (v3) {
    +[PasscodeViewStyle lightStyleWithBackgroundStyle:v4];
  }
  else {
  objc_super v5 = +[PasscodeViewStyle darkStyleWithBackgroundStyle:v4];
  }

  return v5;
}

- (int64_t)_backgroundStyle
{
  if (UIAccessibilityIsReduceTransparencyEnabled()) {
    return 3;
  }
  if ([(PasscodeViewController *)self _hasBlurredBackground]) {
    return 1;
  }
  if ([(PasscodeViewController *)self _hasTranslucentBackground]) {
    return 2;
  }
  return 0;
}

- (BOOL)_hasBlurredBackground
{
  unsigned int v3 = [(TransitionViewController *)self options];
  uint64_t v4 = [v3 objectForKeyedSubscript:&off_10008A5D0];

  objc_super v5 = [(TransitionViewController *)self options];
  uint64_t v6 = [v5 objectForKeyedSubscript:&off_10008A5E8];

  if (v4 | v6)
  {
    if (!v4 || ([(id)v4 BOOLValue] & 1) == 0)
    {
LABEL_8:
      LOBYTE(v7) = 0;
      goto LABEL_9;
    }
  }
  else if (![(PasscodeViewController *)self _useWhitePasscodeScreen] {
         || !+[LAUtils isApplePayPolicy:[(TransitionViewController *)self policy] inApp:1])
  }
  {
    goto LABEL_8;
  }
  BOOL v7 = !UIAccessibilityIsReduceTransparencyEnabled();
LABEL_9:

  return v7;
}

- (BOOL)_hasTranslucentBackground
{
  unsigned int v3 = [(TransitionViewController *)self options];
  uint64_t v4 = [v3 objectForKeyedSubscript:&off_10008A5D0];

  objc_super v5 = [(TransitionViewController *)self options];
  uint64_t v6 = [v5 objectForKeyedSubscript:&off_10008A5E8];

  if (v4 | v6
    || [(PasscodeViewController *)self _useWhitePasscodeScreen]
    || (id)[(TransitionViewController *)self policy] != (id)1004)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    BOOL v7 = !UIAccessibilityIsReduceTransparencyEnabled();
  }

  return v7;
}

- (BOOL)_useWhitePasscodeScreen
{
  unsigned int v3 = [(PasscodeViewController *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  objc_super v5 = +[LAPasscodeHelper sharedInstance];
  int64_t v6 = [(TransitionViewController *)self policy];
  BOOL v7 = [(TransitionViewController *)self options];
  id v8 = [v5 passcodeScreenStyleWithPolicy:v6 options:v7 darkInterface:v4];

  return v8 == 0;
}

- (void)_showPasscodeScreen
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B420;
  v4[3] = &unk_1000868C0;
  v4[4] = self;
  unsigned int v3 = sub_10001B420((uint64_t)v4);
  [(PasscodeView *)self->_passcodeView setState:v3];
}

- (void)_showBackoffScreenWithMinsUntilUnblocked:(int)a3
{
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  int64_t v6 = [v5 localizedStringForKey:@"DEVICE_BLOCKED" value:&stru_100088CF0 table:@"MobileUI"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001B650;
  v11[3] = &unk_1000868E8;
  v11[4] = self;
  int v12 = a3;
  BOOL v7 = sub_10001B650((uint64_t)v11);
  id v8 = +[PasscodeViewState backOffStateWithTitle:v6 subtitle:v7];
  v9 = [(PasscodeViewController *)self _style];
  int v10 = [v8 withStyle:v9];
  [(PasscodeView *)self->_passcodeView setState:v10];
}

- (int64_t)preferredStatusBarStyle
{
  if ([(PasscodeViewController *)self _useWhitePasscodeScreen]) {
    int64_t v2 = 3;
  }
  else {
    int64_t v2 = 1;
  }
  unsigned int v3 = LACLogPasscodeUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    int64_t v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "statusBarStyle = %ld", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (void)_switchToBackoffScreen:(id)a3
{
}

- (void)_switchToBackoffScreen:(id)a3 animated:(BOOL)a4
{
  int v5 = [a3 userInfo];
  int64_t v6 = [v5 objectForKey:LAPasswordRetryTime];
  blockedUntilDate = self->_blockedUntilDate;
  self->_blockedUntilDate = v6;

  [(NSDate *)self->_blockedUntilDate timeIntervalSinceNow];
  self->_isBlocked = v8 > 0.0;
  if (v8 > 0.0)
  {
    [(PasscodeView *)self->_passcodeView resignFirstResponder];
    [(PasscodeViewController *)self _scheduleTimerIfNecessaryAndUpdateSubtitle];
  }
}

- (void)_clearTimer
{
  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (void)_scheduleTimerIfNecessaryAndUpdateSubtitle
{
  HIDWORD(v3) = 0;
  blockedUntilDate = self->_blockedUntilDate;
  if (blockedUntilDate)
  {
    [(NSDate *)blockedUntilDate timeIntervalSinceNow];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.0;
  }
  BOOL v7 = v6 > 0.0;
  self->_BOOL isBlocked = v7;
  if (self->_blockedUntilDate)
  {
    unsigned int v3 = LACLogPasscodeUI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isBlocked = self->_isBlocked;
      BOOL isLockoutActive = self->_isLockoutActive;
      int v15 = 138544130;
      int v16 = self;
      __int16 v17 = 1024;
      BOOL v18 = isBlocked;
      __int16 v19 = 1024;
      BOOL v20 = isLockoutActive;
      __int16 v21 = 2048;
      double v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is blocked:%d lockoutActive:%d unblockTimeout:%f", (uint8_t *)&v15, 0x22u);
    }

    BOOL v7 = self->_isBlocked;
  }
  if (v7)
  {
    self->_BOOL isLockoutActive = 1;
    double v10 = v6 / 60.0;
    float v11 = v10;
    LODWORD(v3) = vcvtps_s32_f32(v11);
    [(PasscodeViewController *)self _showBackoffScreenWithMinsUntilUnblocked:v3];
    [(PasscodeViewController *)self _clearTimer];
    float v12 = (v10 - (double)((int)v3 - 1)) * 60.0;
    if (v12 > 0.0)
    {
      id v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_scheduleTimerIfNecessaryAndUpdateSubtitle" selector:0 userInfo:1 repeats:v12];
      updateTimer = self->_updateTimer;
      self->_updateTimer = v13;
    }
  }
  else if (self->_isLockoutActive)
  {
    self->_BOOL isLockoutActive = 0;
    [(PasscodeViewController *)self _showPasscodeScreen];
    [(PasscodeViewController *)self _clearTimer];
  }
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(void))a5;
  double v10 = LACLogPasscodeUI();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    float v11 = NSStringFromMechanismEventAndValue();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    __int16 v24 = 1024;
    int v25 = a3;
    __int16 v26 = 2112;
    CFStringRef v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ has received mechanism event %d (%@)", buf, 0x1Cu);
  }
  switch(a3)
  {
    case 1:
    case 4:
      goto LABEL_6;
    case 2:
      +[LAUIPearlGlyphView invokeSuccessFeedback];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001BE04;
      block[3] = &unk_1000865C8;
      void block[4] = self;
      __int16 v21 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_13;
    case 3:
      objc_initWeak((id *)buf, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10001BFEC;
      v14[3] = &unk_1000860D8;
      objc_copyWeak(&v15, (id *)buf);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
      id v13 = &v15;
      goto LABEL_10;
    default:
      if (a3 != 13) {
        goto LABEL_11;
      }
LABEL_6:
      objc_initWeak((id *)buf, self);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001BF5C;
      v18[3] = &unk_1000860D8;
      objc_copyWeak(&v19, (id *)buf);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
      if (self->_toastController)
      {
        dispatch_time_t v12 = dispatch_time(0, 1000000000);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10001BFA4;
        v16[3] = &unk_1000860D8;
        objc_copyWeak(&v17, (id *)buf);
        dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v16);

        objc_destroyWeak(&v17);
      }
      id v13 = &v19;
LABEL_10:
      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
LABEL_11:
      if (v9) {
        v9[2](v9);
      }
LABEL_13:

      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toastController, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_blockedUntilDate, 0);
  objc_storeStrong((id *)&self->_failureLimit, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);

  objc_storeStrong((id *)&self->_passcodeView, 0);
}

@end