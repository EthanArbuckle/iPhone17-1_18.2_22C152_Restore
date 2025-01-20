@interface SubCredentialActivationMainController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)appInfoDownloadEnabled;
- (NSArray)adamIDs;
- (NSString)appStoreURL;
- (NSString)cardSubtitle;
- (NSString)cardTitle;
- (NSString)issuerID;
- (NSString)launchURL;
- (SFAppContent)appContent;
- (UINavigationController)proxCardNavigationController;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)setAdamIDs:(id)a3;
- (void)setAppContent:(id)a3;
- (void)setAppInfoDownloadEnabled:(BOOL)a3;
- (void)setAppStoreURL:(id)a3;
- (void)setCardSubtitle:(id)a3;
- (void)setCardTitle:(id)a3;
- (void)setIssuerID:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setProxCardNavigationController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewFetchContent;
- (void)viewPresentStartViewControllerIfReady;
- (void)viewUpdateAppInfo;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SubCredentialActivationMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxCardNavigationController, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_issuerID, 0);
  objc_storeStrong((id *)&self->_cardTitle, 0);
  objc_storeStrong((id *)&self->_cardSubtitle, 0);
  objc_storeStrong((id *)&self->_appStoreURL, 0);
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_appContent, 0);
  objc_storeStrong((id *)&self->_vcStart, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_appIconImage, 0);

  objc_storeStrong((id *)&self->_appName, 0);
}

- (void)setProxCardNavigationController:(id)a3
{
}

- (UINavigationController)proxCardNavigationController
{
  return self->_proxCardNavigationController;
}

- (void)setLaunchURL:(id)a3
{
}

- (NSString)launchURL
{
  return self->_launchURL;
}

- (void)setIssuerID:(id)a3
{
}

- (NSString)issuerID
{
  return self->_issuerID;
}

- (void)setCardTitle:(id)a3
{
}

- (NSString)cardTitle
{
  return self->_cardTitle;
}

- (void)setCardSubtitle:(id)a3
{
}

- (NSString)cardSubtitle
{
  return self->_cardSubtitle;
}

- (void)setAppStoreURL:(id)a3
{
}

- (NSString)appStoreURL
{
  return self->_appStoreURL;
}

- (void)setAppInfoDownloadEnabled:(BOOL)a3
{
  self->_appInfoDownloadEnabled = a3;
}

- (BOOL)appInfoDownloadEnabled
{
  return self->_appInfoDownloadEnabled;
}

- (void)setAdamIDs:(id)a3
{
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void)setAppContent:(id)a3
{
}

- (SFAppContent)appContent
{
  return self->_appContent;
}

- (void)proxCardFlowDidDismiss
{
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    if (dword_1001CCB18 <= 30 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
    {
      v7 = "no";
      if (v4) {
        v7 = "yes";
      }
      v11 = v7;
      LogPrintF();
    }
    v8 = [(SubCredentialActivationMainController *)self _remoteViewControllerProxy];
    v9 = [(SubCredentialActivationMainController *)self proxCardNavigationController];

    if (v9)
    {
      v10 = [(SubCredentialActivationMainController *)self proxCardNavigationController];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10012E674;
      v12[3] = &unk_1001A1AE8;
      id v13 = v8;
      v14 = v6;
      [v10 dismissViewControllerAnimated:v4 completion:v12];
    }
    else
    {
      [v8 dismiss];
      if (v6) {
        v6[2](v6);
      }
    }
  }
}

