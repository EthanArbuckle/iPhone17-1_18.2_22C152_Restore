@interface DKDiagnosticHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (BOOL)isXPC;
- (DKDiagnosticHostContext)initWithConnection:(id)a3;
- (DKExtensionHostAdapterDelegate)delegate;
- (NSXPCConnection)xpcConnection;
- (id)_helperConnnection;
- (void)cancelWithCompletion:(id)a3;
- (void)checkShouldShowViewController:(id)a3;
- (void)remoteHostAllowSessionAccessoryDisconnectForDuration:(id)a3;
- (void)remoteHostClearAllowSessionAccessoryDisconnect;
- (void)remoteHostCompleteWithResult:(id)a3 completion:(id)a4;
- (void)remoteHostDismissViewControllerWithCompletion:(id)a3;
- (void)remoteHostDisplayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6;
- (void)remoteHostDisplayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10;
- (void)remoteHostEnableVolumeHUD:(BOOL)a3;
- (void)remoteHostGetAsset:(id)a3 completion:(id)a4;
- (void)remoteHostHideStatusBar;
- (void)remoteHostRequestPluginReloadOnFinishWithCompletion:(id)a3;
- (void)remoteHostRequestSessionAccessoryIdentifierWithCompletion:(id)a3;
- (void)remoteHostSetScreenToBrightness:(float)a3 animate:(BOOL)a4;
- (void)remoteHostSetStatusBarStyle:(int64_t)a3;
- (void)remoteHostShowStatusBar;
- (void)remoteHostShowUI:(id)a3 completion:(id)a4;
- (void)remoteHostUnpairSessionAccessoryOnTestCompletion;
- (void)remoteHostUpdateProgress:(id)a3 forTest:(id)a4;
- (void)remoteHostUploadAssets:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIsXPC:(BOOL)a3;
- (void)setNotAllowListedWithContactMessage:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)startWithPayload:(id)a3 completion:(id)a4;
@end

@implementation DKDiagnosticHostContext

- (DKDiagnosticHostContext)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DKDiagnosticHostContext;
  v6 = [(DKDiagnosticHostContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v7->_isXPC = 1;
  }

  return v7;
}

- (id)_helperConnnection
{
  if ([(DKDiagnosticHostContext *)self isXPC]
    && ([(DKDiagnosticHostContext *)self xpcConnection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(DKDiagnosticHostContext *)self xpcConnection];
  }
  else
  {
    v4 = [(DKDiagnosticHostContext *)self _auxiliaryConnection];
  }
  return v4;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_2 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_2, &__block_literal_global_10);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_2;
  return v2;
}

void __60__DKDiagnosticHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E6FB8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_2;
  _extensionAuxiliaryVendorProtocol_interface_2 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_2;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_startRemoteDiagnosticWithDiagnosticParameters_completion_ argumentIndex:0 ofReply:0];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_2 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_2, &__block_literal_global_61_1);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_2;
  return v2;
}

void __58__DKDiagnosticHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E7370];
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_2;
  _extensionAuxiliaryHostProtocol_interface_2 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_2;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_remoteHostCompleteWithResult_completion_ argumentIndex:0 ofReply:0];
}

- (void)startWithPayload:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::startWithCompletion:", buf, 2u);
  }

  objc_super v9 = [(DKDiagnosticHostContext *)self _helperConnnection];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke;
  v17 = &unk_264E86AA0;
  v18 = self;
  id v10 = v7;
  id v19 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:&v14];

  v12 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x23ECF6C10](v10);
    *(_DWORD *)buf = 138412546;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_23D039000, v12, OS_LOG_TYPE_DEFAULT, "Got ROP: %@, completion: %@", buf, 0x16u);
  }
  if (!v10) {
    id v10 = &__block_literal_global_104;
  }
  if (v11) {
    objc_msgSend(v11, "startRemoteDiagnosticWithDiagnosticParameters:completion:", v6, v10, v14, v15, v16, v17, v18);
  }
  else {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke_cold_1();
  }

  if (([*(id *)(a1 + 32) isXPC] & 1) == 0) {
    [*(id *)(a1 + 32) cancelRequestWithError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  +[DKAnalytics sendAnalyticsWithEvent:2 error:v3];
}

- (void)cancelWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DKDiagnosticHostContext *)self _helperConnnection];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke;
  v11 = &unk_264E86AA0;
  v12 = self;
  id v6 = (void (**)(void))v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:&v8];

  if (!v6) {
    id v6 = (void (**)(void))&__block_literal_global_107;
  }
  if (v7) {
    objc_msgSend(v7, "cancelRemoteDiagnosticWithCompletion:", v6, v8, v9, v10, v11, v12);
  }
  else {
    v6[2](v6);
  }
}

