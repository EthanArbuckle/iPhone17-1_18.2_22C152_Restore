@interface CXProviderExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
@end

@implementation CXProviderExtensionContext

- (id)remoteObjectProxy
{
  return [(CXProviderExtensionContext *)self remoteObjectProxyWithErrorHandler:0];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CXProviderExtensionContext *)self _auxiliaryConnection];
  v6 = v5;
  if (v4) {
    [v5 remoteObjectProxyWithErrorHandler:v4];
  }
  else {
  v7 = [v5 remoteObjectProxy];
  }

  return v7;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;

  return v2;
}

uint64_t __63__CXProviderExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_interface = objc_msgSend(MEMORY[0x1E4F29280], "cx_providerVendorInterface");

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;

  return v2;
}

uint64_t __61__CXProviderExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_interface = objc_msgSend(MEMORY[0x1E4F29280], "cx_providerHostInterface");

  return MEMORY[0x1F41817F8]();
}

@end