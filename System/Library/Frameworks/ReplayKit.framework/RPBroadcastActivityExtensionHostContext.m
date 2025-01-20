@interface RPBroadcastActivityExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (RPBroadcastActivityHostViewController)hostViewController;
- (id)extensionObjectProxy;
- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6;
- (void)presentationInfoWithCompletion:(id)a3;
- (void)setHostViewController:(id)a3;
@end

@implementation RPBroadcastActivityExtensionHostContext

- (void)extensionDidFinishWithLaunchURL:(id)a3 broadcastURL:(id)a4 extensionBundleID:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  p_hostViewController = &self->_hostViewController;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  [WeakRetained extensionDidFinishWithLaunchURL:v12 broadcastURL:v11 extensionBundleID:v10 cancelled:v6];
}

- (void)presentationInfoWithCompletion:(id)a3
{
  p_hostViewController = &self->_hostViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  [WeakRetained presentationInfoWithCompletion:v4];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D144BC0];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D130B60];
}

- (id)extensionObjectProxy
{
  v2 = [(RPBroadcastActivityExtensionHostContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];

  return v3;
}

void __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(a2);
  }
}

- (RPBroadcastActivityHostViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (RPBroadcastActivityHostViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

void __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = [a1 code];
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error calling extension - %i", (uint8_t *)v1, 8u);
}

@end