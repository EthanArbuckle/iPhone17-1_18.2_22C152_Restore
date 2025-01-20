@interface DKDiagnosticContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isPresentingView;
- (BOOL)isXPC;
- (DKDiagnosticContext)initWithConnection:(id)a3;
- (NSXPCConnection)xpcConnection;
- (id)_extensionAttributes;
- (id)_getRemoteProxyAndSetUpHandlers;
- (id)_helperConnnection;
- (id)_helperPrincipalObject;
- (id)_testName;
- (id)testID;
- (id)xpcPrincipalObject;
- (void)allowSessionAccessoryDisconnectForDuration:(id)a3;
- (void)cancelRemoteDiagnosticWithCompletion:(id)a3;
- (void)checkShouldShowRemoteDiagnosticViewController:(id)a3;
- (void)clearAllowSessionAccessoryDisconnect;
- (void)completeWithDiagnosticResult:(id)a3 completion:(id)a4;
- (void)dismissRemoteDiagnosticViewControllerWithCompletion:(id)a3;
- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6;
- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10;
- (void)enableVolumeHUD:(BOOL)a3;
- (void)getAsset:(id)a3 completion:(id)a4;
- (void)hideStatusBar;
- (void)requestPluginReloadOnFinishWithCompletion:(id)a3;
- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3;
- (void)setIsPresentingView:(BOOL)a3;
- (void)setIsXPC:(BOOL)a3;
- (void)setRemoteDiagnosticNotAllowListedWithContactMessage:(id)a3;
- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcPrincipalObject:(id)a3;
- (void)showStatusBar;
- (void)showUI:(id)a3 completion:(id)a4;
- (void)startRemoteDiagnosticWithDiagnosticParameters:(id)a3 completion:(id)a4;
- (void)unpairSessionAccessoryOnTestCompletion;
- (void)updateProgress:(id)a3 forTest:(id)a4;
- (void)uploadAssets:(id)a3 completion:(id)a4;
@end

@implementation DKDiagnosticContext

- (DKDiagnosticContext)initWithConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DKDiagnosticContext;
  v6 = [(DKDiagnosticContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v7->_isXPC = 1;
    id xpcPrincipalObject = v7->_xpcPrincipalObject;
    v7->_id xpcPrincipalObject = 0;

    v7->_isPresentingView = 0;
  }

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  v4 = [(DKDiagnosticContext *)self _helperConnnection];
  if (v4)
  {
    v6 = v4;
    [v4 auditToken];
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)_helperConnnection
{
  if ([(DKDiagnosticContext *)self isXPC]
    && ([(DKDiagnosticContext *)self xpcConnection],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(DKDiagnosticContext *)self xpcConnection];
  }
  else
  {
    v4 = [(DKDiagnosticContext *)self _auxiliaryConnection];
  }
  return v4;
}

- (id)_helperPrincipalObject
{
  if ([(DKDiagnosticContext *)self isXPC]
    && ([(DKDiagnosticContext *)self xpcPrincipalObject],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(DKDiagnosticContext *)self xpcPrincipalObject];
  }
  else
  {
    v4 = [(DKDiagnosticContext *)self _principalObject];
  }
  return v4;
}

- (id)testID
{
  v2 = [(DKDiagnosticContext *)self _extensionAttributes];
  v3 = [v2 objectForKeyedSubscript:@"DKDiagnosticIdentifier"];

  return v3;
}

- (id)_testName
{
  v2 = [(DKDiagnosticContext *)self _extensionAttributes];
  v3 = [v2 objectForKeyedSubscript:@"DKDiagnosticName"];

  return v3;
}

- (id)_extensionAttributes
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"NSExtension"];

  v4 = [v3 objectForKeyedSubscript:@"NSExtensionAttributes"];

  return v4;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1, &__block_literal_global_6);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_1;
  return v2;
}

void __56__DKDiagnosticContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E6FB8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_1;
  _extensionAuxiliaryVendorProtocol_interface_1 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_1;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_startRemoteDiagnosticWithDiagnosticParameters_completion_ argumentIndex:0 ofReply:0];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1, &__block_literal_global_74);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_1;
  return v2;
}

