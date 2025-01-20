@interface NEExtensionDNSProxyProviderContext
+ (id)_extensionAuxiliaryVendorProtocol;
- (Class)requiredProviderSuperClass;
- (id)extensionPoint;
- (void)setSystemDNSSettings:(id)a3;
@end

@implementation NEExtensionDNSProxyProviderContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_2171 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_2171, &__block_literal_global_2172);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2173;

  return v2;
}

void __71__NEExtensionDNSProxyProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0939B0];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_2173;
  _extensionAuxiliaryVendorProtocol_protocol_2173 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryVendorProtocol_protocol_2173 setClasses:v4 forSelector:sel_setSystemDNSSettings_ argumentIndex:0 ofReply:0];
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (id)extensionPoint
{
  return @"com.apple.networkextension.dns-proxy";
}

- (void)setSystemDNSSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(NEExtensionProviderContext *)self _principalObject];
  [v5 setSystemDNSSettings:v4];
}

@end