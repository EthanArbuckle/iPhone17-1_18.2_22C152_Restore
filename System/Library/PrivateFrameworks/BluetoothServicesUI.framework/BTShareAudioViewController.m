@interface BTShareAudioViewController
+ (id)instantiateViewController;
- (BTShareAudioConnectingViewController)vcConnecting;
- (BTShareAudioSessionClient)shareAudioSession;
- (NSBundle)mainBundle;
- (UIStoryboard)mainStoryboard;
- (id)_imageForPID:(unsigned int)a3 colorCode:(unsigned int)a4;
- (id)_moviePathForPID:(unsigned int)a3 colorCode:(unsigned int)a4;
- (id)completion;
- (unsigned)flags;
- (void)_reportCompletion:(id)a3 mediaRouteID:(id)a4;
- (void)_sessionProgressEvent:(int)a3 info:(id)a4;
- (void)_sessionStart;
- (void)_showBringClose;
- (void)_showConfirm:(id)a3;
- (void)_showConnecting:(id)a3;
- (void)_showError:(id)a3;
- (void)_showPairInstructions:(id)a3;
- (void)_transitionToViewController:(id)a3 animate:(BOOL)a4;
- (void)reportError:(id)a3;
- (void)reportUserCancelled;
- (void)setCompletion:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setMainBundle:(id)a3;
- (void)setMainStoryboard:(id)a3;
- (void)setShareAudioSession:(id)a3;
- (void)setVcConnecting:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BTShareAudioViewController

+ (id)instantiateViewController
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.BluetoothServicesUI"];
  v3 = [MEMORY[0x263F1C9E8] storyboardWithName:@"ShareAudioiOS" bundle:v2];
  v4 = [v3 instantiateViewControllerWithIdentifier:@"Main"];
  [v4 setMainBundle:v2];
  [v4 setMainStoryboard:v3];
  [v4 setModalPresentationStyle:8];
  [v4 setModalTransitionStyle:2];
  id v5 = (id)[v4 view];
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)BTShareAudioViewController;
  [(BTShareAudioViewController *)&v5 viewWillAppear:v3];
  [(BTShareAudioViewController *)self setTitle:0];
  [(BTShareAudioViewController *)self _showBringClose];
  [(BTShareAudioViewController *)self _sessionStart];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7.receiver = self;
  v7.super_class = (Class)BTShareAudioViewController;
  [(BTShareAudioViewController *)&v7 viewWillDisappear:v3];
  [(BTShareAudioSessionClient *)self->_shareAudioSession invalidate];
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  v6 = NSErrorF();
  [(BTShareAudioViewController *)self _reportCompletion:v6 mediaRouteID:0];
}

- (id)_imageForPID:(unsigned int)a3 colorCode:(unsigned int)a4
{
  signed int v5 = a3 - 8201;
  if (a3 - 8201 < 0xA && ((0x28Du >> v5) & 1) != 0)
  {
    uint64_t v7 = dword_23EF72A20[v5];
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (a3 == 0x10000) {
      uint64_t v7 = 8207;
    }
    else {
      uint64_t v7 = a3;
    }
  }
  v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"ShareAudioDetail-PID-%u-CL_%u", v7, v6);
  v9 = [MEMORY[0x263F1C6B0] imageNamed:v8 inBundle:self->_mainBundle compatibleWithTraitCollection:0];

  return v9;
}

- (id)_moviePathForPID:(unsigned int)a3 colorCode:(unsigned int)a4
{
  unsigned int v4 = a3 - 8201;
  if (a3 == 0x10000) {
    unsigned int v5 = 8207;
  }
  else {
    unsigned int v5 = a3;
  }
  BOOL v6 = v4 > 0x1D;
  int v7 = (1 << v4) & 0x2000628D;
  BOOL v8 = v6 || v7 == 0;
  uint64_t v9 = !v8;
  if (v8) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = a3;
  }
  v11 = [MEMORY[0x263F1C920] mainScreen];
  [v11 scale];
  uint64_t v13 = (int)v12;

  v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"ShareAudioDetail-PID-%u-CL_%u-%ux", v10, v9, v13);
  return v14;
}

- (void)_reportCompletion:(id)a3 mediaRouteID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [(BTShareAudioSessionClient *)self->_shareAudioSession invalidate];
  shareAudioSession = self->_shareAudioSession;
  self->_shareAudioSession = 0;

  BOOL v8 = (void (**)(void, void, void))MEMORY[0x2455BFED0](self->_completion);
  if (v8)
  {
    id completion = self->_completion;
    self->_id completion = 0;

    if (v6)
    {
      uint64_t v10 = objc_alloc_init(BTSharedAudioDeviceInfo);
      [(BTSharedAudioDeviceInfo *)v10 setMediaRouteIdentifier:v6];
      ((void (**)(void, BTSharedAudioDeviceInfo *, void))v8)[2](v8, v10, 0);
LABEL_4:

      goto LABEL_7;
    }
    if (!v11)
    {
      NSErrorF();
      uint64_t v10 = (BTSharedAudioDeviceInfo *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, void, BTSharedAudioDeviceInfo *))v8)[2](v8, 0, v10);
      goto LABEL_4;
    }
    ((void (*)(void (**)(void, void, void), void))v8[2])(v8, 0);
  }
