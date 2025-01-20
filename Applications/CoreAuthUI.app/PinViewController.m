@interface PinViewController
- (BOOL)ctkPin;
- (NSNumber)pinCharset;
- (NSNumber)pinMaxLength;
- (NSNumber)pinMinLength;
- (id)_createBlurView;
- (int64_t)_backdropStyle;
- (void)_updateCurrentAppearanceIfNeeded;
- (void)didReceiveAuthenticationData;
- (void)loadView;
- (void)pinEntered:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PinViewController

- (void)loadView
{
  v3 = [PinView alloc];
  pinLength = self->_pinLength;
  v5 = [(PinViewController *)self pinMinLength];
  v6 = [(PinViewController *)self pinMaxLength];
  v7 = [(PinViewController *)self pinCharset];
  v8 = [(PinView *)v3 initWithPinLength:pinLength minLength:v5 maxLength:v6 charset:v7];
  pinView = self->_pinView;
  self->_pinView = v8;

  v10 = self->_pinView;
  v11 = [(TransitionViewController *)self authenticationTitle];
  [(PinView *)v10 setTitle:v11];

  [(PinView *)self->_pinView setDelegate:self];
  [(PinView *)self->_pinView setViewController:self];
  if (![(TransitionViewController *)self isRemoteViewController])
  {
    v12 = [(PinViewController *)self _createBlurView];
    blurView = self->_blurView;
    self->_blurView = v12;

    [(PinView *)self->_pinView addSubview:self->_blurView];
    [(PinView *)self->_pinView sendSubviewToBack:self->_blurView];
    v14 = +[UIButton buttonWithType:1];
    [v14 addTarget:self action:"uiCancel" forControlEvents:1];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_100088CF0 table:@"MobileUI"];
    [v14 setTitle:v16 forState:0];

    v17 = +[UIColor labelColor];
    [v14 setTitleColor:v17 forState:0];

    [v14 sizeToFit];
    [(PinView *)self->_pinView setCancelButton:v14];
  }
  v18 = self->_pinView;

  [(PinViewController *)self setView:v18];
}

- (id)_createBlurView
{
  v2 = +[_UIBackdropViewSettings settingsForPrivateStyle:[(PinViewController *)self _backdropStyle] graphicsQuality:100];
  [v2 setBackdropVisible:1];
  id v3 = [objc_alloc((Class)_UIBackdropView) initWithSettings:v2];
  [v3 setAutoresizingMask:18];
  [v3 setConfiguration:1];
  [v3 setAlpha:1.0];

  return v3;
}

