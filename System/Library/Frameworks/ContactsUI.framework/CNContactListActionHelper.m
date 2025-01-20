@interface CNContactListActionHelper
+ (id)descriptorForRequiredKeysForMultiSelectAction:(BOOL)a3;
+ (id)log;
- (BOOL)canRemoveFromGroup;
- (BOOL)canShowContactActionsForContacts:(id)a3;
- (BOOL)canShowDeleteAction;
- (BOOL)canShowMergeActionForContacts:(id)a3;
- (BOOL)canShowSetAsMyCardActionForContacts:(id)a3;
- (BOOL)includesContactOrbActions;
- (BOOL)includesEditingActions;
- (CNActionMenuHelper)actionMenuHelper;
- (CNContactListActionConfiguration)actionConfiguration;
- (CNContactListActionExecutor)actionExecutor;
- (CNContactListActionHelper)initWithContactStore:(id)a3 environment:(id)a4 contactFormatter:(id)a5 undoManager:(id)a6;
- (CNContactListActionHelperDelegate)delegate;
- (CNContactOrbActionsController)contactActionsController;
- (NSArray)contacts;
- (id)actionsForContacts:(id)a3 dataSourceFilter:(id)a4 sourceView:(id)a5;
- (id)contactActionsMenuForContact:(id)a3;
- (id)contactActionsMenuFromItems:(id)a3;
- (id)presentingViewControllerForActions;
- (id)searchMenuActionProviderForContacts:(id)a3;
- (id)trailingSwipeActionsForContact:(id)a3 dataSourceFilter:(id)a4;
- (void)action:(id)a3 presentViewController:(id)a4;
- (void)actionDidFinish:(id)a3;
- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)copyContacts:(id)a3;
- (void)deleteContacts:(id)a3;
- (void)deleteContacts:(id)a3 dataSourceFilter:(id)a4;
- (void)mergeContacts:(id)a3;
- (void)removeContactsFromGroup:(id)a3 withConfirmation:(BOOL)a4;
- (void)setActionConfiguration:(id)a3;
- (void)setActionExecutor:(id)a3;
- (void)setActionMenuHelper:(id)a3;
- (void)setContactActionsController:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncludesContactOrbActions:(BOOL)a3;
- (void)setIncludesEditingActions:(BOOL)a3;
- (void)shareContacts:(id)a3 sourceView:(id)a4;
- (void)updateMeContact:(id)a3;
- (void)willDismissMenu;
- (void)willDisplayMenuWithContextMenuInteraction:(id)a3;
@end

@implementation CNContactListActionHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_contactActionsController, 0);
  objc_storeStrong((id *)&self->_actionExecutor, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_actionConfiguration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setActionMenuHelper:(id)a3
{
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setContactActionsController:(id)a3
{
}

- (CNContactOrbActionsController)contactActionsController
{
  return self->_contactActionsController;
}

- (void)setActionExecutor:(id)a3
{
}

- (CNContactListActionExecutor)actionExecutor
{
  return self->_actionExecutor;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setIncludesEditingActions:(BOOL)a3
{
  self->_includesEditingActions = a3;
}

- (BOOL)includesEditingActions
{
  return self->_includesEditingActions;
}

- (void)setIncludesContactOrbActions:(BOOL)a3
{
  self->_includesContactOrbActions = a3;
}

- (BOOL)includesContactOrbActions
{
  return self->_includesContactOrbActions;
}

- (void)setActionConfiguration:(id)a3
{
}

- (CNContactListActionConfiguration)actionConfiguration
{
  return self->_actionConfiguration;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactListActionHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListActionHelperDelegate *)WeakRetained;
}

- (void)contactOrbActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(CNContactListActionHelper *)self actionMenuHelper];

  if (v6)
  {
    v7 = [(CNContactListActionHelper *)self actionMenuHelper];
    v8 = [(CNContactListActionHelper *)self delegate];
    v9 = [v8 contextMenuInteraction];
    [v7 updateWithMenuItems:v5 contextMenuInteraction:v9];

LABEL_5:
    goto LABEL_6;
  }
  v10 = [(CNContactListActionHelper *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v7 = [(CNContactListActionHelper *)self contactActionsMenuFromItems:v5];
    v12 = [(CNContactListActionHelper *)self delegate];
    v14[0] = v7;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v12 listActionHelper:self didUpdateWithMenu:v13];

    goto LABEL_5;
  }
LABEL_6:
}

- (id)presentingViewControllerForActions
{
  v2 = [(CNContactListActionHelper *)self delegate];
  v3 = [v2 presentingViewControllerForActions];

  return v3;
}

