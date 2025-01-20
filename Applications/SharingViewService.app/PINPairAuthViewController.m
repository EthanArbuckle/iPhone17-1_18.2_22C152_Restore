@interface PINPairAuthViewController
- (void)_handleKeyboardWillShow:(id)a3;
- (void)_handlePINEntered:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PINPairAuthViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pinWell4 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinWell1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel4 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel3 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel2 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinLabel1 + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pinEntryView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)_handlePINEntered:(id)a3
{
  id v4 = a3;
  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setHidden:1];
  [*(id *)((char *)&self->_pinWell4 + 1) setHidden:0];
  [*(id *)((char *)&self->_pinWell4 + 1) startAnimating];
  if ([self->super._mainController testFlags])
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10011A094;
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
    v5 = [self->super._mainController pairingSession];
    [v5 clientTryPIN:v4];
  }
}

- (void)_handleKeyboardWillShow:(id)a3
{
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10011A3AC;
  v30[3] = &unk_1001A1BD8;
  v30[4] = self;
  id v4 = a3;
  +[UIView performWithoutAnimation:v30];
  v5 = [v4 userInfo];

  v6 = [v5 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = [(PINPairAuthViewController *)self view];
  [v15 convertRect:0 fromView:v8 toView:v10];
  double v17 = v16;

  v18 = [v5 objectForKeyedSubscript:UIKeyboardAnimationDurationUserInfoKey];
  [v18 doubleValue];
  double v20 = v19;

  v21 = [v5 objectForKeyedSubscript:UIKeyboardAnimationCurveUserInfoKey];
  unint64_t v22 = (unint64_t)[v21 integerValue];

  if (!BYTE1(self->_progressSpinner))
  {
    v23 = [(SVSBaseViewController *)self bottomMarginConstraint];
    [v23 constant];
    *(void *)(&self->_viewBottomConstantValid + 1) = v24;

    BYTE1(self->_progressSpinner) = 1;
  }
  double v25 = *(double *)(&self->_viewBottomConstantValid + 1);
  v26 = [(PINPairAuthViewController *)self view];
  [v26 bounds];
  double v27 = v25 + CGRectGetHeight(v31) - v17;
  v28 = [(SVSBaseViewController *)self bottomMarginConstraint];
  [v28 setConstant:v27];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10011A448;
  v29[3] = &unk_1001A1BD8;
  v29[4] = self;
  +[UIView animateWithDuration:v22 | 4 delay:v29 options:0 animations:v20 completion:0.0];
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)((char *)&self->_infoLabel + 1) setDisabled:1];
  [self->super._mainController dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)PINPairAuthViewController;
  [(PINPairAuthViewController *)&v6 viewDidDisappear:v3];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardWillShowNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v15.receiver = self;
  v15.super_class = (Class)PINPairAuthViewController;
  [(SVSBaseViewController *)&v15 viewWillAppear:v3];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleKeyboardWillShow:" name:UIKeyboardWillShowNotification object:0];
  objc_super v6 = +[NSBundle mainBundle];
  double v7 = [v6 localizedStringForKey:@"AUTH_INSTRUCTIONS_APPLETV" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setText:v7];

  uint64_t v8 = *(uint64_t *)((char *)&self->_pinLabel1 + 1);
  v17[0] = *(PINEntryView **)((char *)&self->_pinEntryView + 1);
  v17[1] = v8;
  uint64_t v9 = *(uint64_t *)((char *)&self->_pinLabel3 + 1);
  v17[2] = *(UILabel **)((char *)&self->_pinLabel2 + 1);
  v17[3] = v9;
  double v10 = +[NSArray arrayWithObjects:v17 count:4];
  [*(id *)((char *)&self->_infoLabel + 1) setDigits:v10];

  uint64_t v11 = *(uint64_t *)((char *)&self->_pinWell1 + 1);
  v16[0] = *(UILabel **)((char *)&self->_pinLabel4 + 1);
  v16[1] = v11;
  uint64_t v12 = *(uint64_t *)((char *)&self->_pinWell3 + 1);
  v16[2] = *(UIView **)((char *)&self->_pinWell2 + 1);
  v16[3] = v12;
  double v13 = +[NSArray arrayWithObjects:v16 count:4];
  [*(id *)((char *)&self->_infoLabel + 1) setWells:v13];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10011A8B0;
  v14[3] = &unk_1001A1BB0;
  v14[4] = self;
  [*(id *)((char *)&self->_infoLabel + 1) setTextChangedHandler:v14];
  [(PINPairAuthViewController *)self showWithFlags:0 throttleSeconds:0xFFFFFFFFLL];
  [*(id *)((char *)&self->_infoLabel + 1) becomeFirstResponder];
}

- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  [*(id *)((char *)&self->_pinWell4 + 1) setHidden:1 *(void *)&a4];
  objc_super v6 = +[NSBundle mainBundle];
  double v7 = v6;
  if ((a3 & 0x10000) != 0)
  {
    uint64_t v9 = [v6 localizedStringForKey:@"AUTH_INCORRECT" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setText:v9];

    +[UIColor systemRedColor];
  }
  else
  {
    uint64_t v8 = [v6 localizedStringForKey:@"AUTH_INSTRUCTIONS_APPLETV" value:&stru_1001A1DC0 table:@"Localizable"];
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setText:v8];

    +[UIColor blackColor];
  double v10 = };
  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setTextColor:v10];

  [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setHidden:0];
  uint64_t v11 = *(UILabel **)((char *)&self->_infoLabel + 1);

  [v11 setText:&stru_1001A1DC0];
}

@end