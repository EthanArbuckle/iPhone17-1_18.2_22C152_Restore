@interface ContinuityCaptureViewController
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (ContinuityCaptureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_disconnectSession;
- (void)_handleLayout:(id)a3 ignoringStandby:(BOOL)a4;
- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)_resolveUserPauseState;
- (void)_setConnectionInterruptTimer;
- (void)_showHowToReconnectDialog;
- (void)_terminate;
- (void)_updateUI;
- (void)callActive:(BOOL)a3;
- (void)contentViewDidSelectDisconnectButton:(id)a3;
- (void)contentViewDidSelectPauseButton:(id)a3;
- (void)dealloc;
- (void)deviceLockStateMonitor:(id)a3 didUpdateDeviceLockState:(BOOL)a4;
- (void)incomingCall:(BOOL)a3 data:(id)a4 shouldDisplayNotification:(BOOL)a5;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)receivedItems:(id)a3;
- (void)requestDidFinish:(id)a3;
- (void)requestDidStart:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setBackgrounded:(BOOL)a3;
- (void)sidecarServiceActive;
- (void)updateRequestState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ContinuityCaptureViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (ContinuityCaptureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  global_queue = dispatch_get_global_queue(2, 0);
  dispatch_async(global_queue, &stru_100014618);
  v13.receiver = self;
  v13.super_class = (Class)ContinuityCaptureViewController;
  v8 = [(ContinuityCaptureViewController *)&v13 initWithNibName:a3 bundle:a4];
  v9 = v8;
  if (v8)
  {
    objc_sync_enter(v8);
    v9->_activeRequests = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_sync_exit(v9);
    v9->_uiState = 0;
    FigCaptureSessionRemoteSetWombatInUse();
    v10 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
    [(ContinuityCaptureRemoteUISystemStatus *)v10 addObserver:v9 forKeyPath:CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey options:3 context:0];
    v11 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
    [(ContinuityCaptureRemoteUISystemStatus *)v11 addObserver:v9 forKeyPath:CMContinuityCaptureCallStateKVOKey options:3 context:0];
    [+[ContinuityCaptureRemoteUISystemStatus sharedInstance] holdIdleSleepAssertionForReason:&stru_100014A80];
    [+[ContinuityCaptureRemoteUISystemStatus sharedInstance] addObserver:v9];
  }
  return v9;
}

- (void)dealloc
{
  if (dword_10001A140)
  {
    int v12 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  FigCaptureSessionRemoteSetWombatInUse();
  FigCaptureSessionRemoteSetWombatEnabled();

  [(FigCaptureDeviceLockStateMonitor *)self->_lockStateMonitor removeDeviceLockStateObserver:self];
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];

  connectionInterruptTimer = self->_connectionInterruptTimer;
  if (connectionInterruptTimer)
  {
    dispatch_source_cancel(connectionInterruptTimer);
  }
  v5 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  [(ContinuityCaptureRemoteUISystemStatus *)v5 removeObserver:self forKeyPath:CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey context:0];
  v6 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  [(ContinuityCaptureRemoteUISystemStatus *)v6 removeObserver:self forKeyPath:CMContinuityCaptureCallStateKVOKey context:0];
  [+[ContinuityCaptureRemoteUISystemStatus sharedInstance] removeObserver:self];
  continuityCaptureDevice = self->_continuityCaptureDevice;
  if (continuityCaptureDevice)
  {
    [(CMContinuityCaptureRemoteCompositeDevice *)continuityCaptureDevice removeObserver:self forKeyPath:CMContinuityCaptureRemoteCompositeStateKVOKey context:0];
    [(CMContinuityCaptureRemoteCompositeDevice *)self->_continuityCaptureDevice invalidate];
  }
  v10.receiver = self;
  v10.super_class = (Class)ContinuityCaptureViewController;
  [(ContinuityCaptureViewController *)&v10 dealloc];
}