LABEL_7:
}

- (void)reportError:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (gLogCategory_BTShareAudioViewController <= 90)
  {
    if (gLogCategory_BTShareAudioViewController != -1 || (int v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      LogPrintF();
      id v4 = v7;
    }
  }
  if (v4)
  {
    [(BTShareAudioViewController *)self _reportCompletion:v4 mediaRouteID:0];
  }
  else
  {
    id v6 = NSErrorF();
    [(BTShareAudioViewController *)self _reportCompletion:v6 mediaRouteID:0];
  }
}

- (void)reportUserCancelled
{
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(BTShareAudioViewController *)self _reportCompletion:v3 mediaRouteID:0];
}

- (void)_sessionStart
{
  id v3 = objc_alloc_init(MEMORY[0x263F2B9A8]);
  objc_storeStrong((id *)&self->_shareAudioSession, v3);
  if (GestaltGetDeviceClass() == 4) {
    [v3 setMode:2];
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__BTShareAudioViewController__sessionStart__block_invoke;
  v4[3] = &unk_265049E30;
  v4[4] = v3;
  v4[5] = self;
  [v3 setProgressHandler:v4];
  [v3 activate];
}

void *__43__BTShareAudioViewController__sessionStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v4 == result[179]) {
    return (void *)[result _sessionProgressEvent:a2 info:a3];
  }
  return result;
}

- (void)_sessionProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (__CFString *)a4;
  id v7 = v6;
  v17 = v6;
  if (gLogCategory_BTShareAudioViewController > 30) {
    goto LABEL_42;
  }
  if (gLogCategory_BTShareAudioViewController == -1)
  {
    id v6 = (__CFString *)_LogCategory_Initialize();
    id v7 = v17;
    if (!v6) {
      goto LABEL_42;
    }
  }
  if ((int)v4 > 119)
  {
    if ((int)v4 <= 219)
    {
      switch(v4)
      {
        case 0x78:
          BOOL v8 = "ShowPairInstructions";
          goto LABEL_39;
        case 0xC8:
          BOOL v8 = "GuestiOSConnecting";
          goto LABEL_39;
        case 0xD2:
          BOOL v8 = "GuestiOSAuthenticated";
          goto LABEL_39;
      }
    }
    else if ((int)v4 > 309)
    {
      if (v4 == 310)
      {
        BOOL v8 = "GuestHeadphonesConnected";
        goto LABEL_39;
      }
      if (v4 == 320)
      {
        BOOL v8 = "GuestHeadphonesWaitForRoute";
        goto LABEL_39;
      }
    }
    else
    {
      if (v4 == 220)
      {
        BOOL v8 = "GuestiOSWaitingForAccept";
        goto LABEL_39;
      }
      if (v4 == 300)
      {
        BOOL v8 = "GuestHeadphonesConnecting";
        goto LABEL_39;
      }
    }
LABEL_38:
    BOOL v8 = "?";
    goto LABEL_39;
  }
  if ((int)v4 <= 29)
  {
    switch(v4)
    {
      case 0:
        BOOL v8 = "Invalid";
        goto LABEL_39;
      case 0xA:
        BOOL v8 = "Activated";
        goto LABEL_39;
      case 0x14:
        BOOL v8 = "Invalidated";
        goto LABEL_39;
    }
    goto LABEL_38;
  }
  if ((int)v4 > 49)
  {
    if (v4 == 50)
    {
      BOOL v8 = "Failed";
      goto LABEL_39;
    }
    if (v4 == 100)
    {
      BOOL v8 = "Confirm";
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v4 == 30)
  {
    BOOL v8 = "Interrupted";
    goto LABEL_39;
  }
  if (v4 != 40) {
    goto LABEL_38;
  }
  BOOL v8 = "Succeeded";
LABEL_39:
  uint64_t v9 = &stru_26F2A5B18;
  if (v7) {
    uint64_t v9 = v7;
  }
  v15 = v8;
  v16 = v9;
  id v6 = (__CFString *)LogPrintF();
  id v7 = v17;
LABEL_42:
  if ((int)v4 > 119)
  {
    if ((v4 - 200) <= 0x14 && ((1 << (v4 + 56)) & 0x100401) != 0
      || (v4 - 300) <= 0x14 && ((1 << (v4 - 44)) & 0x100401) != 0)
    {
      -[BTShareAudioViewController _showConnecting:](self, "_showConnecting:", v17, v15, v16);
      id v6 = (__CFString *)[(BTShareAudioConnectingViewController *)self->_vcConnecting sessionProgressEvent:v4 info:v17];
    }
    else
    {
      if (v4 != 120) {
        goto LABEL_61;
      }
      id v6 = (__CFString *)[(BTShareAudioViewController *)self _showPairInstructions:v17];
    }
    goto LABEL_60;
  }
  if (v4 == 40)
  {
    CFStringGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    id v11 = self;
    double v12 = 0;
    uint64_t v13 = v10;
    goto LABEL_57;
  }
  if (v4 == 50)
  {
    CFErrorGetTypeID();
    uint64_t v10 = CFDictionaryGetTypedValue();
    uint64_t v14 = [v10 code] - 299008;
    id v11 = self;
    double v12 = v10;
    if (v14 != 2023)
    {
      [(BTShareAudioViewController *)self _showError:v10];
      goto LABEL_59;
    }
    uint64_t v13 = 0;
LABEL_57:
    -[BTShareAudioViewController _reportCompletion:mediaRouteID:](v11, "_reportCompletion:mediaRouteID:", v12, v13, v15, v16);
LABEL_59:

    goto LABEL_60;
  }
  if (v4 != 100) {
    goto LABEL_61;
  }
  id v6 = (__CFString *)[(BTShareAudioViewController *)self _showConfirm:v17];
LABEL_60:
  id v7 = v17;
LABEL_61:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)_showBringClose
{
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"BringClose"];
  [v3 setMainController:self];
  [(BTShareAudioViewController *)self _transitionToViewController:v3 animate:0];
}

