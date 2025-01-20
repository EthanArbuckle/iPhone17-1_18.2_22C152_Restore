@interface ClarityUIAdminPasscodeSetupController
- (BFFPasscodeInputView)passcodeInputView;
- (ClarityUIAdminPasscodeSetupController)initWithCompletion:(id)a3;
- (NSString)initialPasscode;
- (id)_axPasscodeInputView;
- (id)completionHandler;
- (int64_t)passcodeState;
- (void)_axShowDoneControllerWithPasscode:(id)a3;
- (void)_axShowWarmingView:(id)a3;
- (void)_axTransitionToPasscodeInput:(id)a3 withAnimation:(int)a4;
- (void)_passcodeViewTapped:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setInitialPasscode:(id)a3;
- (void)setPasscodeState:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ClarityUIAdminPasscodeSetupController

- (ClarityUIAdminPasscodeSetupController)initWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = settingsLocString(@"ADMIN_PASSCODE_TITLE", @"ClarityUISettings");
  v27.receiver = self;
  v27.super_class = (Class)ClarityUIAdminPasscodeSetupController;
  v6 = [(ClarityUIAdminPasscodeSetupController *)&v27 initWithTitle:v5 detailText:0 symbolName:@"lock.fill"];

  if (v6)
  {
    id v7 = objc_retainBlock(v4);
    id completionHandler = v6->_completionHandler;
    v6->_id completionHandler = v7;

    v9 = [(ClarityUIAdminPasscodeSetupController *)v6 contentView];
    v6->_passcodeState = 0;
    uint64_t v10 = [(ClarityUIAdminPasscodeSetupController *)v6 _axPasscodeInputView];
    passcodeInputView = v6->_passcodeInputView;
    v6->_passcodeInputView = (BFFPasscodeInputView *)v10;

    [(BFFPasscodeInputView *)v6->_passcodeInputView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(BFFPasscodeInputView *)v6->_passcodeInputView setDelegate:v6];
    v12 = [(ClarityUIAdminPasscodeSetupController *)v6 contentView];
    [v12 addSubview:v6->_passcodeInputView];

    v24 = [(BFFPasscodeInputView *)v6->_passcodeInputView trailingAnchor];
    v23 = [v9 trailingAnchor];
    v13 = [v24 constraintEqualToAnchor:v23];
    v28[0] = v13;
    v14 = [(BFFPasscodeInputView *)v6->_passcodeInputView leadingAnchor];
    v25 = v9;
    v15 = [v9 leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v28[1] = v16;
    [(BFFPasscodeInputView *)v6->_passcodeInputView topAnchor];
    v17 = id v26 = v4;
    v18 = [v9 topAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v28[2] = v19;
    v20 = +[NSArray arrayWithObjects:v28 count:3];
    +[NSLayoutConstraint activateConstraints:v20];

    id v21 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v6 action:"_passcodeViewTapped:"];
    [(BFFPasscodeInputView *)v6->_passcodeInputView setUserInteractionEnabled:1];
    [(BFFPasscodeInputView *)v6->_passcodeInputView addGestureRecognizer:v21];

    id v4 = v26;
  }

  return v6;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ClarityUIAdminPasscodeSetupController;
  [(ClarityUIAdminPasscodeSetupController *)&v4 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ClarityUIAdminPasscodeSetupController;
  [(ClarityUIAdminPasscodeSetupController *)&v6 viewWillAppear:a3];
  [(ClarityUIAdminPasscodeSetupController *)self setPasscodeState:0];
  [(ClarityUIAdminPasscodeSetupController *)self setInitialPasscode:&stru_20F6B8];
  objc_super v4 = settingsLocString(@"ADMIN_PASSCODE_DESCRIPTION_INITIAL_ENTRY", @"ClarityUISettings");
  v5 = [(BFFPasscodeInputView *)self->_passcodeInputView instructions];
  [v5 setText:v4];

  [(BFFPasscodeInputView *)self->_passcodeInputView sizeToFit];
  [(BFFPasscodeInputView *)self->_passcodeInputView setPasscode:&stru_20F6B8];
  [(BFFPasscodeInputView *)self->_passcodeInputView invalidateIntrinsicContentSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ClarityUIAdminPasscodeSetupController;
  [(ClarityUIAdminPasscodeSetupController *)&v4 viewDidAppear:a3];
  [(BFFPasscodeInputView *)self->_passcodeInputView becomeFirstResponder];
}

- (void)_passcodeViewTapped:(id)a3
{
}

- (void)passcodeInput:(id)a3 enteredPasscode:(id)a4
{
  id v6 = a4;
  id v12 = v6;
  if (self->_passcodeState == 1)
  {
    if ([(NSString *)self->_initialPasscode isEqualToString:v6])
    {
      [(ClarityUIAdminPasscodeSetupController *)self _axShowWarmingView:v12];
      goto LABEL_7;
    }
    self->_passcodeState = 2;
    initialPasscode = self->_initialPasscode;
    self->_initialPasscode = 0;

    [(BFFPasscodeInputView *)self->_passcodeInputView setPasscode:&stru_20F6B8];
    id v7 = [(ClarityUIAdminPasscodeSetupController *)self _axPasscodeInputView];
    v8 = self;
    v9 = v7;
    uint64_t v10 = 1;
  }
  else
  {
    self->_passcodeState = 1;
    objc_storeStrong((id *)&self->_initialPasscode, a4);
    [(BFFPasscodeInputView *)self->_passcodeInputView setPasscode:&stru_20F6B8];
    id v7 = [(ClarityUIAdminPasscodeSetupController *)self _axPasscodeInputView];
    v8 = self;
    v9 = v7;
    uint64_t v10 = 2;
  }
  [(ClarityUIAdminPasscodeSetupController *)v8 _axTransitionToPasscodeInput:v9 withAnimation:v10];

LABEL_7:
}

- (id)_axPasscodeInputView
{
  id v3 = objc_alloc((Class)BFFSimplePasscodeInputView);
  id v4 = objc_msgSend(v3, "initWithFrame:numberOfEntryFields:", AXBackBoardServerClarityUIAdminPasscodeLength, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  int64_t v5 = [(ClarityUIAdminPasscodeSetupController *)self passcodeState];
  if (v5 == 2)
  {
    id v6 = @"ADMIN_PASSCODE_DESCRIPTION_FAILED_ENTRY";
  }
  else if (v5 == 1)
  {
    id v6 = @"ADMIN_PASSCODE_DESCRIPTION_SECOND_ENTRY";
  }
  else
  {
    if (v5) {
      goto LABEL_8;
    }
    id v6 = @"ADMIN_PASSCODE_DESCRIPTION_INITIAL_ENTRY";
  }
  id v7 = settingsLocString(v6, @"ClarityUISettings");
  v8 = [v4 instructions];
  [v8 setText:v7];

LABEL_8:

  return v4;
}

- (void)_axTransitionToPasscodeInput:(id)a3 withAnimation:(int)a4
{
  id v7 = a3;
  v8 = [(ClarityUIAdminPasscodeSetupController *)self view];
  unsigned __int8 v9 = [v8 _shouldReverseLayoutDirection];

  uint64_t v10 = [(ClarityUIAdminPasscodeSetupController *)self contentView];
  if (((a4 == 2) & v9) != 0) {
    unsigned int v11 = 1;
  }
  else {
    unsigned int v11 = a4;
  }
  if (((a4 == 1) & v9) != 0) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = v11;
  }
  v13 = self->_passcodeInputView;
  [(BFFPasscodeInputView *)v13 setEnabled:0];
  [(BFFPasscodeInputView *)v13 setDelegate:0];
  objc_storeStrong((id *)&self->_passcodeInputView, a3);
  [v7 becomeFirstResponder];
  [v10 frame];
  double v15 = v14;
  [(BFFPasscodeInputView *)v13 center];
  double v17 = v16;
  double v19 = v18;
  double v20 = v16 + v15;
  double v21 = v16 - v15;
  [v7 frame];
  double v23 = v22;
  double v25 = v24;
  [(BFFPasscodeInputView *)v13 frame];
  objc_msgSend(v7, "setFrame:", v23, v25);
  if (v12 == 2) {
    double v26 = v20;
  }
  else {
    double v26 = v21;
  }
  objc_msgSend(v7, "setCenter:", v26, v19);
  [v10 addSubview:v7];
  +[UITransitionView defaultDurationForTransition:v12];
  double v28 = v27;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __84__ClarityUIAdminPasscodeSetupController__axTransitionToPasscodeInput_withAnimation___block_invoke;
  v35[3] = &unk_20A940;
  v36 = v13;
  int v44 = v12;
  double v38 = v21;
  double v39 = v19;
  double v40 = v20;
  double v41 = v19;
  id v37 = v7;
  double v42 = v17;
  double v43 = v19;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __84__ClarityUIAdminPasscodeSetupController__axTransitionToPasscodeInput_withAnimation___block_invoke_2;
  v31[3] = &unk_20A968;
  v32 = v36;
  id v33 = v37;
  v34 = self;
  id v29 = v37;
  v30 = v36;
  +[UIView animateWithDuration:v35 animations:v31 completion:v28];
}

id __84__ClarityUIAdminPasscodeSetupController__axTransitionToPasscodeInput_withAnimation___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = 72;
  if (*(_DWORD *)(a1 + 96) == 2) {
    uint64_t v3 = 56;
  }
  uint64_t v4 = 64;
  if (*(_DWORD *)(a1 + 96) == 2) {
    uint64_t v4 = 48;
  }
  objc_msgSend(v2, "setCenter:", *(double *)(a1 + v4), *(double *)(a1 + v3));
  int64_t v5 = *(void **)(a1 + 40);
  double v6 = *(double *)(a1 + 80);
  double v7 = *(double *)(a1 + 88);

  return objc_msgSend(v5, "setCenter:", v6, v7);
}

void __84__ClarityUIAdminPasscodeSetupController__axTransitionToPasscodeInput_withAnimation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 48)];
  UIAccessibilityNotifications v2 = UIAccessibilityLayoutChangedNotification;
  uint64_t v3 = *(void **)(a1 + 40);

  UIAccessibilityPostNotification(v2, v3);
}

