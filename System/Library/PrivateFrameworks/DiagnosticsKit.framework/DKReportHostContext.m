@interface DKReportHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (DKExtensionHostAdapterDelegate)delegate;
- (void)cancelWithCompletion:(id)a3;
- (void)completeRemoteWithReport:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startWithPayload:(id)a3 completion:(id)a4;
@end

@implementation DKReportHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  return v2;
}

void __56__DKReportHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E6A48];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_startRemoteReportWithComponentIdentity_completion_ argumentIndex:0 ofReply:0];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_51);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;
  return v2;
}

void __54__DKReportHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E6240];
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_completeRemoteWithReport_completion_ argumentIndex:0 ofReply:0];
}

- (void)startWithPayload:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[DKReportHostContext startWithPayload:completion:]";
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = [(DKReportHostContext *)self _auxiliaryConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__DKReportHostContext_startWithPayload_completion___block_invoke;
  v13[3] = &unk_264E86668;
  v13[4] = self;
  v10 = [v9 remoteObjectProxyWithErrorHandler:v13];

  v11 = [(DKReportHostContext *)self _auxiliaryConnection];
  [v11 setInterruptionHandler:&__block_literal_global_61];

  v12 = [(DKReportHostContext *)self _auxiliaryConnection];
  [v12 setInvalidationHandler:&__block_literal_global_64];

  if (!v7) {
    v7 = (void (**)(id, void))&__block_literal_global_67;
  }
  if (v10) {
    [v10 startRemoteReportWithComponentIdentity:v6 completion:v7];
  }
  else {
    v7[2](v7, 0);
  }
}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__DKReportHostContext_startWithPayload_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) cancelRequestWithError:v3];
  +[DKAnalytics sendAnalyticsWithEvent:2 error:v3];
}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke_59()
{
  id v0 = [MEMORY[0x263F087E8] errorWithDomain:@"DKReportHostContextConnectionInterrupted" code:0 userInfo:0];
  +[DKAnalytics sendAnalyticsWithEvent:0 error:v0];
}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke_2()
{
  id v0 = [MEMORY[0x263F087E8] errorWithDomain:@"DKReportHostContextConnectionInvalidated" code:0 userInfo:0];
  +[DKAnalytics sendAnalyticsWithEvent:1 error:v0];
}

- (void)cancelWithCompletion:(id)a3
{
  id v6 = a3;
  v4 = [(DKReportHostContext *)self delegate];
  [v4 cancelExtensionRequest];

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

- (void)completeRemoteWithReport:(id)a3 completion:(id)a4
{
  id v6 = (void (*)(id))*((void *)a4 + 2);
  id v7 = a3;
  v6(a4);
  id v8 = [(DKReportHostContext *)self delegate];
  [v8 completeWithPayload:v7 completion:&__block_literal_global_69];
}

- (DKExtensionHostAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DKExtensionHostAdapterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __51__DKReportHostContext_startWithPayload_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[DKReportHostContext startWithPayload:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)&v2, 0x16u);
}

@end