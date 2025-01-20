@interface SFWebProcessPlugInCertificateWarningController
- (SFWebProcessPlugInCertificateWarningController)initWithPageController:(id)a3;
- (WBSCertificateWarningPageContext)warningPageContext;
- (id)_certificateWarningPageHandlerProxy;
- (void)_clearCertificateWarningPagePresenterInterface;
- (void)_setUpCertificateWarningPagePresenterInterface;
- (void)certificateWarningPageLoaded;
- (void)dealloc;
- (void)goBackSelected;
- (void)injectCertificateWarningBindingsForFrame:(id)a3 inScriptWorld:(id)a4;
- (void)openClockSettings;
- (void)prepareCertificateWarningPage:(id)a3;
- (void)showCertificateInformation;
- (void)visitInsecureWebsite;
- (void)visitInsecureWebsiteWithTemporaryBypass;
- (void)visitWebsiteWithoutPrivateRelay;
@end

@implementation SFWebProcessPlugInCertificateWarningController

- (SFWebProcessPlugInCertificateWarningController)initWithPageController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFWebProcessPlugInCertificateWarningController;
  v5 = [(SFWebProcessPlugInCertificateWarningController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pageController, v4);
    [(SFWebProcessPlugInCertificateWarningController *)v6 _setUpCertificateWarningPagePresenterInterface];
    v7 = v6;
  }

  return v6;
}

- (void)_setUpCertificateWarningPagePresenterInterface
{
  v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC608D0];
  certificateWarningPagePresenterInterface = self->_certificateWarningPagePresenterInterface;
  self->_certificateWarningPagePresenterInterface = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  v5 = [WeakRetained browserContextController];
  v6 = [v5 _remoteObjectRegistry];
  [v6 registerExportedObject:self interface:self->_certificateWarningPagePresenterInterface];
}

- (void)dealloc
{
  [(SFWebProcessPlugInCertificateWarningController *)self _clearCertificateWarningPagePresenterInterface];
  v3.receiver = self;
  v3.super_class = (Class)SFWebProcessPlugInCertificateWarningController;
  [(SFWebProcessPlugInCertificateWarningController *)&v3 dealloc];
}

- (void)_clearCertificateWarningPagePresenterInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  id v4 = [WeakRetained browserContextController];
  id v6 = [v4 _remoteObjectRegistry];

  [v6 unregisterExportedObject:self interface:self->_certificateWarningPagePresenterInterface];
  certificateWarningPagePresenterInterface = self->_certificateWarningPagePresenterInterface;
  self->_certificateWarningPagePresenterInterface = 0;
}

- (void)injectCertificateWarningBindingsForFrame:(id)a3 inScriptWorld:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [v13 URL];
  if ([v7 isFileURL] && self->_warningPageContext)
  {
    v8 = [v13 jsContextForWorld:v6];
    objc_super v9 = [v8 globalObject];
    v10 = (void *)MEMORY[0x1E4F30938];
    v11 = [[SFCertificateWarningJSController alloc] initWithCertificateWarningController:self];
    v12 = [v10 valueWithObject:v11 inContext:v8];

    [v9 setValue:v12 forProperty:@"CertificateWarningController"];
  }
}

