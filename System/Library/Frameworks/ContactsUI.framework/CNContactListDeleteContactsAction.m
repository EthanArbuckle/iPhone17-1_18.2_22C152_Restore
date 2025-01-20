@interface CNContactListDeleteContactsAction
+ (id)actionForContact:(id)a3 configuration:(id)a4;
+ (id)descriptorForRequiredKeys;
+ (id)log;
- (BOOL)editRequiresAuthorization;
- (BOOL)editRequiresAuthorizationCheckForActions:(id)a3;
- (BOOL)shouldReloadListOnCompletion;
- (CNContactFormatter)contactFormatter;
- (CNContactListDeleteContactsAction)initWithContacts:(id)a3 configuration:(id)a4;
- (CNContactStore)contactStore;
- (CNUICoreRecentsManager)recentsManager;
- (CNUIExternalComponentsFactory)componentsFactory;
- (NSArray)actions;
- (id)alertTitle;
- (int64_t)originalContactCount;
- (void)performAction;
- (void)performUndoAction;
- (void)setActions:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setOriginalContactCount:(int64_t)a3;
- (void)showDeleteFailureAlert;
@end

@implementation CNContactListDeleteContactsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);

  objc_storeStrong((id *)&self->_componentsFactory, 0);
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

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (CNUIExternalComponentsFactory)componentsFactory
{
  return self->_componentsFactory;
}

- (void)performUndoAction
{
  v3 = [(CNContactListDeleteContactsAction *)self actions];
  objc_msgSend(v3, "_cn_each:", &__block_literal_global_91);

  id v4 = [(CNContactListAction *)self delegate];
  [v4 actionDidFinish:self];
}

uint64_t __54__CNContactListDeleteContactsAction_performUndoAction__block_invoke(uint64_t a1, void *a2)
{
  return [a2 undoAction];
}

- (BOOL)editRequiresAuthorizationCheckForActions:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__CNContactListDeleteContactsAction_editRequiresAuthorizationCheckForActions___block_invoke;
  v4[3] = &unk_1E5498230;
  v4[4] = self;
  return objc_msgSend(a3, "_cn_any:", v4);
}

uint64_t __78__CNContactListDeleteContactsAction_editRequiresAuthorizationCheckForActions___block_invoke(uint64_t a1, void *a2)
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
  id v3 = [(CNContactListDeleteContactsAction *)self actions];
  LOBYTE(v2) = [(CNContactListDeleteContactsAction *)v2 editRequiresAuthorizationCheckForActions:v3];

  return (char)v2;
}

- (void)showDeleteFailureAlert
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"DELETE_CARD_SHEET_FAILURE_ALERT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v6 = CNContactsUIBundle();
  v7 = [v6 localizedStringForKey:@"DELETE_CARD_SHEET_FAILURE_ALERT_EXPLANATION" value:&stru_1ED8AC728 table:@"Localized"];
  id v13 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  v8 = [(CNContactListDeleteContactsAction *)self componentsFactory];
  v9 = CNContactsUIBundle();
  v10 = [v9 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  v11 = [v8 alertActionWithTitle:v10 style:0 handler:0];
  [v13 addAction:v11];

  v12 = [(CNContactListAction *)self delegate];
  [v12 action:self presentViewController:v13];
}

- (id)alertTitle
{
  if ([(CNContactListDeleteContactsAction *)self originalContactCount] == 1)
  {
    id v3 = [(CNContactListDeleteContactsAction *)self actions];
    id v4 = [v3 firstObject];
    v5 = [v4 contact];

    uint64_t v6 = [(CNContactListDeleteContactsAction *)self actions];
    unint64_t v7 = [v6 count];

    v8 = NSString;
    v9 = CNContactsUIBundle();
    v10 = v9;
    if (v7 < 2)
    {
      v11 = [v9 localizedStringForKey:@"LIST_ACTION_DELETE_CARD" value:&stru_1ED8AC728 table:@"Localized"];
      v12 = [(CNContactListDeleteContactsAction *)self contactFormatter];
      v15 = [v12 stringFromContact:v5];
      id v13 = objc_msgSend(v8, "localizedStringWithFormat:", v11, v15);
    }
    else
    {
      v11 = [v9 localizedStringForKey:@"LIST_ACTION_DELETE_CARD_SINGLE_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
      v12 = [(CNContactListDeleteContactsAction *)self actions];
      id v13 = objc_msgSend(v8, "localizedStringWithFormat:", v11, objc_msgSend(v12, "count") - 1);
    }
  }
  else
  {
    v14 = NSString;
    v5 = CNContactsUIBundle();
    v10 = [v5 localizedStringForKey:@"LIST_ACTION_DELETE_CARD_MULTIPLE" value:&stru_1ED8AC728 table:@"Localized"];
    id v13 = objc_msgSend(v14, "localizedStringWithFormat:", v10, -[CNContactListDeleteContactsAction originalContactCount](self, "originalContactCount"));
  }

  return v13;
}

- (void)performAction
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [(CNContactListDeleteContactsAction *)self alertTitle];
  v5 = [v3 alertControllerWithTitle:v4 message:0 preferredStyle:1];

  if ([(CNContactListDeleteContactsAction *)self originalContactCount] == 1
    && ([(CNContactListDeleteContactsAction *)self actions],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7 == 1))
  {
    v8 = CNContactsUIBundle();
    v9 = v8;
    v10 = @"CARD_ACTION_DELETE_CARD";
  }
  else
  {
    v8 = CNContactsUIBundle();
    v9 = v8;
    v10 = @"LIST_ACTION_DELETE_CARDS";
  }
  v11 = [v8 localizedStringForKey:v10 value:&stru_1ED8AC728 table:@"Localized"];

  v12 = [(CNContactListDeleteContactsAction *)self componentsFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__CNContactListDeleteContactsAction_performAction__block_invoke;
  v19[3] = &unk_1E549B590;
  v19[4] = self;
  id v13 = [v12 alertActionWithTitle:v11 style:2 handler:v19];
  [v5 addAction:v13];

  v14 = [(CNContactListDeleteContactsAction *)self componentsFactory];
  v15 = CNContactsUIBundle();
  v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v17 = [v14 alertActionWithTitle:v16 style:1 handler:&__block_literal_global_70];
  [v5 addAction:v17];

  v18 = [(CNContactListAction *)self delegate];
  [v18 action:self presentViewController:v5];
}

void __50__CNContactListDeleteContactsAction_performAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__23366;
  v7[4] = __Block_byref_object_dispose__23367;
  id v8 = (id)MEMORY[0x1E4F1CBF0];
  id v4 = [*(id *)(a1 + 32) actions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CNContactListDeleteContactsAction_performAction__block_invoke_63;
  v6[3] = &unk_1E5498208;
  v6[4] = v7;
  objc_msgSend(v4, "_cn_each:", v6);

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [*(id *)(a1 + 32) showDeleteFailureAlert];
  }
  v5 = [*(id *)(a1 + 32) delegate];
  [v5 actionDidFinish:*(void *)(a1 + 32)];

  _Block_object_dispose(v7, 8);
}

