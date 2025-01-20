@interface HomeKitDeviceDetectedMainController
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation HomeKitDeviceDetectedMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);

  objc_storeStrong((id *)&self->_storyboard, 0);
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
          if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(HomeKitDeviceDetectedMainController *)self dismiss:4];
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
    id v5 = [(HomeKitDeviceDetectedMainController *)self _remoteViewControllerProxy];
    id v6 = v5;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000FD554;
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
  [(HomeKitDeviceDetectedMainController *)self dismissAnimated:a3 != 19];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_dismissed)
  {
    if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(HomeKitDeviceDetectedMainController *)self dismiss:21];
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(SVSBaseViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  v8.receiver = self;
  v8.super_class = (Class)HomeKitDeviceDetectedMainController;
  [(SVSBaseMainController *)&v8 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)HomeKitDeviceDetectedMainController;
  [(HomeKitDeviceDetectedMainController *)&v14 viewDidAppear:v3];
  id v5 = +[UIStoryboard storyboardWithName:@"HomeKitDeviceDetected" bundle:0];
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
  long long v11 = [(SVSCommonNavController *)self->_vcNav viewControllers];
  long long v12 = [v11 firstObject];
  vcStart = self->_vcStart;
  self->_vcStart = v12;

  [(SVSBaseViewController *)self->_vcStart setMainController:self];
  [(HomeKitDeviceDetectedMainController *)self presentViewController:self->_vcNav animated:1 completion:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(HomeKitDeviceDetectedMainController *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  id v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    return (1 << (char)[UIApp activeInterfaceOrientation]);
  }
  else {
    return 2;
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CC250 <= 30 && (dword_1001CC250 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  objc_super v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    objc_super v8 = v9;
  }
}

@end