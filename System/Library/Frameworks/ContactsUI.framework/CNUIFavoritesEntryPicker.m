@interface CNUIFavoritesEntryPicker
+ (id)descriptorForRequiredKeys;
+ (id)log;
- (CNActionMenuHelper)actionMenuHelper;
- (CNContact)contact;
- (CNContactActionsController)actionsController;
- (CNUIFavoritesEntryPicker)initWithContact:(id)a3;
- (CNUIFavoritesEntryPickerDelegate)delegate;
- (UIAlertController)alertController;
- (UIContextMenuInteraction)contextMenuInteraction;
- (id)menuProviderForContextMenuInteraction:(id)a3;
- (id)viewController;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)setActionMenuHelper:(id)a3;
- (void)setActionsController:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CNUIFavoritesEntryPicker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setContextMenuInteraction:(id)a3
{
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setActionMenuHelper:(id)a3
{
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setActionsController:(id)a3
{
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setAlertController:(id)a3
{
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setDelegate:(id)a3
{
}

- (CNUIFavoritesEntryPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUIFavoritesEntryPickerDelegate *)WeakRetained;
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5 = a4;
  id v7 = [(CNUIFavoritesEntryPicker *)self actionMenuHelper];
  v6 = [(CNUIFavoritesEntryPicker *)self contextMenuInteraction];
  [v7 updateWithMenuItems:v5 contextMenuInteraction:v6];
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(CNUIFavoritesEntryPicker *)self alertController];

  if (v6)
  {
    id v7 = [(CNUIFavoritesEntryPicker *)self alertController];
    [v7 dismissViewControllerAnimated:1 completion:0];

    [(CNUIFavoritesEntryPicker *)self setAlertController:0];
  }
  id v8 = v5;
  id v9 = v8;
  if (![v8 isSuggested]) {
    goto LABEL_6;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  v10 = (void *)MEMORY[0x1E4F1B9F0];
  v11 = [v8 contactProperty];
  v12 = [v11 key];
  v13 = [v10 descriptorsForRequiredKeysForPropertyKey:v12];
  uint64_t v14 = [v8 curateActionWithContext:v9 withKeysToFetch:v13];

  if (v14)
  {

    id v9 = (id)v14;
LABEL_6:
    v15 = [MEMORY[0x1E4F1B9F0] favoritesEntryForUserActionItem:v9];
    v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = [v15 contactProperty];
      int v20 = 138412546;
      id v21 = v17;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_18B625000, v16, OS_LOG_TYPE_INFO, "Did select favorites entry with contact property %@ with action item %@", (uint8_t *)&v20, 0x16u);
    }
    v18 = [(CNUIFavoritesEntryPicker *)self delegate];
    [v18 favoritesEntryPicker:self didPickEntry:v15];

    [(CNUIFavoritesEntryPicker *)self setActionsController:0];
    [(CNUIFavoritesEntryPicker *)self setActionMenuHelper:0];

    goto LABEL_9;
  }
  v19 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138412290;
    id v21 = v8;
    _os_log_error_impl(&dword_18B625000, v19, OS_LOG_TYPE_ERROR, "Failed to curate suggestion for action item %@", (uint8_t *)&v20, 0xCu);
  }

  [(CNUIFavoritesEntryPicker *)self setActionsController:0];
  [(CNUIFavoritesEntryPicker *)self setActionMenuHelper:0];
LABEL_9:
}

