@interface CNContactListMergeAction
+ (id)descriptorForRequiredKeys;
+ (id)log;
- (BOOL)executeAction;
- (BOOL)mergeWillRequireLinkingForContacts:(id)a3;
- (BOOL)shouldReloadListOnCompletion;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)mergeUnifyActionHelper;
- (void)performAction;
- (void)performUndoAction;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setMergeUnifyActionHelper:(id)a3;
- (void)showMergeFailureAlert;
@end

@implementation CNContactListMergeAction

+ (id)descriptorForRequiredKeys
{
  v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = +[ContactListMergeUnifyActionHelper descriptorForRequiredKeys];
  v4 = [NSString stringWithUTF8String:"+[CNContactListMergeAction descriptorForRequiredKeys]"];
  v5 = [v2 descriptorWithKeyDescriptors:v3 description:v4];

  return v5;
}

+ (id)log
{
  if (log_cn_once_token_4_35732 != -1) {
    dispatch_once(&log_cn_once_token_4_35732, &__block_literal_global_35733);
  }
  v2 = (void *)log_cn_once_object_4_35734;

  return v2;
}

void __31__CNContactListMergeAction_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNUIContactListMergeAction");
  v1 = (void *)log_cn_once_object_4_35734;
  log_cn_once_object_4_35734 = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);

  objc_storeStrong((id *)&self->_mergeUnifyActionHelper, 0);
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setMergeUnifyActionHelper:(id)a3
{
}

- (_TtC10ContactsUI33ContactListMergeUnifyActionHelper)mergeUnifyActionHelper
{
  return self->_mergeUnifyActionHelper;
}

- (void)showMergeFailureAlert
{
  v3 = (void *)MEMORY[0x1E4FB1418];
  v4 = CNContactsUIBundle();
  v5 = [v4 localizedStringForKey:@"MERGE_CARDS_SHEET_FAILURE_ALERT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  id v11 = [v3 alertControllerWithTitle:v5 message:0 preferredStyle:1];

  v6 = (void *)MEMORY[0x1E4FB1410];
  v7 = CNContactsUIBundle();
  v8 = [v7 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  v9 = [v6 actionWithTitle:v8 style:0 handler:0];
  [v11 addAction:v9];

  v10 = [(CNContactListAction *)self delegate];
  [v10 action:self presentViewController:v11];
}

- (void)performUndoAction
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  [v3 setIgnoresGuardianRestrictions:1];
  [v4 setIgnoresGuardianRestrictions:1];
  v5 = [(CNContactListMergeAction *)self mergeUnifyActionHelper];
  char v6 = [v5 applyUndoTo:v3 and:v4];

  if (v6)
  {
    v7 = [(CNContactListAction *)self configuration];
    v8 = [v7 contactStore];
    id v17 = 0;
    int v9 = [v8 executeSaveRequest:v3 error:&v17];
    v10 = v17;

    id v11 = 0;
    if (!v9) {
      goto LABEL_7;
    }
    v12 = [(CNContactListAction *)self configuration];
    v13 = [v12 contactStore];
    id v16 = 0;
    char v14 = [v13 executeSaveRequest:v4 error:&v16];
    id v11 = v16;

    if (v14)
    {
      v15 = [(CNContactListAction *)self delegate];
      [v15 actionDidFinish:self];
    }
    else
    {
LABEL_7:
      v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v10;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, "Failed to undo merge contacts action: %@ | %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v10, OS_LOG_TYPE_ERROR, "Failed to undo merge contacts action: no merge result to undo", buf, 2u);
    }
  }
}

- (BOOL)mergeWillRequireLinkingForContacts:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CNContactListMergeAction_mergeWillRequireLinkingForContacts___block_invoke;
  v7[3] = &unk_1E54993F0;
  v7[4] = self;
  id v3 = objc_msgSend(a3, "_cn_groupBy:", v7);
  id v4 = [v3 allKeys];
  BOOL v5 = (unint64_t)[v4 count] > 1;

  return v5;
}

__CFString *__63__CNContactListMergeAction_mergeWillRequireLinkingForContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 configuration];
  BOOL v5 = [v4 contactViewCache];
  char v6 = [v5 containerForContact:v3];

  v7 = [v6 identifier];
  v8 = v7;
  if (!v7) {
    v7 = &stru_1ED8AC728;
  }
  int v9 = v7;

  return v9;
}

