@interface SRAuthHostExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)remoteProxy;
- (void)openURL:(id)a3 completionHandler:(id)a4;
@end

@implementation SRAuthHostExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D181298];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D17A7A8];
}

- (id)remoteProxy
{
  v2 = (void *)[(SRAuthHostExtensionContext *)self _auxiliaryConnection];

  return (id)[v2 remoteObjectProxy];
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace"), "openURL:withOptions:", a3, 0);
  v6 = (void (*)(id, uint64_t))*((void *)a4 + 2);

  v6(a4, v5);
}

@end