- (void)actionDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListActionHelper *)self delegate];
  [v5 actionDidFinish:v4];
}

- (void)action:(id)a3 presentViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNContactListActionHelper *)self delegate];
  [v8 action:v7 presentViewController:v6];
}

- (BOOL)canShowContactActionsForContacts:(id)a3
{
  id v4 = a3;
  if ([(CNContactListActionHelper *)self includesContactOrbActions]) {
    BOOL v5 = [v4 count] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)contactActionsMenuFromItems:(id)a3
{
  return (id)[MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 image:0 identifier:@"CNContactListActionHelperOrbMenuIdentifier" options:1 children:a3];
}

- (id)contactActionsMenuForContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[CNContactOrbActionsController alloc] initWithContact:v4];

  [(CNContactListActionHelper *)self setContactActionsController:v5];
  id v6 = [(CNContactListActionHelper *)self contactActionsController];

  if (v6)
  {
    id v7 = [(CNContactListActionHelper *)self contactActionsController];
    [v7 setDelegate:self];

    id v8 = [(CNContactListActionHelper *)self contactActionsController];
    id v6 = [v8 currentAvailableMenuItems];
  }
  v9 = [(CNContactListActionHelper *)self contactActionsMenuFromItems:v6];

  return v9;
}

- (void)copyContacts:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CNContactListActionHelper_copyContacts___block_invoke;
  v5[3] = &unk_1E549C068;
  v5[4] = self;
  v3 = objc_msgSend(a3, "_cn_map:", v5);
  id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v4 setItemProviders:v3];
}

id __42__CNContactListActionHelper_copyContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 actionConfiguration];
  BOOL v5 = [v4 contactStore];
  id v6 = +[CNUIDraggingContacts itemProviderForContact:v3 withContactStore:v5];

  id v7 = +[CNUIVCardUtilities fileNameForContact:v3];

  [v6 setSuggestedName:v7];

  return v6;
}

- (BOOL)canShowSetAsMyCardActionForContacts:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    BOOL v5 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    int v6 = [v5 isMeContact:v4] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)updateMeContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [CNContactListSetMyCardAction alloc];
  int v6 = [(CNContactListActionHelper *)self actionConfiguration];
  id v8 = [(CNContactListSetMyCardAction *)v5 initWithContact:v4 configuration:v6];

  [(CNContactListAction *)v8 setDelegate:self];
  id v7 = [(CNContactListActionHelper *)self actionExecutor];
  [v7 executeUndoableAction:v8];
}

- (BOOL)canShowMergeActionForContacts:(id)a3
{
  return (unint64_t)[a3 count] > 1;
}

- (void)mergeContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = [CNContactListMergeAction alloc];
  int v6 = [(CNContactListActionHelper *)self actionConfiguration];
  id v8 = [(CNContactListAction *)v5 initWithContacts:v4 configuration:v6];

  [(CNContactListAction *)v8 setDelegate:self];
  id v7 = [(CNContactListActionHelper *)self actionExecutor];
  [v7 executeUndoableAction:v8];
}

- (void)deleteContacts:(id)a3 dataSourceFilter:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(CNContactListActionHelper *)self actionConfiguration];
  [v7 setContactStoreFilter:v6];

  [(CNContactListActionHelper *)self deleteContacts:v8];
}

- (void)deleteContacts:(id)a3
{
  id v4 = a3;
  BOOL v5 = [CNContactListDeleteContactsAction alloc];
  id v6 = [(CNContactListActionHelper *)self actionConfiguration];
  id v8 = [(CNContactListDeleteContactsAction *)v5 initWithContacts:v4 configuration:v6];

  [(CNContactListAction *)v8 setDelegate:self];
  id v7 = [(CNContactListActionHelper *)self actionExecutor];
  [v7 executeUndoableAction:v8];
}

- (BOOL)canShowDeleteAction
{
  v2 = self;
  id v3 = [(CNContactListActionHelper *)self contacts];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CNContactListActionHelper_canShowDeleteAction__block_invoke;
  v5[3] = &unk_1E549C040;
  v5[4] = v2;
  LODWORD(v2) = objc_msgSend(v3, "_cn_any:", v5) ^ 1;

  return (char)v2;
}

uint64_t __48__CNContactListActionHelper_canShowDeleteAction__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 actionConfiguration];
  BOOL v5 = [v4 contactViewCache];
  id v6 = [v5 policyForContact:v3];

  uint64_t v7 = [v6 isReadonly];
  return v7;
}

