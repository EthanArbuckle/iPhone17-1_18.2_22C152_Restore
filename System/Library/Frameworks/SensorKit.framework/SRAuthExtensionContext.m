@interface SRAuthExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)remoteProxy;
- (void)openURL:(id)a3 completionHandler:(id)a4;
@end

@implementation SRAuthExtensionContext

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
  v2 = (void *)[(SRAuthExtensionContext *)self _auxiliaryConnection];

  return (id)[v2 remoteObjectProxy];
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6 = [(SRAuthExtensionContext *)self remoteProxy];

  [v6 openURL:a3 completionHandler:a4];
}

@end