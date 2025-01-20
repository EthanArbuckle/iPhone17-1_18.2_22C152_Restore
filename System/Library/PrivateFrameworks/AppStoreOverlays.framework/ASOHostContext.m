@interface ASOHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)serviceContext;
- (void)dismissOverlayWithReply:(id)a3;
- (void)presentOverlayWithConfiguration:(id)a3 delegate:(id)a4 reply:(id)a5;
@end

@implementation ASOHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

uint64_t __49__ASOHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C98C360];

  return MEMORY[0x270F9A758]();
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

void __51__ASOHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9A95D8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C99FA70];
  [(id)_extensionAuxiliaryVendorProtocol___interface setInterface:v2 forSelector:sel_presentOverlayWithConfiguration_delegate_reply_ argumentIndex:1 ofReply:0];
  v3 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t Class = ASOSignpostSpanGetClass(v9, v5);
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:3];
  v7 = objc_msgSend(v4, "setWithArray:", v6, v8);
  [v3 setClasses:v7 forSelector:sel_presentOverlayWithConfiguration_delegate_reply_ argumentIndex:0 ofReply:0];
}

- (id)serviceContext
{
  v2 = [(ASOHostContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)presentOverlayWithConfiguration:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ASOHostContext *)self serviceContext];
  [v11 presentOverlayWithConfiguration:v10 delegate:v9 reply:v8];
}

- (void)dismissOverlayWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(ASOHostContext *)self serviceContext];
  [v5 dismissOverlayWithReply:v4];
}

@end