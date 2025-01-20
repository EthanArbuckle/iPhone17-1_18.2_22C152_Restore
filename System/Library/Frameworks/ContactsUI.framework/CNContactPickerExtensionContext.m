@interface CNContactPickerExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)invalidateSelectionAnimated:(BOOL)a3;
- (void)pickerDidCancel;
- (void)pickerDidCompleteWithNewContact:(id)a3;
- (void)pickerDidSelectAddNewContact;
- (void)pickerDidSelectContact:(id)a3 property:(id)a4;
- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
@end

@implementation CNContactPickerExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_24627 != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_24627, &__block_literal_global_103);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_24628;

  return v2;
}

void __66__CNContactPickerExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED945ED0];
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface_24628;
  _extensionAuxiliaryHostProtocol___interface_24628 = v0;

  v2 = (void *)_extensionAuxiliaryHostProtocol___interface_24628;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_pickerDidSelectContacts_properties_ argumentIndex:0 ofReply:0];

  v6 = (void *)_extensionAuxiliaryHostProtocol___interface_24628;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setClasses:v9 forSelector:sel_pickerDidSelectContacts_properties_ argumentIndex:1 ofReply:0];
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_24633 != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_24633, &__block_literal_global_87_24634);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_24635;

  return v2;
}

void __68__CNContactPickerExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED990BA8];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface_24635;
  _extensionAuxiliaryVendorProtocol___interface_24635 = v0;

  v2 = (void *)_extensionAuxiliaryVendorProtocol___interface_24635;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v10 forSelector:sel_setupWithOptions_readyBlock_ argumentIndex:0 ofReply:0];
}

- (void)pickerDidCancel
{
  uint64_t v4 = [(CNContactPickerExtensionContext *)self _auxiliaryConnection];
  id v7 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_128_24644];

  uint64_t v5 = v7;
  if (!v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CNContactPickerServiceViewController.m" lineNumber:306 description:@"host object is nil!"];

    uint64_t v5 = 0;
  }
  [v5 pickerDidCancel];
}

void __50__CNContactPickerExtensionContext_pickerDidCancel__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 304, 3, @"error calling host - %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  id v8 = a3;
  uint64_t v5 = [(CNContactPickerExtensionContext *)self _auxiliaryConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_126_24656];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"CNContactPickerServiceViewController.m" lineNumber:296 description:@"host object is nil!"];
  }
  [v6 pickerDidCompleteWithNewContact:v8];
}

void __67__CNContactPickerExtensionContext_pickerDidCompleteWithNewContact___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 294, 3, @"error calling host - %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  id v8 = [(CNContactPickerExtensionContext *)self _auxiliaryConnection];
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_124];

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CNContactPickerServiceViewController.m" lineNumber:286 description:@"host object is nil!"];
  }
  [v9 pickerDidSelectContacts:v11 properties:v7];
}

void __70__CNContactPickerExtensionContext_pickerDidSelectContacts_properties___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 284, 3, @"error calling host - %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  id v8 = [(CNContactPickerExtensionContext *)self _auxiliaryConnection];
  uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_122];

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CNContactPickerServiceViewController.m" lineNumber:276 description:@"host object is nil!"];
  }
  [v9 pickerDidSelectContact:v11 property:v7];
}

void __67__CNContactPickerExtensionContext_pickerDidSelectContact_property___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 274, 3, @"error calling host - %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (void)pickerDidSelectAddNewContact
{
  uint64_t v4 = [(CNContactPickerExtensionContext *)self _auxiliaryConnection];
  id v7 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_110];

  uint64_t v5 = v7;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CNContactPickerServiceViewController.m" lineNumber:266 description:@"host object is nil!"];

    uint64_t v5 = 0;
  }
  [v5 pickerDidSelectAddNewContact];
}

void __63__CNContactPickerExtensionContext_pickerDidSelectAddNewContact__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 localizedDescription];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerServiceViewController.m", 264, 3, @"error calling host - %@", v2, v3, v4, v5, (uint64_t)v6);
}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__CNContactPickerExtensionContext_invalidateSelectionAnimated___block_invoke;
  v3[3] = &unk_1E5499510;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __63__CNContactPickerExtensionContext_invalidateSelectionAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _principalObject];
  [v2 invalidateSelectionAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CNContactPickerExtensionContext_setupWithOptions_readyBlock___block_invoke;
  block[3] = &unk_1E549AFF8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__CNContactPickerExtensionContext_setupWithOptions_readyBlock___block_invoke(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [*(id *)(a1 + 32) _auxiliaryConnection];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 auditToken];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }

  long long v12 = v14;
  long long v13 = v15;
  BOOL v4 = [MEMORY[0x1E4F5A340] auditToken:&v12];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A350]) initWithAuditToken:v4 assumedIdentity:0];
  id v6 = +[CNUIContactsEnvironment currentEnvironment];
  [v6 setAuthorizationContext:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F5A440]);
  id v8 = [MEMORY[0x1E4F5A448] sharedConnection];
  long long v12 = v14;
  long long v13 = v15;
  id v9 = (void *)[v7 initWithAuditToken:&v12 managedProfileConnection:v8];

  id v10 = [*(id *)(a1 + 32) _principalObject];
  [v10 setManagedConfiguration:v9];

  id v11 = [*(id *)(a1 + 32) _principalObject];
  [v11 setupWithOptions:*(void *)(a1 + 40) readyBlock:*(void *)(a1 + 48)];
}

@end