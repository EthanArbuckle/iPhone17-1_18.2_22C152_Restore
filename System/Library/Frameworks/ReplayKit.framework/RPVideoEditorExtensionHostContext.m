@interface RPVideoEditorExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (RPVideoEditorHostViewController)hostViewController;
- (id)extensionObjectProxy;
- (void)extensionDidFinishWithActivityTypes:(id)a3;
- (void)setHostViewController:(id)a3;
@end

@implementation RPVideoEditorExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D144C20];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D138E20];
}

- (void)extensionDidFinishWithActivityTypes:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPVideoEditorExtensionHostContext:extensionsDidFinish", v6, 2u);
  }
  v5 = [(RPVideoEditorExtensionHostContext *)self hostViewController];
  [v5 extensionDidFinishWithActivityTypes:v4];
}

- (id)extensionObjectProxy
{
  v2 = [(RPVideoEditorExtensionHostContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_6];

  return v3;
}

void __57__RPVideoEditorExtensionHostContext_extensionObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __63__RPBroadcastActivityExtensionHostContext_extensionObjectProxy__block_invoke_cold_1(a2);
  }
}

- (RPVideoEditorHostViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (RPVideoEditorHostViewController *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end