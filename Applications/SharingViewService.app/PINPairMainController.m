@interface PINPairMainController
- (SFPINPairSession)pairingSession;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)testFlags;
- (void)_startPairing:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)handleButtonActions:(id)a3;
- (void)setPairingSession:(id)a3;
- (void)setTestFlags:(unint64_t)a3;
- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)showDoneUI:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PINPairMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_vcAuth, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);

  objc_storeStrong((id *)&self->_storyboard, 0);
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setPairingSession:(id)a3
{
}

- (SFPINPairSession)pairingSession
{
  return self->_pairingSession;
}

- (void)_startPairing:(id)a3
{
  id v4 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize()))
  {
    id v7 = v4;
    LogPrintF();
  }
  [(SFPINPairSession *)self->_pairingSession invalidate];
  v5 = (SFPINPairSession *)objc_alloc_init((Class)SFPINPairSession);
  pairingSession = self->_pairingSession;
  self->_pairingSession = v5;

  [(SFPINPairSession *)self->_pairingSession setPeerDevice:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100118CC4;
  v9[3] = &unk_1001A1A08;
  v9[4] = self;
  [(SFPINPairSession *)self->_pairingSession setCompletionHandler:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100118D9C;
  v8[3] = &unk_1001A1B60;
  v8[4] = self;
  [(SFPINPairSession *)self->_pairingSession setPromptForPINHandler:v8];
  [(SFPINPairSession *)self->_pairingSession activate];
}

- (void)showDoneUI:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = v3;
    LogPrintF();
  }
  vcDone = self->_vcDone;
  if (!vcDone)
  {
    v6 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"Done"];
    id v7 = self->_vcDone;
    self->_vcDone = v6;

    [(SVSBaseViewController *)self->_vcDone setMainController:self];
    vcDone = self->_vcDone;
  }
  -[PINPairDoneViewController setStatus:](vcDone, "setStatus:", v3, v10);
  vcNav = self->_vcNav;
  v9 = self->_vcDone;

  sub_1001386A0(vcNav, v9, 0);
}

- (void)showAuthUIWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  vcAuth = self->_vcAuth;
  if (vcAuth)
  {
    [(PINPairAuthViewController *)vcAuth showWithFlags:*(void *)&a3 throttleSeconds:*(void *)&a4];
  }
  else
  {
    v6 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"Auth", *(void *)&a4];
    id v7 = self->_vcAuth;
    self->_vcAuth = v6;

    [(SVSBaseViewController *)self->_vcAuth setMainController:self];
    vcNav = self->_vcNav;
    v9 = self->_vcAuth;
    sub_1001386A0(vcNav, v9, 0);
  }
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * i) events] & 0x10) != 0)
        {
          if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(PINPairMainController *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  if (!self->_dismissed)
  {
    BOOL v3 = a3;
    self->_dismissed = 1;
    id v5 = [(PINPairMainController *)self _remoteViewControllerProxy];
    id v6 = v5;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100119224;
      v8[3] = &unk_1001A1BD8;
      id v9 = v5;
      [(SVSCommonNavController *)vcNav dismissViewControllerAnimated:v3 completion:v8];
    }
    else
    {
      [v5 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
  [(PINPairMainController *)self dismissAnimated:a3 != 19];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_dismissed)
  {
    if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(PINPairMainController *)self dismiss:21];
  }
  [(SFPINPairSession *)self->_pairingSession invalidate];
  pairingSession = self->_pairingSession;
  self->_pairingSession = 0;

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(SVSBaseViewController *)self->_vcAuth setMainController:0];
  vcAuth = self->_vcAuth;
  self->_vcAuth = 0;

  [(SVSBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v11.receiver = self;
  v11.super_class = (Class)PINPairMainController;
  [(SVSBaseMainController *)&v11 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)PINPairMainController;
  [(PINPairMainController *)&v14 viewDidAppear:v3];
  id v5 = +[UIStoryboard storyboardWithName:@"PINPair" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v5;

  uint64_t v7 = [(UIStoryboard *)self->_storyboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v7;

  [(SVSCommonNavController *)self->_vcNav setDelegate:self];
  [(SVSCommonNavController *)self->_vcNav setModalPresentationStyle:4];
  id v9 = +[UIDevice currentDevice];
  unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SVSCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  }
  [(SVSCommonNavController *)self->_vcNav setTransitioningDelegate:self->_vcNav];
  objc_super v11 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  long long v12 = [v11 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(PINPairMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(PINPairMainController *)self view];
  BOOL v3 = [v2 window];

  if (v3) {
    unint64_t v4 = (1 << (char)[UIApp activeInterfaceOrientation]);
  }
  else {
    unint64_t v4 = 30;
  }

  return v4;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v9 = (void (**)(void))a4;
  id v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CC748 <= 30 && (dword_1001CC748 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  v8 = CFDictionaryGetTypedValue();
  if (v8) {
    self->_testFlags = SFTestFlagsFromString();
  }
  if (v9) {
    v9[2](v9);
  }
}

@end