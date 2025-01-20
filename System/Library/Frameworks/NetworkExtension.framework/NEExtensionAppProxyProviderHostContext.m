@interface NEExtensionAppProxyProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3;
- (void)setDelegateInterface:(unsigned int)a3;
- (void)setInitialFlowDivertControlSocket:(id)a3;
@end

@implementation NEExtensionAppProxyProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_2005 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_2005, &__block_literal_global_69_2006);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_2007;

  return v2;
}

uint64_t __73__NEExtensionAppProxyProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_2007 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092B08];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2010 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2010, &__block_literal_global_2011);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2012;

  return v2;
}

uint64_t __75__NEExtensionAppProxyProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_2012 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF092A70];

  return MEMORY[0x1F41817F8]();
}

- (int)requiredEntitlement
{
  return 2;
}

- (void)openFlowDivertControlSocketWithCompletionHandler:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext delegate]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 extension:self didRequestFlowDivertControlSocketWithCompletionHandler:v4];
}

- (void)setDelegateInterface:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setDelegateInterface:v3];
}

- (void)setInitialFlowDivertControlSocket:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setInitialFlowDivertControlSocket:v4];
}

@end