- (void)loadView
{
  v3 = objc_alloc_init(ContinuityCaptureShieldUIContentView);
  [(ContinuityCaptureShieldUIContentView *)v3 setDelegate:self];

  [(ContinuityCaptureViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  if (dword_10001A140)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7.receiver = self;
  v7.super_class = (Class)ContinuityCaptureViewController;
  [(ContinuityCaptureViewController *)&v7 viewDidLoad];
  [self.view setBackgroundColor:[UIColor clearColor]];
  [self view].setOverrideUserInterfaceStyle:2;
  [self view]->_setOverrideUserInterfaceRenderingMode:2;
  [self view]->_setOverrideVibrancyTrait:2;
  self->_connectionType = 0;
  [(ContinuityCaptureViewController *)self _updateUI];
  self->_sidecarLayoutValue = -1;
  v4 = (FigCaptureDeviceLockStateMonitor *)objc_alloc_init((Class)FigCaptureDeviceLockStateMonitor);
  self->_lockStateMonitor = v4;
  [(FigCaptureDeviceLockStateMonitor *)v4 addDeviceLockStateObserver:self];
  id v5 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  [v5 setNeedsUserInteractivePriority:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000067C0;
  v6[3] = &unk_100014668;
  v6[4] = self;
  [v5 setTransitionHandler:v6];
  self->_layoutMonitor = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  int v8 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureViewController;
  [(ContinuityCaptureViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  int v8 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureViewController;
  [(ContinuityCaptureViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int v8 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureViewController;
  [(ContinuityCaptureViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int v8 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureViewController;
  [(ContinuityCaptureViewController *)&v6 viewDidDisappear:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)incomingCall:(BOOL)a3 data:(id)a4 shouldDisplayNotification:(BOOL)a5
{
  if (dword_10001A140)
  {
    int v12 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006FC4;
  block[3] = &unk_100014690;
  BOOL v10 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)callActive:(BOOL)a3
{
  if (dword_10001A140)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000071CC;
  block[3] = &unk_1000146B8;
  BOOL v7 = a3;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_showHowToReconnectDialog
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_10001A140)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", [+[NSBundle mainBundle](NSBundle, "mainBundle", v5, v6) localizedStringForKey:@"ALERT_DISCONNECTED_TITLE" value:&stru_100014A80 table:0], [+[NSBundle mainBundle] localizedStringForKey:@"ALERT_DISCONNECTED_MESSAGE" value:&stru_100014A80 table:0], 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000074EC;
  v8[3] = &unk_1000146E0;
  v8[4] = self;
  [(UIAlertController *)v4 addAction:+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [+[NSBundle mainBundle] localizedStringForKey:@"ALERT_DISCONNECTED_BUTTON_TITLE_DISCONNECT" value:&stru_100014A80 table:0], 2, v8)];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000764C;
  v7[3] = &unk_1000146E0;
  v7[4] = self;
  [(UIAlertController *)v4 addAction:+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", [+[NSBundle mainBundle] localizedStringForKey:@"ALERT_DISCONNECTED_BUTTON_TITLE_CANCEL" value:&stru_100014A80 table:0], 1, v7)];
  [(ContinuityCaptureViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_updateUI
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  int64_t uiState = self->_uiState;
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v5 = [(ContinuityCaptureViewController *)self view];
  int64_t connectionType = self->_connectionType;
  if (connectionType)
  {
    if (connectionType != 1) {
      goto LABEL_8;
    }
    CFStringRef v7 = @"mic.circle.fill";
  }
  else
  {
    CFStringRef v7 = @"video.circle.fill";
  }
  [v5 setImage:[UIImage systemImageNamed:v7]];
LABEL_8:
  macName = (NSString *)objc_msgSend(objc_msgSend(-[ContinuityCaptureViewController request](self, "request"), "device"), "name");
  if (![(NSString *)macName length]) {
    macName = self->_macName;
  }
  if (uiState == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [v5 setPauseButtonState:v9];
  if ((unint64_t)(uiState - 1) >= 2)
  {
    if (!uiState)
    {
      if ([(NSString *)macName length]) {
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [+[NSBundle mainBundle] localizedStringForKey:@"LABEL_CONNECTING_TO_CLIENT_WITH_NAME" value:&stru_100014A80 table:0], macName);
      }
      else {
        v11 = [+[NSBundle mainBundle] localizedStringForKey:@"LABEL_CONNECTING_TO_MAC" value:&stru_100014A80 table:0];
      }
      [v5 setPrimaryText:v11];
    }
  }
  else
  {
    if ([(NSString *)macName length]) {
      int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [+[NSBundle mainBundle] localizedStringForKey:@"LABEL_CONNECTED_TO_CLIENT_WITH_NAME" value:&stru_100014A80 table:0], macName);
    }
    else {
      int v10 = [+[NSBundle mainBundle] localizedStringForKey:@"LABEL_CONNECTED_TO_MAC" value:&stru_100014A80 table:0];
    }
    [v5 setPrimaryText:v10];
    int64_t v12 = self->_connectionType;
    if (v12 == 1)
    {
      objc_super v13 = +[NSBundle mainBundle];
      CFStringRef v14 = @"LABEL_DISCONNECT_DESCRIPTION_MICROPHONE";
    }
    else
    {
      if (v12) {
        return;
      }
      objc_super v13 = +[NSBundle mainBundle];
      CFStringRef v14 = @"LABEL_DISCONNECT_DESCRIPTION_CAMERA";
    }
    [v5 setSecondaryText:[NSBundle localizedStringForKey:v14 value:&stru_100014A80 table:0]];
  }
}

- (void)updateRequestState
{
  objc_sync_enter(self);
  if (self->_configForPreStreamStart && [(NSMutableArray *)self->_activeRequests count])
  {
    [(CMContinuityCaptureSidecarServer *)self->_requestSever setCurrentSessionID:self->_sessionID];
    if (dword_10001A140)
    {
      int v10 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    id v5 = [objc_alloc((Class)CMContinuityCaptureRemoteCompositeDevice) initWithTransportServer:self->_requestSever videoPreviewLayer:[self->_videoPreviewView videoPreviewLayer]];
    self->_continuityCaptureDevice = v5;
    [(CMContinuityCaptureRemoteCompositeDevice *)v5 addObserver:self forKeyPath:CMContinuityCaptureRemoteCompositeStateKVOKey options:3 context:0];
    [(CMContinuityCaptureSidecarServer *)self->_requestSever activate];
    continuityCaptureDevice = self->_continuityCaptureDevice;
    configForPreStreamStart = self->_configForPreStreamStart;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007EA8;
    v8[3] = &unk_100014708;
    v8[4] = self;
    [(CMContinuityCaptureRemoteCompositeDevice *)continuityCaptureDevice startStream:configForPreStreamStart option:0 completion:v8];
  }
  else if (dword_10001A140)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_sync_exit(self);
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_10001A140)
  {
    int v9 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7.receiver = self;
  v7.super_class = (Class)ContinuityCaptureViewController;
  if ([(ContinuityCaptureViewController *)&v7 respondsToSelector:"setActive:"])
  {
    v6.receiver = self;
    v6.super_class = (Class)ContinuityCaptureViewController;
    [(ContinuityCaptureViewController *)&v6 setActive:v3];
  }
  if (v3) {
    [(ContinuityCaptureViewController *)self setBackgroundStyle:4];
  }
  self->_inactive = !v3;
  [(ContinuityCaptureViewController *)self _resolveUserPauseState];
}

- (void)setBackgrounded:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_10001A140)
  {
    int v8 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureViewController;
  [(ContinuityCaptureViewController *)&v6 setBackgrounded:v3];
}

- (void)requestDidStart:(id)a3
{
  if (dword_10001A140)
  {
    int v11 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_sync_enter(self);
  activeRequests = self->_activeRequests;
  if (!activeRequests)
  {
    activeRequests = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_activeRequests = activeRequests;
  }
  if ([(NSMutableArray *)activeRequests count]) {
    [(NSMutableArray *)self->_activeRequests removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_activeRequests addObject:a3];
  objc_sync_exit(self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000085D0;
  block[3] = &unk_100014640;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)requestDidFinish:(id)a3
{
  if (dword_10001A140)
  {
    int v12 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_sync_enter(self);
  if ([(NSMutableArray *)self->_activeRequests count])
  {
    objc_sync_exit(self);
    BOOL v6 = ([a3 isCancelled] & 1) == 0
      && (objc_msgSend(objc_msgSend(objc_msgSend(a3, "error"), "domain"), "isEqualToString:", @"SidecarErrorDomain")&& (objc_msgSend(objc_msgSend(a3, "error"), "code") == (id)-205|| objc_msgSend(objc_msgSend(a3, "error"), "code") == (id)-204)|| objc_msgSend(objc_msgSend(objc_msgSend(a3, "error", v7, v8), "domain"), "isEqualToString:", @"RPErrorDomain")&& objc_msgSend(objc_msgSend(a3, "error"), "code") == (id)-6753);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008968;
    block[3] = &unk_1000146B8;
    block[4] = self;
    BOOL v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    +[NSException raise:NSInternalInconsistencyException, @"%@ ContinuityCapture error : Invalid active requests", self format];
    objc_sync_exit(self);
  }
}

- (void)receivedItems:(id)a3
{
  v46 = 0;
  if (dword_10001A140)
  {
    unsigned int v45 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v40 objects:v51 count:16 v30, v32];
  if (v4)
  {
    uint64_t v5 = *(void *)v41;
    uint64_t v38 = kCMContinuityCaptureSidecarItemTypeMacName;
    uint64_t v35 = kCMContinuityCaptureSidecarItemTypeSessionGID;
    uint64_t v36 = kCMContinuityCaptureSidecarItemTypeStreamConfiguration;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v41 != v5) {
          objc_enumerationMutation(a3);
        }
        uint64_t v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v8 = [v7 objectValue:v31, v33];
        if (objc_msgSend(objc_msgSend(v7, "type"), "isEqualToString:", v38))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            self->_macName = (NSString *)v8;
            if (!dword_10001A140) {
              continue;
            }
            unsigned int v45 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            int v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v10 = v45;
            if (os_log_type_enabled(v9, type)) {
              unsigned int v11 = v10;
            }
            else {
              unsigned int v11 = v10 & 0xFFFFFFFE;
            }
            if (v11)
            {
              macName = self->_macName;
              int v47 = 136315394;
              v48 = "-[ContinuityCaptureViewController receivedItems:]";
              __int16 v49 = 2112;
              id v50 = macName;
              LODWORD(v33) = 22;
              v31 = &v47;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_37;
          }
        }
        if (objc_msgSend(objc_msgSend(v7, "type"), "isEqualToString:", v36))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_super v13 = objc_opt_class();
            objc_sync_enter(v13);

            CFStringRef v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v46];
            self->_configForPreStreamStart = v14;
            if (v14)
            {
              uint64_t v15 = v14;
              if (dword_10001A140)
              {
                unsigned int v45 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v17 = v45;
                if (os_log_type_enabled(v16, type)) {
                  unsigned int v18 = v17;
                }
                else {
                  unsigned int v18 = v17 & 0xFFFFFFFE;
                }
                if (v18)
                {
                  configForPreStreamStart = self->_configForPreStreamStart;
                  int v47 = 136315394;
                  v48 = "-[ContinuityCaptureViewController receivedItems:]";
                  __int16 v49 = 2112;
                  id v50 = configForPreStreamStart;
                  LODWORD(v33) = 22;
                  v31 = &v47;
                  _os_log_send_and_compose_impl();
                }
                goto LABEL_47;
              }
            }
            else
            {
              unsigned int v45 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v28 = v45;
              if (os_log_type_enabled(v27, type)) {
                unsigned int v29 = v28;
              }
              else {
                unsigned int v29 = v28 & 0xFFFFFFFE;
              }
              if (v29)
              {
                int v47 = 136315394;
                v48 = "-[ContinuityCaptureViewController receivedItems:]";
                __int16 v49 = 2112;
                id v50 = v46;
                LODWORD(v33) = 22;
                v31 = &v47;
                _os_log_send_and_compose_impl();
              }
LABEL_47:
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            objc_sync_exit(v13);
            continue;
          }
        }
        if (!objc_msgSend(objc_msgSend(v7, "type"), "isEqualToString:", v35))
        {
          unsigned int v45 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v24 = v45;
          if (os_log_type_enabled(v23, type)) {
            unsigned int v25 = v24;
          }
          else {
            unsigned int v25 = v24 & 0xFFFFFFFE;
          }
          if (v25)
          {
            id v26 = [v7 type];
            int v47 = 136315394;
            v48 = "-[ContinuityCaptureViewController receivedItems:]";
            __int16 v49 = 2112;
            id v50 = v26;
            LODWORD(v33) = 22;
            v31 = &v47;
            _os_log_send_and_compose_impl();
          }
LABEL_37:
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          continue;
        }
        if (dword_10001A140)
        {
          unsigned int v45 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v21 = v45;
          if (os_log_type_enabled(v20, type)) {
            unsigned int v22 = v21;
          }
          else {
            unsigned int v22 = v21 & 0xFFFFFFFE;
          }
          if (v22)
          {
            int v47 = 136315394;
            v48 = "-[ContinuityCaptureViewController receivedItems:]";
            __int16 v49 = 2112;
            id v50 = v8;
            LODWORD(v33) = 22;
            v31 = &v47;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          self->_sessionID = (unint64_t)[v8 unsignedLongLongValue];
        }
      }
      id v4 = [a3 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v4);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000092AC;
  block[3] = &unk_100014730;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sidecarServiceActive
{
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[ContinuityCaptureViewController setBackgroundStyle:](self, "setBackgroundStyle:", 4, v4, v5);
}

- (void)_setConnectionInterruptTimer
{
  if (!self->_connectionInterruptTimer)
  {
    if (dword_10001A140)
    {
      int v8 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    char v10 = 5;
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
    self->_connectionInterruptTimer = v4;
    dispatch_source_set_timer((dispatch_source_t)v4, 0, 0x77359400uLL, 0);
    connectionInterruptTimer = self->_connectionInterruptTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100009628;
    handler[3] = &unk_100014758;
    handler[4] = self;
    handler[5] = v9;
    dispatch_source_set_event_handler(connectionInterruptTimer, handler);
    dispatch_resume((dispatch_object_t)self->_connectionInterruptTimer);
    _Block_object_dispose(v9, 8);
  }
}

- (void)_terminate
{
  if (self->_pendingDisconnectDialogue)
  {
    if (dword_10001A140)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    self->_isTerminating = 1;
    if (dword_10001A140)
    {
      uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    FigCaptureSessionRemoteSetWombatEnabled();
    FigCaptureSessionRemoteSetWombatInUse();
    [(CMContinuityCaptureSidecarServer *)self->_requestSever cancel];
    connectionInterruptTimer = self->_connectionInterruptTimer;
    if (connectionInterruptTimer)
    {
      dispatch_source_cancel(connectionInterruptTimer);

      self->_connectionInterruptTimer = 0;
    }
    [+[ContinuityCaptureRemoteUISystemStatus sharedInstance] releaseCurrentIdleSleepAssertion];
    [+[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance] updateState:16];
    if (dword_10001A140)
    {
      BOOL v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[ContinuityCaptureViewController completeRequest:](self, "completeRequest:", 1, v8, v10);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  unsigned int v11 = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009CA4;
  block[3] = &unk_100014780;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_10001A140)
  {
    unsigned int v47 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a3, "isEqualToString:", CMContinuityCaptureRemoteCompositeStateKVOKey, v34, v37))
  {
    id v12 = [[a5 objectForKeyedSubscript:NSKeyValueChangeNewKey] integerValue];
    if (dword_10001A140)
    {
      unsigned int v47 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      objc_super v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000A5A4;
    v45[3] = &unk_100014730;
    v45[4] = self;
    [+[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance] updateState:v12 withUserInteractionHandler:v45];
    if (v12)
    {
      self->_int64_t uiState = 2;
      FigCaptureSessionRemoteSetWombatInUse();
      FigCaptureSessionRemoteSetWombatEnabled();
    }
    else
    {
      if ((v12 & 8) == 0)
      {
        if ((v12 & 0x10) != 0)
        {
          [(ContinuityCaptureViewController *)self _terminate];
        }
        else
        {
          self->_int64_t uiState = 1;
          [(ContinuityCaptureViewController *)self _updateUI];
          FigCaptureSessionRemoteSetWombatInUse();
          FigCaptureSessionRemoteSetWombatEnabled();
        }
LABEL_21:
        uint64_t v16 = v12 & 6;
        if (v16 == 2)
        {
          self->_int64_t connectionType = 1;
          [(ContinuityCaptureViewController *)self _updateUI];
        }
        else
        {
          self->_int64_t connectionType = 0;
          [(ContinuityCaptureViewController *)self _updateUI];
          if (!v16) {
            return;
          }
        }
        layoutMonitor = self->_layoutMonitor;
        if (!layoutMonitor || ![(FBSDisplayLayoutMonitor *)layoutMonitor currentLayout]) {
          goto LABEL_60;
        }
        if (dword_10001A140)
        {
          unsigned int v47 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          unsigned int v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v19 = v47;
          if (os_log_type_enabled(v18, type)) {
            unsigned int v20 = v19;
          }
          else {
            unsigned int v20 = v19 & 0xFFFFFFFE;
          }
          if (v20)
          {
            id v21 = [(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
            int v49 = 136315650;
            id v50 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
            __int16 v51 = 2048;
            v52 = self;
            __int16 v53 = 2114;
            id v54 = v21;
            LODWORD(v39) = 32;
            uint64_t v36 = &v49;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v22 = [[self->_layoutMonitor currentLayout:v36, v39] elements];
        id v23 = [v22 countByEnumeratingWithState:&v41 objects:v48 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v42;
LABEL_36:
          uint64_t v26 = 0;
          while (1)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v22);
            }
            if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v26), "bundleIdentifier"), "isEqualToString:", @"com.apple.sidecar"))break; {
            if (v24 == (id)++v26)
            }
            {
              id v24 = [v22 countByEnumeratingWithState:&v41 objects:v48 count:16];
              if (v24) {
                goto LABEL_36;
              }
              goto LABEL_42;
            }
          }
        }
        else
        {
LABEL_42:
          if (!self->_pendingStreamStartAfterResumeEvent && !self->_firstSidecarLayoutReceived)
          {
            if (dword_10001A140)
            {
              unsigned int v47 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v32 = v47;
              if (os_log_type_enabled(v31, type)) {
                unsigned int v33 = v32;
              }
              else {
                unsigned int v33 = v32 & 0xFFFFFFFE;
              }
              if (!v33) {
                goto LABEL_59;
              }
              int v49 = 136315394;
              id v50 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
              __int16 v51 = 2048;
              v52 = self;
              goto LABEL_50;
            }
LABEL_60:
            self->_BOOL pendingStreamStartAfterResumeEvent = 0;
            return;
          }
        }
        if (dword_10001A140)
        {
          unsigned int v47 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v28 = v47;
          if (os_log_type_enabled(v27, type)) {
            unsigned int v29 = v28;
          }
          else {
            unsigned int v29 = v28 & 0xFFFFFFFE;
          }
          if (!v29) {
            goto LABEL_59;
          }
          BOOL pendingStreamStartAfterResumeEvent = self->_pendingStreamStartAfterResumeEvent;
          int v49 = 136315650;
          id v50 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
          __int16 v51 = 2048;
          v52 = self;
          __int16 v53 = 1024;
          LODWORD(v54) = pendingStreamStartAfterResumeEvent;
LABEL_50:
          _os_log_send_and_compose_impl();
LABEL_59:
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          goto LABEL_60;
        }
        goto LABEL_60;
      }
      self->_int64_t uiState = 0;
    }
    [(ContinuityCaptureViewController *)self _updateUI];
    goto LABEL_21;
  }
  if ([a3 isEqualToString:CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey])
  {
    if (!objc_msgSend(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey), "BOOLValue")) {
      return;
    }
    if (dword_10001A140)
    {
      CFStringRef v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v15 = 56;
  }
  else
  {
    if (![a3 isEqualToString:CMContinuityCaptureCallStateKVOKey])
    {
      v40.receiver = self;
      v40.super_class = (Class)ContinuityCaptureViewController;
      [(ContinuityCaptureViewController *)&v40 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
      return;
    }
    if (objc_msgSend(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey), "integerValue") != (id)2) {
      return;
    }
    uint64_t v15 = 154;
  }
  self->SidecarServiceViewController_opaque[v15] = 1;
  [(ContinuityCaptureViewController *)self _resolveUserPauseState];
}

- (void)_handleLayout:(id)a3 ignoringStandby:(BOOL)a4
{
  BOOL v55 = a4;
  if (dword_10001A140)
  {
    unsigned int v63 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int64_t sidecarLayoutValue = self->_sidecarLayoutValue;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!a3)
  {
    if (!dword_10001A140) {
      return;
    }
LABEL_44:
    unsigned int v63 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
LABEL_77:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return;
  }
  if (![a3 displayBacklightLevel])
  {
    if (!dword_10001A140) {
      return;
    }
    goto LABEL_44;
  }
  uint64_t v65 = FBSDisplayLayoutElementSiriIdentifier;
  uint64_t v8 = +[NSArray arrayWithObjects:&v65 count:1];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v9 = [a3 elements];
  id v10 = [v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v10)
  {
    id v11 = v10;
    id v48 = a3;
    v56 = self;
    uint64_t v50 = 0;
    uint64_t v53 = -1;
    uint64_t v12 = *(void *)v59;
    uint64_t v54 = SBSDisplayLayoutElementStandByIdentifier;
    uint64_t v51 = FBSDisplayLayoutElementLockScreenIdentifier;
    uint64_t v49 = SBSDisplayLayoutElementHomeScreenIdentifier;
    uint64_t v52 = -1;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v59 != v12) {
          objc_enumerationMutation(v9);
        }
        CFStringRef v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if (-[NSArray containsObject:](v8, "containsObject:", objc_msgSend(v14, "identifier", v46, v47)))
        {
          if (dword_10001A140)
          {
            unsigned int v63 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v16 = v63;
            if (os_log_type_enabled(v15, type)) {
              unsigned int v17 = v16;
            }
            else {
              unsigned int v17 = v16 & 0xFFFFFFFE;
            }
            if (v17)
            {
              id v18 = [v14 identifier];
              int v66 = 136315650;
              v67 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
              __int16 v68 = 2048;
              v69 = v56;
              __int16 v70 = 2112;
              id v71 = v18;
              LODWORD(v47) = 32;
              v46 = &v66;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        else
        {
          if (objc_msgSend(objc_msgSend(v14, "identifier"), "isEqualToString:", v54)) {
            BOOL v19 = !v55;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            if ((uint64_t)[v14 level] > v53) {
              uint64_t v53 = (uint64_t)[v14 level];
            }
            if (objc_msgSend(objc_msgSend(v14, "bundleIdentifier"), "isEqualToString:", @"com.apple.sidecar"))
            {
              uint64_t v52 = (uint64_t)[v14 level];
            }
            else if (objc_msgSend(objc_msgSend(v14, "identifier"), "isEqualToString:", v51))
            {
              HIDWORD(v50) = 1;
            }
            else if (objc_msgSend(objc_msgSend(v14, "identifier"), "isEqualToString:", v49))
            {
              LOBYTE(v50) = (objc_msgSend(objc_msgSend(v48, "elements"), "count") == (id)1) | v50;
            }
          }
          else
          {
            if (dword_10001A140)
            {
              unsigned int v63 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              unsigned int v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v21 = v63;
              if (os_log_type_enabled(v20, type)) {
                unsigned int v22 = v21;
              }
              else {
                unsigned int v22 = v21 & 0xFFFFFFFE;
              }
              if (v22)
              {
                id v23 = [v14 identifier];
                int v66 = 136315650;
                v67 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
                __int16 v68 = 2048;
                v69 = v56;
                __int16 v70 = 2112;
                id v71 = v23;
                LODWORD(v47) = 32;
                v46 = &v66;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            dispatch_time_t v24 = dispatch_time(0, 2000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000B488;
            block[3] = &unk_100014640;
            block[4] = v56;
            void block[5] = v14;
            dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v11);
    int v25 = 1;
    uint64_t v26 = v52;
    self = v56;
    if (v52 != -1)
    {
      v56->_firstSidecarLayoutReceived = 1;
      int v25 = 0;
    }
    int v28 = HIDWORD(v50);
  }
  else
  {
    int v28 = 0;
    LOBYTE(v50) = 0;
    uint64_t v26 = -1;
    int v25 = 1;
    uint64_t v53 = -1;
  }
  if (!self->_firstSidecarLayoutReceived)
  {
    if (!dword_10001A140) {
      return;
    }
    unsigned int v63 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v33 = v63;
    if (os_log_type_enabled(v32, type)) {
      unsigned int v34 = v33;
    }
    else {
      unsigned int v34 = v33 & 0xFFFFFFFE;
    }
    if (!v34) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
  if ((v25 & v28) == 1)
  {
    if (!dword_10001A140) {
      return;
    }
    unsigned int v63 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v30 = v63;
    if (os_log_type_enabled(v29, type)) {
      unsigned int v31 = v30;
    }
    else {
      unsigned int v31 = v30 & 0xFFFFFFFE;
    }
    if (!v31) {
      goto LABEL_77;
    }
    goto LABEL_76;
  }
  if (self->_ignoreLayoutUpdatesAfterDeviceUnlock)
  {
    if (v50)
    {
      self->_ignoreLayoutUpdatesAfterDeviceUnlock = 0;
      if (dword_10001A140)
      {
        unsigned int v63 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v36 = v63;
        if (os_log_type_enabled(v35, type)) {
          unsigned int v37 = v36;
        }
        else {
          unsigned int v37 = v36 & 0xFFFFFFFE;
        }
        if (v37)
        {
          int v66 = 136315394;
          v67 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
          __int16 v68 = 2048;
          v69 = self;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_80;
    }
    if (!dword_10001A140) {
      return;
    }
    unsigned int v63 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v39 = v63;
    if (os_log_type_enabled(v38, type)) {
      unsigned int v40 = v39;
    }
    else {
      unsigned int v40 = v39 & 0xFFFFFFFE;
    }
    if (!v40) {
      goto LABEL_77;
    }
LABEL_76:
    int v66 = 136315394;
    v67 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
    __int16 v68 = 2048;
    v69 = self;
    _os_log_send_and_compose_impl();
    goto LABEL_77;
  }
LABEL_80:
  int64_t v41 = v26 >= v53;
  self->_int64_t sidecarLayoutValue = v41;
  if (dword_10001A140)
  {
    unsigned int v63 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v43 = v63;
    if (os_log_type_enabled(v42, type)) {
      unsigned int v44 = v43;
    }
    else {
      unsigned int v44 = v43 & 0xFFFFFFFE;
    }
    if (v44)
    {
      int64_t v45 = self->_sidecarLayoutValue;
      int v66 = 136315650;
      v67 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
      __int16 v68 = 2048;
      v69 = self;
      __int16 v70 = 1024;
      LODWORD(v71) = v45;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    int64_t v41 = self->_sidecarLayoutValue;
  }
  if (sidecarLayoutValue != v41) {
    [(ContinuityCaptureViewController *)self _resolveUserPauseState];
  }
}

- (void)_resolveUserPauseState
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_10001A140)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  continuityCaptureDevice = self->_continuityCaptureDevice;
  if (continuityCaptureDevice)
  {
    if (self->_inactive)
    {
      [(CMContinuityCaptureRemoteCompositeDevice *)continuityCaptureDevice postEvent:kCMContinuityCaptureEventUserPause entity:0 data:0];
LABEL_18:
      self->_sideButtonPressed = 0;
      self->_incomingCallDeclined = 0;
      return;
    }
    if (self->_sideButtonPressed)
    {
LABEL_9:
      if (!self->_incomingCall && self->_firstSidecarLayoutReceived)
      {
        [(CMContinuityCaptureRemoteCompositeDevice *)continuityCaptureDevice postEvent:kCMContinuityCaptureEventUserResume entity:0 data:0];
        self->_BOOL pendingStreamStartAfterResumeEvent = 1;
      }
      goto LABEL_18;
    }
    if (self->_incomingCallDeclined)
    {
      if (!self->_pauseButtonPressed) {
        goto LABEL_9;
      }
    }
    else if (!self->_pauseButtonPressed && self->_sidecarLayoutValue)
    {
      BOOL v6 = &kCMContinuityCaptureEventUserResume;
      goto LABEL_17;
    }
    BOOL v6 = &kCMContinuityCaptureEventUserPause;
LABEL_17:
    -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](continuityCaptureDevice, "postEvent:entity:data:", *v6, 0, 0, v7, v8);
    goto LABEL_18;
  }
  if (dword_10001A140)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)deviceLockStateMonitor:(id)a3 didUpdateDeviceLockState:(BOOL)a4
{
  if (self->_deviceIsLocked != a4)
  {
    if (dword_10001A140)
    {
      int v9 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_deviceIsLocked = a4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BBC4;
    block[3] = &unk_100014730;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)contentViewDidSelectPauseButton:(id)a3
{
  self->_pauseButtonPressed = self->_uiState == 1;
  [(ContinuityCaptureViewController *)self _resolveUserPauseState];
}

- (void)contentViewDidSelectDisconnectButton:(id)a3
{
  self->_pendingDisconnectDialogue = 1;
  [(ContinuityCaptureViewController *)self _showHowToReconnectDialog];
}

- (void)_disconnectSession
{
  if (dword_10001A140)
  {
    int v7 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  self->_pendingDisconnectDialogue = 0;
  self->_userDisconnect = 1;
  [(CMContinuityCaptureRemoteCompositeDevice *)self->_continuityCaptureDevice postEvent:kCMContinuityCaptureEventUserDisconnect entity:0 data:0];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BF6C;
  block[3] = &unk_100014730;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end