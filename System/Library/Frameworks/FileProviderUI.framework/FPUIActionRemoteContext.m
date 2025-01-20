@interface FPUIActionRemoteContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (FPUIActionRemoteContextDelegate)delegate;
- (void)_completeRequestWithUserInfo:(id)a3 error:(id)a4;
- (void)_didEncounterError:(id)a3 completionHandler:(id)a4;
- (void)_openExtensionURL:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FPUIActionRemoteContext

uint64_t __58__FPUIActionRemoteContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___hostInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E920058];

  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_51);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___vendorInterface;

  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___hostInterface;

  return v2;
}

uint64_t __60__FPUIActionRemoteContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___vendorInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E929EC8];

  return MEMORY[0x270F9A758]();
}

- (void)_openExtensionURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke;
  v10[3] = &unk_264C6CDB0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F3F5C0];
  v13[0] = @"FPUIAppLaunchOrigin";
  v2 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v3 = [MEMORY[0x263F01880] defaultWorkspace];
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = 0;
  char v5 = [v3 openSensitiveURL:v4 withOptions:v2 error:&v11];
  id v6 = v11;

  if ((v5 & 1) == 0)
  {
    v7 = fpuiLogHandle;
    if (!fpuiLogHandle)
    {
      FPUIInitLogging();
      v7 = fpuiLogHandle;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v6, v7);
    }
  }
  if (*(void *)(a1 + 40))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_55;
    v8[3] = &unk_264C6CD88;
    id v9 = *(id *)(a1 + 40);
    char v10 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

uint64_t __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_completeRequestWithUserInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__FPUIActionRemoteContext__completeRequestWithUserInfo_error___block_invoke;
  block[3] = &unk_264C6CDD8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__FPUIActionRemoteContext__completeRequestWithUserInfo_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteActionContextDidFinishAction:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_didEncounterError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__FPUIActionRemoteContext__didEncounterError_completionHandler___block_invoke;
  block[3] = &unk_264C6CCC0;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__FPUIActionRemoteContext__didEncounterError_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteActionContext:*(void *)(a1 + 32) didEncounterError:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (FPUIActionRemoteContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPUIActionRemoteContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

void __63__FPUIActionRemoteContext__openExtensionURL_completionHandler___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_235BE4000, log, OS_LOG_TYPE_ERROR, "FPUIActionExtensionContext failed to open URL %@ with error %@", (uint8_t *)&v4, 0x16u);
}

@end