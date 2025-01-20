@interface CNContactListRemoveContactsFromGroupAction
+ (id)actionForContact:(id)a3 configuration:(id)a4;
+ (id)descriptorForRequiredKeys;
+ (id)log;
- (BOOL)confirmAction;
- (BOOL)editRequiresAuthorization;
- (BOOL)editRequiresAuthorizationCheckForActions:(id)a3;
- (BOOL)shouldReloadListOnCompletion;
- (CNContactListRemoveContactsFromGroupAction)initWithContacts:(id)a3 configuration:(id)a4 withConfirmation:(BOOL)a5;
- (CNContactStore)contactStore;
- (CNUIExternalComponentsFactory)componentsFactory;
- (NSArray)actions;
- (id)groupToRemoveFrom;
- (int64_t)originalContactCount;
- (void)performAction;
- (void)performAuthorizedRemoveFromGroup:(id)a3;
- (void)performUndoAction;
- (void)setActions:(id)a3;
- (void)setConfirmAction:(BOOL)a3;
- (void)setContactStore:(id)a3;
- (void)setOriginalContactCount:(int64_t)a3;
- (void)showRemoveFromGroupFailureAlert;
@end

@implementation CNContactListRemoveContactsFromGroupAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_componentsFactory, 0);
}

- (void)setConfirmAction:(BOOL)a3
{
  self->_confirmAction = a3;
}

- (BOOL)confirmAction
{
  return self->_confirmAction;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setOriginalContactCount:(int64_t)a3
{
  self->_originalContactCount = a3;
}

- (int64_t)originalContactCount
{
  return self->_originalContactCount;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNUIExternalComponentsFactory)componentsFactory
{
  return self->_componentsFactory;
}

- (id)groupToRemoveFrom
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactListAction *)self configuration];
  v4 = [v3 contactStoreFilter];
  v5 = [v4 groupIdentifiers];
  v6 = [v5 allObjects];
  v7 = [v6 firstObject];

  v8 = [(CNContactListRemoveContactsFromGroupAction *)self contactStore];
  v9 = (void *)MEMORY[0x1E4F1BA00];
  v23[0] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v11 = [v9 predicateForGroupsWithIdentifiers:v10];
  id v20 = 0;
  v12 = [v8 groupsMatchingPredicate:v11 error:&v20];
  id v13 = v20;

  if (!v12)
  {
    v15 = [(id)objc_opt_class() log];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    id v22 = v13;
    v16 = "Failed to remove contact from group: %@";
    v17 = v15;
    uint32_t v18 = 12;
LABEL_12:
    _os_log_error_impl(&dword_18B625000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_7;
  }
  if ([v12 count] == 1)
  {
    v14 = [v12 firstObject];
    goto LABEL_8;
  }
  v15 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v16 = "Failed to remove contact from group, multiple matching groups found";
    v17 = v15;
    uint32_t v18 = 2;
    goto LABEL_12;
  }
LABEL_7:

  v14 = 0;
LABEL_8:

  return v14;
}

- (void)performUndoAction
{
  v3 = [(CNContactListRemoveContactsFromGroupAction *)self actions];
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_78_13458);

  id v4 = [(CNContactListAction *)self delegate];
  [v4 actionDidFinish:self];
}

uint64_t __63__CNContactListRemoveContactsFromGroupAction_performUndoAction__block_invoke(uint64_t a1, void *a2)
{
  return [a2 undoAction];
}

- (BOOL)editRequiresAuthorizationCheckForActions:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__CNContactListRemoveContactsFromGroupAction_editRequiresAuthorizationCheckForActions___block_invoke;
  v4[3] = &unk_1E5497870;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

uint64_t __87__CNContactListRemoveContactsFromGroupAction_editRequiresAuthorizationCheckForActions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 contact];
  v5 = [v3 containerIdentifier];

  uint64_t v6 = [v2 editRequiresAuthorizationCheckForContact:v4 containerIdentifier:v5];
  return v6;
}