- (void)_axShowWarmingView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int64_t v5 = [ClarityUIPasswordRecoveryWarmingController alloc];
  unsigned __int8 v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned int v11 = __60__ClarityUIAdminPasscodeSetupController__axShowWarmingView___block_invoke;
  uint64_t v12 = &unk_20A990;
  objc_copyWeak(&v15, &location);
  id v6 = v4;
  id v13 = v6;
  double v14 = self;
  double v7 = [(ClarityUIPasswordRecoveryWarmingController *)v5 initWithCompletion:&v9];
  v8 = [(ClarityUIAdminPasscodeSetupController *)self navigationController];
  [v8 pushViewController:v7 animated:1];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __60__ClarityUIAdminPasscodeSetupController__axShowWarmingView___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _axShowDoneControllerWithPasscode:*(void *)(a1 + 32)];
  }
  else
  {
    id WeakRetained = +[CLFSettings sharedInstance];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = +[AXBackBoardServer server];
    [v4 setClarityUIAdminPasscode:v3];

    [WeakRetained setAdminPasscodeRecoveryAppleID:0];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
  }
}

- (void)_axShowDoneControllerWithPasscode:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_opt_new();
  [v5 setIsEphemeral:1];
  [v5 setAuthenticationType:2];
  [v5 setShouldPromptForPasswordOnly:1];
  [v5 setPresentingViewController:self];
  int v6 = _os_feature_enabled_impl();
  if (v6)
  {
    double v7 = [@"ADMIN_PASSCODE_RECOVERY_TITLE" stringByAppendingString:@"_AABRANDING"];
  }
  else
  {
    double v7 = @"ADMIN_PASSCODE_RECOVERY_TITLE";
  }
  v8 = settingsLocString(v7, @"ClarityUISettings");
  [v5 setTitle:v8];

  if (v6) {
  int v9 = _os_feature_enabled_impl();
  }
  if (v9)
  {
    uint64_t v10 = [@"ADMIN_PASSCODE_RECOVERY_EXPLANATION" stringByAppendingString:@"_AABRANDING"];
  }
  else
  {
    uint64_t v10 = @"ADMIN_PASSCODE_RECOVERY_EXPLANATION";
  }
  unsigned int v11 = settingsLocString(v10, @"ClarityUISettings");
  [v5 setReason:v11];

  if (v9) {
  uint64_t v12 = settingsLocString(@"ADMIN_PASSCODE_OK_BUTTON", @"ClarityUISettings");
  }
  [v5 setDefaultButtonString:v12];

  id v13 = settingsLocString(@"ADMIN_PASSCODE_CANCEL_BUTTON", @"ClarityUISettings");
  [v5 setCancelButtonString:v13];

  double v14 = objc_opt_new();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke;
  v16[3] = &unk_20A9E0;
  id v17 = v4;
  double v18 = self;
  id v15 = v4;
  [v14 authenticateWithContext:v5 completion:v16];
}

