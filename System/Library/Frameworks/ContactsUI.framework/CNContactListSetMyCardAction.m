@interface CNContactListSetMyCardAction
+ (id)log;
- (CNContact)originalMeContact;
- (CNContactListSetMyCardAction)initWithContact:(id)a3 configuration:(id)a4;
- (id)updatedMeContact;
- (void)fetchOriginalMeContact;
- (void)performAction;
- (void)performUndoAction;
- (void)setOriginalMeContact:(id)a3;
- (void)updateMeContact:(id)a3;
@end

@implementation CNContactListSetMyCardAction

+ (id)log
{
  if (log_cn_once_token_1_34713 != -1) {
    dispatch_once(&log_cn_once_token_1_34713, &__block_literal_global_34714);
  }
  v2 = (void *)log_cn_once_object_1_34715;

  return v2;
}

void __35__CNContactListSetMyCardAction_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIContactListSetMyCardAction");
  v1 = (void *)log_cn_once_object_1_34715;
  log_cn_once_object_1_34715 = (uint64_t)v0;
}

- (void).cxx_destruct
{
}

- (void)setOriginalMeContact:(id)a3
{
}

- (CNContact)originalMeContact
{
  return self->_originalMeContact;
}

- (void)performUndoAction
{
  v3 = [(CNContactListSetMyCardAction *)self originalMeContact];
  [(CNContactListSetMyCardAction *)self updateMeContact:v3];

  id v4 = [(CNContactListAction *)self delegate];
  [v4 actionDidFinish:self];
}

- (void)updateMeContact:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNContactListAction *)self configuration];
  v6 = [v5 contactStore];
  id v10 = 0;
  char v7 = [v6 setMeContact:v4 error:&v10];

  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v8;
      _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Failed to set contact as me contact: %@", buf, 0xCu);
    }
  }
}

- (void)fetchOriginalMeContact
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactListAction *)self configuration];
  id v4 = [v3 contactStore];
  id v8 = 0;
  v5 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:MEMORY[0x1E4F1CBF0] error:&v8];
  id v6 = v8;

  [(CNContactListSetMyCardAction *)self setOriginalMeContact:v5];
  if (!v5)
  {
    char v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_error_impl(&dword_18B625000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch current me contact: %@", buf, 0xCu);
    }
  }
}

- (void)performAction
{
  v3 = NSString;
  id v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"LIST_MENU_ACTION_MY_CARD_ALERT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
  id v6 = [(CNContactListAction *)self configuration];
  char v7 = [v6 contactFormatter];
  id v8 = [(CNContactListSetMyCardAction *)self updatedMeContact];
  v9 = [v7 stringFromContact:v8];
  id v10 = objc_msgSend(v3, "localizedStringWithFormat:", v5, v9);

  uint64_t v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:0 preferredStyle:1];
  id v12 = [(CNContactListAction *)self configuration];
  uint64_t v13 = [v12 environment];
  v14 = [v13 componentsFactory];
  v15 = CNContactsUIBundle();
  v16 = [v15 localizedStringForKey:@"LIST_MENU_ACTION_MY_CARD" value:&stru_1ED8AC728 table:@"Localized"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__CNContactListSetMyCardAction_performAction__block_invoke;
  v25[3] = &unk_1E549B590;
  v25[4] = self;
  v17 = [v14 alertActionWithTitle:v16 style:0 handler:v25];
  [v11 addAction:v17];

  v18 = [(CNContactListAction *)self configuration];
  v19 = [v18 environment];
  v20 = [v19 componentsFactory];
  v21 = CNContactsUIBundle();
  v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v23 = [v20 alertActionWithTitle:v22 style:1 handler:&__block_literal_global_20_34746];
  [v11 addAction:v23];

  v24 = [(CNContactListAction *)self delegate];
  [v24 action:self presentViewController:v11];
}

void __45__CNContactListSetMyCardAction_performAction__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) fetchOriginalMeContact];
  v2 = *(void **)(a1 + 32);
  v3 = [v2 updatedMeContact];
  [v2 updateMeContact:v3];

  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 actionDidFinish:*(void *)(a1 + 32)];
}

- (id)updatedMeContact
{
  v2 = [(CNContactListAction *)self contacts];
  v3 = [v2 firstObject];

  return v3;
}

- (CNContactListSetMyCardAction)initWithContact:(id)a3 configuration:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[CNContactListAction initWithContacts:configuration:](self, "initWithContacts:configuration:", v9, v7, v12, v13);
  return v10;
}

@end