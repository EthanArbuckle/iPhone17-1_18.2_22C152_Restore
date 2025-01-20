@interface _INUIExtensionHostContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (INUIExtensionHostContextDelegate)extensionHostContextDelegate;
- (id)_errorHandlingExtensionContextProxy;
- (void)requestHandlingOfIntent:(id)a3;
- (void)setExtensionContextState:(id)a3 completion:(id)a4;
- (void)setExtensionHostContextDelegate:(id)a3;
- (void)willBeginEditing;
@end

@implementation _INUIExtensionHostContext

+ (id)_allowedItemPayloadClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextVendingInterface];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextHostingInterface];
}

- (void).cxx_destruct
{
}

- (void)setExtensionHostContextDelegate:(id)a3
{
}

- (INUIExtensionHostContextDelegate)extensionHostContextDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionHostContextDelegate);

  return (INUIExtensionHostContextDelegate *)WeakRetained;
}

- (void)willBeginEditing
{
  id v3 = [(_INUIExtensionHostContext *)self extensionHostContextDelegate];
  [v3 extensionHostContextWillBeginEditing:self];
}

- (void)requestHandlingOfIntent:(id)a3
{
  id v4 = a3;
  id v5 = [(_INUIExtensionHostContext *)self extensionHostContextDelegate];
  [v5 extensionHostContext:self wantsToHandleIntent:v4];
}

- (id)_errorHandlingExtensionContextProxy
{
  v2 = [(_INUIExtensionHostContext *)self _auxiliaryConnection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_357];

  return v3;
}

- (void)setExtensionContextState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_INUIExtensionHostContext *)self _errorHandlingExtensionContextProxy];
  [v8 setExtensionContextState:v7 completion:v6];
}

@end