- (void)dismiss:(int)a3
{
  if (dword_1001CCB18 <= 30 && (dword_1001CCB18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SubCredentialActivationMainController *)self dismissAnimated:a3 != 19 completion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_dismissed)
  {
    if (dword_1001CCB18 <= 50 && (dword_1001CCB18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(SubCredentialActivationMainController *)self dismiss:21];
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  [(SVSSubCredentialActivationStartViewController *)self->_vcStart setMainController:0];
  vcStart = self->_vcStart;
  self->_vcStart = 0;

  self->_appeared = 0;
  v7.receiver = self;
  v7.super_class = (Class)SubCredentialActivationMainController;
  [(SVSBaseMainController *)&v7 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_appeared = 1;
  if (dword_1001CCB18 <= 30 && (dword_1001CCB18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SubCredentialActivationMainController;
  [(SubCredentialActivationMainController *)&v5 viewDidAppear:v3];
  [(SubCredentialActivationMainController *)self viewPresentStartViewControllerIfReady];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SubCredentialActivationMainController;
  [(SubCredentialActivationMainController *)&v3 viewWillAppear:a3];
  if (dword_1001CCB18 <= 30 && (dword_1001CCB18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)viewUpdateAppInfo
{
  if (self->_appIconImage)
  {
    if (self->_vcStart) {
      -[SVSSubCredentialActivationStartViewController updateAppName:image:](self->_vcStart, "updateAppName:image:", self->_appName);
    }
    else {
      [(SubCredentialActivationMainController *)self viewPresentStartViewControllerIfReady];
    }
  }
}

- (void)viewPresentStartViewControllerIfReady
{
  if (self->_appeared
    && (![(SFAppContent *)self->_appContent installed] || self->_appIconImage))
  {
    objc_super v3 = objc_alloc_init(SVSSubCredentialActivationStartViewController);
    [(SVSSubCredentialActivationStartViewController *)v3 setMainController:self];
    [(SVSSubCredentialActivationStartViewController *)v3 setAppName:self->_appName];
    [(SVSSubCredentialActivationStartViewController *)v3 setAppIconImage:self->_appIconImage];
    vcStart = self->_vcStart;
    self->_vcStart = v3;
    objc_super v5 = v3;

    id v6 = [(SubCredentialActivationMainController *)self presentProxCardFlowWithDelegate:self initialViewController:v5];

    [(SubCredentialActivationMainController *)self setProxCardNavigationController:v6];
  }
}

- (void)viewFetchContent
{
  objc_super v3 = (SFAppContent *)[objc_alloc((Class)SFAppContent) initWithAdamIDs:self->_adamIDs];
  appContent = self->_appContent;
  self->_appContent = v3;

  if (self->_appStoreURL)
  {
    objc_super v5 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    [(SFAppContent *)self->_appContent setAmsURLOverride:v5];
  }
  else
  {
    -[SFAppContent setAmsURLOverride:](self->_appContent, "setAmsURLOverride:");
  }
  if (dword_1001CCB18 <= 50 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    adamIDs = self->_adamIDs;
    LogPrintF();
  }
  id v6 = self->_appContent;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10012EC58;
  v8[3] = &unk_1001A15F8;
  v8[4] = self;
  -[SFAppContent fetchNameAndIconWithSize:completion:](v6, "fetchNameAndIconWithSize:completion:", v8, 98.0, 98.0, adamIDs);
  if (([(SFAppContent *)self->_appContent installed] & 1) == 0) {
    [(SubCredentialActivationMainController *)self viewPresentStartViewControllerIfReady];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SubCredentialActivationMainController *)self view];
  objc_super v3 = [v2 window];

  if (!v3) {
    return 30;
  }
  BOOL v4 = +[UIDevice currentDevice];
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
  id v6 = (void (**)(void))a4;
  objc_super v7 = [a3 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v7;

  if (dword_1001CCB18 <= 30 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    v16 = self->super._userInfo;
    LogPrintF();
  }
  CFArrayGetTypeID();
  v9 = CFDictionaryGetTypedValue();
  if (![v9 count]
    && dword_1001CCB18 <= 90
    && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    v16 = 0;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_adamIDs, v9);
  CFStringGetTypeID();
  v10 = CFDictionaryGetTypedValue();
  if (!v10 && dword_1001CCB18 <= 10 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    v16 = 0;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_appStoreURL, v10);
  CFStringGetTypeID();
  v11 = CFDictionaryGetTypedValue();
  if (!v11 && dword_1001CCB18 <= 10 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    v16 = 0;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_launchURL, v11);
  CFStringGetTypeID();
  v12 = CFDictionaryGetTypedValue();
  if (!v12 && dword_1001CCB18 <= 60 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    v16 = 0;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_cardTitle, v12);
  CFStringGetTypeID();
  id v13 = CFDictionaryGetTypedValue();
  if (!v13 && dword_1001CCB18 <= 60 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    v16 = 0;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_cardSubtitle, v13);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v14 && dword_1001CCB18 <= 60 && (dword_1001CCB18 != -1 || _LogCategory_Initialize()))
  {
    v16 = 0;
    LogPrintF();
  }
  issuerID = self->_issuerID;
  self->_issuerID = v14;

  if (v6) {
    v6[2](v6);
  }
  [(SubCredentialActivationMainController *)self viewFetchContent];
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