@interface PKTransactionAuthenticationCollectPasscodeViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (PKTransactionAuthenticationCollectPasscodeViewController)init;
- (PKTransactionAuthenticationCollectPasscodeViewController)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 delegate:(id)a5;
- (PKTransactionAuthenticationCollectPasscodeViewControllerDelegate)delegate;
- (UIView)passcodeField;
- (void)_cancelButtonPressed;
- (void)_clearPasscodeField;
- (void)_createPasscodeField;
- (void)_encryptPIN:(id)a3 withCertificates:(id)a4 completion:(id)a5;
- (void)_encryptPasscodeInput;
- (void)_footerButtonPressed;
- (void)_passcodeInputFinished;
- (void)_retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)_transitionToState:(unint64_t)a3;
- (void)_updateFailureLabelVisibility;
- (void)explanationViewDidUpdateLayout:(id)a3;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)loadView;
- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4;
- (void)preflightWithCompletion:(id)a3;
- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKTransactionAuthenticationCollectPasscodeViewController

- (PKTransactionAuthenticationCollectPasscodeViewController)init
{
  return 0;
}

- (PKTransactionAuthenticationCollectPasscodeViewController)initWithPassUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  v12 = [(PKTransactionAuthenticationCollectPasscodeViewController *)&v20 init];
  v13 = v12;
  if (v12)
  {
    p_keyboardSize = &v12->_keyboardSize;
    +[UIKeyboard sizeForInterfaceOrientation:1];
    *(void *)&p_keyboardSize->width = v15;
    v13->_keyboardSize.height = v16;
    objc_storeStrong((id *)&v13->_passUniqueIdentifier, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_transactionIdentifier, a4);
    v17 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    paymentService = v13->_paymentService;
    v13->_paymentService = v17;

    v13->_currentState = 0;
  }

  return v13;
}

- (void)preflightWithCompletion:(id)a3
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000033E4;
  v16[3] = &unk_10000C390;
  id v4 = a3;
  id v17 = v4;
  v5 = objc_retainBlock(v16);
  if (!self->_passUniqueIdentifier) {
    goto LABEL_5;
  }
  if (!self->_transactionIdentifier) {
    goto LABEL_5;
  }
  v6 = +[PKPassLibrary sharedInstance];
  v7 = [v6 passWithUniqueID:self->_passUniqueIdentifier];
  v8 = [v7 paymentPass];
  pass = self->_pass;
  self->_pass = v8;

  if (self->_pass)
  {
    objc_initWeak(&location, self);
    paymentService = self->_paymentService;
    transactionIdentifier = self->_transactionIdentifier;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000033FC;
    v12[3] = &unk_10000C3B8;
    objc_copyWeak(&v14, &location);
    v12[4] = self;
    v13 = v5;
    [(PKPaymentService *)paymentService transactionWithTransactionIdentifier:transactionIdentifier completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_5:
    ((void (*)(void *, void))v5[2])(v5, 0);
  }
}

