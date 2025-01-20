@interface CNContactPickerExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (CNContactPickerHostViewController)viewController;
- (id)_derivedExtensionAuxiliaryHostProtocol;
- (void)invalidateSelectionAnimated:(BOOL)a3;
- (void)pickerDidCancel;
- (void)pickerDidCompleteWithNewContact:(id)a3;
- (void)pickerDidSelectAddNewContact;
- (void)pickerDidSelectContact:(id)a3 property:(id)a4;
- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4;
- (void)setViewController:(id)a3;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
@end

@implementation CNContactPickerExtensionHostContext

- (void).cxx_destruct
{
}

- (void)setViewController:(id)a3
{
}

- (CNContactPickerHostViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (CNContactPickerHostViewController *)WeakRetained;
}

- (void)pickerDidCancel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CNContactPickerExtensionHostContext_pickerDidCancel__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__CNContactPickerExtensionHostContext_pickerDidCancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 pickerDidCancel];
}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CNContactPickerExtensionHostContext_pickerDidCompleteWithNewContact___block_invoke;
  v6[3] = &unk_1E549BF80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__CNContactPickerExtensionHostContext_pickerDidCompleteWithNewContact___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 pickerDidCompleteWithNewContact:*(void *)(a1 + 40)];
}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CNContactPickerExtensionHostContext_pickerDidSelectContacts_properties___block_invoke;
  block[3] = &unk_1E549B800;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__CNContactPickerExtensionHostContext_pickerDidSelectContacts_properties___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 pickerDidSelectContacts:*(void *)(a1 + 40) properties:*(void *)(a1 + 48)];
}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CNContactPickerExtensionHostContext_pickerDidSelectContact_property___block_invoke;
  block[3] = &unk_1E549B800;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71__CNContactPickerExtensionHostContext_pickerDidSelectContact_property___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewController];
  [v2 pickerDidSelectContact:*(void *)(a1 + 40) property:*(void *)(a1 + 48)];
}

- (void)pickerDidSelectAddNewContact
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CNContactPickerExtensionHostContext_pickerDidSelectAddNewContact__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__CNContactPickerExtensionHostContext_pickerDidSelectAddNewContact__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 pickerDidSelectAddNewContact];
}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(CNContactPickerExtensionHostContext *)self _auxiliaryConnection];
  id v9 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_147_42744];

  id v7 = v9;
  if (!v9)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CNContactPickerHostViewController.m" lineNumber:215 description:@"service object is nil!"];

    id v7 = 0;
  }
  [v7 invalidateSelectionAnimated:v3];
}

void __67__CNContactPickerExtensionHostContext_invalidateSelectionAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 213, 3, @"error calling service - %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  id v8 = [(CNContactPickerExtensionHostContext *)self _auxiliaryConnection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_135];

  if (!v9)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CNContactPickerHostViewController.m" lineNumber:205 description:@"service object is nil!"];
  }
  [v9 setupWithOptions:v11 readyBlock:v7];
}

void __67__CNContactPickerExtensionHostContext_setupWithOptions_readyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 203, 3, @"error calling service - %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (id)_derivedExtensionAuxiliaryHostProtocol
{
  v10.receiver = self;
  v10.super_class = (Class)CNContactPickerExtensionHostContext;
  uint64_t v2 = [(CNContactPickerExtensionHostContext *)&v10 _derivedExtensionAuxiliaryHostProtocol];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_pickerDidSelectContacts_properties_ argumentIndex:0 ofReply:0];

  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_pickerDidSelectContacts_properties_ argumentIndex:1 ofReply:0];

  return v2;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[CNContactPickerExtensionContext _extensionAuxiliaryHostProtocol];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[CNContactPickerExtensionContext _extensionAuxiliaryVendorProtocol];
}

@end