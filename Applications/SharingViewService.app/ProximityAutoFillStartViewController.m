@interface ProximityAutoFillStartViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)handleDismissButtonPressed:(id)a3;
- (void)handleMainButtonPressed:(id)a3;
- (void)handleReportBugButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProximityAutoFillStartViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_detailLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicator + 1), 0);
  objc_storeStrong((id *)((char *)&self->_acceptButton + 1), 0);

  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  v6 = [a4 view];
  v7 = [v5 view];

  return v6 == v7;
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController ensureStoppedWithDismiss:1 reason:1];
}

- (void)handleReportBugButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController fileRadar:0];
}

- (void)handleMainButtonPressed:(id)a3
{
  id v4 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = [(SVSBaseViewController *)self containerView];
  [v5 setSwipeDismissible:0];

  [*(id *)((char *)&self->_acceptButton + 1) startAnimating];
  [*(id *)((char *)&self->_detailLabel + 1) setHidden:0];
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setHidden:1];
  if ([self->super.super._mainController testMode])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100123928;
    v7[3] = &unk_1001A1B88;
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v9 = self;
    v6 = v8;
    dispatch_source_set_event_handler(v6, v7);
    SFDispatchTimerSet();
    dispatch_resume(v6);
  }
  else
  {
    [self->super.super._mainController sessionStart];
  }
}

- (void)handleDismissButtonPressed:(id)a3
{
  id v4 = a3;
  if (dword_1001CC8A0 <= 30 && (dword_1001CC8A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController ensureStoppedWithDismiss:1 reason:5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ProximityAutoFillStartViewController;
  [(SVSBaseViewController *)&v15 viewWillAppear:a3];
  id v4 = [self->super.super._mainController _remoteViewControllerProxy];
  uint64_t v5 = 1;
  [v4 setStatusBarHidden:1 withDuration:0.0];

  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v6 setDelegate:self];
  [v6 setNumberOfTapsRequired:1];
  [v6 setCancelsTouchesInView:0];
  v7 = [(ProximityAutoFillStartViewController *)self view];
  [v7 addGestureRecognizer:v6];

  dispatch_source_t v8 = [(SVSBaseViewController *)self containerView];
  [v8 setSwipeDismissible:1];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"PROX_AUTOFILL_START_BUTTON" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setTitle:v10];

  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"PROX_AUTOFILL_START_DETAIL" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_activityIndicator + 1) setText:v12];

  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"PROX_AUTOFILL_START_TITLE" value:&stru_1001A1DC0 table:@"Localizable"];
  [*(id *)((char *)&self->_reportBugButton + 1) setText:v14];

  if (IsAppleInternalBuild()) {
    uint64_t v5 = (uint64_t)[self->super.super._mainController prefHideTTR];
  }
  [*(id *)((char *)&self->_progressView + 1) setHidden:v5];
}

@end