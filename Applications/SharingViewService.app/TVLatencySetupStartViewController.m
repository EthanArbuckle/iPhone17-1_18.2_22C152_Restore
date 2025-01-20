@interface TVLatencySetupStartViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)handleDeviceSetupNotification:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)handleStartButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVLatencySetupStartViewController

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController dismiss:1];
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController dismiss:5];
}

- (void)handleStartButton:(id)a3
{
  id v8 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = [(SVSBaseViewController *)self containerView];
  [v4 setSwipeDismissible:0];

  if ([self->super.super._mainController testFlags])
  {
    [self->super.super._mainController showProgressUI];
  }
  else
  {
    id v5 = objc_alloc_init((Class)SFDevice);
    v6 = [self->super.super._mainController deviceIdentifier];
    [v5 setIdentifier:v6];

    v7 = [self->super.super._mainController userInfo];
    [v5 setOsVersion:CFDictionaryGetInt64Ranged()];

    [self->super.super._mainController _sessionStart:v5];
    [self->super.super._mainController showProgressUI];
  }
}

- (void)handleDeviceSetupNotification:(id)a3
{
  id v14 = a3;
  id v4 = [v14 name];
  id v5 = [v14 userInfo];
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize()))
  {
    CFStringRef v6 = &stru_1001A1DC0;
    if (v5) {
      CFStringRef v6 = v5;
    }
    v12 = v4;
    CFStringRef v13 = v6;
    LogPrintF();
  }
  v7 = [v14 name:v12, v13];
  unsigned int v8 = [v7 isEqual:@"com.apple.sharing.DeviceSetup"];

  if (v8 && !CFDictionaryGetInt64())
  {
    v9 = [self->super.super._mainController userInfo];
    CFStringGetTypeID();
    v10 = CFDictionaryGetTypedValue();

    CFStringGetTypeID();
    v11 = CFDictionaryGetTypedValue();
    if ([v11 isEqual:v10])
    {
      if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [self->super.super._mainController dismiss:16];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (BYTE1(self->super._animationContainerView)) {
    return 0;
  }
  id v6 = a3;
  v7 = [a4 view];
  unsigned int v8 = [v6 view];

  BOOL v4 = v7 == v8;
  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)TVLatencySetupStartViewController;
  [(TVLatencySetupStartViewController *)&v6 viewDidDisappear:v3];
  id v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"com.apple.sharing.DeviceSetup" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCF28 <= 30 && (dword_1001CCF28 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10.receiver = self;
  v10.super_class = (Class)TVLatencySetupStartViewController;
  [(TVLatencySetupBaseViewController *)&v10 viewWillAppear:v3];
  id v5 = [self->super.super._mainController _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v6 setDelegate:self];
  [v6 setNumberOfTapsRequired:1];
  [v6 setCancelsTouchesInView:0];
  v7 = [(TVLatencySetupStartViewController *)self view];
  [v7 addGestureRecognizer:v6];

  unsigned int v8 = +[NSDistributedNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"handleDeviceSetupNotification:" name:@"com.apple.sharing.DeviceSetup" object:0 suspensionBehavior:4];
  v9 = [(SVSBaseViewController *)self containerView];
  [v9 setSwipeDismissible:1];
}

@end