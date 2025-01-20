@interface BroadwayActivationMainController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)noCardTest;
- (BOOL)test;
- (PKPhysicalCard)physicalCard;
- (int64_t)forcedActivationResult;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 completion:(id)a4;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)presentAppropriateViewControllerIfReady;
- (void)retryActivation;
- (void)setForcedActivationResult:(int64_t)a3;
- (void)setNoCardTest:(BOOL)a3;
- (void)setPhysicalCard:(id)a3;
- (void)setTest:(BOOL)a3;
- (void)showCompletedUI:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation BroadwayActivationMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcFailedNoConnectivity, 0);
  objc_storeStrong((id *)&self->_vcFailed, 0);
  objc_storeStrong((id *)&self->_vcDone, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);

  objc_storeStrong((id *)&self->_storyboard, 0);
}

- (void)setNoCardTest:(BOOL)a3
{
  self->_noCardTest = a3;
}

- (BOOL)noCardTest
{
  return self->_noCardTest;
}

- (void)setForcedActivationResult:(int64_t)a3
{
  self->_forcedActivationResult = a3;
}

- (int64_t)forcedActivationResult
{
  return self->_forcedActivationResult;
}

- (void)setTest:(BOOL)a3
{
  self->_test = a3;
}

- (BOOL)test
{
  return self->_test;
}

- (void)setPhysicalCard:(id)a3
{
}

- (PKPhysicalCard)physicalCard
{
  return self->_physicalCard;
}

- (void)retryActivation
{
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(BroadwayActivationStartViewController *)self->_vcStart prepareForRetry];
  if ([(BroadwayActivationMainController *)self test]
    && (id)[(BroadwayActivationMainController *)self forcedActivationResult] != (id)999)
  {
    [(BroadwayActivationMainController *)self setForcedActivationResult:0];
  }
  vcNav = self->_vcNav;
  vcStart = self->_vcStart;

  sub_1001386A0(vcNav, vcStart, 0);
}

- (void)showCompletedUI:(int64_t)a3
{
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize()))
  {
    switch(a3)
    {
      case 0:
        v5 = "Success";
        break;
      case 1:
        v5 = "UnknownError";
        break;
      case 2:
        v5 = "NoPhysicalCardError";
        break;
      case 3:
        v5 = "ServicesUnavailableError";
        break;
      case 4:
        v5 = "NoInternetConnectionError";
        break;
      case 5:
        v5 = "NotYetShippedError";
        break;
      case 6:
        v5 = "AlreadyActivatedError";
        break;
      case 7:
        v5 = "IncorrectActivationCodeError";
        break;
      default:
        v5 = "Uninitialized";
        if (a3 != 999) {
          v5 = "?";
        }
        break;
    }
    v17 = v5;
    LogPrintF();
  }
  if (a3 == 4)
  {
    uint64_t v6 = 64;
    vcFailedNoConnectivity = self->_vcFailedNoConnectivity;
    if (!vcFailedNoConnectivity)
    {
      storyboard = self->_storyboard;
      CFStringRef v9 = @"NoConnectivity";
      goto LABEL_24;
    }
LABEL_25:
    p_vcNav = &self->_vcNav;
    goto LABEL_29;
  }
  if (!a3)
  {
    uint64_t v6 = 48;
    vcFailedNoConnectivity = self->_vcDone;
    if (!vcFailedNoConnectivity)
    {
      storyboard = self->_storyboard;
      CFStringRef v9 = @"Done";
LABEL_24:
      uint64_t v10 = -[UIStoryboard instantiateViewControllerWithIdentifier:](storyboard, "instantiateViewControllerWithIdentifier:", v9, v17);
      v11 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6];
      *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6] = v10;

      [*(id *)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6] setMainController:self];
      vcFailedNoConnectivity = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[v6];
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  vcFailed = self->_vcFailed;
  if (!vcFailed)
  {
    v14 = [(UIStoryboard *)self->_storyboard instantiateViewControllerWithIdentifier:@"Failed"];
    v15 = self->_vcFailed;
    self->_vcFailed = v14;

    [(SVSBaseViewController *)self->_vcFailed setMainController:self];
    vcFailed = self->_vcFailed;
  }
  -[BroadwayActivationFailedViewController setFailureResult:](vcFailed, "setFailureResult:", a3, v17);
  p_vcNav = &self->_vcNav;
  vcFailedNoConnectivity = self->_vcFailed;
LABEL_29:
  v16 = *p_vcNav;

  sub_1001386A0(v16, vcFailedNoConnectivity, 0);
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
          if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(BroadwayActivationMainController *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    uint64_t v7 = [(BroadwayActivationMainController *)self _remoteViewControllerProxy];
    v8 = v7;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100130CD0;
      v10[3] = &unk_1001A1AE8;
      id v11 = v7;
      long long v12 = v6;
      [(SVSCommonNavController *)vcNav dismissViewControllerAnimated:v4 completion:v10];
    }
    else
    {
      [v7 dismiss];
      if (v6) {
        v6[2](v6);
      }
    }
  }
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  [(BroadwayActivationMainController *)self dismissAnimated:a3 != 19 completion:a4];
}