void __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke_cold_1();
  }

  if (([*(id *)(a1 + 32) isXPC] & 1) == 0) {
    [*(id *)(a1 + 32) cancelRequestWithError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  +[DKAnalytics sendAnalyticsWithEvent:2 error:v3];
}

- (void)setNotAllowListedWithContactMessage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::setNotAllowListedWithContactMessage", buf, 2u);
  }

  id v6 = [(DKDiagnosticHostContext *)self _helperConnnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke;
  v10[3] = &unk_264E86668;
  v10[4] = self;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v10];

  uint64_t v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "Got ROP: %@", buf, 0xCu);
  }

  uint64_t v9 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v9, OS_LOG_TYPE_DEFAULT, "About to call setRemoteDiagnosticNotAllowListed", buf, 2u);
  }

  [v7 setRemoteDiagnosticNotAllowListedWithContactMessage:v4];
}

void __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke_cold_1();
  }

  if (([*(id *)(a1 + 32) isXPC] & 1) == 0) {
    [*(id *)(a1 + 32) cancelRequestWithError:v3];
  }
  +[DKAnalytics sendAnalyticsWithEvent:2 error:v3];
}

- (void)checkShouldShowViewController:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::checkShouldShowViewController", buf, 2u);
  }

  id v6 = [(DKDiagnosticHostContext *)self _helperConnnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke;
  v10[3] = &unk_264E86668;
  v10[4] = self;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v10];

  uint64_t v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "Got ROP: %@", buf, 0xCu);
  }

  uint64_t v9 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D039000, v9, OS_LOG_TYPE_DEFAULT, "About to call checkShouldShowViewController", buf, 2u);
  }

  [v7 checkShouldShowRemoteDiagnosticViewController:v4];
}

void __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke_cold_1();
  }

  if (([*(id *)(a1 + 32) isXPC] & 1) == 0) {
    [*(id *)(a1 + 32) cancelRequestWithError:v3];
  }
  +[DKAnalytics sendAnalyticsWithEvent:2 error:v3];
}

- (void)remoteHostUpdateProgress:(id)a3 forTest:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(DKDiagnosticHostContext *)self delegate];
  uint64_t v8 = [v7 hostServicesDelegate];
  int v9 = [v8 conformsToProtocol:&unk_26F0E73E8];

  if (v9)
  {
    id v10 = [(DKDiagnosticHostContext *)self delegate];
    v11 = [v10 hostServicesDelegate];

    [v11 updateProgress:v12 forTest:v6];
  }
}

- (void)remoteHostEnableVolumeHUD:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DKDiagnosticHostContext *)self delegate];
  id v6 = [v5 hostServicesDelegate];
  int v7 = [v6 conformsToProtocol:&unk_26F0E78B0];

  if (v7)
  {
    uint64_t v8 = [(DKDiagnosticHostContext *)self delegate];
    id v9 = [v8 hostServicesDelegate];

    [v9 enableVolumeHUD:v3];
  }
}