- (void)resetWithTransactionAuthenticationFailure:(int64_t)a3 completion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003590;
  block[3] = &unk_10000C3E0;
  id v8 = a4;
  int64_t v9 = a3;
  block[4] = self;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadView
{
  v70.receiver = self;
  v70.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  [(PKTransactionAuthenticationCollectPasscodeViewController *)&v70 loadView];
  v3 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self view];
  id v4 = +[UIColor systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(PKPaymentPass *)self->_pass compactBankLogoDarkImage];
  id v6 = +[UIImage imageWithPKImage:v5];

  v7 = [(PKPaymentPass *)self->_pass compactBankLogoLightImage];
  uint64_t v8 = +[UIImage imageWithPKImage:v7];

  if (v8)
  {
    int64_t v9 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    id v10 = [v6 imageAsset];
    [v10 registerImage:v8 withTraitCollection:v9];
  }
  v65 = (void *)v8;
  v66 = v6;
  if (v6)
  {
    id v11 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
    logoImageView = self->_logoImageView;
    self->_logoImageView = v11;

    [v3 addSubview:self->_logoImageView];
    v13 = UIContentSizeCategoryAccessibilityMedium;
  }
  else
  {
    id v14 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v14;

    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    CGFloat v16 = self->_titleLabel;
    id v17 = [(PKPaymentPass *)self->_pass organizationName];
    [(UILabel *)v16 setText:v17];

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    v18 = self->_titleLabel;
    v13 = UIContentSizeCategoryAccessibilityMedium;
    v19 = PKFontForDefaultDesign(UIFontTextStyleTitle1, UIContentSizeCategoryAccessibilityMedium);
    [(UILabel *)v18 setFont:v19];

    [v3 addSubview:self->_titleLabel];
  }
  objc_super v20 = [(PKPaymentTransaction *)self->_transaction currencyAmount];
  v21 = [v20 formattedStringValue];
  v22 = [(PKPaymentTransaction *)self->_transaction merchant];
  v23 = [v22 displayName];
  v24 = [(PKPaymentPass *)self->_pass organizationName];
  uint64_t v25 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_PAYMENT_PIN_BODY", @"%@%@%@", v21, v23, v24);

  v26 = (UILabel *)objc_alloc_init((Class)UILabel);
  bodyTextLabel = self->_bodyTextLabel;
  self->_bodyTextLabel = v26;

  [(UILabel *)self->_bodyTextLabel setNumberOfLines:0];
  v64 = (void *)v25;
  [(UILabel *)self->_bodyTextLabel setText:v25];
  [(UILabel *)self->_bodyTextLabel setTextAlignment:1];
  v28 = self->_bodyTextLabel;
  v29 = PKFontForDefaultDesign(UIFontTextStyleBody, v13);
  [(UILabel *)v28 setFont:v29];

  v30 = v3;
  [v3 addSubview:self->_bodyTextLabel];
  v31 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_FORGOT_PIN_BUTTON");
  v32 = PKFontForDefaultDesign(UIFontTextStyleCallout, v13);
  uint64_t v33 = +[UIButtonConfiguration pkui_plainConfigurationWithTitle:v31 font:v32];

  objc_initWeak(&location, self);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100003D70;
  v67[3] = &unk_10000C408;
  objc_copyWeak(&v68, &location);
  v34 = +[UIAction actionWithHandler:v67];
  v63 = (void *)v33;
  v35 = +[UIButton buttonWithConfiguration:v33 primaryAction:v34];
  footerButton = self->_footerButton;
  self->_footerButton = v35;

  v37 = (PKLinkedApplication *)[objc_alloc((Class)PKLinkedApplication) initWithPass:self->_pass];
  linkedApplication = self->_linkedApplication;
  self->_linkedApplication = v37;

  [(PKLinkedApplication *)self->_linkedApplication addObserver:self];
  [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
  v39 = self->_footerButton;
  id v40 = [(PKLinkedApplication *)self->_linkedApplication state];
  double v41 = 0.0;
  if (v40 == (id)1) {
    double v41 = 1.0;
  }
  [(UIButton *)v39 setAlpha:v41];
  [v3 addSubview:self->_footerButton];
  [(PKTransactionAuthenticationCollectPasscodeViewController *)self _createPasscodeField];
  [v3 addSubview:self->_passcodeField];
  v42 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  spinner = self->_spinner;
  self->_spinner = v42;

  [(UIActivityIndicatorView *)self->_spinner setHidden:1];
  [v3 addSubview:self->_spinner];
  v44 = (UILabel *)objc_alloc_init((Class)UILabel);
  failureLabel = self->_failureLabel;
  self->_failureLabel = v44;

  v46 = self->_failureLabel;
  v47 = PKFontForDefaultDesign(UIFontTextStyleCallout, v13);
  [(UILabel *)v46 setFont:v47];

  v48 = self->_failureLabel;
  v49 = +[UIColor systemWhiteColor];
  [(UILabel *)v48 setTextColor:v49];

  v50 = self->_failureLabel;
  v51 = +[UIColor systemRedColor];
  [(UILabel *)v50 setBackgroundColor:v51];

  [(UILabel *)self->_failureLabel setTextAlignment:1];
  [(UILabel *)self->_failureLabel setClipsToBounds:1];
  v52 = [(UILabel *)self->_failureLabel layer];
  [v52 setCornerCurve:kCACornerCurveContinuous];

  [v3 addSubview:self->_failureLabel];
  [(PKTransactionAuthenticationCollectPasscodeViewController *)self _updateFailureLabelVisibility];
  v53 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonPressed"];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v53;

  v55 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self navigationItem];
  [v55 setLeftBarButtonItem:self->_cancelButton];

  if (self->_PINFormat == 2)
  {
    id v56 = objc_alloc((Class)UIBarButtonItem);
    v57 = PKLocalizedAquamanString(@"CONFIRM");
    v58 = (UIBarButtonItem *)[v56 initWithTitle:v57 style:0 target:self action:"_passcodeInputFinished"];
    confirmButton = self->_confirmButton;
    self->_confirmButton = v58;

    [(UIBarButtonItem *)self->_confirmButton setEnabled:0];
    v60 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self navigationItem];
    [v60 setRightBarButtonItem:self->_confirmButton];
  }
  id v61 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v61 configureWithTransparentBackground];
  v62 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self navigationItem];
  [v62 setStandardAppearance:v61];

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
}

