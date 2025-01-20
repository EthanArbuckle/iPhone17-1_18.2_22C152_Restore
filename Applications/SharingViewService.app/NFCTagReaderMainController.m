@interface NFCTagReaderMainController
- (BOOL)appeared;
- (BOOL)dismissing;
- (NSString)purpose;
- (int64_t)tagCount;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dismiss:(int)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissIfIdle;
- (void)handleButtonActions:(id)a3;
- (void)nfcTagScannedCount:(int64_t)a3;
- (void)proxCardFlowDidDismiss;
- (void)setAppeared:(BOOL)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setPurpose:(id)a3;
- (void)setTagCount:(int64_t)a3;
- (void)uiOperationBegin;
- (void)uiOperationEnd;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation NFCTagReaderMainController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_xpcAgent, 0);
  objc_storeStrong((id *)&self->_vcScan, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);

  objc_storeStrong((id *)&self->_storyboard, 0);
}

- (void)setTagCount:(int64_t)a3
{
  self->_tagCount = a3;
}

- (int64_t)tagCount
{
  return self->_tagCount;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)dismissing
{
  return self->_dismissing;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (BOOL)appeared
{
  return self->_appeared;
}

- (void)proxCardFlowDidDismiss
{
}

- (void)uiOperationEnd
{
  int v2 = self->_operationCount - 1;
  self->_operationCount = v2;
  if (!v2 && self->_dismissPending && !self->_dismissing)
  {
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_dismissPending = 0;
    [(NFCTagReaderMainController *)self dismiss:8];
  }
}

- (void)uiOperationBegin
{
}

- (void)setPurpose:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_purpose, a3);
  if (self->_appeared) {
    [(NFCTagReaderScanViewController *)self->_vcScan setSubtitle:v5];
  }
}

- (void)nfcTagScannedCount:(int64_t)a3
{
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (a3)
  {
    if (a3 >= 1)
    {
      self->_tagCount = a3;
      if (self->_appeared)
      {
        vcScan = self->_vcScan;
        [(NFCTagReaderScanViewController *)vcScan nfcTagScanned];
      }
      else
      {
        [(NFCTagReaderMainController *)self uiOperationBegin];
      }
    }
  }
  else
  {
    v6 = self->_vcScan;
    [(NFCTagReaderScanViewController *)v6 showFailureUI];
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
          if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(NFCTagReaderMainController *)self dismiss:4];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dismissIfIdle
{
  if (self->_dismissing)
  {
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (self->_operationCount < 1)
  {
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NFCTagReaderMainController *)self dismiss:8];
  }
  else
  {
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_dismissPending = 1;
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  if (!self->_dismissed)
  {
    BOOL v3 = a3;
    self->_dismissed = 1;
    id v5 = [(NFCTagReaderMainController *)self _remoteViewControllerProxy];
    id v6 = v5;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10010A658;
      v8[3] = &unk_1001A1BD8;
      id v9 = v5;
      [(UINavigationController *)vcNav dismissViewControllerAnimated:v3 completion:v8];
    }
    else
    {
      [v5 dismiss];
    }
  }
}

- (void)dismiss:(int)a3
{
  [(NFCTagReaderMainController *)self dismissAnimated:a3 != 19];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = [(NFCTagReaderMainController *)self _remoteViewControllerProxy];
  [v5 setIdleTimerDisabled:0 forReason:@"com.apple.SharingViewService.NFCTagReader"];

  if (!self->_dismissed)
  {
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NFCTagReaderMainController *)self dismiss:21];
  }
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v6 = self->_xpcAgent;
  xpcAgent = self->_xpcAgent;
  self->_xpcAgent = 0;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10010A924;
  v17[3] = &unk_1001A1A08;
  v8 = v6;
  v18 = v8;
  id v9 = [(CUXPCAgent *)v8 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010A9C8;
  v15[3] = &unk_1001A1A08;
  v16 = v8;
  long long v10 = v8;
  [v9 uiInvalidatedWithCompletion:v15];

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  [(NFCTagReaderScanViewController *)self->_vcScan setMainController:0];
  vcScan = self->_vcScan;
  self->_vcScan = 0;

  v14.receiver = self;
  v14.super_class = (Class)NFCTagReaderMainController;
  [(SVSBaseMainController *)&v14 viewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v12.receiver = self;
  v12.super_class = (Class)NFCTagReaderMainController;
  [(NFCTagReaderMainController *)&v12 viewDidAppear:v3];
  id v5 = objc_alloc_init(NFCTagReaderScanViewController);
  [(NFCTagReaderScanViewController *)v5 setMainController:self];
  vcScan = self->_vcScan;
  self->_vcScan = v5;
  uint64_t v7 = v5;

  v8 = [(NFCTagReaderMainController *)self presentProxCardFlowWithDelegate:self initialViewController:v7];
  vcNav = self->_vcNav;
  self->_vcNav = v8;

  long long v10 = [(NFCTagReaderMainController *)self _remoteViewControllerProxy];
  [v10 setStatusBarHidden:1 withDuration:0.3];

  long long v11 = [(NFCTagReaderMainController *)self _remoteViewControllerProxy];
  [v11 setIdleTimerDisabled:1 forReason:@"com.apple.SharingViewService.NFCTagReader"];
}

- (unint64_t)supportedInterfaceOrientations
{
  return _PRXSupportedInterfaceOrientations(self, 1);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  v8 = [v6 userInfo];
  userInfo = self->super._userInfo;
  self->super._userInfo = v8;

  if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  long long v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  purpose = self->_purpose;
  self->_purpose = v10;

  objc_super v12 = [v6 xpcEndpoint];

  if (v12
    && (id v13 = objc_alloc_init((Class)NSXPCListenerEndpoint),
        [v6 xpcEndpoint],
        objc_super v14 = objc_claimAutoreleasedReturnValue(),
        [v13 _setEndpoint:v14],
        v14,
        v13))
  {
    if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v15 = (CUXPCAgent *)objc_alloc_init((Class)CUXPCAgent);
    xpcAgent = self->_xpcAgent;
    self->_xpcAgent = v15;

    [(CUXPCAgent *)self->_xpcAgent setDispatchQueue:&_dispatch_main_q];
    v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFNFCTagReaderUIInterface];
    [(CUXPCAgent *)self->_xpcAgent setExportedInterface:v17];

    [(CUXPCAgent *)self->_xpcAgent setExportedObject:self];
    v18 = +[NSString stringWithUTF8String:off_1001CC490];
    [(CUXPCAgent *)self->_xpcAgent setLabel:v18];

    [(CUXPCAgent *)self->_xpcAgent setListenerEndpoint:v13];
    v19 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFNFCTagReaderControllerInterface];
    [(CUXPCAgent *)self->_xpcAgent setRemoteObjectInterface:v19];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10010C47C;
    v23[3] = &unk_1001A1BD8;
    v23[4] = self;
    [(CUXPCAgent *)self->_xpcAgent setInterruptionHandler:v23];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10010C500;
    v22[3] = &unk_1001A1BD8;
    v22[4] = self;
    [(CUXPCAgent *)self->_xpcAgent setInvalidationHandler:v22];
    v20 = self->_xpcAgent;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10010C584;
    v21[3] = &unk_1001A1A08;
    v21[4] = self;
    [(CUXPCAgent *)v20 activateWithCompletion:v21];
  }
  else if (dword_1001CC478 <= 30 && (dword_1001CC478 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v7) {
    v7[2](v7);
  }
}

@end