- (void)dismiss:(int)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_dismissed)
  {
    if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(BroadwayActivationMainController *)self dismiss:21];
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(SVSBaseViewController *)self->_vcDone setMainController:0];
  vcDone = self->_vcDone;
  self->_vcDone = 0;

  [(SVSBaseViewController *)self->_vcFailed setMainController:0];
  vcFailed = self->_vcFailed;
  self->_vcFailed = 0;

  [(SVSBaseViewController *)self->_vcFailedNoConnectivity setMainController:0];
  vcFailedNoConnectivity = self->_vcFailedNoConnectivity;
  self->_vcFailedNoConnectivity = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  self->_appeared = 0;
  v11.receiver = self;
  v11.super_class = (Class)BroadwayActivationMainController;
  [(SVSBaseMainController *)&v11 viewDidDisappear:v3];
}

- (void)presentAppropriateViewControllerIfReady
{
  if (!self->_appeared || !self->_physicalCard) {
    return;
  }
  BOOL v3 = +[UIStoryboard storyboardWithName:@"BroadwayActivation" bundle:0];
  storyboard = self->_storyboard;
  self->_storyboard = v3;

  id v5 = [(UIStoryboard *)self->_storyboard instantiateInitialViewController];
  vcNav = self->_vcNav;
  self->_vcNav = v5;

  [(SVSCommonNavController *)self->_vcNav setDelegate:self];
  [(SVSCommonNavController *)self->_vcNav setModalPresentationStyle:4];
  uint64_t v7 = +[UIDevice currentDevice];
  unint64_t v8 = (unint64_t)[v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(SVSCommonNavController *)self->_vcNav setModalTransitionStyle:2];
  }
  [(SVSCommonNavController *)self->_vcNav setTransitioningDelegate:self->_vcNav];
  if (self->_noCardTest)
  {
    physicalCard = self->_physicalCard;
    self->_physicalCard = 0;
  }
  if (!self->_physicalCard)
  {
    v13 = self->_storyboard;
    CFStringRef v14 = @"NoCard";
LABEL_14:
    v15 = [(UIStoryboard *)v13 instantiateViewControllerWithIdentifier:v14];
    goto LABEL_15;
  }
  long long v10 = [(NSDictionary *)self->super._userInfo objectForKeyedSubscript:@"physicalCard"];
  if (v10)
  {
    objc_super v11 = [(NSDictionary *)self->super._userInfo objectForKeyedSubscript:@"physicalCard"];
    long long v12 = (char *)[v11 unsignedIntegerValue];
  }
  else
  {
    long long v12 = (char *)[(PKPhysicalCard *)self->_physicalCard state];
  }

  if ((unint64_t)(v12 - 2) < 3)
  {
    v13 = self->_storyboard;
    CFStringRef v14 = @"AlreadyActivated";
    goto LABEL_14;
  }
  if (v12 == (char *)1)
  {
    v19 = [(SVSCommonNavController *)self->_vcNav viewControllers];
    v20 = [v19 firstObject];
    vcStart = self->_vcStart;
    self->_vcStart = v20;

    v15 = self->_vcStart;
LABEL_15:
    v16 = v15;
    if (v15)
    {
      [(SVSBaseViewController *)v15 setMainController:self];
      v17 = self->_vcNav;
      v22 = v16;
      v18 = +[NSArray arrayWithObjects:&v22 count:1];
      [(SVSCommonNavController *)v17 setViewControllers:v18 animated:0];

      [(BroadwayActivationMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
      return;
    }
  }
  if (dword_1001CCC58 <= 60 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(BroadwayActivationMainController *)self dismissAnimated:0 completion:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_appeared = 1;
  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)BroadwayActivationMainController;
  [(BroadwayActivationMainController *)&v5 viewDidAppear:v3];
  [(BroadwayActivationMainController *)self presentAppropriateViewControllerIfReady];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(BroadwayActivationMainController *)self view];
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
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001CCC58 <= 30 && (dword_1001CCC58 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  long long v9 = CFDictionaryGetTypedValue();
  if (!v9)
  {
    self->_test = 0;
LABEL_10:
    if (!v6) {
      goto LABEL_12;
    }
LABEL_11:
    v6[2](v6);
    goto LABEL_12;
  }
  uint64_t v10 = SFTestFlagsFromString();
  self->_test = v10 & 1;
  if ((v10 & 1) == 0) {
    goto LABEL_10;
  }
  self->_noCardTest = BYTE4(v10) & 1;
  objc_super v11 = [(NSDictionary *)self->super._userInfo objectForKeyedSubscript:@"activationResult"];
  if (v11)
  {
    long long v12 = [(NSDictionary *)self->super._userInfo objectForKeyedSubscript:@"activationResult"];
    self->_forcedActivationResult = (int64_t)[v12 integerValue];
  }
  else
  {
    self->_forcedActivationResult = 999;
  }

  if (v6) {
    goto LABEL_11;
  }
LABEL_12:
  CFStringGetTypeID();
  v13 = CFDictionaryGetTypedValue();
  CFStringRef v14 = [(objc_class *)off_1001CCCC8() sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100131578;
  v15[3] = &unk_1001A1688;
  v15[4] = self;
  [v14 physicalCardForFeatureIdentifier:2 activationCode:v13 completion:v15];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end