- (void)remoteHostSetScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(DKDiagnosticHostContext *)self delegate];
  uint64_t v8 = [v7 hostServicesDelegate];
  int v9 = [v8 conformsToProtocol:&unk_26F0E77E0];

  if (v9)
  {
    id v10 = [(DKDiagnosticHostContext *)self delegate];
    id v12 = [v10 hostServicesDelegate];

    *(float *)&double v11 = a3;
    [v12 setScreenToBrightness:v4 animate:v11];
  }
}

- (void)remoteHostGetAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  uint64_t v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::getAsset:completion:", v14, 2u);
  }

  int v9 = [(DKDiagnosticHostContext *)self delegate];
  id v10 = [v9 hostServicesDelegate];
  int v11 = [v10 conformsToProtocol:&unk_26F0E7480];

  if (v11)
  {
    id v12 = [(DKDiagnosticHostContext *)self delegate];
    uint64_t v13 = [v12 hostServicesDelegate];

    [v13 getAsset:v6 completion:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)remoteHostUploadAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *, void *))a4;
  uint64_t v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "DKDiagnosticHostContext::uploadAssets:completion:", v15, 2u);
  }

  int v9 = [(DKDiagnosticHostContext *)self delegate];
  id v10 = [v9 hostServicesDelegate];
  int v11 = [v10 conformsToProtocol:&unk_26F0E7480];

  if (v11)
  {
    id v12 = [(DKDiagnosticHostContext *)self delegate];
    uint64_t v13 = [v12 hostServicesDelegate];

    [v13 uploadAssets:v6 completion:v7];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263EFF8C0] array];
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:@"DKErrorDomain" code:-1008 userInfo:0];
    v7[2](v7, v13, v14);
  }
}

- (void)remoteHostCompleteWithResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DKDiagnosticHostContext *)self delegate];
  [v8 completeWithPayload:v7 completion:v6];
}

- (void)remoteHostDismissViewControllerWithCompletion:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(DKDiagnosticHostContext *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(DKDiagnosticHostContext *)self delegate];
    [v6 dismissViewControllerWithCompletion:v7];
  }
}

- (void)remoteHostShowUI:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(DKDiagnosticHostContext *)self delegate];
  id v8 = [v7 hostServicesDelegate];
  int v9 = [v8 conformsToProtocol:&unk_26F0E74F8];

  if (v9)
  {
    id v10 = [(DKDiagnosticHostContext *)self delegate];
    int v11 = [v10 hostServicesDelegate];

    [v11 showUI:v12 completion:v6];
  }
}

- (void)remoteHostRequestPluginReloadOnFinishWithCompletion:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(DKDiagnosticHostContext *)self delegate];
  char v5 = [v4 hostServicesDelegate];
  int v6 = [v5 conformsToProtocol:&unk_26F0E79D8];

  if (v6)
  {
    id v7 = [(DKDiagnosticHostContext *)self delegate];
    id v8 = [v7 hostServicesDelegate];

    [v8 requestPluginReloadOnFinishWithCompletion:v9];
  }
}

- (void)remoteHostRequestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(DKDiagnosticHostContext *)self delegate];
  char v5 = [v4 hostServicesDelegate];
  int v6 = [v5 conformsToProtocol:&unk_26F0E7610];

  if (v6)
  {
    id v7 = [(DKDiagnosticHostContext *)self delegate];
    id v8 = [v7 hostServicesDelegate];

    [v8 requestSessionAccessoryIdentifierWithCompletion:v9];
  }
}

- (void)remoteHostUnpairSessionAccessoryOnTestCompletion
{
  BOOL v3 = [(DKDiagnosticHostContext *)self delegate];
  BOOL v4 = [v3 hostServicesDelegate];
  int v5 = [v4 conformsToProtocol:&unk_26F0E7610];

  if (v5)
  {
    int v6 = [(DKDiagnosticHostContext *)self delegate];
    id v7 = [v6 hostServicesDelegate];

    [v7 unpairSessionAccessoryOnTestCompletion];
  }
}

