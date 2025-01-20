@interface PasswordPickerMainController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleHomeButtonPressed;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismiss:(int)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)handlePasswordPicked:(id)a3;
- (void)passwordViewController:(id)a3 selectedCredential:(id)a4;
- (void)passwordViewControllerDidFinish:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PasswordPickerMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcPicker, 0);
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_contextURL, 0);
  objc_storeStrong((id *)&self->_contextAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_contextUnlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_contextLocalizedAppName, 0);

  objc_storeStrong((id *)&self->_contextBundleID, 0);
}

- (void)passwordViewController:(id)a3 selectedCredential:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  vcPicker = self->_vcPicker;
  v9 = (_SFAppAutoFillPasswordViewController *)v6;
  v10 = vcPicker;
  if (v10 == v9)
  {
  }
  else
  {
    v11 = v10;
    if ((v9 == 0) != (v10 != 0))
    {
      unsigned __int8 v12 = [(_SFAppAutoFillPasswordViewController *)v9 isEqual:v10];

      if (v12) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (dword_1001CC7B8 <= 60 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_11:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10011C580;
  v14[3] = &unk_1001A1B88;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

- (void)passwordViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(PasswordPickerMainController *)self dismiss:0];
}

- (void)handlePasswordPicked:(id)a3
{
  id v7 = a3;
  if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_passwordPicked = 1;
  helper = self->_helper;
  if (helper)
  {
    v5 = [v7 user];
    id v6 = [v7 password];
    [(SFRemoteAutoFillSessionHelper *)helper serverDidPickUsername:v5 password:v6 error:0];
  }
  else if (dword_1001CC7B8 <= 60 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    id v11 = v6;
    if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = v4;
      LogPrintF();
    }
    if (!self->_passwordPicked)
    {
      helper = self->_helper;
      v8 = NSErrorWithOSStatusF();
      [(SFRemoteAutoFillSessionHelper *)helper serverDidPickUsername:0 password:0 error:v8];
    }
    -[PasswordPickerMainController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v11, v10);
    v9 = [(PasswordPickerMainController *)self _remoteViewControllerProxy];
    [v9 dismiss];
  }

  _objc_release_x2();
}

- (void)dismiss:(int)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_dismissed)
  {
    if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(PasswordPickerMainController *)self dismiss:21];
  }
  [(SFRemoteAutoFillSessionHelper *)self->_helper invalidate];
  helper = self->_helper;
  self->_helper = 0;

  contextBundleID = self->_contextBundleID;
  self->_contextBundleID = 0;

  contextLocalizedAppName = self->_contextLocalizedAppName;
  self->_contextLocalizedAppName = 0;

  contextUnlocalizedAppName = self->_contextUnlocalizedAppName;
  self->_contextUnlocalizedAppName = 0;

  contextURL = self->_contextURL;
  self->_contextURL = 0;

  vcPicker = self->_vcPicker;
  self->_vcPicker = 0;

  id v11 = [(PasswordPickerMainController *)self _remoteViewControllerProxy];
  [v11 setStatusBarHidden:0 withDuration:0.0];

  v12.receiver = self;
  v12.super_class = (Class)PasswordPickerMainController;
  [(SVSBaseMainController *)&v12 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v11.receiver = self;
  v11.super_class = (Class)PasswordPickerMainController;
  [(PasswordPickerMainController *)&v11 viewDidAppear:v3];
  v5 = (_SFAppAutoFillPasswordViewController *)objc_alloc_init(off_1001CC828());
  vcPicker = self->_vcPicker;
  self->_vcPicker = v5;

  [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setDelegate:self];
  id v7 = +[NSURL URLWithString:self->_contextURL];
  if (v7) {
    [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setWebViewURL:v7];
  }
  if (self->_contextBundleID) {
    -[_SFAppAutoFillPasswordViewController setRemoteAppID:](self->_vcPicker, "setRemoteAppID:");
  }
  if (self->_contextLocalizedAppName) {
    -[_SFAppAutoFillPasswordViewController setRemoteLocalizedAppName:](self->_vcPicker, "setRemoteLocalizedAppName:");
  }
  if (self->_contextUnlocalizedAppName) {
    -[_SFAppAutoFillPasswordViewController setRemoteUnlocalizedAppName:](self->_vcPicker, "setRemoteUnlocalizedAppName:");
  }
  char v8 = objc_opt_respondsToSelector();
  if (self->_contextAssociatedDomains && (v8 & 1) != 0) {
    -[_SFAppAutoFillPasswordViewController setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:](self->_vcPicker, "setExternallyVerifiedAndApprovedSharedWebCredentialsDomains:");
  }
  [(_SFAppAutoFillPasswordViewController *)self->_vcPicker setAuthenticationGracePeriod:45.0];
  v9 = self->_vcPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10011CC40;
  v10[3] = &unk_1001A1898;
  v10[4] = self;
  [(_SFAppAutoFillPasswordViewController *)v9 authenticateToPresentInPopover:1 completion:v10];
}

- (void)_handleHomeButtonPressed
{
  if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(PasswordPickerMainController *)self dismiss:4];
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
      char v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) events] & 0x10) != 0) {
          [(PasswordPickerMainController *)self _handleHomeButtonPressed];
        }
        char v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v18 = (void (**)(void))a4;
  id v6 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v6;

  if (dword_1001CC7B8 <= 30 && (dword_1001CC7B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  char v8 = CFDictionaryGetTypedValue();
  if (v8) {
    objc_storeStrong((id *)&self->_contextBundleID, v8);
  }
  CFStringGetTypeID();
  long long v9 = CFDictionaryGetTypedValue();

  if (v9) {
    objc_storeStrong((id *)&self->_contextLocalizedAppName, v9);
  }
  CFStringGetTypeID();
  long long v10 = CFDictionaryGetTypedValue();

  if (v10) {
    objc_storeStrong((id *)&self->_contextUnlocalizedAppName, v10);
  }
  CFStringGetTypeID();
  long long v11 = CFDictionaryGetTypedValue();

  if (v11) {
    objc_storeStrong((id *)&self->_contextURL, v11);
  }
  CFArrayGetTypeID();
  long long v12 = CFDictionaryGetTypedValue();
  id v13 = v12;
  if (v12)
  {
    v14 = (NSArray *)[v12 copy];
    contextAssociatedDomains = self->_contextAssociatedDomains;
    self->_contextAssociatedDomains = v14;
  }
  v16 = (SFRemoteAutoFillSessionHelper *)objc_alloc_init((Class)SFRemoteAutoFillSessionHelper);
  helper = self->_helper;
  self->_helper = v16;

  [(SFRemoteAutoFillSessionHelper *)self->_helper activateWithCompletion:&stru_1001A1088];
  if (v18) {
    v18[2](v18);
  }
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)PasswordPickerMainController;
  [(SVSBaseMainController *)&v4 _willAppearInRemoteViewController];
  BOOL v3 = [(PasswordPickerMainController *)self _remoteViewControllerProxy];
  [v3 setAllowsAlertItems:1];
  [v3 setAllowsAlertStacking:1];
  [v3 setStatusBarHidden:0 withDuration:0.0];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(PasswordPickerMainController *)self view];
  BOOL v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  objc_super v4 = +[UIDevice currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  if (v5 == (id)1) {
    return (1 << (char)[UIApp activeInterfaceOrientation]);
  }
  else {
    return 2;
  }
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end