- (id)menuProviderForContextMenuInteraction:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  [(CNUIFavoritesEntryPicker *)self setContextMenuInteraction:a3];
  v4 = objc_alloc_init(CNActionMenuHelper);
  [(CNUIFavoritesEntryPicker *)self setActionMenuHelper:v4];

  id v5 = CNContactsUIBundle();
  v6 = [v5 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
  id v7 = [(CNUIFavoritesEntryPicker *)self actionMenuHelper];
  [v7 setMenuTitle:v6];

  id v8 = [CNContactActionsController alloc];
  id v9 = [(CNUIFavoritesEntryPicker *)self contact];
  uint64_t v10 = *MEMORY[0x1E4F1AD20];
  v23[0] = *MEMORY[0x1E4F1AD48];
  v23[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AD38];
  v23[2] = *MEMORY[0x1E4F1AD78];
  v23[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  v13 = [(CNContactActionsController *)v8 initWithContact:v9 actionTypes:v12];
  [(CNUIFavoritesEntryPicker *)self setActionsController:v13];

  uint64_t v14 = [(CNUIFavoritesEntryPicker *)self actionsController];
  [v14 setShouldUseOutlinedActionGlyphStyle:1];

  v15 = [(CNUIFavoritesEntryPicker *)self actionsController];
  [v15 setDisplayMenuIconAtTopLevel:1];

  v16 = [(CNUIFavoritesEntryPicker *)self actionsController];
  [v16 setGenerateFavoritesListItemsOnly:1];

  v17 = [(CNUIFavoritesEntryPicker *)self actionsController];
  [v17 setDisplayDefaultAppsSectionedMenus:0];

  v18 = [(CNUIFavoritesEntryPicker *)self actionsController];
  [v18 setDelegate:self];

  v19 = [(CNUIFavoritesEntryPicker *)self actionsController];
  [v19 retrieveModels];

  int v20 = [(CNUIFavoritesEntryPicker *)self actionMenuHelper];
  id v21 = [v20 menuProviderWithActionBlock:&__block_literal_global_23_40244];

  return v21;
}

- (id)viewController
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v3 = [(CNUIFavoritesEntryPicker *)self alertController];

  if (v3)
  {
    v4 = [(CNUIFavoritesEntryPicker *)self alertController];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F1AD20];
    v31[0] = *MEMORY[0x1E4F1AD48];
    v31[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F1AD38];
    v31[2] = *MEMORY[0x1E4F1AD78];
    v31[3] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    id v8 = [(CNUIFavoritesEntryPicker *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      uint64_t v10 = [(CNUIFavoritesEntryPicker *)self delegate];
      uint64_t v11 = [v10 actionTypesForFavoritesEntryPicker:self];

      id v7 = (void *)v11;
    }
    v12 = [CNContactActionsController alloc];
    v13 = [(CNUIFavoritesEntryPicker *)self contact];
    uint64_t v14 = [(CNContactActionsController *)v12 initWithContact:v13 actionTypes:v7];
    [(CNUIFavoritesEntryPicker *)self setActionsController:v14];

    v15 = [(CNUIFavoritesEntryPicker *)self actionsController];
    [v15 setDelegate:self];

    v16 = [(CNUIFavoritesEntryPicker *)self actionsController];
    [v16 setGenerateFavoritesListItemsOnly:1];

    v17 = [(CNUIFavoritesEntryPicker *)self actionsController];
    [v17 setDisplayDefaultAppsSectionedMenus:0];

    v18 = (void *)MEMORY[0x1E4FB1418];
    v19 = CNContactsUIBundle();
    int v20 = [v19 localizedStringForKey:@"PHONE_ACTION_ADD_TO_FAVORITES" value:&stru_1ED8AC728 table:@"Localized"];
    v4 = [v18 alertControllerWithTitle:v20 message:0 preferredStyle:0];

    id v21 = [(CNUIFavoritesEntryPicker *)self actionsController];
    __int16 v22 = [v21 viewController];
    [v4 setContentViewController:v22];

    objc_initWeak(&location, self);
    id v23 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v24 = CNContactsUIBundle();
    v25 = [v24 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __42__CNUIFavoritesEntryPicker_viewController__block_invoke;
    v28[3] = &unk_1E5499870;
    objc_copyWeak(&v29, &location);
    v26 = [v23 actionWithTitle:v25 style:1 handler:v28];
    [v4 addAction:v26];

    [(CNUIFavoritesEntryPicker *)self setAlertController:v4];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __42__CNUIFavoritesEntryPicker_viewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlertController:0];
}

- (CNUIFavoritesEntryPicker)initWithContact:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNUIFavoritesEntryPicker;
  uint64_t v6 = [(CNUIFavoritesEntryPicker *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contact, a3);
  }

  return v7;
}

+ (id)log
{
  if (log_cn_once_token_1_40265 != -1) {
    dispatch_once(&log_cn_once_token_1_40265, &__block_literal_global_40266);
  }
  v2 = (void *)log_cn_once_object_1_40267;

  return v2;
}

void __31__CNUIFavoritesEntryPicker_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIFavoritesEntryPicker");
  v1 = (void *)log_cn_once_object_1_40267;
  log_cn_once_object_1_40267 = (uint64_t)v0;
}

+ (id)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = +[CNContactActionsController descriptorForRequiredKeys];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [NSString stringWithUTF8String:"+[CNUIFavoritesEntryPicker descriptorForRequiredKeys]"];
  uint64_t v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

@end