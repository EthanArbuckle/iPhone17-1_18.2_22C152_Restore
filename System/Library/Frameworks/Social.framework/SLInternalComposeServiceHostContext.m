@interface SLInternalComposeServiceHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)shouldShowNetworkActivityIndicator:(id)a3;
@end

@implementation SLInternalComposeServiceHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v2;
}

uint64_t __72__SLInternalComposeServiceHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E41C38];

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v2;
}

uint64_t __70__SLInternalComposeServiceHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E41BD8];

  return MEMORY[0x1F41817F8]();
}

- (void)shouldShowNetworkActivityIndicator:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SLInternalComposeServiceHostContext_shouldShowNetworkActivityIndicator___block_invoke;
  block[3] = &unk_1E6467288;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__SLInternalComposeServiceHostContext_shouldShowNetworkActivityIndicator___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  _SLLog(v1, 6, @"SLInternalComposeServiceHostContext shouldShowNetworkActivityIndicator: %@");
  objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNetworkActivityIndicatorVisible:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"));
}

@end