- (void)shareContacts:(id)a3 sourceView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[CNContactListShareContactsAction alloc] initWithContacts:v7 sourceView:v6];

  [(CNContactListShareContactsAction *)v9 setDelegate:self];
  id v8 = [(CNContactListActionHelper *)self actionExecutor];
  [v8 executeAction:v9];
}

- (BOOL)canRemoveFromGroup
{
  if (![(CNContactListActionHelper *)self includesEditingActions]) {
    return 0;
  }
  id v3 = [(CNContactListActionHelper *)self actionConfiguration];
  id v4 = [v3 contactStoreFilter];

  BOOL v5 = [v4 groupIdentifiers];
  if ([v5 count] == 1)
  {
    id v6 = [v4 containerIdentifiers];
    BOOL v7 = [v6 count] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)removeContactsFromGroup:(id)a3 withConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [CNContactListRemoveContactsFromGroupAction alloc];
  id v8 = [(CNContactListActionHelper *)self actionConfiguration];
  v10 = [(CNContactListRemoveContactsFromGroupAction *)v7 initWithContacts:v6 configuration:v8 withConfirmation:v4];

  [(CNContactListAction *)v10 setDelegate:self];
  v9 = [(CNContactListActionHelper *)self actionExecutor];
  [v9 executeUndoableAction:v10];
}

- (id)trailingSwipeActionsForContact:(id)a3 dataSourceFilter:(id)a4
{
  id v6 = a3;
  if (v6
    && (id v7 = a4,
        [(CNContactListActionHelper *)self actionConfiguration],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 setContactStoreFilter:v7],
        v7,
        v8,
        [(CNContactListActionHelper *)self canRemoveFromGroup]))
  {
    v9 = CNContactsUIBundle();
    v10 = [v9 localizedStringForKey:@"LIST_SWIPE_ACTION_REMOVE_FROM_GROUP" value:&stru_1ED8AC728 table:@"Localized"];

    char v11 = (void *)MEMORY[0x1E4FB1688];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __77__CNContactListActionHelper_trailingSwipeActionsForContact_dataSourceFilter___block_invoke;
    v18 = &unk_1E549C018;
    v19 = self;
    id v20 = v6;
    v12 = [v11 contextualActionWithStyle:1 title:v10 handler:&v15];
    v13 = objc_msgSend(MEMORY[0x1E4F1CBF0], "arrayByAddingObject:", v12, v15, v16, v17, v18, v19);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

void __77__CNContactListActionHelper_trailingSwipeActionsForContact_dataSourceFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  BOOL v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = [v5 arrayWithObjects:&v8 count:1];
  objc_msgSend(v4, "removeContactsFromGroup:withConfirmation:", v7, 0, v8, v9);

  v6[2](v6, 1);
}

