@interface SVSBaseMainController
- (BOOL)_canShowWhileLocked;
- (NSDictionary)userInfo;
- (SFProxCardSessionServer)proxCardSessionServer;
- (unint64_t)desiredHomeButtonEvents;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)setUserInfo:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SVSBaseMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_proxCardSessionServer, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (SFProxCardSessionServer)proxCardSessionServer
{
  return self->_proxCardSessionServer;
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return (unint64_t)[(SVSBaseMainController *)self supportedInterfaceOrientations];
}

- (void)dismiss:(int)a3
{
  id v3 = +[NSException exceptionWithName:@"SubclassUnimplementedException" reason:@"dismiss must be overridden by a subclasses." userInfo:0];
  [v3 raise];
}

- (unint64_t)desiredHomeButtonEvents
{
  return 16 * (SFDeviceHomeButtonType() != 3);
}

- (void)_willAppearInRemoteViewController
{
  if (dword_1001CCD98 <= 30 && (dword_1001CCD98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v3 = [(SVSBaseMainController *)self _remoteViewControllerProxy];
  [v3 setAllowsBanners:1];
  [v3 setDesiredHardwareButtonEvents:[self desiredHomeButtonEvents]];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CCD98 <= 30 && (dword_1001CCD98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  proxCardSessionServer = self->_proxCardSessionServer;
  if (proxCardSessionServer)
  {
    v6 = proxCardSessionServer;
    [(SFProxCardSessionServer *)v6 invalidate];
    v7 = self->_proxCardSessionServer;
    self->_proxCardSessionServer = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SVSBaseMainController;
  [(SVSBaseMainController *)&v8 viewDidDisappear:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (dword_1001CCD98 <= 30 && (dword_1001CCD98 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  objc_super v8 = [v6 userInfo];
  objc_storeStrong((id *)&self->_userInfo, v8);
  v9 = [v6 xpcEndpoint];
  if (v9 && CFDictionaryGetInt64())
  {
    id v10 = objc_alloc_init((Class)SFProxCardSessionServer);
    objc_storeStrong((id *)&self->_proxCardSessionServer, v10);
    CFStringGetTypeID();
    v11 = CFDictionaryGetTypedValue();
    if (v11) {
      [v10 setLabel:v11];
    }
    id v12 = objc_alloc_init((Class)NSXPCListenerEndpoint);
    [v12 _setEndpoint:v9];
    [v10 setXpcEndpoint:v12];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100135F50;
    v13[3] = &unk_1001A17D0;
    v13[4] = v10;
    v13[5] = self;
    [v10 activateWithCompletion:v13];
  }
  if (v7) {
    v7[2](v7);
  }
}

@end