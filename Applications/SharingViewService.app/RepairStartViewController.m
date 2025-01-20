@interface RepairStartViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)handleDeviceSetupNotification:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)handleStartButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RepairStartViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);

  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:1];
}

- (void)handleStartButton:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_startButton))
  {
    id v11 = v4;
    BYTE1(self->_startButton) = 1;
    if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v5 = [(SVSBaseViewController *)self containerView];
    [v5 setSwipeDismissible:0];

    unsigned int v6 = [self->super._mainController testMode];
    id mainController = self->super._mainController;
    if (v6 == 3)
    {
      uint64_t v8 = 301000;
    }
    else
    {
      if ([mainController testMode] != 4)
      {
        id v9 = objc_alloc_init((Class)SFDevice);
        v10 = [self->super._mainController deviceIdentifier];
        [v9 setIdentifier:v10];

        [self->super._mainController _sessionStart:v9];
        goto LABEL_12;
      }
      id mainController = self->super._mainController;
      uint64_t v8 = 301004;
    }
    [mainController showDoneUI:v8];
LABEL_12:
    id v4 = v11;
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super._mainController dismiss:5];
}

- (void)handleDeviceSetupNotification:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_startButton))
  {
    id v15 = v4;
    v5 = [v4 name];
    unsigned int v6 = [v15 userInfo];
    if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v7 = &stru_1001A1DC0;
      if (v6) {
        CFStringRef v7 = v6;
      }
      v13 = v5;
      CFStringRef v14 = v7;
      LogPrintF();
    }
    uint64_t v8 = [v15 name:v13, v14];
    unsigned int v9 = [v8 isEqual:@"com.apple.sharing.DeviceSetup"];

    if (v9 && !CFDictionaryGetInt64())
    {
      v10 = [self->super._mainController userInfo];
      CFStringGetTypeID();
      id v11 = CFDictionaryGetTypedValue();

      CFStringGetTypeID();
      v12 = CFDictionaryGetTypedValue();
      if ([v12 isEqual:v11])
      {
        if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [self->super._mainController dismiss:16];
      }
    }
    id v4 = v15;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (BYTE1(self->_startButton)) {
    return 0;
  }
  id v6 = a3;
  CFStringRef v7 = [a4 view];
  uint64_t v8 = [v6 view];

  BOOL v4 = v7 == v8;
  return v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)RepairStartViewController;
  [(RepairStartViewController *)&v6 viewDidDisappear:v3];
  v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"com.apple.sharing.DeviceSetup" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC9D8 <= 30 && (dword_1001CC9D8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v12.receiver = self;
  v12.super_class = (Class)RepairStartViewController;
  [(SVSBaseViewController *)&v12 viewWillAppear:v3];
  v5 = [self->super._mainController _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v6 setDelegate:self];
  [v6 setNumberOfTapsRequired:1];
  [v6 setCancelsTouchesInView:0];
  CFStringRef v7 = [(RepairStartViewController *)self view];
  [v7 addGestureRecognizer:v6];

  uint64_t v8 = [self->super._mainController productImage];
  [*(id *)((char *)&self->_infoLabel + 1) setImage:v8];

  unsigned int v9 = sub_100138280(@"Localizable", @"REPAIR_INFO_HOMEPOD");
  [*(id *)((char *)&self->_dismissButton + 1) setText:v9];

  v10 = [(SVSBaseViewController *)self containerView];
  [v10 setSwipeDismissible:1];

  id v11 = +[NSDistributedNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"handleDeviceSetupNotification:" name:@"com.apple.sharing.DeviceSetup" object:0 suspensionBehavior:4];
}

@end