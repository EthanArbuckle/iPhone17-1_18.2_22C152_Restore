@interface INUIVoiceShortcutHostContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (INUIVoiceShortcutRemoteHostingInterface)delegate;
- (void)remoteViewControllerDidCancel;
- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4;
- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3;
- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation INUIVoiceShortcutHostContext

+ (id)_allowedItemPayloadClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerHostingInterface];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerServingInterface];
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (INUIVoiceShortcutRemoteHostingInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (INUIVoiceShortcutRemoteHostingInterface *)WeakRetained;
}

- (void)remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__INUIVoiceShortcutHostContext_remoteViewControllerDidDeleteVoiceShortcutWithIdentifier___block_invoke;
  v6[3] = &unk_263FD6E08;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __89__INUIVoiceShortcutHostContext_remoteViewControllerDidDeleteVoiceShortcutWithIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:*(void *)(a1 + 40)];
}

- (void)remoteViewControllerDidUpdateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__INUIVoiceShortcutHostContext_remoteViewControllerDidUpdateVoiceShortcut_error___block_invoke;
  block[3] = &unk_263FD69B8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __81__INUIVoiceShortcutHostContext_remoteViewControllerDidUpdateVoiceShortcut_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteViewControllerDidUpdateVoiceShortcut:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)remoteViewControllerDidCreateVoiceShortcut:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__INUIVoiceShortcutHostContext_remoteViewControllerDidCreateVoiceShortcut_error___block_invoke;
  block[3] = &unk_263FD69B8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __81__INUIVoiceShortcutHostContext_remoteViewControllerDidCreateVoiceShortcut_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 remoteViewControllerDidCreateVoiceShortcut:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)remoteViewControllerDidCancel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__INUIVoiceShortcutHostContext_remoteViewControllerDidCancel__block_invoke;
  block[3] = &unk_263FD6DB8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __61__INUIVoiceShortcutHostContext_remoteViewControllerDidCancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 remoteViewControllerDidCancel];
}

@end