- (BOOL)executeAction
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  id v4 = [(CNContactListMergeAction *)self mergeUnifyActionHelper];

  if (!v4)
  {
    BOOL v5 = [_TtC10ContactsUI33ContactListMergeUnifyActionHelper alloc];
    char v6 = [(CNContactListAction *)self configuration];
    v7 = [v6 contactStore];
    v8 = [(ContactListMergeUnifyActionHelper *)v5 initWithContactStore:v7];
    [(CNContactListMergeAction *)self setMergeUnifyActionHelper:v8];
  }
  int v9 = [(CNContactListMergeAction *)self groupsAndContainersSaveManager];

  if (!v9)
  {
    v10 = [CNUIGroupsAndContainersSaveManager alloc];
    id v11 = [(CNContactListAction *)self configuration];
    v12 = [v11 contactStore];
    v13 = [(CNContactListAction *)self configuration];
    char v14 = [v13 contactViewCache];
    v15 = [(CNUIGroupsAndContainersSaveManager *)v10 initWithContactStore:v12 contactViewCache:v14];
    [(CNContactListMergeAction *)self setGroupsAndContainersSaveManager:v15];
  }
  id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v17 = [(CNContactListAction *)self contacts];
  v41 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v18 = [(CNContactListAction *)self contacts];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v45;
    uint64_t v22 = *MEMORY[0x1E4F5A258];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v25 = [(CNContactListMergeAction *)self groupsAndContainersSaveManager];
        v26 = [v25 parentGroupsForContact:v24];

        if (((*(uint64_t (**)(uint64_t, void *))(v22 + 16))(v22, v26) & 1) == 0)
        {
          v27 = [v24 identifier];
          [v41 setObject:v26 forKeyedSubscript:v27];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v20);
  }

  v28 = [(CNContactListMergeAction *)self mergeUnifyActionHelper];
  uint64_t v29 = [(CNContactListAction *)self contacts];
  v30 = [(CNContactListAction *)self contacts];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __41__CNContactListMergeAction_executeAction__block_invoke;
  v43[3] = &unk_1E549C068;
  v43[4] = self;
  v31 = objc_msgSend(v30, "_cn_map:", v43);
  [v28 mergeContacts:v29 withContainerIdentifiers:v31 withContactIDToParentGroupsDict:v41];

  v32 = [(CNContactListMergeAction *)self mergeUnifyActionHelper];
  LOBYTE(v29) = [v32 applyMergeResultToSaveRequest:v40];

  if ((v29 & 1) == 0)
  {
    v37 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18B625000, v37, OS_LOG_TYPE_ERROR, "Failed to merge contacts action: no merge result", buf, 2u);
    }
    goto LABEL_21;
  }
  BOOL v33 = 1;
  [v40 setIgnoresGuardianRestrictions:1];
  v34 = [(CNContactListAction *)self configuration];
  v35 = [v34 contactStore];
  id v42 = 0;
  char v36 = [v35 executeSaveRequest:v40 error:&v42];
  v37 = v42;

  if ((v36 & 1) == 0)
  {
    v38 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v37;
      _os_log_error_impl(&dword_18B625000, v38, OS_LOG_TYPE_ERROR, "Failed to merge contacts: %@", buf, 0xCu);
    }

LABEL_21:
    BOOL v33 = 0;
  }

  return v33;
}

__CFString *__41__CNContactListMergeAction_executeAction__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 configuration];
  BOOL v5 = [v4 contactViewCache];
  char v6 = [v5 containerForContact:v3];

  v7 = [v6 identifier];
  v8 = v7;
  if (!v7) {
    v7 = &stru_1ED8AC728;
  }
  int v9 = v7;

  return v9;
}

- (void)performAction
{
  id v3 = [(CNContactListAction *)self contacts];
  BOOL v4 = [(CNContactListMergeAction *)self mergeWillRequireLinkingForContacts:v3];

  BOOL v5 = NSString;
  char v6 = CNContactsUIBundle();
  v7 = v6;
  if (v4) {
    v8 = @"LIST_ACTION_MERGE_LINK_CARDS_MESSAGE";
  }
  else {
    v8 = @"LIST_ACTION_MERGE_CARDS_MESSAGE";
  }
  if (v4) {
    int v9 = @"LIST_ACTION_MERGE_LINK_CARDS_TITLE";
  }
  else {
    int v9 = @"LIST_ACTION_MERGE_CARDS_TITLE";
  }
  v10 = [v6 localizedStringForKey:v8 value:&stru_1ED8AC728 table:@"Localized"];
  id v11 = [(CNContactListAction *)self contacts];
  unint64_t v12 = [v11 count];

  if (v12 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  char v14 = objc_msgSend(v5, "localizedStringWithFormat:", v10, v13);

  v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:0 preferredStyle:1];
  id v16 = NSString;
  id v17 = CNContactsUIBundle();
  v18 = [v17 localizedStringForKey:v9 value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v19 = [(CNContactListAction *)self contacts];
  unint64_t v20 = [v19 count];

  if (v20 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
  uint64_t v22 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v21);

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __41__CNContactListMergeAction_performAction__block_invoke;
  v29[3] = &unk_1E549B590;
  v29[4] = self;
  v23 = [MEMORY[0x1E4FB1410] actionWithTitle:v22 style:0 handler:v29];
  [v15 addAction:v23];

  v24 = (void *)MEMORY[0x1E4FB1410];
  v25 = CNContactsUIBundle();
  v26 = [v25 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v27 = [v24 actionWithTitle:v26 style:1 handler:&__block_literal_global_28];
  [v15 addAction:v27];

  v28 = [(CNContactListAction *)self delegate];
  [v28 action:self presentViewController:v15];
}

void __41__CNContactListMergeAction_performAction__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) executeAction] & 1) == 0) {
    [*(id *)(a1 + 32) showMergeFailureAlert];
  }
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 actionDidFinish:*(void *)(a1 + 32)];
}

- (BOOL)shouldReloadListOnCompletion
{
  return 1;
}

@end