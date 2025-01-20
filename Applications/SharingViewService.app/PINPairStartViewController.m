@interface PINPairStartViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)handleDismissButton:(id)a3;
- (void)handlePairButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PINPairStartViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_pairButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)(&self->_deviceVersion + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:1];
}

- (void)handlePairButton:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_progressLabel))
  {
    if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BYTE1(self->_progressLabel) = 1;
    [*(id *)((char *)&self->_imageView + 1) setHidden:1];
    [*(id *)((char *)&self->_pairButton + 1) setHidden:0];
    v5 = [(SVSBaseViewController *)self containerView];
    [v5 setSwipeDismissible:0];

    [*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1) startAnimating];
    if ([self->super._mainController testFlags])
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100119A44;
      v8[3] = &unk_1001A1B88;
      dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      v10 = self;
      v6 = v9;
      dispatch_source_set_event_handler(v6, v8);
      SFDispatchTimerSet();
      dispatch_resume(v6);
    }
    else
    {
      id v7 = objc_alloc_init((Class)SFDevice);
      [v7 setIdentifier:*(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1)];
      [v7 setOsVersion:BYTE1(self->_deviceIdentifier)];
      [self->super._mainController _startPairing:v7];
    }
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (BYTE1(self->_progressLabel)) {
    return 0;
  }
  id v6 = a3;
  id v7 = [a4 view];
  v8 = [v6 view];

  BOOL v4 = v7 == v8;
  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)PINPairStartViewController;
  [(PINPairStartViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)PINPairStartViewController;
  [(SVSBaseViewController *)&v14 viewWillAppear:v3];
  objc_super v5 = [self->super._mainController _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  id v6 = [self->super._mainController userInfo];
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();

  if (v7)
  {
    v8 = (UIActivityIndicatorView *)[objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    dispatch_source_t v9 = *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1);
    *(UIActivityIndicatorView **)((char *)&self->_activityIndicatorView + 1) = v8;
  }
  v10 = [self->super._mainController userInfo];
  BYTE1(self->_deviceIdentifier) = CFDictionaryGetInt64Ranged();

  id v11 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v11 setDelegate:self];
  [v11 setNumberOfTapsRequired:1];
  [v11 setCancelsTouchesInView:0];
  v12 = [(PINPairStartViewController *)self view];
  [v12 addGestureRecognizer:v11];

  v13 = [(SVSBaseViewController *)self containerView];
  [v13 setSwipeDismissible:1];
}

@end