void __54__DKDiagnosticContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E7370];
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_1;
  _extensionAuxiliaryHostProtocol_interface_1 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_1;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_remoteHostCompleteWithResult_completion_ argumentIndex:0 ofReply:0];
}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v8 remoteHostUpdateProgress:v7 forTest:v6];
}

- (void)enableVolumeHUD:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v4 remoteHostEnableVolumeHUD:v3];
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  *(float *)&double v6 = a3;
  [v7 remoteHostSetScreenToBrightness:v4 animate:v6];
}

- (void)getAsset:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[DKDiagnosticContext getAsset:completion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v9 remoteHostGetAsset:v6 completion:v7];
}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "-[DKDiagnosticContext uploadAssets:completion:]";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
  }

  v9 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v9 remoteHostUploadAssets:v6 completion:v7];
}

- (void)showUI:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[DKDiagnosticContext showUI:completion:]";
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v9 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v9 remoteHostShowUI:v7 completion:v6];
}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[DKDiagnosticContext requestSessionAccessoryIdentifierWithCompletion:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v6 remoteHostRequestSessionAccessoryIdentifierWithCompletion:v4];
}

- (void)unpairSessionAccessoryOnTestCompletion
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DKDiagnosticContext unpairSessionAccessoryOnTestCompletion]";
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v4 remoteHostUnpairSessionAccessoryOnTestCompletion];
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[DKDiagnosticContext allowSessionAccessoryDisconnectForDuration:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v6 remoteHostAllowSessionAccessoryDisconnectForDuration:v4];
}

- (void)clearAllowSessionAccessoryDisconnect
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DKDiagnosticContext clearAllowSessionAccessoryDisconnect]";
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v4 remoteHostClearAllowSessionAccessoryDisconnect];
}

- (void)requestPluginReloadOnFinishWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[DKDiagnosticContext requestPluginReloadOnFinishWithCompletion:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v6 remoteHostRequestPluginReloadOnFinishWithCompletion:v4];
}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void *))a6;
  uint64_t v14 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[DKDiagnosticContext displayAlertWithHeader:message:buttonStrings:completion:]";
    _os_log_impl(&dword_23D039000, v14, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([(DKDiagnosticContext *)self isPresentingView])
  {
    v15 = DiagnosticsKitLogHandleForCategory(4);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D039000, v15, OS_LOG_TYPE_DEFAULT, "Not calling displayAlertWithHeader: because DK is currently presenting a view controller", buf, 2u);
    }

    id v16 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v19 = *MEMORY[0x263F08320];
    v20 = @"This DiagnosticsKit extension is already presenting a view controller";
    v17 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v18 = (void *)[v16 initWithDomain:@"com.apple.DiagnosticsKit" code:-1 userInfo:v17];

    v13[2](v13, &unk_26F0DB9F0, v18);
  }
  else
  {
    v18 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
    [v18 remoteHostDisplayAlertWithHeader:v10 message:v11 buttonStrings:v12 completion:v13];
  }
}

- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  uint64_t v14 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = (void (**)(id, __CFString *, void *))a10;
  uint64_t v23 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[DKDiagnosticContext displayInstructions:style:imageLocators:title:subtitle:iconLocator:options:completion:]";
    _os_log_impl(&dword_23D039000, v23, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if ([(DKDiagnosticContext *)self isPresentingView])
  {
    v24 = DiagnosticsKitLogHandleForCategory(4);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D039000, v24, OS_LOG_TYPE_DEFAULT, "Not calling displayInstructions: because DK is currently presenting a view controller", buf, 2u);
    }

    id v25 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = @"This DiagnosticsKit extension is already presenting a view controller";
    v26 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v27 = (void *)[v25 initWithDomain:@"com.apple.DiagnosticsKit" code:-1 userInfo:v26];

    v22[2](v22, &stru_26F0D5118, v27);
  }
  else
  {
    v27 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
    [v27 remoteHostDisplayInstructions:v16 style:v14 imageLocators:v17 title:v18 subtitle:v19 iconLocator:v20 options:v21 completion:v22];
  }
}