void __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = +[NSOperationQueue mainQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2;
  v12[3] = &unk_209768;
  id v13 = v5;
  id v14 = v6;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v8;
  uint64_t v16 = v9;
  id v10 = v6;
  id v11 = v5;
  [v7 addOperationWithBlock:v12];
}

void __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  id v4 = +[CLFSettings sharedInstance];
  id v5 = (id *)(a1 + 40);
  if (*(void *)(a1 + 40)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6)
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = +[AXBackBoardServer server];
    [v10 setClarityUIAdminPasscode:v9];

    [v4 setAdminPasscodeRecoveryAppleID:v3];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 56) + 8) + 16))();
    goto LABEL_34;
  }
  if (_os_feature_enabled_impl())
  {
    double v7 = [@"ADMIN_PASSCODE_RECOVERY_SKIP_ALERT" stringByAppendingString:@"_AABRANDING"];
    id v8 = settingsLocString(v7, @"ClarityUISettings");
  }
  else
  {
    id v8 = settingsLocString(@"ADMIN_PASSCODE_RECOVERY_SKIP_ALERT", @"ClarityUISettings");
  }
  if (_os_feature_enabled_impl())
  {
    id v11 = [@"ADMIN_PASSCODE_RECOVERY_PROVIDE_BUTTON" stringByAppendingString:@"_AABRANDING"];
    uint64_t v12 = settingsLocString(v11, @"ClarityUISettings");
  }
  else
  {
    uint64_t v12 = settingsLocString(@"ADMIN_PASSCODE_RECOVERY_PROVIDE_BUTTON", @"ClarityUISettings");
  }
  id v13 = [*v5 domain];
  if (![v13 isEqualToString:AKAppleIDAuthenticationErrorDomain])
  {

LABEL_16:
    if (*v5)
    {
      uint64_t v16 = CLFLogSettings();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2_cold_2((uint64_t *)(a1 + 40), v16);
      }
    }
    else
    {
      if (v3) {
        goto LABEL_21;
      }
      uint64_t v16 = CLFLogSettings();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2_cold_1(v2, v16);
      }
    }

