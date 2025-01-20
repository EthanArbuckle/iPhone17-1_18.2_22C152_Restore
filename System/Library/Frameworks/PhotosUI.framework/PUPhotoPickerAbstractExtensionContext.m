@interface PUPhotoPickerAbstractExtensionContext
+ (id)_allowedItemPayloadClasses;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)principalObject;
- (id)proxy;
- (void)firstPayloadFromExtensionItems:(id)a3 completion:(id)a4;
- (void)invalidateContext;
@end

@implementation PUPhotoPickerAbstractExtensionContext

- (void)firstPayloadFromExtensionItems:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)*MEMORY[0x263F1DB38] identifier];
  v8 = [v5 firstObject];
  [v8 attachments];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v14 hasItemConformingToTypeIdentifier:v7])
        {
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __83__PUPhotoPickerAbstractExtensionContext_firstPayloadFromExtensionItems_completion___block_invoke;
          v15[3] = &unk_2642C50F8;
          id v16 = v6;
          [v14 loadItemForTypeIdentifier:v7 options:0 completionHandler:v15];

          goto LABEL_12;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
LABEL_12:
}

uint64_t __83__PUPhotoPickerAbstractExtensionContext_firstPayloadFromExtensionItems_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)principalObject
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoPickerAbstractExtensionContext;
  v2 = [(PUPhotoPickerAbstractExtensionContext *)&v4 _principalObject];

  return v2;
}

- (void)invalidateContext
{
  id v2 = [(PUPhotoPickerAbstractExtensionContext *)self _auxiliaryConnection];
  [v2 invalidate];
}

- (id)proxy
{
  id v2 = [(PUPhotoPickerAbstractExtensionContext *)self _auxiliaryConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_130];

  return v3;
}

void __46__PUPhotoPickerAbstractExtensionContext_proxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 localizedDescription];
  NSLog(&cfstr_PhotopickerExt.isa, v2);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_107);
  }
  id v2 = (void *)_extensionAuxiliaryHostProtocol_interface;

  return v2;
}

void __72__PUPhotoPickerAbstractExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C850AB8];
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

  [(id)_extensionAuxiliaryHostProtocol_interface setClass:objc_opt_class() forSelector:sel_dismissCurrentViewControllerFromPhotoPickerAnimated_ argumentIndex:0 ofReply:0];
  [(id)_extensionAuxiliaryHostProtocol_interface setClass:objc_opt_class() forSelector:sel_didDisplayPhotoPickerSourceType_ argumentIndex:0 ofReply:0];
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryHostProtocol_interface setClasses:v12 forSelector:sel_didSelectMediaWithInfoDictionary_ argumentIndex:0 ofReply:0];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  [(id)_extensionAuxiliaryHostProtocol_interface setClasses:v11 forSelector:sel_didSelectMultipleMediaItemsWithInfoDictionaries_ argumentIndex:0 ofReply:0];
  [(id)_extensionAuxiliaryHostProtocol_interface setClass:objc_opt_class() forSelector:sel_performTraitCollectionUpdateUsingData_completion_ argumentIndex:0 ofReply:0];
  [(id)_extensionAuxiliaryHostProtocol_interface setClass:objc_opt_class() forSelector:sel_performTraitCollectionUpdateUsingData_completion_ argumentIndex:0 ofReply:1];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_53);
  }
  id v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;

  return v2;
}

uint64_t __74__PUPhotoPickerAbstractExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C858F68];
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

  [(id)_extensionAuxiliaryVendorProtocol_interface setClass:objc_opt_class() forSelector:sel_performTraitCollectionUpdateUsingData_completion_ argumentIndex:0 ofReply:0];
  id v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  uint64_t v3 = objc_opt_class();

  return [v2 setClass:v3 forSelector:sel_performTraitCollectionUpdateUsingData_completion_ argumentIndex:0 ofReply:1];
}

+ (id)_allowedItemPayloadClasses
{
  if (_allowedItemPayloadClasses_onceToken != -1) {
    dispatch_once(&_allowedItemPayloadClasses_onceToken, &__block_literal_global_194);
  }
  id v2 = (void *)_allowedItemPayloadClasses_allowedItemPayloadClasses;

  return v2;
}

void __67__PUPhotoPickerAbstractExtensionContext__allowedItemPayloadClasses__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)_allowedItemPayloadClasses_allowedItemPayloadClasses;
  _allowedItemPayloadClasses_allowedItemPayloadClasses = v2;
}

@end