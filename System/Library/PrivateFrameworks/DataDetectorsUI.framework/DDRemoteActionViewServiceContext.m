@interface DDRemoteActionViewServiceContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)enableUserInteraction:(BOOL)a3;
- (void)prepareViewControllerWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation DDRemoteActionViewServiceContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_383);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  return v2;
}

uint64_t __69__DDRemoteActionViewServiceContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF523290];
  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_388);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;
  return v2;
}

uint64_t __67__DDRemoteActionViewServiceContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF5230B0];
  return MEMORY[0x1F41817F8]();
}

- (void)prepareViewControllerWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__DDRemoteActionViewServiceContext_prepareViewControllerWithContext_completionHandler___block_invoke;
  block[3] = &unk_1E5A85508;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__DDRemoteActionViewServiceContext_prepareViewControllerWithContext_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 prepareViewControllerWithContext:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)enableUserInteraction:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__DDRemoteActionViewServiceContext_enableUserInteraction___block_invoke;
  v3[3] = &unk_1E5A85530;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __58__DDRemoteActionViewServiceContext_enableUserInteraction___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _principalObject];
  id v2 = [v3 view];
  [v2 setUserInteractionEnabled:v1];
}

+ (id)_allowedItemPayloadClasses
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  return v2;
}

@end