LABEL_21:
    int v17 = _os_feature_enabled_impl();
    if (v17)
    {
      double v18 = [@"ADMIN_PASSCODE_RECOVERY_CONNECTIVITY_ERROR_TITLE" stringByAppendingString:@"_AABRANDING"];
    }
    else
    {
      double v18 = @"ADMIN_PASSCODE_RECOVERY_CONNECTIVITY_ERROR_TITLE";
    }
    id v15 = settingsLocString(v18, @"ClarityUISettings");
    if (v17) {

    }
    if (MGGetBoolAnswer()) {
      double v19 = @"ADMIN_PASSCODE_RECOVERY_CONNECTIVITY_ERROR_DESCRIPTION_WLAN";
    }
    else {
      double v19 = @"ADMIN_PASSCODE_RECOVERY_CONNECTIVITY_ERROR_DESCRIPTION_WIFI";
    }
    uint64_t v20 = settingsLocString(v19, @"ClarityUISettings");

    uint64_t v21 = settingsLocString(@"ADMIN_PASSCODE_RECOVERY_CONNECTIVITY_TRY_AGAIN", @"ClarityUISettings");

    uint64_t v12 = (void *)v21;
    id v8 = (void *)v20;
    goto LABEL_30;
  }
  id v14 = [*v5 code];

  if (v14 != (id)-7003) {
    goto LABEL_16;
  }
  id v15 = settingsLocString(@"ADMIN_PASSCODE_RECOVERY_CONFIRMATION", @"ClarityUISettings");
