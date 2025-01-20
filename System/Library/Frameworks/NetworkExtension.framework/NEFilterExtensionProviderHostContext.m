@interface NEFilterExtensionProviderHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation NEFilterExtensionProviderHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_4893 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_4893, &__block_literal_global_63_4894);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_protocol_4895;

  return v2;
}

uint64_t __71__NEFilterExtensionProviderHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_protocol_4895 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094180];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_4898 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_4898, &__block_literal_global_4899);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_4900;

  return v2;
}

uint64_t __73__NEFilterExtensionProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_protocol_4900 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF094120];

  return MEMORY[0x1F41817F8]();
}

- (int)requiredEntitlement
{
  return 4;
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 startFilterWithOptions:v7 completionHandler:v6];
}

@end