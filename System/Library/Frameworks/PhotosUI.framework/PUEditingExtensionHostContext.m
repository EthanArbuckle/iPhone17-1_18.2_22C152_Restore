@interface PUEditingExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)contentEditingOutputCommitHandler;
- (id)hideNavigationControllerHandler;
- (void)commitContentEditingOutput:(id)a3 withCompletionHandler:(id)a4;
- (void)setContentEditingOutputCommitHandler:(id)a3;
- (void)setHideNavigationController:(BOOL)a3;
- (void)setHideNavigationControllerHandler:(id)a3;
@end

@implementation PUEditingExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1413 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1413, &__block_literal_global_17_1414);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_1415;

  return v2;
}

uint64_t __64__PUEditingExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C854AB8];
  _extensionAuxiliaryHostProtocol___interface_1415 = v0;

  return MEMORY[0x270F9A758](v0);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1418 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1418, &__block_literal_global_1419);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_1420;

  return v2;
}

uint64_t __66__PUEditingExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C852B30];
  _extensionAuxiliaryVendorProtocol___interface_1420 = v0;

  return MEMORY[0x270F9A758](v0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hideNavigationControllerHandler, 0);

  objc_storeStrong(&self->_contentEditingOutputCommitHandler, 0);
}

- (void)setHideNavigationControllerHandler:(id)a3
{
}

- (id)hideNavigationControllerHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setContentEditingOutputCommitHandler:(id)a3
{
}

- (id)contentEditingOutputCommitHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setHideNavigationController:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUEditingExtensionHostContext *)self hideNavigationControllerHandler];

  if (v5)
  {
    v6 = [(PUEditingExtensionHostContext *)self hideNavigationControllerHandler];
    v6[2](v6, v3);
  }
}

- (void)commitContentEditingOutput:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PUEditingExtensionHostContext *)self contentEditingOutputCommitHandler];
  v8[2](v8, v7, v6);
}

@end