- (id)actionsForContacts:(id)a3 dataSourceFilter:(id)a4 sourceView:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v70 = a5;
  id v9 = a4;
  [(CNContactListActionHelper *)self setContacts:v8];
  v10 = [(CNContactListActionHelper *)self actionConfiguration];
  [v10 setContactStoreFilter:v9];

  if ([(CNContactListActionHelper *)self canShowContactActionsForContacts:v8])
  {
    objc_opt_class();
    char v11 = [v8 firstObject];
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (v13)
    {
      v14 = [(CNContactListActionHelper *)self contactActionsMenuForContact:v13];
      uint64_t v15 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v14];
    }
    else
    {
      uint64_t v16 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v68 = [v8 firstObject];
        *(_DWORD *)buf = 138412290;
        v89 = v68;
        _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "Attempted to orb non-contact: %@", buf, 0xCu);
      }
      uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v17 = CNContactsUIBundle();
  uint64_t v18 = [v17 localizedStringForKey:@"LIST_MENU_ACTION_COPY_CARD" value:&stru_1ED8AC728 table:@"Localized"];

  v19 = (void *)MEMORY[0x1E4FB13F0];
  id v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke;
  v85[3] = &unk_1E549BFC8;
  v85[4] = self;
  id v21 = v8;
  id v86 = v21;
  v72 = (void *)v18;
  v22 = [v19 actionWithTitle:v18 image:v20 identifier:0 handler:v85];

  v23 = CNContactsUIBundle();
  uint64_t v24 = [v23 localizedStringForKey:@"LIST_MENU_ACTION_SHARE_CARD" value:&stru_1ED8AC728 table:@"Localized"];

  v25 = (void *)MEMORY[0x1E4FB13F0];
  v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_2;
  v82[3] = &unk_1E549BFF0;
  v82[4] = self;
  id v27 = v21;
  id v83 = v27;
  id v28 = v70;
  id v84 = v28;
  v71 = (void *)v24;
  v29 = [v25 actionWithTitle:v24 image:v26 identifier:0 handler:v82];

  v30 = (void *)MEMORY[0x1E4FB1970];
  v87[0] = v22;
  v87[1] = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
  v32 = [v30 menuWithTitle:&stru_1ED8AC728 image:0 identifier:0 options:1 children:v31];

  v33 = [v15 arrayByAddingObject:v32];

  if ([(CNContactListActionHelper *)self includesEditingActions])
  {
    if ([(CNContactListActionHelper *)self canShowMergeActionForContacts:v27])
    {
      v34 = NSString;
      v35 = CNContactsUIBundle();
      v36 = [v35 localizedStringForKey:@"LIST_ACTION_MERGE_CARDS_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
      v37 = objc_msgSend(v34, "localizedStringWithFormat:", v36, objc_msgSend(v27, "count"));

      v38 = (void *)MEMORY[0x1E4FB13F0];
      v39 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.triangle.merge"];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_3;
      v80[3] = &unk_1E549BFC8;
      v80[4] = self;
      id v81 = v27;
      v40 = [v38 actionWithTitle:v37 image:v39 identifier:0 handler:v80];

      v41 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v40];
    }
    else
    {
      v41 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v69 = v22;
    if ([(CNContactListActionHelper *)self canShowSetAsMyCardActionForContacts:v27])
    {
      v42 = NSString;
      v43 = CNContactsUIBundle();
      v44 = [v43 localizedStringForKey:@"LIST_MENU_ACTION_MY_CARD" value:&stru_1ED8AC728 table:@"Localized"];
      v45 = objc_msgSend(v42, "localizedStringWithFormat:", v44, objc_msgSend(v27, "count"));

      v46 = (void *)MEMORY[0x1E4FB13F0];
      v47 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle"];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_4;
      v77[3] = &unk_1E549BFC8;
      id v78 = v27;
      v79 = self;
      v48 = [v46 actionWithTitle:v45 image:v47 identifier:0 handler:v77];

      uint64_t v49 = [v41 arrayByAddingObject:v48];

      v41 = (void *)v49;
    }
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
    {
      v50 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 image:0 identifier:0 options:1 children:v41];
      uint64_t v51 = [v33 arrayByAddingObject:v50];

      v33 = (void *)v51;
    }
    if ([(CNContactListActionHelper *)self canRemoveFromGroup])
    {
      v52 = CNContactsUIBundle();
      v53 = [v52 localizedStringForKey:@"LIST_ACTION_ALERT_ACTION_REMOVE_FROM_GROUP" value:&stru_1ED8AC728 table:@"Localized"];

      v54 = (void *)MEMORY[0x1E4FB13F0];
      v55 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_5;
      v75[3] = &unk_1E549BFC8;
      v75[4] = self;
      id v76 = v27;
      v56 = [v54 actionWithTitle:v53 image:v55 identifier:0 handler:v75];

      [v56 setAttributes:2];
      uint64_t v57 = [v33 arrayByAddingObject:v56];

      v33 = (void *)v57;
    }
    v22 = v69;
    if ([(CNContactListActionHelper *)self canShowDeleteAction])
    {
      if ((unint64_t)[v27 count] < 2)
      {
        v59 = CNContactsUIBundle();
        v61 = [v59 localizedStringForKey:@"CARD_ACTION_DELETE_CARD" value:&stru_1ED8AC728 table:@"Localized"];
      }
      else
      {
        v58 = NSString;
        v59 = CNContactsUIBundle();
        v60 = [v59 localizedStringForKey:@"CARD_ACTION_DELETE_CARD_MULTIPLE" value:&stru_1ED8AC728 table:@"Localized"];
        v61 = objc_msgSend(v58, "localizedStringWithFormat:", v60, objc_msgSend(v27, "count"));
      }
      v62 = (void *)MEMORY[0x1E4FB13F0];
      v63 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_6;
      v73[3] = &unk_1E549BFC8;
      v73[4] = self;
      id v74 = v27;
      v64 = [v62 actionWithTitle:v61 image:v63 identifier:0 handler:v73];

      [v64 setAttributes:2];
      uint64_t v65 = [v33 arrayByAddingObject:v64];

      v33 = (void *)v65;
      v22 = v69;
    }
  }
  else
  {
    v41 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v66 = v33;

  return v66;
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) copyContacts:*(void *)(a1 + 40)];
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareContacts:*(void *)(a1 + 40) sourceView:*(void *)(a1 + 48)];
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) mergeContacts:*(void *)(a1 + 40)];
}