- (int64_t)_backdropStyle
{
  v2 = [(PinViewController *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];

  if (v3 == (id)1000 || v3 == (id)2) {
    return 2032;
  }
  else {
    return 2010;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PinViewController;
  [(TransitionViewController *)&v4 viewWillAppear:a3];
  [(PinView *)self->_pinView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PinViewController;
  [(PinViewController *)&v4 viewWillDisappear:a3];
  [(PinView *)self->_pinView resignFirstResponder];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PinViewController;
  [(PinViewController *)&v3 viewDidLayoutSubviews];
  [(PinViewController *)self _updateCurrentAppearanceIfNeeded];
}

- (void)_updateCurrentAppearanceIfNeeded
{
  objc_super v3 = [(PinViewController *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (self->_currentInterfaceStyle != v4)
  {
    self->_currentInterfaceStyle = (int64_t)v4;
    if (![(TransitionViewController *)self isRemoteViewController])
    {
      [(_UIBackdropView *)self->_blurView removeFromSuperview];
      v5 = [(PinViewController *)self _createBlurView];
      blurView = self->_blurView;
      self->_blurView = v5;

      [(PinView *)self->_pinView addSubview:self->_blurView];
      pinView = self->_pinView;
      v8 = self->_blurView;
      [(PinView *)pinView sendSubviewToBack:v8];
    }
  }
}

- (void)didReceiveAuthenticationData
{
  v28.receiver = self;
  v28.super_class = (Class)PinViewController;
  [(TransitionViewController *)&v28 didReceiveAuthenticationData];
  objc_super v3 = [(TransitionViewController *)self authenticationTitle];
  id v4 = [v3 length];

  if (!v4)
  {
    v5 = [(TransitionViewController *)self options];
    v6 = [v5 objectForKey:&off_10008A498];

    if (v6)
    {
      [(TransitionViewController *)self setAuthenticationTitle:v6];
    }
    else
    {
      unsigned __int8 v7 = +[LAUtils isApplePayPolicy:[(TransitionViewController *)self policy]];
      v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = v8;
      if (v7) {
        CFStringRef v10 = @"PAY_PIN";
      }
      else {
        CFStringRef v10 = @"ENTER_PIN";
      }
      v11 = [v8 localizedStringForKey:v10 value:&stru_100088CF0 table:@"MobileUI"];
      [(TransitionViewController *)self setAuthenticationTitle:v11];
    }
  }
  v12 = [(TransitionViewController *)self internalInfo];
  v13 = [v12 objectForKeyedSubscript:@"PassphrasePurpose"];
  self->_purpose = [v13 unsignedIntValue];

  v14 = [(TransitionViewController *)self options];
  v15 = [v14 objectForKeyedSubscript:&off_10008A4B0];
  pinLength = self->_pinLength;
  self->_pinLength = v15;

  v17 = [(TransitionViewController *)self options];
  v18 = [v17 objectForKeyedSubscript:&off_10008A4C8];
  pinMinLength = self->_pinMinLength;
  self->_pinMinLength = v18;

  v20 = [(TransitionViewController *)self options];
  v21 = [v20 objectForKeyedSubscript:&off_10008A4E0];
  pinMaxLength = self->_pinMaxLength;
  self->_pinMaxLength = v21;

  v23 = [(TransitionViewController *)self options];
  v24 = [v23 objectForKeyedSubscript:&off_10008A4F8];
  pinCharset = self->_pinCharset;
  self->_pinCharset = v24;

  v26 = [(TransitionViewController *)self internalInfo];
  v27 = [v26 objectForKeyedSubscript:@"CTKPIN"];
  self->_ctkPin = [v27 BOOLValue];
}

- (void)pinEntered:(id)a3
{
  id v4 = a3;
  if (qword_10009E298 != -1) {
    dispatch_once(&qword_10009E298, &stru_100086798);
  }
  v5 = qword_10009E2A0;
  if (os_log_type_enabled((os_log_t)qword_10009E2A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[PinViewController pinEntered:]";
    __int16 v32 = 2112;
    v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }
  if ([(PinViewController *)self ctkPin])
  {
    id v6 = [v4 data];
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v6 bytes]);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    v28[0] = @"Result";
    v26 = &off_10008A510;
    v27 = &__kCFBooleanTrue;
    id v8 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v28[1] = @"PIN";
    v29[0] = v8;
    v29[1] = v7;
    v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    [(TransitionViewController *)self uiSuccessWithResult:v9];
  }
  else
  {
    id v10 = objc_alloc((Class)LAACMHelper);
    v11 = [(TransitionViewController *)self cachedExternalizedContext];
    v12 = [v11 externalizedContext];
    id v8 = [v10 initWithExternalizedContext:v12];

    v13 = [(TransitionViewController *)self options];
    v14 = [v13 objectForKey:&off_10008A528];
    [v14 doubleValue];
    double v16 = v15;

    if (v16 == 0.0) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    uint64_t purpose = self->_purpose;
    id v21 = 0;
    unsigned int v19 = [v8 replacePassphraseCredentialWithPurpose:purpose passphrase:v4 scope:v17 error:&v21];
    id v7 = v21;
    if (!v19)
    {
      [(TransitionViewController *)self uiFailureWithError:v7];
      goto LABEL_14;
    }
    CFStringRef v24 = @"Result";
    v22 = &off_10008A510;
    v23 = &__kCFBooleanTrue;
    v9 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v25 = v9;
    v20 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [(TransitionViewController *)self uiSuccessWithResult:v20];
  }
LABEL_14:

  [v4 reset];
}

- (NSNumber)pinMaxLength
{
  return self->_pinMaxLength;
}

- (NSNumber)pinMinLength
{
  return self->_pinMinLength;
}

- (NSNumber)pinCharset
{
  return self->_pinCharset;
}

- (BOOL)ctkPin
{
  return self->_ctkPin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinCharset, 0);
  objc_storeStrong((id *)&self->_pinMinLength, 0);
  objc_storeStrong((id *)&self->_pinMaxLength, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_pinView, 0);

  objc_storeStrong((id *)&self->_pinLength, 0);
}

@end