- (BOOL)editRequiresAuthorization
{
  v2 = self;
  id v3 = [(CNContactListRemoveContactsFromGroupAction *)self actions];
  LOBYTE(v2) = [(CNContactListRemoveContactsFromGroupAction *)v2 editRequiresAuthorizationCheckForActions:v3];

  return (char)v2;
}

- (void)showRemoveFromGroupFailureAlert
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"LIST_ACTION_REMOVE_FROM_GROUP_FAILURE_ALERT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v6 = CNContactsUIBundle();
  v7 = [v6 localizedStringForKey:@"DELETE_CARD_SHEET_FAILURE_ALERT_EXPLANATION" value:&stru_1ED8AC728 table:@"Localized"];
  id v13 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  v8 = [(CNContactListRemoveContactsFromGroupAction *)self componentsFactory];
  v9 = CNContactsUIBundle();
  v10 = [v9 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  v11 = [v8 alertActionWithTitle:v10 style:0 handler:0];
  [v13 addAction:v11];

  v12 = [(CNContactListAction *)self delegate];
  [v12 action:self presentViewController:v13];
}

- (void)performAuthorizedRemoveFromGroup:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13475;
  id v20 = __Block_byref_object_dispose__13476;
  id v21 = (id)MEMORY[0x1E4F1CBF0];
  v5 = [(CNContactListRemoveContactsFromGroupAction *)self actions];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __79__CNContactListRemoveContactsFromGroupAction_performAuthorizedRemoveFromGroup___block_invoke;
  id v13 = &unk_1E5497848;
  id v6 = v4;
  id v14 = v6;
  v15 = &v16;
  objc_msgSend(v5, "_cn_each:", &v10);

  if (((*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v17[5], v7, v8) & 1) == 0)[(CNContactListRemoveContactsFromGroupAction *)self showRemoveFromGroupFailureAlert]; {
  v9 = [(CNContactListAction *)self delegate];
  }
  [v9 actionDidFinish:self];

  _Block_object_dispose(&v16, 8);
}

void __79__CNContactListRemoveContactsFromGroupAction_performAuthorizedRemoveFromGroup___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setGroup:*(void *)(a1 + 32)];
  if (([v6 executeAction] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (void)performAction
{
  uint64_t v3 = [(CNContactListRemoveContactsFromGroupAction *)self groupToRemoveFrom];
  if ([(CNContactListRemoveContactsFromGroupAction *)self confirmAction])
  {
    uint64_t v4 = NSString;
    v5 = CNContactsUIBundle();
    id v6 = [v5 localizedStringForKey:@"LIST_ACTION_REMOVE_CONTACT_FROM_LIST" value:&stru_1ED8AC728 table:@"Localized"];
    int64_t v7 = [(CNContactListRemoveContactsFromGroupAction *)self originalContactCount];
    uint64_t v8 = [v3 name];
    v9 = objc_msgSend(v4, "localizedStringWithFormat:", v6, v7, v8);

    uint64_t v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:0 preferredStyle:1];
    uint64_t v11 = [(CNContactListRemoveContactsFromGroupAction *)self componentsFactory];
    v12 = CNContactsUIBundle();
    id v13 = [v12 localizedStringForKey:@"LIST_ACTION_ALERT_ACTION_REMOVE_FROM_GROUP" value:&stru_1ED8AC728 table:@"Localized"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__CNContactListRemoveContactsFromGroupAction_performAction__block_invoke;
    v20[3] = &unk_1E549BC48;
    v20[4] = self;
    id v21 = v3;
    id v14 = [v11 alertActionWithTitle:v13 style:2 handler:v20];
    [v10 addAction:v14];

    v15 = [(CNContactListRemoveContactsFromGroupAction *)self componentsFactory];
    uint64_t v16 = CNContactsUIBundle();
    v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v18 = [v15 alertActionWithTitle:v17 style:1 handler:&__block_literal_global_65];
    [v10 addAction:v18];

    v19 = [(CNContactListAction *)self delegate];
    [v19 action:self presentViewController:v10];
  }
  else
  {
    [(CNContactListRemoveContactsFromGroupAction *)self performAuthorizedRemoveFromGroup:v3];
  }
}

uint64_t __59__CNContactListRemoveContactsFromGroupAction_performAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAuthorizedRemoveFromGroup:*(void *)(a1 + 40)];
}

