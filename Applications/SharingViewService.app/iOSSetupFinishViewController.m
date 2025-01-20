@interface iOSSetupFinishViewController
- (BOOL)_canShowWhileLocked;
- (void)handleDismissButton:(id)a3;
- (void)handleProgressEvent:(unsigned int)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iOSSetupFinishViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);

  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)handleProgressEvent:(unsigned int)a3
{
  if (a3 == 97)
  {
    unsigned int v4 = [self->super.super._mainController otherDeviceClassCode] - 1;
    if (v4 > 6) {
      CFStringRef v5 = @"_IPHONE";
    }
    else {
      CFStringRef v5 = off_1001A18E0[v4];
    }
    id v7 = [@"IOS_SETUP_FINISH_TITLE" stringByAppendingString:v5];
    v6 = sub_100138280(@"Localizable", v7);
    [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v6];
  }
  else
  {
    if (a3 != 99) {
      return;
    }
    sub_100138280(@"Localizable", @"WAITING_FOR_SOFTWARE_UPDATE");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v7];
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(iOSSetupBaseViewController *)self dismissWithType:5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)iOSSetupFinishViewController;
  [(iOSSetupFinishViewController *)&v6 viewDidDisappear:v3];
  [self->super.super._mainController setBlockHardwareButtons:0];
  CFStringRef v5 = [self->super.super._mainController _remoteViewControllerProxy];
  [v5 setDesiredHardwareButtonEvents:[self->super.super._mainController desiredHomeButtonEvents]];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v28.receiver = self;
  v28.super_class = (Class)iOSSetupFinishViewController;
  [(SVSBaseViewController *)&v28 viewWillAppear:v3];
  [self->super.super._mainController setBlockHardwareButtons:1];
  CFStringRef v5 = [self->super.super._mainController _remoteViewControllerProxy];
  [v5 setDesiredHardwareButtonEvents:17];
  unsigned int v6 = [self->super.super._mainController otherDeviceClassCode] - 1;
  if (v6 > 6) {
    CFStringRef v7 = @"_IPHONE";
  }
  else {
    CFStringRef v7 = off_1001A18E0[v6];
  }
  v8 = [@"IOS_SETUP_FINISH_TITLE" stringByAppendingString:v7];
  v9 = sub_100138280(@"Localizable", v8);
  [*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1) setText:v9];

  unsigned int v10 = SFDeviceClassCodeGet() - 1;
  if (v10 > 6) {
    CFStringRef v11 = @"_IPHONE";
  }
  else {
    CFStringRef v11 = off_1001A18E0[v10];
  }
  v12 = [@"IOS_SETUP_FINISH_TRANSFER" stringByAppendingString:v11];
  unsigned int v13 = [self->super.super._mainController otherDeviceClassCode] - 1;
  if (v13 > 6) {
    CFStringRef v14 = @"_IPHONE";
  }
  else {
    CFStringRef v14 = off_1001A18E0[v13];
  }
  v15 = [v12 stringByAppendingString:v14];

  v23 = sub_100138494(v15, v16, v17, v18, v19, v20, v21, v22, v25[0]);
  [*(id *)((char *)&self->_titleLabel + 1) setText:v23];

  if ([self->super.super._mainController testMode])
  {
    v25[0] = (uint64_t)_NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = (uint64_t)sub_10010705C;
    v25[3] = (uint64_t)&unk_1001A1B88;
    dispatch_source_t v26 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v27 = self;
    v24 = v26;
    dispatch_source_set_event_handler(v24, v25);
    SFDispatchTimerSet();
    dispatch_resume(v24);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end