- (void)remoteHostAllowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(DKDiagnosticHostContext *)self delegate];
  int v5 = [v4 hostServicesDelegate];
  int v6 = [v5 conformsToProtocol:&unk_26F0E7610];

  if (v6)
  {
    id v7 = [(DKDiagnosticHostContext *)self delegate];
    id v8 = [v7 hostServicesDelegate];

    [v8 allowSessionAccessoryDisconnectForDuration:v9];
  }
}

- (void)remoteHostClearAllowSessionAccessoryDisconnect
{
  BOOL v3 = [(DKDiagnosticHostContext *)self delegate];
  BOOL v4 = [v3 hostServicesDelegate];
  int v5 = [v4 conformsToProtocol:&unk_26F0E7610];

  if (v5)
  {
    int v6 = [(DKDiagnosticHostContext *)self delegate];
    id v7 = [v6 hostServicesDelegate];

    [v7 clearAllowSessionAccessoryDisconnect];
  }
}

- (void)remoteHostDisplayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(DKDiagnosticHostContext *)self delegate];
  uint64_t v14 = [v13 hostServicesDelegate];
  int v15 = [v14 conformsToProtocol:&unk_26F0E7708];

  if (v15)
  {
    v16 = [(DKDiagnosticHostContext *)self delegate];
    v17 = [v16 hostServicesDelegate];

    [v17 displayAlertWithHeader:v18 message:v10 buttonStrings:v11 completion:v12];
  }
}

- (void)remoteHostDisplayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  id v27 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = [(DKDiagnosticHostContext *)self delegate];
  __int16 v22 = [v21 hostServicesDelegate];
  int v23 = [v22 conformsToProtocol:&unk_26F0E7708];

  if (v23)
  {
    uint64_t v24 = [(DKDiagnosticHostContext *)self delegate];
    v25 = [v24 hostServicesDelegate];

    [v25 displayInstructions:v27 style:a4 imageLocators:v15 title:v16 subtitle:v17 iconLocator:v18 options:v19 completion:v20];
  }
}

- (void)remoteHostShowStatusBar
{
  BOOL v3 = [(DKDiagnosticHostContext *)self delegate];
  BOOL v4 = [v3 hostServicesDelegate];
  int v5 = [v4 conformsToProtocol:&unk_26F0E7948];

  if (v5)
  {
    int v6 = [(DKDiagnosticHostContext *)self delegate];
    id v7 = [v6 hostServicesDelegate];

    [v7 showStatusBar];
  }
}

- (void)remoteHostHideStatusBar
{
  BOOL v3 = [(DKDiagnosticHostContext *)self delegate];
  BOOL v4 = [v3 hostServicesDelegate];
  int v5 = [v4 conformsToProtocol:&unk_26F0E7948];

  if (v5)
  {
    int v6 = [(DKDiagnosticHostContext *)self delegate];
    id v7 = [v6 hostServicesDelegate];

    [v7 hideStatusBar];
  }
}

- (void)remoteHostSetStatusBarStyle:(int64_t)a3
{
  int v5 = [(DKDiagnosticHostContext *)self delegate];
  int v6 = [v5 hostServicesDelegate];
  int v7 = [v6 conformsToProtocol:&unk_26F0E7948];

  if (v7)
  {
    id v8 = [(DKDiagnosticHostContext *)self delegate];
    id v9 = [v8 hostServicesDelegate];

    [v9 setStatusBarStyle:a3];
  }
}

- (DKExtensionHostAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DKExtensionHostAdapterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)isXPC
{
  return self->_isXPC;
}

- (void)setIsXPC:(BOOL)a3
{
  self->_isXPC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__DKDiagnosticHostContext_startWithPayload_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_23D039000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
}

void __48__DKDiagnosticHostContext_cancelWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_23D039000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
}

void __63__DKDiagnosticHostContext_setNotAllowListedWithContactMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_23D039000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
}

void __57__DKDiagnosticHostContext_checkShouldShowViewController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_23D039000, v0, v1, "%s Failed to retrieve remote object proxy: %@", v2, v3, v4, v5, 2u);
}

@end