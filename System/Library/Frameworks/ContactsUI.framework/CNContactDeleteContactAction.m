@interface CNContactDeleteContactAction
- (BOOL)deleteContact;
- (CNContactDeleteContactAction)initWithContact:(id)a3 recentsManager:(id)a4 componentsFactory:(id)a5;
- (CNUICoreRecentsManager)recentsManager;
- (CNUIExternalComponentsFactory)componentsFactory;
- (id)_makeAvatarImageForTraitCollection:(id)a3;
- (void)performActionWithSender:(id)a3;
- (void)showDeleteFailureAlert;
@end

@implementation CNContactDeleteContactAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsManager, 0);

  objc_storeStrong((id *)&self->_componentsFactory, 0);
}

- (CNUICoreRecentsManager)recentsManager
{
  return self->_recentsManager;
}

- (CNUIExternalComponentsFactory)componentsFactory
{
  return self->_componentsFactory;
}

- (id)_makeAvatarImageForTraitCollection:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [CNAvatarImageRenderer alloc];
  v6 = +[CNAvatarImageRendererSettings defaultSettings];
  v7 = [(CNAvatarImageRenderer *)v5 initWithSettings:v6];

  [v4 displayScale];
  double v9 = v8;
  uint64_t v10 = [v4 layoutDirection];

  v11 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v10 == 1, 0, 40.0, 40.0, v9);
  v12 = [(CNContactAction *)self contact];
  v17[0] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v14 = [(CNAvatarImageRenderer *)v7 avatarImageForContacts:v13 scope:v11];

  if (!v14)
  {
    v15 = [(CNAvatarImageRenderer *)v7 placeholderImageProvider];
    v14 = objc_msgSend(v15, "imageForSize:scale:", 40.0, 40.0, v9);
  }

  return v14;
}

- (void)showDeleteFailureAlert
{
  v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"DELETE_CARD_SHEET_FAILURE_ALERT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  v6 = CNContactsUIBundle();
  v7 = [v6 localizedStringForKey:@"DELETE_CARD_SHEET_FAILURE_ALERT_EXPLANATION" value:&stru_1ED8AC728 table:@"Localized"];
  id v13 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  double v8 = [(CNContactDeleteContactAction *)self componentsFactory];
  double v9 = CNContactsUIBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  v11 = [v8 alertActionWithTitle:v10 style:0 handler:0];
  [v13 addAction:v11];

  v12 = [(CNContactAction *)self delegate];
  [v12 action:self presentViewController:v13 sender:self];
}

- (BOOL)deleteContact
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v3 setIgnoresGuardianRestrictions:1];
  id v4 = [(CNContactAction *)self delegate];
  v5 = [v4 contactViewCache];
  v6 = [v5 contactStore];

  v7 = [(CNContactAction *)self mutableContact];
  double v8 = (void *)[v7 copy];

  double v9 = [(CNContactAction *)self mutableContact];
  [v3 deleteContact:v9];

  id v22 = 0;
  [v6 executeSaveRequest:v3 error:&v22];
  id v10 = v22;
  v15 = v10;
  if (v10)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactDeleteContactAction.m", 105, 3, @"Could not delete contact: %@", v11, v12, v13, v14, (uint64_t)v10);
  }
  else
  {
    v16 = [(CNContactDeleteContactAction *)self recentsManager];
    v17 = [v16 recentContactsMatchingAllPropertiesOfContact:v8];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__CNContactDeleteContactAction_deleteContact__block_invoke;
    v20[3] = &unk_1E5499068;
    id v21 = v16;
    id v18 = v16;
    [v17 addSuccessBlock:v20];
  }
  return v15 == 0;
}

uint64_t __45__CNContactDeleteContactAction_deleteContact__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRecents:a2 completionHandler:0];
}

- (void)performActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = CNContactsUIBundle();
  v6 = [v5 localizedStringForKey:@"CARD_ACTION_DELETE_CARD" value:&stru_1ED8AC728 table:@"Localized"];

  v7 = [(CNContactAction *)self contact];
  double v8 = [v7 mainStoreLinkedContacts];
  unint64_t v9 = [v8 count];

  if (v9 < 2)
  {
    v15 = 0;
  }
  else
  {
    id v10 = NSString;
    uint64_t v11 = CNContactsUIBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"CARD_ACTION_DELETE_CARD_MULTIPLE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v13 = [(CNContactAction *)self contact];
    uint64_t v14 = [v13 mainStoreLinkedContacts];
    v15 = objc_msgSend(v10, "localizedStringWithFormat:", v12, objc_msgSend(v14, "count"));
  }
  v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v15 message:0 preferredStyle:0];
  v17 = [(CNContactDeleteContactAction *)self componentsFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__CNContactDeleteContactAction_performActionWithSender___block_invoke;
  v25[3] = &unk_1E549B590;
  v25[4] = self;
  id v18 = [v17 alertActionWithTitle:v6 style:2 handler:v25];
  [v16 addAction:v18];

  v19 = [(CNContactDeleteContactAction *)self componentsFactory];
  v20 = CNContactsUIBundle();
  id v21 = [v20 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__CNContactDeleteContactAction_performActionWithSender___block_invoke_2;
  v24[3] = &unk_1E549B590;
  v24[4] = self;
  id v22 = [v19 alertActionWithTitle:v21 style:1 handler:v24];
  [v16 addAction:v22];

  v23 = [(CNContactAction *)self delegate];
  [v23 action:self presentViewController:v16 sender:v4];
}

void __56__CNContactDeleteContactAction_performActionWithSender___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) deleteContact] & 1) == 0) {
    [*(id *)(a1 + 32) showDeleteFailureAlert];
  }
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionDidFinish:*(void *)(a1 + 32)];
}

void __56__CNContactDeleteContactAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionWasCanceled:*(void *)(a1 + 32)];
}

- (CNContactDeleteContactAction)initWithContact:(id)a3 recentsManager:(id)a4 componentsFactory:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNContactDeleteContactAction;
  uint64_t v11 = [(CNContactAction *)&v15 initWithContact:a3];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_componentsFactory, a5);
    objc_storeStrong((id *)&v12->_recentsManager, a4);
    uint64_t v13 = v12;
  }

  return v12;
}

@end