- (BOOL)shouldReloadListOnCompletion
{
  return 1;
}

- (CNContactListRemoveContactsFromGroupAction)initWithContacts:(id)a3 configuration:(id)a4 withConfirmation:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CNContactListRemoveContactsFromGroupAction;
  uint64_t v10 = [(CNContactListRemoveContactsFromGroupAction *)&v26 init];
  uint64_t v11 = v10;
  if (v10)
  {
    [(CNContactListAction *)v10 setConfiguration:v9];
    v12 = [v9 environment];
    uint64_t v13 = [v12 componentsFactory];
    componentsFactory = v11->_componentsFactory;
    v11->_componentsFactory = (CNUIExternalComponentsFactory *)v13;

    uint64_t v15 = [v9 contactStore];
    contactStore = v11->_contactStore;
    v11->_contactStore = (CNContactStore *)v15;

    v11->_confirmAction = a5;
    v11->_originalContactCount = [v8 count];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke;
    v22[3] = &unk_1E54981E0;
    v17 = v11;
    v23 = v17;
    id v24 = v8;
    id v25 = v9;
    uint64_t v18 = objc_msgSend(v24, "_cn_flatMap:", v22);
    actions = v17->_actions;
    v17->_actions = (NSArray *)v18;

    id v20 = v17;
  }

  return v11;
}

id __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 isUnified])
    {
      v5 = [v4 linkedContacts];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke_47;
      v10[3] = &unk_1E54981B8;
      uint64_t v11 = *(id *)(a1 + 32);
      id v12 = *(id *)(a1 + 48);
      id v6 = objc_msgSend(v5, "_cn_map:", v10);

      int64_t v7 = v11;
    }
    else
    {
      int64_t v7 = [(id)objc_opt_class() actionForContact:v4 configuration:*(void *)(a1 + 48)];
      uint64_t v13 = v7;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    }
  }
  else
  {
    int64_t v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Contact was nil for remove from group action with contacts: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

id __94__CNContactListRemoveContactsFromGroupAction_initWithContacts_configuration_withConfirmation___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() actionForContact:v3 configuration:*(void *)(a1 + 40)];

  return v4;
}

+ (id)actionForContact:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int64_t v7 = [v5 contactViewCache];
  id v8 = [v7 containerForContact:v6];
  uint64_t v9 = [v8 identifier];

  uint64_t v10 = [CNContactListRemoveContactFromGroupAction alloc];
  uint64_t v11 = [v5 contactStore];

  id v12 = [(CNContactListRemoveContactFromGroupAction *)v10 initWithContact:v6 contactStore:v11 containerIdentifier:v9];

  return v12;
}

+ (id)descriptorForRequiredKeys
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v7[0] = *MEMORY[0x1E4F1ADC0];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v4 = [NSString stringWithUTF8String:"+[CNContactListRemoveContactsFromGroupAction descriptorForRequiredKeys]"];
  id v5 = [v2 descriptorWithKeyDescriptors:v3 description:v4];

  return v5;
}

+ (id)log
{
  if (log_cn_once_token_4 != -1) {
    dispatch_once(&log_cn_once_token_4, &__block_literal_global_41);
  }
  v2 = (void *)log_cn_once_object_4;

  return v2;
}

void __49__CNContactListRemoveContactsFromGroupAction_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIListRemoveContactsFromGroupAction");
  v1 = (void *)log_cn_once_object_4;
  log_cn_once_object_4 = (uint64_t)v0;
}

@end