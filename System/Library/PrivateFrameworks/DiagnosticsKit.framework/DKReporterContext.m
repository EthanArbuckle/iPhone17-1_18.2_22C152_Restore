@interface DKReporterContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)completeWithReport:(id)a3 completion:(id)a4;
- (void)startRemoteReportWithComponentIdentity:(id)a3 completion:(id)a4;
@end

@implementation DKReporterContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_0;
  return v2;
}

void __54__DKReporterContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E6A48];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_0;
  _extensionAuxiliaryVendorProtocol_interface_0 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface_0;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_startRemoteReportWithComponentIdentity_completion_ argumentIndex:0 ofReply:0];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_51_0);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_0;
  return v2;
}

void __52__DKReporterContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F0E6240];
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_0;
  _extensionAuxiliaryHostProtocol_interface_0 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol_interface_0;
  id v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_completeRemoteWithReport_completion_ argumentIndex:0 ofReply:0];
}

- (void)completeWithReport:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[DKReporterContext completeWithReport:completion:]";
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = [(DKReporterContext *)self _auxiliaryConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__DKReporterContext_completeWithReport_completion___block_invoke;
  v13[3] = &unk_264E86668;
  v13[4] = self;
  v10 = [v9 remoteObjectProxyWithErrorHandler:v13];

  v11 = [(DKReporterContext *)self _auxiliaryConnection];
  [v11 setInterruptionHandler:&__block_literal_global_61_0];

  v12 = [(DKReporterContext *)self _auxiliaryConnection];
  [v12 setInvalidationHandler:&__block_literal_global_64_0];

  if (!v7) {
    v7 = (void (**)(void))&__block_literal_global_66;
  }
  if (v10) {
    [v10 completeRemoteWithReport:v6 completion:v7];
  }
  else {
    v7[2](v7);
  }
}

void __51__DKReporterContext_completeWithReport_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__DKReporterContext_completeWithReport_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  [*(id *)(a1 + 32) cancelRequestWithError:v3];
  +[DKAnalytics sendAnalyticsWithEvent:2 error:v3];
}

void __51__DKReporterContext_completeWithReport_completion___block_invoke_59()
{
  id v0 = [MEMORY[0x263F087E8] errorWithDomain:@"DKReporterContextConnectionInterrupted" code:0 userInfo:0];
  +[DKAnalytics sendAnalyticsWithEvent:0 error:v0];
}

void __51__DKReporterContext_completeWithReport_completion___block_invoke_2()
{
  id v0 = [MEMORY[0x263F087E8] errorWithDomain:@"DKReporterContextConnectionInvalidated" code:0 userInfo:0];
  +[DKAnalytics sendAnalyticsWithEvent:1 error:v0];
}

- (void)startRemoteReportWithComponentIdentity:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, uint64_t))a4;
  id v7 = a3;
  v8 = DiagnosticsKitLogHandleForCategory(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[DKReporterContext startRemoteReportWithComponentIdentity:completion:]";
    _os_log_impl(&dword_23D039000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v6) {
    v6[2](v6, 1);
  }
  v9 = [(DKReporterContext *)self _principalObject];
  [v9 setComponentIdentity:v7];

  v10 = dispatch_get_global_queue(21, 0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__DKReporterContext_startRemoteReportWithComponentIdentity_completion___block_invoke;
  v12[3] = &unk_264E867B0;
  id v13 = v9;
  v14 = self;
  id v11 = v9;
  dispatch_async(v10, v12);
}

uint64_t __71__DKReporterContext_startRemoteReportWithComponentIdentity_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setupWithContext:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 start];
}

void __51__DKReporterContext_completeWithReport_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[DKReporterContext completeWithReport:completion:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "%s Failed to retrieve remote object proxy: %@", (uint8_t *)&v2, 0x16u);
}

@end