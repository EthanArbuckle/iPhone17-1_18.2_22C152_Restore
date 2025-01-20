@interface SLInternalComposeServiceVendorContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)shouldShowNetworkActivityIndicator:(id)a3;
@end

@implementation SLInternalComposeServiceVendorContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_11 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_11, &__block_literal_global_14);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_12;

  return v2;
}

uint64_t __74__SLInternalComposeServiceVendorContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface_12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E41C38];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_15 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_15, &__block_literal_global_18);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_16;

  return v2;
}

uint64_t __72__SLInternalComposeServiceVendorContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface_16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E41BD8];

  return MEMORY[0x1F41817F8]();
}

- (void)shouldShowNetworkActivityIndicator:(id)a3
{
  id v7 = a3;
  _SLLog(v3, 7, @"SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: %@");
  v5 = [(SLInternalComposeServiceVendorContext *)self _auxiliaryConnection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_24];

  if (v6)
  {
    _SLLog(v3, 7, @"SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: calling host %@");
    objc_msgSend(v6, "shouldShowNetworkActivityIndicator:", v7, v6);
  }
  else
  {
    _SLLog(v3, 3, @"SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: had nil host. bailing.");
  }
}

void __76__SLInternalComposeServiceVendorContext_shouldShowNetworkActivityIndicator___block_invoke()
{
  _SLLog(v0, 3, @"SLInternalComposeServiceVendorContext shouldShowNetworkActivityIndicator: failed to get host %@");
}

@end