- (void)_showError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  uint64_t v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Error", v5];
  [v4 setMainController:self];
  [v4 setError:v6];
  [(BTShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_showConfirm:(id)a3
{
  id v6 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  uint64_t v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Confirm", v5];
  [v4 setMainController:self];
  [v4 setColorCode:CFDictionaryGetInt64Ranged()];
  CFStringGetTypeID();
  [v4 setDeviceName:CFDictionaryGetTypedValue()];
  [v4 setProductID:CFDictionaryGetInt64Ranged()];
  [(BTShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_showPairInstructions:(id)a3
{
  id v6 = a3;
  if (gLogCategory_BTShareAudioViewController <= 30
    && (gLogCategory_BTShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  uint64_t v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"HoldButton", v5];
  [v4 setMainController:self];
  [v4 setProductID:CFDictionaryGetInt64Ranged()];
  [v4 setColorCode:CFDictionaryGetInt64Ranged()];
  [(BTShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_showConnecting:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self->_vcConnecting;
  if (!v4)
  {
    uint64_t v4 = [(UIStoryboard *)self->_mainStoryboard instantiateViewControllerWithIdentifier:@"Connecting"];
    [(BTShareAudioBaseViewController *)v4 setMainController:self];
    objc_storeStrong((id *)&self->_vcConnecting, v4);
  }
  [(BTShareAudioConnectingViewController *)v4 setColorCode:CFDictionaryGetInt64Ranged()];
  CFStringGetTypeID();
  [(BTShareAudioConnectingViewController *)v4 setDeviceName:CFDictionaryGetTypedValue()];
  [(BTShareAudioConnectingViewController *)v4 setProductID:CFDictionaryGetInt64Ranged()];
  [(BTShareAudioViewController *)self _transitionToViewController:v4 animate:0];
}

- (void)_transitionToViewController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  if (v4)
  {
    id v6 = [MEMORY[0x263F15910] animation];
    [v6 setDuration:0.5];
    [v6 setType:*MEMORY[0x263F15FD8]];
    id v7 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v6 setTimingFunction:v7];

    BOOL v8 = [(BTShareAudioViewController *)self view];
    uint64_t v9 = [v8 layer];
    [v9 addAnimation:v6 forKey:0];

    uint64_t v10 = [v15 view];
    id v11 = [v10 layer];
    [v11 addAnimation:v6 forKey:0];
  }
  double v12 = [(BTShareAudioViewController *)self viewControllers];
  int v13 = [v12 containsObject:v15];

  if (v13) {
    id v14 = (id)[(BTShareAudioViewController *)self popToViewController:v15 animated:0];
  }
  else {
    [(BTShareAudioViewController *)self pushViewController:v15 animated:0];
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (BTShareAudioSessionClient)shareAudioSession
{
  return self->_shareAudioSession;
}

- (void)setShareAudioSession:(id)a3
{
}

- (NSBundle)mainBundle
{
  return self->_mainBundle;
}

- (void)setMainBundle:(id)a3
{
}

- (UIStoryboard)mainStoryboard
{
  return self->_mainStoryboard;
}

- (void)setMainStoryboard:(id)a3
{
}

- (BTShareAudioConnectingViewController)vcConnecting
{
  return self->_vcConnecting;
}

- (void)setVcConnecting:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcConnecting, 0);
  objc_storeStrong((id *)&self->_mainStoryboard, 0);
  objc_storeStrong((id *)&self->_mainBundle, 0);
  objc_storeStrong((id *)&self->_shareAudioSession, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end