void __50__CNContactListDeleteContactsAction_performAction__block_invoke_63(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 executeAction] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObject:v6];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (BOOL)shouldReloadListOnCompletion
{
  return 1;
}

- (CNContactListDeleteContactsAction)initWithContacts:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CNContactListDeleteContactsAction;
  id v8 = [(CNContactListDeleteContactsAction *)&v29 init];
  v9 = v8;
  if (v8)
  {
    [(CNContactListAction *)v8 setConfiguration:v7];
    v10 = [v7 environment];
    uint64_t v11 = [v10 componentsFactory];
    componentsFactory = v9->_componentsFactory;
    v9->_componentsFactory = (CNUIExternalComponentsFactory *)v11;

    id v13 = [v7 environment];
    uint64_t v14 = [v13 recentsManager];
    recentsManager = v9->_recentsManager;
    v9->_recentsManager = (CNUICoreRecentsManager *)v14;

    uint64_t v16 = [v7 contactFormatter];
    contactFormatter = v9->_contactFormatter;
    v9->_contactFormatter = (CNContactFormatter *)v16;

    uint64_t v18 = [v7 contactStore];
    contactStore = v9->_contactStore;
    v9->_contactStore = (CNContactStore *)v18;

    v9->_originalContactCount = [v6 count];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke;
    v25[3] = &unk_1E54981E0;
    v20 = v9;
    v26 = v20;
    id v27 = v6;
    id v28 = v7;
    uint64_t v21 = objc_msgSend(v27, "_cn_flatMap:", v25);
    actions = v20->_actions;
    v20->_actions = (NSArray *)v21;

    v23 = v20;
  }

  return v9;
}

id __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke(uint64_t a1, void *a2)
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
      v10[2] = __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke_50;
      v10[3] = &unk_1E54981B8;
      uint64_t v11 = *(id *)(a1 + 32);
      id v12 = *(id *)(a1 + 48);
      id v6 = objc_msgSend(v5, "_cn_map:", v10);

      id v7 = v11;
    }
    else
    {
      id v7 = [(id)objc_opt_class() actionForContact:v4 configuration:*(void *)(a1 + 48)];
      id v13 = v7;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    }
  }
  else
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Contact was nil for delete action with contacts: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

id __68__CNContactListDeleteContactsAction_initWithContacts_configuration___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() actionForContact:v3 configuration:*(void *)(a1 + 40)];

  return v4;
}

+ (id)actionForContact:(id)a3 configuration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 contactViewCache];
  id v8 = [v7 containerForContact:v6];
  uint64_t v9 = [v8 identifier];

  v10 = [CNContactListDeleteContactAction alloc];
  uint64_t v11 = [v5 contactStore];
  id v12 = [v5 environment];

  id v13 = [v12 recentsManager];
  uint64_t v14 = [(CNContactListDeleteContactAction *)v10 initWithContact:v6 contactStore:v11 containerIdentifier:v9 recentsManager:v13];

  return v14;
}

+ (id)descriptorForRequiredKeys
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [MEMORY[0x1E4F5A680] descriptorForRequiredKeys];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1B910], "descriptorForRequiredKeysForStyle:", 0, v3);
  uint64_t v5 = *MEMORY[0x1E4F1ADC0];
  v10[1] = v4;
  v10[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v7 = [NSString stringWithUTF8String:"+[CNContactListDeleteContactsAction descriptorForRequiredKeys]"];
  id v8 = [v2 descriptorWithKeyDescriptors:v6 description:v7];

  return v8;
}

+ (id)log
{
  if (log_cn_once_token_4_23383 != -1) {
    dispatch_once(&log_cn_once_token_4_23383, &__block_literal_global_41_23384);
  }
  v2 = (void *)log_cn_once_object_4_23385;

  return v2;
}

void __40__CNContactListDeleteContactsAction_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIListDeleteContactsAction");
  v1 = (void *)log_cn_once_object_4_23385;
  log_cn_once_object_4_23385 = (uint64_t)v0;
}

@end