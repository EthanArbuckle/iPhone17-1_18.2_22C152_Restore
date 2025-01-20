@interface CNContactClearRecentsDataAction
- (BOOL)canPerformAction;
- (BOOL)isDestructive;
- (CNContactClearRecentsDataAction)initWithRecentsData:(id)a3 coreRecentsManager:(id)a4;
- (CNContactRecentsReference)recentsData;
- (CNUICoreRecentsManager)coreRecentsManager;
- (id)title;
- (void)performActionWithSender:(id)a3;
@end

@implementation CNContactClearRecentsDataAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreRecentsManager, 0);

  objc_storeStrong((id *)&self->_recentsData, 0);
}

- (CNUICoreRecentsManager)coreRecentsManager
{
  return self->_coreRecentsManager;
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)performActionWithSender:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = [(CNContactClearRecentsDataAction *)self coreRecentsManager];
  v5 = [(CNContactClearRecentsDataAction *)self recentsData];
  v6 = [v5 recentContactID];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [(CNContactClearRecentsDataAction *)self recentsData];
  v9 = [v8 domain];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke;
  v10[3] = &unk_1E5499BC8;
  v10[4] = self;
  [v4 removeRecentsWithIdentifiers:v7 domain:v9 completionHandler:v10];
}

void __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke_2;
  v3[3] = &unk_1E549B488;
  v3[4] = *(void *)(a1 + 32);
  [v2 performBlock:v3];
}

void __59__CNContactClearRecentsDataAction_performActionWithSender___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionDidFinish:*(void *)(a1 + 32)];
}

- (BOOL)canPerformAction
{
  return 1;
}

- (BOOL)isDestructive
{
  return 1;
}

- (id)title
{
  id v2 = CNContactsUIBundle();
  v3 = [v2 localizedStringForKey:@"CLEAR_RECENTS" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (CNContactClearRecentsDataAction)initWithRecentsData:(id)a3 coreRecentsManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactClearRecentsDataAction;
  v9 = [(CNContactAction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recentsData, a3);
    objc_storeStrong((id *)&v10->_coreRecentsManager, a4);
    v11 = v10;
  }

  return v10;
}

@end