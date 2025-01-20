@interface iOSSetupAuthViewController
- (BOOL)_canShowWhileLocked;
- (void)_handleKeyboardWillShow:(id)a3;
- (void)_handlePINEntered:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iOSSetupAuthViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pinWell5 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell4 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel6 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel5 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel4 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinEntryView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);

  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setHidden:1, *(void *)&a4];
  if ((a3 & 0x10000) != 0)
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"AUTH_INCORRECT" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)((char *)&self->_activityIndicatorView + 1) setText:v9];

    v10 = +[UIColor systemRedColor];
    [*(id *)((char *)&self->_activityIndicatorView + 1) setTextColor:v10];

    [self->super.super._mainController setBadPINCount:[self->super.super._mainController badPINCount] + 1];
  }
  else
  {
    unsigned int v6 = [self->super.super._mainController otherDeviceClassCode] - 1;
    if (v6 > 6) {
      CFStringRef v7 = @"_IPHONE";
    }
    else {
      CFStringRef v7 = off_1001A18E0[v6];
    }
    v11 = [@"IOS_SETUP_ENTER_PIN" stringByAppendingString:v7];
    v12 = sub_100138280(@"Localizable", v11);
    [*(id *)((char *)&self->_activityIndicatorView + 1) setText:v12];

    v13 = +[UIColor blackColor];
    [*(id *)((char *)&self->_activityIndicatorView + 1) setTextColor:v13];
  }
  v14 = *(UILabel **)((char *)&self->_infoLabel + 1);

  [v14 setText:&stru_1001A1DC0];
}

- (void)_handlePINEntered:(id)a3
{
  id v4 = a3;
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setHidden:0];
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) startAnimating];
  if ([self->super.super._mainController testMode])
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100105CAC;
    handler[3] = &unk_1001A1C00;
    dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    id v8 = v4;
    v9 = self;
    v5 = v7;
    dispatch_source_set_event_handler(v5, handler);
    SFDispatchTimerSet();
    dispatch_resume(v5);
  }
  else
  {
    [self->super.super._mainController _tryPIN:v4];
  }
}

- (void)_handleKeyboardWillShow:(id)a3
{
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100105F9C;
  v30[3] = &unk_1001A1BD8;
  v30[4] = self;
  id v4 = a3;
  +[UIView performWithoutAnimation:v30];
  v5 = [v4 userInfo];

  unsigned int v6 = [v5 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(iOSSetupAuthViewController *)self view];
  [v15 convertRect:0 fromView:v8 toView:v10];
  double v17 = v16;

  v18 = [v5 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
  [v18 doubleValue];
  double v20 = v19;

  v21 = [v5 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
  unint64_t v22 = (unint64_t)[v21 integerValue];

  if (!BYTE1(self->_pinWell6))
  {
    v23 = [(SVSBaseViewController *)self bottomMarginConstraint];
    [v23 constant];
    *(void *)(&self->_viewBottomConstantValid + 1) = v24;

    BYTE1(self->_pinWell6) = 1;
  }
  double v25 = *(double *)(&self->_viewBottomConstantValid + 1);
  v26 = [(iOSSetupAuthViewController *)self view];
  [v26 bounds];
  double v27 = v25 + CGRectGetHeight(v31) - v17;
  v28 = [(SVSBaseViewController *)self bottomMarginConstraint];
  [v28 setConstant:v27];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100106038;
  v29[3] = &unk_1001A1BD8;
  v29[4] = self;
  +[UIView animateWithDuration:v22 | 4 delay:v29 options:0 animations:v20 completion:0.0];
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)((char *)&self->_infoLabel + 1) setDisabled:1];
  [self->super.super._mainController dismiss:5];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)iOSSetupAuthViewController;
  [(iOSSetupAuthViewController *)&v6 viewDidDisappear:v3];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardWillShowNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v16.receiver = self;
  v16.super_class = (Class)iOSSetupAuthViewController;
  [(SVSBaseViewController *)&v16 viewWillAppear:v3];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleKeyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
  uint64_t v6 = *(uint64_t *)((char *)&self->_pinLabel1 + 1);
  v18[0] = *(PINEntryView **)((char *)&self->_pinEntryView + 1);
  v18[1] = v6;
  uint64_t v7 = *(uint64_t *)((char *)&self->_pinLabel3 + 1);
  v18[2] = *(UILabel **)((char *)&self->_pinLabel2 + 1);
  v18[3] = v7;
  uint64_t v8 = *(uint64_t *)((char *)&self->_pinLabel5 + 1);
  v18[4] = *(UILabel **)((char *)&self->_pinLabel4 + 1);
  v18[5] = v8;
  double v9 = +[NSArray arrayWithObjects:v18 count:6];
  [*(id *)((char *)&self->_infoLabel + 1) setDigits:v9];

  uint64_t v10 = *(uint64_t *)((char *)&self->_pinWell1 + 1);
  uint64_t v11 = *(uint64_t *)((char *)&self->_pinWell2 + 1);
  v17[0] = *(UILabel **)((char *)&self->_pinLabel6 + 1);
  v17[1] = v10;
  uint64_t v12 = *(uint64_t *)((char *)&self->_pinWell3 + 1);
  v17[2] = v11;
  v17[3] = v12;
  uint64_t v13 = *(uint64_t *)((char *)&self->_pinWell5 + 1);
  v17[4] = *(UIView **)((char *)&self->_pinWell4 + 1);
  v17[5] = v13;
  double v14 = +[NSArray arrayWithObjects:v17 count:6];
  [*(id *)((char *)&self->_infoLabel + 1) setWells:v14];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010648C;
  v15[3] = &unk_1001A1BB0;
  v15[4] = self;
  [*(id *)((char *)&self->_infoLabel + 1) setTextChangedHandler:v15];
  [(iOSSetupAuthViewController *)self showWithFlags:0 throttleSeconds:0xFFFFFFFFLL];
  [*(id *)((char *)&self->_infoLabel + 1) becomeFirstResponder];
}

@end