- (void)showStatusBar
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DKDiagnosticContext showStatusBar]";
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v4 remoteHostShowStatusBar];
}

- (void)hideStatusBar
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DKDiagnosticContext hideStatusBar]";
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v4 remoteHostHideStatusBar];
}

- (void)setStatusBarStyle:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[DKDiagnosticContext setStatusBarStyle:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v6 remoteHostSetStatusBarStyle:a3];
}

- (void)startRemoteDiagnosticWithDiagnosticParameters:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[DKDiagnosticContext startRemoteDiagnosticWithDiagnosticParameters:completion:]";
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v9 = [(DKDiagnosticContext *)self _helperPrincipalObject];
  id v10 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v9;
    _os_log_impl(&dword_23D039000, v10, OS_LOG_TYPE_DEFAULT, "Diagnostic: %@", buf, 0xCu);
  }

  BOOL v11 = [(DKDiagnosticContext *)self isXPC];
  id v12 = MEMORY[0x263EF83A0];
  if (v11)
  {
    id v13 = dispatch_get_global_queue(21, 0);
  }
  else
  {
    id v13 = MEMORY[0x263EF83A0];
    id v14 = MEMORY[0x263EF83A0];
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke;
  v19[3] = &unk_264E86800;
  id v20 = v9;
  id v21 = v6;
  v22 = self;
  id v23 = v7;
  id v15 = v7;
  id v16 = v6;
  id v17 = v9;
  dispatch_async(v13, v19);
  if (v11) {
    id v18 = v13;
  }
  else {
    id v18 = v12;
  }
}

void __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) predicates];
  id v4 = [*(id *)(a1 + 40) specifications];
  int v5 = [*(id *)(a1 + 40) parameters];
  id v6 = +[DKUtilities inputsForDiagnostic:v2 predicates:v3 specifications:v4 parameters:v5];

  if ([*(id *)(a1 + 32) isFinished]) {
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) setSetup:1];
  id v7 = [*(id *)(a1 + 32) result];
  [v7 setStatusCode:&unk_26F0DBA08];

  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) setupWithInputs:v6 responder:*(void *)(a1 + 48)];
  }
  if ([*(id *)(a1 + 32) isFinished])
  {
LABEL_5:
    uint64_t v8 = 0;
  }
  else if ([*(id *)(a1 + 48) isXPC])
  {
    id v10 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke_130;
    block[3] = &unk_264E86710;
    id v12 = *(id *)(a1 + 32);
    dispatch_async(v10, block);

    uint64_t v8 = 1;
  }
  else
  {
    [*(id *)(a1 + 32) start];
    uint64_t v8 = [*(id *)(a1 + 32) isFinished] ^ 1;
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);
  }
}

uint64_t __80__DKDiagnosticContext_startRemoteDiagnosticWithDiagnosticParameters_completion___block_invoke_130(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (void)cancelRemoteDiagnosticWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[DKDiagnosticContext cancelRemoteDiagnosticWithCompletion:]";
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(DKDiagnosticContext *)self _helperPrincipalObject];
  id v7 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v8 = [v7 bundleIdentifier];
  uint64_t v9 = [v8 stringByAppendingString:@".cancelQueue"];

  id v10 = v9;
  BOOL v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__DKDiagnosticContext_cancelRemoteDiagnosticWithCompletion___block_invoke;
  v14[3] = &unk_264E86828;
  id v15 = v6;
  id v16 = v4;
  id v12 = v4;
  id v13 = v6;
  dispatch_async(v11, v14);
}

uint64_t __60__DKDiagnosticContext_cancelRemoteDiagnosticWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) result];
  [v2 setStatusCode:&unk_26F0DBA20];

  [*(id *)(a1 + 32) setCancelled:1];
  BOOL v3 = [*(id *)(a1 + 32) progress];
  [v3 cancel];

  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) cancel];
  }
  [*(id *)(a1 + 32) setFinished:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)completeWithDiagnosticResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__DKDiagnosticContext_completeWithDiagnosticResult_completion___block_invoke;
  v10[3] = &unk_264E86850;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 remoteHostCompleteWithResult:v7 completion:v10];
}