void __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstObject];
  [*(id *)(a1 + 40) updateMeContact:v2];
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeContactsFromGroup:*(void *)(a1 + 40) withConfirmation:1];
}

uint64_t __76__CNContactListActionHelper_actionsForContacts_dataSourceFilter_sourceView___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteContacts:*(void *)(a1 + 40)];
}

- (void)willDisplayMenuWithContextMenuInteraction:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactListActionHelper *)self actionMenuHelper];
  [v5 willDisplayMenuWithContextMenuInteraction:v4];
}

- (void)willDismissMenu
{
  id v2 = [(CNContactListActionHelper *)self actionMenuHelper];
  [v2 willDismissMenu];
}

- (id)searchMenuActionProviderForContacts:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 firstObject];

  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if (!self->_actionMenuHelper)
    {
      id v8 = objc_alloc_init(CNActionMenuHelper);
      actionMenuHelper = self->_actionMenuHelper;
      self->_actionMenuHelper = v8;
    }
    v10 = [[CNContactOrbActionsController alloc] initWithContact:v7];
    [(CNContactListActionHelper *)self setContactActionsController:v10];

    char v11 = [(CNContactListActionHelper *)self contactActionsController];

    if (v11)
    {
      v12 = [(CNContactListActionHelper *)self contactActionsController];
      [v12 setDelegate:self];

      id v13 = [(CNContactListActionHelper *)self contactActionsController];
      v14 = [v13 currentAvailableMenuItems];

      if ([v14 count])
      {
        uint64_t v15 = [(CNContactListActionHelper *)self actionMenuHelper];
        uint64_t v16 = [(CNContactListActionHelper *)self delegate];
        v17 = [v16 contextMenuInteraction];
        [v15 updateWithMenuItems:v14 contextMenuInteraction:v17];
      }
    }
    uint64_t v18 = [(CNContactListActionHelper *)self actionMenuHelper];
    v19 = [v18 configurationActionProviderWithActionBlock:&__block_literal_global_56_65666];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (CNContactListActionHelper)initWithContactStore:(id)a3 environment:(id)a4 contactFormatter:(id)a5 undoManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CNContactListActionHelper;
  v14 = [(CNContactListActionHelper *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [[CNContactListActionExecutor alloc] initWithUndoManager:v13];
    actionExecutor = v14->_actionExecutor;
    v14->_actionExecutor = v15;

    v17 = objc_alloc_init(CNContactListActionConfiguration);
    actionConfiguration = v14->_actionConfiguration;
    v14->_actionConfiguration = v17;

    [(CNContactListActionConfiguration *)v14->_actionConfiguration setContactStore:v10];
    [(CNContactListActionConfiguration *)v14->_actionConfiguration setEnvironment:v11];
    [(CNContactListActionConfiguration *)v14->_actionConfiguration setContactFormatter:v12];
    v19 = objc_alloc_init(CNContactViewCache);
    [(CNContactListActionConfiguration *)v14->_actionConfiguration setContactViewCache:v19];

    id v20 = v14;
  }

  return v14;
}

+ (id)descriptorForRequiredKeysForMultiSelectAction:(BOOL)a3
{
  BOOL v3 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1B8F8];
  id v5 = +[CNContactListDeleteContactsAction descriptorForRequiredKeys];
  id v6 = +[CNContactListShareContactsAction descriptorForRequiredKeys];
  v17[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v8 = [NSString stringWithUTF8String:"+[CNContactListActionHelper descriptorForRequiredKeysForMultiSelectAction:]"];
  id v9 = [v4 descriptorWithKeyDescriptors:v7 description:v8];
  v18[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  if (v3)
  {
    id v11 = +[CNContactListMergeAction descriptorForRequiredKeys];
    uint64_t v12 = [v10 arrayByAddingObject:v11];

    id v10 = (void *)v12;
  }
  id v13 = (void *)MEMORY[0x1E4F1B8F8];
  v14 = [NSString stringWithUTF8String:"+[CNContactListActionHelper descriptorForRequiredKeysForMultiSelectAction:]"];
  uint64_t v15 = [v13 descriptorWithKeyDescriptors:v10 description:v14];

  return v15;
}

+ (id)log
{
  if (log_cn_once_token_3_65676 != -1) {
    dispatch_once(&log_cn_once_token_3_65676, &__block_literal_global_42_65677);
  }
  id v2 = (void *)log_cn_once_object_3_65678;

  return v2;
}

void __32__CNContactListActionHelper_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNContactListActionHelper");
  v1 = (void *)log_cn_once_object_3_65678;
  log_cn_once_object_3_65678 = (uint64_t)v0;
}

@end