- (void)viewWillLayoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  [(PKTransactionAuthenticationCollectPasscodeViewController *)&v48 viewWillLayoutSubviews];
  v3 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self view];
  uint64_t v4 = PKUIGetMinScreenWidthType();
  double v5 = 44.0;
  if (v4 == 1) {
    double v5 = 24.0;
  }
  if (v4) {
    double v6 = v5;
  }
  else {
    double v6 = 16.0;
  }
  [v3 bounds:v5];
  double v8 = v7 - (v6 + v6);
  PKUIGetMinScreenWidthType();
  int64_t v9 = [(UIImageView *)self->_logoImageView superview];

  if (v9)
  {
    id v10 = [(UIImageView *)self->_logoImageView image];
    [v10 size];

    PKSizeAspectFit();
    UIRectCenteredXInRect();
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    -[UIImageView setFrame:](self->_logoImageView, "setFrame:");
    v49.origin.x = v12;
    v49.origin.y = v14;
    v49.size.width = v16;
    v49.size.height = v18;
    CGRectGetMaxY(v49);
  }
  else
  {
    v19 = [(UILabel *)self->_titleLabel superview];

    if (v19)
    {
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v8, 1.79769313e308);
      UIRectCenteredXInRect();
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      -[UILabel setFrame:](self->_titleLabel, "setFrame:");
      v50.origin.x = v21;
      v50.origin.y = v23;
      v50.size.width = v25;
      v50.size.height = v27;
      CGRectGetMaxY(v50);
    }
  }
  [(UILabel *)self->_bodyTextLabel sizeThatFits:v8];
  UIRectCenteredXInRect();
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  -[UILabel setFrame:](self->_bodyTextLabel, "setFrame:");
  v51.origin.x = v29;
  v51.origin.y = v31;
  v51.size.width = v33;
  v51.size.height = v35;
  CGRectGetMaxY(v51);
  PKFloatRoundToPixel();
  -[UIView sizeThatFits:](self->_passcodeField, "sizeThatFits:");
  UIRectCenteredXInRect();
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  -[UIView setFrame:](self->_passcodeField, "setFrame:");
  v52.origin.x = v37;
  v52.origin.y = v39;
  v52.size.width = v41;
  v52.size.height = v43;
  CGRectGetMaxY(v52);
  [(UIActivityIndicatorView *)self->_spinner frame];
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  -[UILabel sizeThatFits:](self->_failureLabel, "sizeThatFits:", v8, 1.79769313e308);
  double v45 = v44 + 4.0;
  UIRectCenteredXInRect();
  -[UILabel setFrame:](self->_failureLabel, "setFrame:");
  v46 = [(UILabel *)self->_failureLabel layer];
  [v46 setCornerRadius:v45 * 0.5];

  [(UIButton *)self->_footerButton sizeToFit];
  [(UIButton *)self->_footerButton frame];
  v47 = [(UIButton *)self->_footerButton titleLabel];
  [v47 frame];

  UIRectCenteredXInRect();
  -[UIButton setFrame:](self->_footerButton, "setFrame:");
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionAuthenticationCollectPasscodeViewController;
  [(PKTransactionAuthenticationCollectPasscodeViewController *)&v4 viewDidAppear:a3];
  [(UIView *)self->_passcodeField becomeFirstResponder];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [a3 userInterfaceStyle];
  double v5 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    id v8 = [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField layer];
    id v7 = +[UIColor labelColor];
    [v8 setBorderColor:[v7 CGColor]];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)explanationViewDidUpdateLayout:(id)a3
{
  id v3 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self view];
  [v3 setNeedsLayout];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  if (self->_PINFormat == 2)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    id v9 = a5;
    id v10 = [a3 text];
    double v11 = [v10 stringByReplacingCharactersInRange:location length:length withString:v9];

    -[UIBarButtonItem setEnabled:](self->_confirmButton, "setEnabled:", (unint64_t)[v11 length] > 5);
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = [a3 text];
  id v5 = [v4 length];

  if ((unint64_t)v5 >= 6) {
    [(PKTransactionAuthenticationCollectPasscodeViewController *)self _passcodeInputFinished];
  }
  return (unint64_t)v5 > 5;
}

