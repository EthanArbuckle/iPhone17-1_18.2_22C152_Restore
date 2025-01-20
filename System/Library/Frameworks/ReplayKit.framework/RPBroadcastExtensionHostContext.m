@interface RPBroadcastExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (RPBroadcastHostViewController)hostViewController;
- (id)extensionObjectProxy;
- (void)completeSetupWithBroadcastURL:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)updateBroadcastHandlerListenerEndpoint:(id)a3;
@end

@implementation RPBroadcastExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D13F558];
  v3 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_updateBroadcastHandlerListenerEndpoint_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D13F4D0];
}

- (id)extensionObjectProxy
{
  v2 = [(RPBroadcastExtensionHostContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_10];

  return v3;
}

void __55__RPBroadcastExtensionHostContext_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(a2);
  }
}

- (void)completeSetupWithBroadcastURL:(id)a3
{
  p_hostViewController = &self->_hostViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostViewController);
  [WeakRetained completeSetupWithBroadcastURL:v4];
}

- (void)updateBroadcastHandlerListenerEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(RPBroadcastExtensionHostContext *)self extensionObjectProxy];
  [v5 updateBroadcastHandlerListenerEndpoint:v4];
}

- (RPBroadcastHostViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (RPBroadcastHostViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end