- (void)certificateWarningPageLoaded
{
  v37[6] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
  id v4 = [WeakRetained browserContextController];
  v5 = [v4 mainFrame];

  id v6 = [MEMORY[0x1E4F466E8] normalWorld];
  v7 = [v5 jsContextForWorld:v6];

  v8 = [v7 globalObject];
  objc_super v9 = [v8 valueForProperty:@"CertificateWarning"];
  v10 = v9;
  if (v9 && ([v9 isUndefined] & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F30938];
    v12 = [(WBSCertificateWarningPageContext *)self->_warningPageContext failingURL];
    id v13 = [v12 host];
    v35 = [v11 valueWithObject:v13 inContext:v7];

    v14 = (void *)MEMORY[0x1E4F30938];
    v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[WBSCertificateWarningPageContext warningCategory](self->_warningPageContext, "warningCategory"));
    v34 = [v14 valueWithObject:v15 inContext:v7];

    v16 = (void *)MEMORY[0x1E4F30938];
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[WBSCertificateWarningPageContext canGoBack](self->_warningPageContext, "canGoBack"));
    v18 = [v16 valueWithObject:v17 inContext:v7];

    v19 = (void *)MEMORY[0x1E4F30938];
    v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[WBSCertificateWarningPageContext numberOfDaysInvalid](self->_warningPageContext, "numberOfDaysInvalid"));
    v21 = [v19 valueWithObject:v20 inContext:v7];

    v22 = (void *)MEMORY[0x1E4F30938];
    v23 = [(WBSCertificateWarningPageContext *)self->_warningPageContext expiredCerticateDescription];
    v24 = [v22 valueWithObject:v23 inContext:v7];

    v25 = (void *)MEMORY[0x1E4F30938];
    [(WBSCertificateWarningPageContext *)self->_warningPageContext clockSkew];
    v26 = objc_msgSend(v25, "valueWithDouble:inContext:", v7);
    v37[0] = v35;
    v37[1] = v34;
    v37[2] = v18;
    v37[3] = v21;
    v37[4] = v24;
    v37[5] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
    id v28 = (id)[v10 invokeMethod:@"updateUI" withArguments:v27];

    warningPageContext = self->_warningPageContext;
    self->_warningPageContext = 0;

    v30 = [MEMORY[0x1E4FB1438] sharedApplication];
    LODWORD(v27) = objc_msgSend(v30, "safari_prefersRTLLayout");

    if (v27)
    {
      v31 = [MEMORY[0x1E4F30938] valueWithObject:@"rtl" inContext:v7];
      v36 = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      id v33 = (id)[v10 invokeMethod:@"setTextDirection" withArguments:v32];
    }
  }
}

- (id)_certificateWarningPageHandlerProxy
{
  certificateWarningPageHandlerProxy = self->_certificateWarningPageHandlerProxy;
  if (!certificateWarningPageHandlerProxy)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);
    v5 = [WeakRetained browserContextController];
    id v6 = [v5 _remoteObjectRegistry];
    v7 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC06528];
    v8 = [v6 remoteObjectProxyWithInterface:v7];
    objc_super v9 = self->_certificateWarningPageHandlerProxy;
    self->_certificateWarningPageHandlerProxy = v8;

    certificateWarningPageHandlerProxy = self->_certificateWarningPageHandlerProxy;
  }

  return certificateWarningPageHandlerProxy;
}

- (void)visitInsecureWebsite
{
  id v2 = [(SFWebProcessPlugInCertificateWarningController *)self _certificateWarningPageHandlerProxy];
  [v2 visitInsecureWebsite];
}

- (void)visitInsecureWebsiteWithTemporaryBypass
{
  id v2 = [(SFWebProcessPlugInCertificateWarningController *)self _certificateWarningPageHandlerProxy];
  [v2 visitInsecureWebsiteWithTemporaryBypass];
}

- (void)showCertificateInformation
{
  id v2 = [(SFWebProcessPlugInCertificateWarningController *)self _certificateWarningPageHandlerProxy];
  [v2 showCertificateInformation];
}

- (void)openClockSettings
{
  id v2 = [(SFWebProcessPlugInCertificateWarningController *)self _certificateWarningPageHandlerProxy];
  [v2 openClockSettings];
}

- (void)goBackSelected
{
  id v2 = [(SFWebProcessPlugInCertificateWarningController *)self _certificateWarningPageHandlerProxy];
  [v2 goBackButtonClicked];
}

- (void)visitWebsiteWithoutPrivateRelay
{
  id v2 = [(SFWebProcessPlugInCertificateWarningController *)self _certificateWarningPageHandlerProxy];
  [v2 visitWebsiteWithoutPrivateRelay];
}

- (void)prepareCertificateWarningPage:(id)a3
{
}

- (WBSCertificateWarningPageContext)warningPageContext
{
  return self->_warningPageContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningPageContext, 0);
  objc_storeStrong((id *)&self->_certificateWarningPageHandlerProxy, 0);
  objc_storeStrong((id *)&self->_certificateWarningPagePresenterInterface, 0);

  objc_destroyWeak((id *)&self->_pageController);
}

@end