@interface TVLatencyColorimeterSetupAuthViewController
- (UILabel)titleLabel;
- (void)_handlePINEntered:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencyColorimeterSetupAuthViewController

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
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return *(UILabel **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
}

- (void)showWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  [*(id *)((char *)&self->_pinWell4 + 1) setHidden:1 *(void *)&a4];
  v6 = +[NSBundle mainBundle];
  v7 = v6;
  if ((a3 & 0x10000) != 0)
  {
    v10 = [v6 localizedStringForKey:@"AUTH_INCORRECT" value:&stru_1001A1DC0 table:@"Localizable"];
    v9 = (id *)((char *)&self->_titleLabel + 1);
    [*(id *)((char *)&self->_titleLabel + 1) setText:v10];

    +[UIColor systemRedColor];
  }
  else
  {
    v8 = [v6 localizedStringForKey:@"AUTH_INSTRUCTIONS_APPLETV" value:&stru_1001A1DC0 table:@"Localizable"];
    v9 = (id *)((char *)&self->_titleLabel + 1);
    [*(id *)((char *)&self->_titleLabel + 1) setText:v8];

    +[UIColor blackColor];
  v11 = };
  [*v9 setTextColor:v11];

  v12 = *(UILabel **)((char *)&self->_infoLabel + 1);

  [v12 setText:&stru_1001A1DC0];
}

- (void)_handlePINEntered:(id)a3
{
  id v4 = a3;
  [*(id *)((char *)&self->_pinWell4 + 1) setHidden:0];
  [*(id *)((char *)&self->_pinWell4 + 1) startAnimating];
  v5 = [(SVSBaseViewController *)self mainController];
  id v6 = [v5 testFlags];

  if (v6)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100118584;
    handler[3] = &unk_1001A1C00;
    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    id v11 = v4;
    v12 = self;
    v7 = v10;
    dispatch_source_set_event_handler(v7, handler);
    SFDispatchTimerSet();
    dispatch_resume(v7);
  }
  else
  {
    v7 = [(SVSBaseViewController *)self mainController];
    v8 = [v7 colorCalibratorSetupSession];
    [v8 pairSetupTryPIN:v4];
  }
}

- (void)handleDismissButton:(id)a3
{
  id v5 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)((char *)&self->_infoLabel + 1) setDisabled:1];
  id v4 = [(SVSBaseViewController *)self mainController];
  [v4 dismiss:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)TVLatencyColorimeterSetupAuthViewController;
  [(TVLatencyColorimeterSetupAuthViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC6D8 <= 30 && (dword_1001CC6D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)TVLatencyColorimeterSetupAuthViewController;
  [(SVSBaseViewController *)&v14 viewWillAppear:v3];
  objc_super v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"AUTH_INSTRUCTIONS_APPLETV" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_titleLabel + 1) setText:v6];

  uint64_t v7 = *(uint64_t *)((char *)&self->_pinLabel1 + 1);
  v16[0] = *(PINEntryView **)((char *)&self->_pinEntryView + 1);
  v16[1] = v7;
  uint64_t v8 = *(uint64_t *)((char *)&self->_pinLabel3 + 1);
  v16[2] = *(UILabel **)((char *)&self->_pinLabel2 + 1);
  v16[3] = v8;
  v9 = +[NSArray arrayWithObjects:v16 count:4];
  [*(id *)((char *)&self->_infoLabel + 1) setDigits:v9];

  uint64_t v10 = *(uint64_t *)((char *)&self->_pinWell1 + 1);
  v15[0] = *(UILabel **)((char *)&self->_pinLabel4 + 1);
  v15[1] = v10;
  uint64_t v11 = *(uint64_t *)((char *)&self->_pinWell3 + 1);
  v15[2] = *(UIView **)((char *)&self->_pinWell2 + 1);
  v15[3] = v11;
  v12 = +[NSArray arrayWithObjects:v15 count:4];
  [*(id *)((char *)&self->_infoLabel + 1) setWells:v12];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001189D8;
  v13[3] = &unk_1001A1BB0;
  v13[4] = self;
  [*(id *)((char *)&self->_infoLabel + 1) setTextChangedHandler:v13];
  [(TVLatencyColorimeterSetupAuthViewController *)self showWithFlags:0 throttleSeconds:0xFFFFFFFFLL];
  [*(id *)((char *)&self->_infoLabel + 1) becomeFirstResponder];
}

@end