LABEL_30:
  double v22 = +[UIAlertController alertControllerWithTitle:v15 message:v8 preferredStyle:1];
  if (_os_feature_enabled_impl())
  {
    double v23 = [@"ADMIN_PASSCODE_RECOVERY_SKIP_BUTTON" stringByAppendingString:@"_AABRANDING"];
    double v24 = settingsLocString(v23, @"ClarityUISettings");
  }
  else
  {
    double v24 = settingsLocString(@"ADMIN_PASSCODE_RECOVERY_SKIP_BUTTON", @"ClarityUISettings");
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_376;
  v33[3] = &unk_20A9B8;
  id v34 = *(id *)(a1 + 48);
  id v25 = v4;
  uint64_t v26 = *(void *)(a1 + 56);
  id v35 = v25;
  uint64_t v36 = v26;
  double v27 = +[UIAlertAction actionWithTitle:v24 style:0 handler:v33];
  [v22 addAction:v27];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2_378;
  v31[3] = &unk_209CD8;
  int8x16_t v30 = *(int8x16_t *)(a1 + 48);
  id v28 = (id)v30.i64[0];
  int8x16_t v32 = vextq_s8(v30, v30, 8uLL);
  id v29 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v31];
  [v22 addAction:v29];

  [*(id *)(a1 + 56) presentViewController:v22 animated:1 completion:0];
LABEL_34:
}

uint64_t __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_376(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = +[AXBackBoardServer server];
  [v3 setClarityUIAdminPasscode:v2];

  [*(id *)(a1 + 40) setAdminPasscodeRecoveryAppleID:0];
  id v4 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 16);

  return v4();
}

id __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2_378(uint64_t a1)
{
  return [*(id *)(a1 + 32) _axShowDoneControllerWithPasscode:*(void *)(a1 + 40)];
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKey:UIKeyboardFrameEndUserInfoKey];
  [v6 CGRectValue];
  CGFloat rect = v7;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  objc_opt_class();
  id v14 = [(ClarityUIAdminPasscodeSetupController *)self view];
  id v15 = [v14 subviews];
  uint64_t v16 = [v15 firstObject];
  int v17 = __UIAccessibilityCastAsClass();

  [(BFFPasscodeInputView *)self->_passcodeInputView frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  uint64_t v26 = [(BFFPasscodeInputView *)self->_passcodeInputView superview];
  objc_msgSend(v17, "convertRect:fromView:", v26, v19, v21, v23, v25);
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v34 = v33;

  v38.origin.x = v28;
  v38.origin.y = v30;
  v38.size.width = v32;
  v38.size.height = v34;
  double Width = CGRectGetWidth(v38);
  v39.origin.x = v28;
  v39.origin.y = v30;
  v39.size.width = v32;
  v39.size.height = v34;
  double MaxY = CGRectGetMaxY(v39);
  v40.origin.x = rect;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  objc_msgSend(v17, "setContentSize:", Width, MaxY + CGRectGetHeight(v40));
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BFFPasscodeInputView)passcodeInputView
{
  return self->_passcodeInputView;
}

- (int64_t)passcodeState
{
  return self->_passcodeState;
}

- (void)setPasscodeState:(int64_t)a3
{
  self->_passcodeState = a3;
}

- (NSString)initialPasscode
{
  return self->_initialPasscode;
}

- (void)setInitialPasscode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPasscode, 0);
  objc_storeStrong((id *)&self->_passcodeInputView, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

void __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Authenticated user without an altDSID: %{private}@", (uint8_t *)&v3, 0xCu);
}

void __75__ClarityUIAdminPasscodeSetupController__axShowDoneControllerWithPasscode___block_invoke_2_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to authenticate recovery Apple ID: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end