uint64_t __63__DKDiagnosticContext_completeWithDiagnosticResult_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = [*(id *)(a1 + 32) isXPC];
  if (result)
  {
    id v4 = [*(id *)(a1 + 32) xpcConnection];
    [v4 invalidate];

    [*(id *)(a1 + 32) setXpcConnection:0];
    int v5 = *(void **)(a1 + 32);
    return [v5 setXpcPrincipalObject:0];
  }
  return result;
}

- (void)checkShouldShowRemoteDiagnosticViewController:(id)a3
{
  id v4 = a3;
  int v5 = [(DKDiagnosticContext *)self _helperPrincipalObject];
  id v6 = [MEMORY[0x263F086E0] mainBundle];
  id v7 = [v6 bundleIdentifier];
  uint64_t v8 = [v7 stringByAppendingString:@".checkShowViewControllerQueue"];

  id v9 = v8;
  id v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__DKDiagnosticContext_checkShouldShowRemoteDiagnosticViewController___block_invoke;
  v13[3] = &unk_264E86828;
  id v14 = v5;
  id v15 = v4;
  id v11 = v4;
  id v12 = v5;
  dispatch_async(v10, v13);
}

uint64_t __69__DKDiagnosticContext_checkShouldShowRemoteDiagnosticViewController___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 shouldShowViewControllerInHostApp:v3];
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      int v5 = *(uint64_t (**)(void))(result + 16);
      return v5();
    }
  }
  return result;
}

- (void)dismissRemoteDiagnosticViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DKDiagnosticContext *)self _getRemoteProxyAndSetUpHandlers];
  [v5 remoteHostDismissViewControllerWithCompletion:v4];
}

- (void)setRemoteDiagnosticNotAllowListedWithContactMessage:(id)a3
{
  id v4 = a3;
  id v5 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    [(DKDiagnosticContext *)self setRemoteDiagnosticNotAllowListedWithContactMessage:v5];
  }
}

- (id)_getRemoteProxyAndSetUpHandlers
{
  uint64_t v3 = [(DKDiagnosticContext *)self _helperConnnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_145];

  id v5 = [(DKDiagnosticContext *)self _helperConnnection];
  [v5 setInterruptionHandler:&__block_literal_global_149];

  id v6 = [(DKDiagnosticContext *)self _helperConnnection];
  [v6 setInvalidationHandler:&__block_literal_global_151];

  return v4;
}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_cold_1((uint64_t)v2, v3);
  }

  +[DKAnalytics sendAnalyticsWithEvent:2 error:v2];
}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_147()
{
  id v0 = [MEMORY[0x263F087E8] errorWithDomain:@"DKDiagnosticsContextConnectionInterrupted" code:0 userInfo:0];
  +[DKAnalytics sendAnalyticsWithEvent:0 error:v0];
}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_2()
{
  id v0 = [MEMORY[0x263F087E8] errorWithDomain:@"DKDiagnosticsContextConnectionInvalidated" code:0 userInfo:0];
  +[DKAnalytics sendAnalyticsWithEvent:1 error:v0];
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

- (id)xpcPrincipalObject
{
  return self->_xpcPrincipalObject;
}

- (void)setXpcPrincipalObject:(id)a3
{
}

- (BOOL)isPresentingView
{
  return self->_isPresentingView;
}

- (void)setIsPresentingView:(BOOL)a3
{
  self->_isPresentingView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_xpcPrincipalObject, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)setRemoteDiagnosticNotAllowListedWithContactMessage:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = [a1 testID];
  id v7 = [a1 _testName];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_fault_impl(&dword_23D039000, a3, OS_LOG_TYPE_FAULT, "This DiagnosticsKit extension (%@ - %@) is not allow listed with the DK host application. %@", (uint8_t *)&v8, 0x20u);
}

void __54__DKDiagnosticContext__getRemoteProxyAndSetUpHandlers__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve remote object proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end