@interface NEExtensionDNSProxyProviderHostContext
+ (id)_extensionAuxiliaryVendorProtocol;
- (int)requiredEntitlement;
- (void)setSystemDNSSettings:(id)a3;
@end

@implementation NEExtensionDNSProxyProviderHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2271 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2271, &__block_literal_global_2272);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2273;

  return v2;
}

void __75__NEExtensionDNSProxyProviderHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0939B0];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2273;
  _extensionAuxiliaryVendorProtocol_protocol_2273 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryVendorProtocol_protocol_2273 setClasses:v4 forSelector:sel_setSystemDNSSettings_ argumentIndex:0 ofReply:0];
}

- (int)requiredEntitlement
{
  return 16;
}

- (void)setSystemDNSSettings:(id)a3
{
  id v4 = a3;
  -[NEExtensionProviderHostContext vendorContext]((id *)&self->super.super.super.super.super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setSystemDNSSettings:v4];
}

@end