@interface WHASetupStartViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)handleDismissButton:(id)a3;
- (void)handleStartButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WHASetupStartViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_started + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:1];
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)handleStartButton:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_startButton))
  {
    BYTE1(self->_startButton) = 1;
    if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v5 = [(SVSBaseViewController *)self containerView];
    [v5 setSwipeDismissible:0];

    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) setHidden:0];
    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) startAnimating];
    [*(id *)((char *)&self->_imageView + 1) setHidden:0];
    [*(id *)((char *)&self->_progressView + 1) setHidden:1];
    switch([self->super._mainController testMode])
    {
      case 0u:
        [self->super._mainController _sessionStart];
        break;
      case 4u:
        id mainController = self->super._mainController;
        uint64_t v8 = 301000;
        goto LABEL_17;
      case 5u:
        id mainController = self->super._mainController;
        uint64_t v8 = 301004;
        goto LABEL_17;
      case 6u:
        id mainController = self->super._mainController;
        uint64_t v8 = 301005;
        goto LABEL_17;
      case 7u:
        id mainController = self->super._mainController;
        uint64_t v8 = 301006;
        goto LABEL_17;
      case 8u:
        id mainController = self->super._mainController;
        uint64_t v8 = 301007;
        goto LABEL_17;
      case 9u:
        id mainController = self->super._mainController;
        uint64_t v8 = 301010;
        goto LABEL_17;
      case 0xAu:
        id mainController = self->super._mainController;
        uint64_t v8 = 301015;
        goto LABEL_17;
      case 0xBu:
        id mainController = self->super._mainController;
        uint64_t v8 = 301011;
LABEL_17:
        [mainController showDoneUI:v8];
        break;
      default:
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1001419B4;
        v9[3] = &unk_1001A1B88;
        dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        v11 = self;
        v6 = v10;
        dispatch_source_set_event_handler(v6, v9);
        SFDispatchTimerSet();
        dispatch_resume(v6);

        break;
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (BYTE1(self->_startButton)) {
    return 0;
  }
  id v6 = a3;
  v7 = [a4 view];
  uint64_t v8 = [v6 view];

  BOOL v4 = v7 == v8;
  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)WHASetupStartViewController;
  [(WHASetupStartViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CD068 <= 30 && (dword_1001CD068 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v18.receiver = self;
  v18.super_class = (Class)WHASetupStartViewController;
  [(SVSBaseViewController *)&v18 viewWillAppear:v3];
  objc_super v5 = [self->super._mainController _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v6 setDelegate:self];
  [v6 setNumberOfTapsRequired:1];
  [v6 setCancelsTouchesInView:0];
  v7 = [(WHASetupStartViewController *)self view];
  [v7 addGestureRecognizer:v6];

  uint64_t v8 = [*(id *)((char *)&self->_progressView + 1) titleLabel];
  [v8 setAdjustsFontSizeToFitWidth:1];

  unsigned int v9 = MKBGetDeviceLockState() - 1;
  dispatch_source_t v10 = *(UIView **)((char *)&self->_progressView + 1);
  v11 = +[NSBundle mainBundle];
  v12 = v11;
  if (v9 >= 2) {
    CFStringRef v13 = @"CONNECT";
  }
  else {
    CFStringRef v13 = @"UNLOCK_TO_CONNECT";
  }
  v14 = [v11 localizedStringForKey:v13 value:&stru_1001A1DC0 table:@"Localizable"];
  [v10 setTitle:v14 forState:0];

  v15 = [self->super._mainController userInfo];
  uint64_t Int64 = CFDictionaryGetInt64();

  if (Int64) {
    [(WHASetupStartViewController *)self handleStartButton:0];
  }
  v17 = [(SVSBaseViewController *)self containerView];
  [v17 setSwipeDismissible:1];
}

@end