@interface CNContactPickerHostViewController
+ (BOOL)getViewController:(id)a3;
+ (id)contactPickerExtension;
+ (id)contextForIdentifier:(id)a3;
- (CNContactPickerContentDelegate)delegate;
- (NSCopying)currentRequestIdentifier;
- (NSExtension)extension;
- (UIBarButtonItem)addContactBarButtonItem;
- (UINavigationController)navigationController;
- (void)invalidate;
- (void)invalidateSelectionAnimated:(BOOL)a3;
- (void)pickerDidCancel;
- (void)pickerDidCompleteWithNewContact:(id)a3;
- (void)pickerDidSelectAddNewContact;
- (void)pickerDidSelectContact:(id)a3 property:(id)a4;
- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4;
- (void)setCurrentRequestIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation CNContactPickerHostViewController

+ (BOOL)getViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 contactPickerExtension];
  v10 = (void *)v5;
  if (v5)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 90, 7, @"Instantiate view controller from extension %@", v6, v7, v8, v9, v5);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__CNContactPickerHostViewController_getViewController___block_invoke;
    v12[3] = &unk_1E5499A88;
    id v14 = v4;
    id v13 = v10;
    id v15 = a1;
    [v13 instantiateViewControllerWithInputItems:MEMORY[0x1E4F1CBF0] listenerEndpoint:0 connectionHandler:v12];
  }
  return v10 != 0;
}

void __55__CNContactPickerHostViewController_getViewController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v24 = a2;
  id v7 = a3;
  id v8 = a4;
  id v13 = v8;
  if (v8)
  {
    id v14 = [v8 description];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 94, 3, @"View Service Error, %@", v15, v16, v17, v18, (uint64_t)v14);

    v19 = [CNContactPickerServiceErrorViewController alloc];
    v20 = [v13 localizedDescription];
    v21 = [(CNErrorViewController *)v19 initWithMessage:v20];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 99, 7, @"Got view controller %@ identifier %@", v9, v10, v11, v12, (uint64_t)v7);
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = v7;
    [v23 setExtension:v22];
    [v23 setCurrentRequestIdentifier:v24];
    v21 = [(id)objc_opt_class() contextForIdentifier:v24];
    [(CNContactPickerServiceErrorViewController *)v21 setViewController:v23];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)contextForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 contactPickerExtension];
  uint64_t v6 = [v5 _extensionContextForUUID:v4];

  return v6;
}

+ (id)contactPickerExtension
{
  if (contactPickerExtension_onceToken != -1) {
    dispatch_once(&contactPickerExtension_onceToken, &__block_literal_global_42665);
  }
  v2 = (void *)contactPickerExtension_extension;

  return v2;
}

void __59__CNContactPickerHostViewController_contactPickerExtension__block_invoke()
{
  id v7 = 0;
  uint64_t v0 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:@"com.apple.ContactsUI.ContactsViewService" error:&v7];
  id v1 = v7;
  v2 = (void *)contactPickerExtension_extension;
  contactPickerExtension_extension = v0;

  if (v1) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 69, 3, @"Could not get Contacts extension: %@", v3, v4, v5, v6, (uint64_t)v1);
  }
  else {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 71, 7, @"Got extension %@", v3, v4, v5, v6, contactPickerExtension_extension);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_currentRequestIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setExtension:(id)a3
{
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setCurrentRequestIdentifier:(id)a3
{
}

- (NSCopying)currentRequestIdentifier
{
  return self->_currentRequestIdentifier;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactPickerContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactPickerContentDelegate *)WeakRetained;
}

- (void)pickerDidCancel
{
  id v2 = [(CNContactPickerHostViewController *)self delegate];
  [v2 pickerDidCancel];
}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactPickerHostViewController *)self delegate];
  [v5 pickerDidCompleteWithNewContact:v4];
}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNContactPickerHostViewController *)self delegate];
  [v8 pickerDidSelectContacts:v7 properties:v6];
}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNContactPickerHostViewController *)self delegate];
  [v8 pickerDidSelectContact:v7 property:v6];
}

- (void)pickerDidSelectAddNewContact
{
  id v2 = [(CNContactPickerHostViewController *)self delegate];
  [v2 pickerDidSelectAddNewContact];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 141, 7, @"view service did terminate with error: %@", v3, v4, v5, v6, (uint64_t)a3);

  [(CNContactPickerHostViewController *)self pickerDidCancel];
}

- (void)invalidate
{
  uint64_t v3 = [(CNContactPickerHostViewController *)self extension];
  uint64_t v9 = [(CNContactPickerHostViewController *)self currentRequestIdentifier];
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerHostViewController.m", 133, 7, @"Invalidate extension %@ identifier %@", v4, v5, v6, v7, (uint64_t)v3);

  id v10 = [(CNContactPickerHostViewController *)self extension];
  id v8 = [(CNContactPickerHostViewController *)self currentRequestIdentifier];
  [v10 cancelExtensionRequestWithIdentifier:v8];
}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CNContactPickerHostViewController *)self currentRequestIdentifier];
  id v7 = [v5 contextForIdentifier:v6];

  [v7 invalidateSelectionAnimated:v3];
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  uint64_t v9 = [(CNContactPickerHostViewController *)self currentRequestIdentifier];
  id v10 = [v8 contextForIdentifier:v9];

  [v10 setupWithOptions:v7 readyBlock:v6];
}

- (UIBarButtonItem)addContactBarButtonItem
{
  return 0;
}

- (UINavigationController)navigationController
{
  return 0;
}

@end