- (void)pinCodeTextFieldWasUpdated:(id)a3 isComplete:(BOOL)a4
{
  if (a4) {
    [(PKTransactionAuthenticationCollectPasscodeViewController *)self _passcodeInputFinished];
  }
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  if ([a3 state] == (id)1)
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000045F0;
    v4[3] = &unk_10000C430;
    objc_copyWeak(&v5, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000478C;
  v5[3] = &unk_10000C458;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_createPasscodeField
{
  int64_t PINFormat = self->_PINFormat;
  if (PINFormat == 2)
  {
    id v7 = objc_alloc_init(PKTransactionAuthenticationComplexPasscodeTextField);
    p_complexPasscodeField = (id *)&self->_complexPasscodeField;
    complexPasscodeField = self->_complexPasscodeField;
    self->_complexPasscodeField = v7;

    id v9 = [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField layer];
    id v10 = +[UIColor labelColor];
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    double v11 = [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField layer];
    [v11 setBorderWidth:1.0];

    CGFloat v12 = [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField layer];
    [v12 setCornerRadius:10.0];

    -[PKTransactionAuthenticationComplexPasscodeTextField setTextInsets:](self->_complexPasscodeField, "setTextInsets:", 0.0, 10.0, 0.0, 10.0);
    [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField setSecureTextEntry:1];
    [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField setDevicePasscodeEntry:1];
    [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField setDelegate:self];
  }
  else
  {
    if (PINFormat != 1) {
      return;
    }
    id v4 = (PKPinCodeField *)[objc_alloc((Class)PKPinCodeField) initWithPinCodeLength:6 style:1 delegate:self];
    p_complexPasscodeField = (id *)&self->_simplePasscodeField;
    simplePasscodeField = self->_simplePasscodeField;
    self->_simplePasscodeField = v4;

    [(PKPinCodeField *)self->_simplePasscodeField setHyphenatePinCode:0];
    [(PKPinCodeField *)self->_simplePasscodeField setSecureTextEntry:1];
  }
  self->_passcodeField = (UIView *)*p_complexPasscodeField;

  _objc_release_x1();
}

- (void)_clearPasscodeField
{
  [(PKPinCodeField *)self->_simplePasscodeField setPinCode:0];
  complexPasscodeField = self->_complexPasscodeField;

  [(PKTransactionAuthenticationComplexPasscodeTextField *)complexPasscodeField setText:0];
}

- (void)_cancelButtonPressed
{
  uint64_t v3 = PKAnalyticsSubjectSecureUIService;
  v7[0] = PKAnalyticsReportEventKey;
  v7[1] = PKAnalyticsReportButtonTagKey;
  v8[0] = PKAnalyticsReportEventTypeButtonTap;
  v8[1] = PKAnalyticsReportPaymentPINInputCancelButtonTag;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  +[PKAnalyticsReporter subject:v3 sendEvent:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 passcodeViewControllerDidCancel:self];
  }
  else
  {
    id v6 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_footerButtonPressed
{
  objc_initWeak(&location, self);
  uint64_t v3 = PKLocalizedAquamanString(@"CANCEL");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004EE8;
  v18[3] = &unk_10000C480;
  objc_copyWeak(&v19, &location);
  id v4 = +[UIAlertAction actionWithTitle:v3 style:1 handler:v18];

  id v5 = [(PKPaymentPass *)self->_pass organizationName];
  if ([(PKLinkedApplication *)self->_linkedApplication isInstalled])
  {
    id v6 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_FORGOT_PIN_ALERT_TITLE");
    id v7 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_FORGOT_PIN_ALERT_BODY", @"%@", v5);
    id v8 = PKLocalizedAquamanString(@"OPEN");
    id v9 = (id *)&PKAnalyticsReportResetPaymentPINOpenButtonTag;
  }
  else
  {
    id v6 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_APP_REQUIRED_TITLE", @"%@", v5);
    id v7 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_FORGOT_PIN_APP_REQUIRED_ALERT_BODY", @"%@%@", v5, v5);
    id v8 = PKLocalizedAquamanString(@"VIEW_IN_APP_STORE");
    id v9 = (id *)&PKAnalyticsReportResetPaymentPINViewInAppStoreButtonTag;
  }
  id v10 = *v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100004FE4;
  v14[3] = &unk_10000C4A8;
  objc_copyWeak(&v17, &location);
  id v11 = v10;
  id v15 = v11;
  CGFloat v16 = self;
  CGFloat v12 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v14];
  double v13 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  PKApplyDefaultIconToAlertController();
  [v13 addAction:v4];
  [v13 addAction:v12];
  [v13 setPreferredAction:v12];
  [(PKTransactionAuthenticationCollectPasscodeViewController *)self presentViewController:v13 animated:1 completion:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)_passcodeInputFinished
{
  [(UIView *)self->_passcodeField forceDisplayIfNeeded];
  dispatch_time_t v3 = dispatch_time(0, 76000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000523C;
  block[3] = &unk_10000C4D0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_transitionToState:(unint64_t)a3
{
  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    if (!a3 || a3 == 2)
    {
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
      [(UIBarButtonItem *)self->_confirmButton setEnabled:0];
      id v6 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self navigationItem];
      [v6 setRightBarButtonItem:self->_confirmButton];

      id v7 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self navigationItem];
      [v7 setLeftBarButtonItem:self->_cancelButton];

      [(UIButton *)self->_footerButton setEnabled:1];
      [(UIView *)self->_passcodeField setHidden:0];
      [(UIView *)self->_passcodeField becomeFirstResponder];
    }
    else if (a3 == 1)
    {
      -[UIView setHidden:](self->_passcodeField, "setHidden:");
      [(UIView *)self->_passcodeField resignFirstResponder];
      [(PKTransactionAuthenticationCollectPasscodeViewController *)self _clearPasscodeField];
      [(UIButton *)self->_footerButton setEnabled:0];
      id v4 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self navigationItem];
      [v4 setRightBarButtonItem:0];

      id v5 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self navigationItem];
      [v5 setLeftBarButtonItem:0];

      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    [(PKTransactionAuthenticationCollectPasscodeViewController *)self _updateFailureLabelVisibility];
  }
}

- (void)_encryptPasscodeInput
{
  int64_t PINFormat = self->_PINFormat;
  if (PINFormat == 2)
  {
    id v4 = [(PKTransactionAuthenticationComplexPasscodeTextField *)self->_complexPasscodeField text];
  }
  else
  {
    if (PINFormat != 1)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    id v4 = [(PKPinCodeField *)self->_simplePasscodeField pinCode];
  }
  id v5 = v4;
  id v6 = [v4 pk_zString];

LABEL_7:
  id v7 = [(PKPaymentPass *)self->_pass uniqueID];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000556C;
  v9[3] = &unk_10000C520;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [(PKTransactionAuthenticationCollectPasscodeViewController *)self _retrievePINEncryptionCertificateForPassUniqueIdentifier:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000057F4;
    v9[3] = &unk_10000C570;
    objc_copyWeak(&v12, &location);
    id v11 = v7;
    id v10 = v6;
    [WeakRetained passcodeViewController:self requestSessionExchangeToken:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_encryptPIN:(id)a3 withCertificates:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([v9 count])
    {
      objc_initWeak(&location, self);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100005B40;
      v12[3] = &unk_10000C5C0;
      objc_copyWeak(&v16, &location);
      id v15 = v10;
      id v13 = v8;
      id v14 = v9;
      [WeakRetained passcodeViewController:self requestSessionExchangeToken:v12];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (void)_updateFailureLabelVisibility
{
  if (self->_currentFailure == 1 && self->_currentState == 2)
  {
    dispatch_time_t v3 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_INCORRECT_PIN_ENTRY");
    [(UILabel *)self->_failureLabel setText:v3];
    id v4 = [(PKTransactionAuthenticationCollectPasscodeViewController *)self viewIfLoaded];
    [v4 setNeedsLayout];

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  failureLabel = self->_failureLabel;

  [(UILabel *)failureLabel setHidden:v5];
}

- (PKTransactionAuthenticationCollectPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTransactionAuthenticationCollectPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)passcodeField
{
  return self->_passcodeField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_failureLabel, 0);
  objc_storeStrong((id *)&self->_bodyTextLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoImageView, 0);
  objc_storeStrong((id *)&self->_complexPasscodeField, 0);
  objc_storeStrong((id *)&self->_simplePasscodeField, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end