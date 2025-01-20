@interface CNAccountsAndGroupsActionsProvider
- (BOOL)addGroupToStoreForGroupItem:(id)a3 withName:(id)a4;
- (BOOL)authorizedDeleteGroupForItem:(id)a3 completionHandler:(id)a4;
- (BOOL)authorizedEditGroupNameForCell:(id)a3;
- (BOOL)deleteGroupActionForItem:(id)a3 sourceView:(id)a4 completionHandler:(id)a5;
- (BOOL)editGroupNameActionForItem:(id)a3 cell:(id)a4;
- (BOOL)emailGroupForItem:(id)a3;
- (BOOL)exportGroupForItem:(id)a3 sourceView:(id)a4;
- (BOOL)isAuthorizedToEditItem:(id)a3;
- (BOOL)messageGroupForItem:(id)a3;
- (CNAccountsAndGroupsActionsProvider)initWithDataSource:(id)a3 saveManager:(id)a4;
- (CNAccountsAndGroupsActionsProviderDelegate)delegate;
- (CNAccountsAndGroupsDataSource)dataSource;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (NSMutableArray)issuedSaveRequestIdentifiers;
- (id)actionsForItem:(id)a3 cell:(id)a4;
- (id)contextMenuConfigurationForItem:(id)a3 cell:(id)a4 atIndexPath:(id)a5;
- (id)leadingActionsForItem:(id)a3 cell:(id)a4;
- (id)trailingActionsForItem:(id)a3 cell:(id)a4 isCollectionViewEditing:(BOOL)a5;
- (void)authorizedCreateGroupActionForContainerItem:(id)a3;
- (void)createGroupActionForContainerItem:(id)a3 isCollectionViewEditing:(BOOL)a4;
- (void)deleteGroupForItem:(id)a3 completionHandler:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setIssuedSaveRequestIdentifiers:(id)a3;
- (void)updateItem:(id)a3 withNewName:(id)a4;
@end

@implementation CNAccountsAndGroupsActionsProvider

- (void)setDelegate:(id)a3
{
}

- (CNAccountsAndGroupsActionsProvider)initWithDataSource:(id)a3 saveManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAccountsAndGroupsActionsProvider;
  v9 = [(CNAccountsAndGroupsActionsProvider *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_groupsAndContainersSaveManager, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_issuedSaveRequestIdentifiers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setDataSource:(id)a3
{
}

- (CNAccountsAndGroupsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setIssuedSaveRequestIdentifiers:(id)a3
{
}

- (NSMutableArray)issuedSaveRequestIdentifiers
{
  return self->_issuedSaveRequestIdentifiers;
}

- (CNAccountsAndGroupsActionsProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAccountsAndGroupsActionsProviderDelegate *)WeakRetained;
}

- (BOOL)isAuthorizedToEditItem:(id)a3
{
  id v4 = a3;
  v5 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
  v6 = [v5 containerIdentifierForItem:v4];

  id v7 = [(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager];
  LOBYTE(v4) = [v7 isAuthorizedToEditContainerWithIdentifier:v6];

  return (char)v4;
}

- (BOOL)addGroupToStoreForGroupItem:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  [(CNAccountsAndGroupsActionsProvider *)self setIssuedSaveRequestIdentifiers:v8];

  v9 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
  v10 = [v9 containerIdentifierForItem:v6];

  if (v10)
  {
    if ([v6 type] == 2)
    {
      v11 = [(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager];
      id v12 = [v11 accountForContainerIdentifier:v10];

      id v13 = (id)[objc_alloc(MEMORY[0x1E4F1BA48]) initWithName:v7 type:2];
      id v14 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
      [v14 setIgnoresGuardianRestrictions:1];
      v15 = [(CNAccountsAndGroupsActionsProvider *)self issuedSaveRequestIdentifiers];
      v16 = [v14 saveRequestIdentifier];
      [v15 addObject:v16];

      v17 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
      v18 = [v17 store];
      v19 = [v12 identifier];
      int v20 = [v13 addContainerInStore:v18 toAccountWithIdentifier:v19 saveRequest:v14];

      if (!v20)
      {
        BOOL v22 = 0;
        goto LABEL_10;
      }
      v21 = [v13 identifier];
      [v6 setIdentifier:v21];

      [v6 setContainerIdentifier:0];
    }
    else
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1BA50]);
      [v12 setName:v7];
      id v13 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
      [v13 setIgnoresGuardianRestrictions:1];
      v23 = [(CNAccountsAndGroupsActionsProvider *)self issuedSaveRequestIdentifiers];
      v24 = [v13 saveRequestIdentifier];
      [v23 addObject:v24];

      v25 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
      v26 = [v25 store];
      LODWORD(v24) = [v12 addGroupInStore:v26 toContainerWithIdentifier:v10 saveRequest:v13];

      if (!v24)
      {
        BOOL v22 = 0;
        goto LABEL_12;
      }
      id v14 = [v12 identifier];
      [v6 setIdentifier:v14];
    }
    BOOL v22 = 1;
LABEL_10:

LABEL_12:
    goto LABEL_13;
  }
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (void)authorizedCreateGroupActionForContainerItem:(id)a3
{
  id v13 = a3;
  id v4 = [(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager];
  v5 = [v13 identifier];
  id v6 = [v4 accountForContainerIdentifier:v5];

  id v7 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  if (v6)
  {
    id v8 = [v6 identifier];
    [(CNAccountsAndGroupsItem *)v7 expandSectionForAccountWithIdentifier:v8];

    if ([v13 type] == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 4;
    }
    id v7 = [[CNAccountsAndGroupsItem alloc] initWithType:v9 nameProvider:0];
    [(CNAccountsAndGroupsItem *)v7 setIdentifier:@"groupPlaceholderIdentifier"];
    v10 = [v13 identifier];
    [(CNAccountsAndGroupsItem *)v7 setContainerIdentifier:v10];

    v11 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    id v12 = [v6 identifier];
    [v11 reloadCollectionViewAddingPlaceholderItem:v7 inSectionWithIdentifier:v12];
  }
  else
  {
    v11 = CNContactsUIBundle();
    id v12 = [v11 localizedStringForKey:@"CREATE_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNAccountsAndGroupsItem *)v7 presentErrorAlertWithMessage:v12 animated:1];
  }
}

- (void)createGroupActionForContainerItem:(id)a3 isCollectionViewEditing:(BOOL)a4
{
  id v11 = a3;
  if (a4
    || ([(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v11 identifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isAuthorizedToEditContainerWithIdentifier:v7],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    [(CNAccountsAndGroupsActionsProvider *)self authorizedCreateGroupActionForContainerItem:v11];
  }
  else
  {
    uint64_t v9 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    [(CNAccountsAndGroupsAuthorizationContext *)v9 setType:3];
    [(CNAccountsAndGroupsAuthorizationContext *)v9 setContainerItem:v11];
    v10 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    [v10 showEditAuthorizationPaneWithAuthorizationContext:v9 animated:1];
  }
}

- (void)updateItem:(id)a3 withNewName:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  id v7 = [v31 identifier];
  int v8 = [v7 isEqualToString:@"groupPlaceholderIdentifier"];

  uint64_t v9 = [v31 name];
  if (([v9 isEqualToString:v6] & 1) == 0)
  {
    char v10 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))();

    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
    id v11 = [MEMORY[0x1E4F1CA48] array];
    [(CNAccountsAndGroupsActionsProvider *)self setIssuedSaveRequestIdentifiers:v11];

    if (v8)
    {
      if (![(CNAccountsAndGroupsActionsProvider *)self addGroupToStoreForGroupItem:v31 withName:v6])
      {
        id v12 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
        [v12 reloadCollectionViewDeletingItem:v31];

LABEL_16:
        id v13 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
        v29 = CNContactsUIBundle();
        v30 = [v29 localizedStringForKey:@"UPDATE_GROUP_NAME_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
        [v13 presentErrorAlertWithMessage:v30 animated:1];

        goto LABEL_17;
      }
    }
    else if ([v31 type] == 4)
    {
      id v14 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
      v15 = [v14 groupIdentifierForGroupItem:v31];

      v16 = [(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager];
      v17 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
      v18 = [v17 store];
      v19 = [(CNAccountsAndGroupsActionsProvider *)self issuedSaveRequestIdentifiers];
      char v20 = [v16 updateGroupWithIdentifier:v15 inStore:v18 withNewName:v6 ignoresGuardianRestrictions:1 issuedRequestIdentifiers:v19];

      if ((v20 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
      if ([v31 type] != 2) {
        goto LABEL_16;
      }
      v21 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
      BOOL v22 = [v21 containerIdentifierForItem:v31];

      v23 = [(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager];
      v24 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
      v25 = [v24 store];
      v26 = [(CNAccountsAndGroupsActionsProvider *)self issuedSaveRequestIdentifiers];
      int v27 = [v23 updateContainerWithIdentifier:v22 inStore:v25 withNewName:v6 ignoresGuardianRestrictions:1 issuedRequestIdentifiers:v26];

      if (!v27) {
        goto LABEL_16;
      }
    }
    [v31 setName:v6];
    v28 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
    id v13 = [v28 sectionIdentifierForItem:v31];

    if (!v13) {
      goto LABEL_18;
    }
    v29 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    [v29 reloadCollectionViewForSectionWithIdentifier:v13 settingFilterForEditingItem:0 allowsReloadWhenEditing:0];
LABEL_17:

    goto LABEL_18;
  }

LABEL_7:
  if (!v8) {
    goto LABEL_19;
  }
  id v13 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  [v13 reloadCollectionViewDeletingItem:v31];
LABEL_18:

LABEL_19:
}

- (BOOL)authorizedEditGroupNameForCell:(id)a3
{
  id v4 = a3;
  v5 = [v4 item];
  id v6 = [v5 identifier];
  id v7 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
  [v7 setCurrentlyEditingGroupIdentifier:v6];

  [v4 beginEditingName];
  return 1;
}

- (BOOL)editGroupNameActionForItem:(id)a3 cell:(id)a4
{
  id v6 = a4;
  if ([(CNAccountsAndGroupsActionsProvider *)self isAuthorizedToEditItem:a3])
  {
    BOOL v7 = [(CNAccountsAndGroupsActionsProvider *)self authorizedEditGroupNameForCell:v6];
  }
  else
  {
    int v8 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    BOOL v7 = 1;
    [(CNAccountsAndGroupsAuthorizationContext *)v8 setType:1];
    [(CNAccountsAndGroupsAuthorizationContext *)v8 setCell:v6];
    uint64_t v9 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    [v9 showEditAuthorizationPaneWithAuthorizationContext:v8 animated:1];
  }
  return v7;
}

- (BOOL)authorizedDeleteGroupForItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, BOOL))a4;
  int v8 = [MEMORY[0x1E4F1CA48] array];
  [(CNAccountsAndGroupsActionsProvider *)self setIssuedSaveRequestIdentifiers:v8];

  uint64_t v9 = [v6 identifier];
  char v10 = [v9 isEqualToString:@"groupPlaceholderIdentifier"];

  if (v10) {
    goto LABEL_7;
  }
  if ([v6 type] == 2)
  {
    id v11 = [(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager];
    id v12 = [v6 identifier];
    id v13 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
    id v14 = [v13 store];
    v15 = [(CNAccountsAndGroupsActionsProvider *)self issuedSaveRequestIdentifiers];
    char v16 = [v11 deleteContainerWithIdentifier:v12 inStore:v14 ignoresGuardianRestrictions:1 issuedRequestIdentifiers:v15];
  }
  else
  {
    if ([v6 type] != 4) {
      goto LABEL_8;
    }
    id v11 = [(CNAccountsAndGroupsActionsProvider *)self groupsAndContainersSaveManager];
    id v12 = [v6 identifier];
    id v13 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
    id v14 = [v13 store];
    v15 = [(CNAccountsAndGroupsActionsProvider *)self issuedSaveRequestIdentifiers];
    char v16 = [v11 deleteGroupWithIdentifier:v12 inStore:v14 ignoresGuardianRestrictions:1 issuedRequestIdentifiers:v15];
  }
  char v17 = v16;

  if (v17)
  {
LABEL_7:
    v18 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
    [v18 setCurrentlyEditingGroupIdentifier:0];

    v19 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    [v19 reloadCollectionViewDeletingItem:v6];
    BOOL v20 = 1;
    goto LABEL_9;
  }
LABEL_8:
  v19 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  v21 = CNContactsUIBundle();
  BOOL v22 = [v21 localizedStringForKey:@"DELETE_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
  [v19 presentErrorAlertWithMessage:v22 animated:1];

  BOOL v20 = 0;
LABEL_9:

  if (v7) {
    v7[2](v7, v20);
  }

  return v20;
}

- (void)deleteGroupForItem:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(CNAccountsAndGroupsActionsProvider *)self isAuthorizedToEditItem:v9])
  {
    [(CNAccountsAndGroupsActionsProvider *)self authorizedDeleteGroupForItem:v9 completionHandler:v6];
  }
  else
  {
    BOOL v7 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    [(CNAccountsAndGroupsAuthorizationContext *)v7 setType:2];
    [(CNAccountsAndGroupsAuthorizationContext *)v7 setItem:v9];
    [(CNAccountsAndGroupsAuthorizationContext *)v7 setActionCompletionHandler:v6];
    int v8 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    [v8 showEditAuthorizationPaneWithAuthorizationContext:v7 animated:1];
  }
}

- (BOOL)deleteGroupActionForItem:(id)a3 sourceView:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  char v10 = NSString;
  id v11 = a4;
  id v12 = CNContactsUIBundle();
  id v13 = [v12 localizedStringForKey:@"DELETE_GROUP_CONFIRMATION_ALERT_TITLE-%@" value:&stru_1ED8AC728 table:@"Localized"];
  id v14 = [v8 name];
  v41 = objc_msgSend(v10, "localizedStringWithFormat:", v13, v14);

  v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v41 message:0 preferredStyle:1];
  char v16 = (void *)MEMORY[0x1E4FB1410];
  char v17 = CNContactsUIBundle();
  v18 = [v17 localizedStringForKey:@"DELETE_GROUP" value:&stru_1ED8AC728 table:@"Localized"];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke;
  v44[3] = &unk_1E54997B0;
  v44[4] = self;
  id v45 = v8;
  id v19 = v9;
  id v46 = v19;
  id v20 = v8;
  v21 = [v16 actionWithTitle:v18 style:2 handler:v44];

  [v15 addAction:v21];
  BOOL v22 = (void *)MEMORY[0x1E4FB1410];
  v23 = CNContactsUIBundle();
  v24 = [v23 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke_2;
  v42[3] = &unk_1E549A818;
  id v43 = v19;
  id v25 = v19;
  v26 = [v22 actionWithTitle:v24 style:1 handler:v42];

  [v15 addAction:v26];
  int v27 = [v15 popoverPresentationController];
  [v27 setSourceView:v11];

  [v11 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  v36 = [v15 popoverPresentationController];
  objc_msgSend(v36, "setSourceRect:", v29, v31, v33, v35);

  v37 = [v15 popoverPresentationController];
  [v37 setPermittedArrowDirections:15];

  v38 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  [v38 presentController:v15 animated:1];

  return 1;
}

uint64_t __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteGroupForItem:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

uint64_t __92__CNAccountsAndGroupsActionsProvider_deleteGroupActionForItem_sourceView_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (BOOL)exportGroupForItem:(id)a3 sourceView:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  [v8 resignAllFirstRespondersSavingCurrentlyEditing:0];

  id v9 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
  char v10 = +[CNContactListShareContactsAction descriptorForRequiredKeys];
  v18[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v12 = [v9 allContactsForItem:v7 keysToFetch:v11];

  id v13 = objc_alloc_init(CNContactListShareContactsActionContext);
  id v14 = [v7 name];

  [(CNContactListShareContactsActionContext *)v13 setGroupName:v14];
  v15 = [[CNContactListShareContactsAction alloc] initWithContacts:v12 sourceView:v6 context:v13];

  char v16 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  [(CNContactListShareContactsAction *)v15 setDelegate:v16];

  [(CNContactListShareContactsAction *)v15 performAction];
  return 1;
}

- (BOOL)messageGroupForItem:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  [v5 resignAllFirstRespondersSavingCurrentlyEditing:0];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1BA38]);
  id v7 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
  id v8 = [MEMORY[0x1E4F1BA38] descriptorForRequiredKeys];
  v20[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  char v10 = [v7 allContactsForItem:v4 keysToFetch:v9];

  id v11 = [v6 messageUrlForContacts:v10];
  if (v11)
  {
    id v12 = +[CNUIContactsEnvironment currentEnvironment];
    id v13 = [v12 applicationWorkspace];
    uint64_t v18 = *MEMORY[0x1E4F22320];
    uint64_t v19 = MEMORY[0x1E4F1CC38];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v13 openSensitiveURLInBackground:v11 withOptions:v14];
  }
  else
  {
    id v12 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    id v13 = CNContactsUIBundle();
    id v14 = [v13 localizedStringForKey:@"MESSAGE_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
    v15 = CNContactsUIBundle();
    char v16 = [v15 localizedStringForKey:@"MESSAGE_GROUP_FAILURE_HINT" value:&stru_1ED8AC728 table:@"Localized"];
    [v12 presentErrorAlertWithTitle:v14 message:v16 animated:1];
  }
  return v11 != 0;
}

- (BOOL)emailGroupForItem:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
  [v5 resignAllFirstRespondersSavingCurrentlyEditing:0];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1BA28]);
  id v7 = [(CNAccountsAndGroupsActionsProvider *)self dataSource];
  id v8 = [MEMORY[0x1E4F1BA28] descriptorForRequiredKeys];
  v18[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  char v10 = [v7 allContactsForItem:v4 keysToFetch:v9];

  id v11 = [v6 mailUrlForContacts:v10 needsEmailAddresses:0];
  if (v11)
  {
    id v12 = +[CNUIContactsEnvironment currentEnvironment];
    id v13 = [v12 applicationWorkspace];
    uint64_t v16 = *MEMORY[0x1E4F22320];
    uint64_t v17 = MEMORY[0x1E4F1CC38];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v13 openSensitiveURLInBackground:v11 withOptions:v14];
  }
  else
  {
    id v12 = [(CNAccountsAndGroupsActionsProvider *)self delegate];
    id v13 = CNContactsUIBundle();
    id v14 = [v13 localizedStringForKey:@"EMAIL_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
    [v12 presentErrorAlertWithMessage:v14 animated:1];
  }

  return v11 != 0;
}

- (id)actionsForItem:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 canEmail])
  {
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    id v9 = CNContactsUIBundle();
    char v10 = [v9 localizedStringForKey:@"EMAIL_GROUP" value:&stru_1ED8AC728 table:@"Localized"];
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"envelope"];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke;
    v54[3] = &unk_1E549BFC8;
    v54[4] = self;
    id v55 = v6;
    id v12 = [v8 actionWithTitle:v10 image:v11 identifier:0 handler:v54];

    id v13 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v12];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([v6 canMessage])
  {
    id v14 = (void *)MEMORY[0x1E4FB13F0];
    v15 = CNContactsUIBundle();
    uint64_t v16 = [v15 localizedStringForKey:@"MESSAGE_GROUP" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message"];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_2;
    v52[3] = &unk_1E549BFC8;
    v52[4] = self;
    id v53 = v6;
    uint64_t v18 = [v14 actionWithTitle:v16 image:v17 identifier:0 handler:v52];

    uint64_t v19 = [v13 arrayByAddingObject:v18];

    id v13 = (void *)v19;
  }
  if ([v6 canExport])
  {
    id v20 = (void *)MEMORY[0x1E4FB13F0];
    v21 = CNContactsUIBundle();
    BOOL v22 = [v21 localizedStringForKey:@"EXPORT_GROUP" value:&stru_1ED8AC728 table:@"Localized"];
    v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up.on.square"];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_3;
    v49[3] = &unk_1E549BFF0;
    v49[4] = self;
    id v50 = v6;
    id v51 = v7;
    v24 = [v20 actionWithTitle:v22 image:v23 identifier:0 handler:v49];

    uint64_t v25 = [v13 arrayByAddingObject:v24];

    id v13 = (void *)v25;
  }
  if ([v6 canRename])
  {
    v26 = (void *)MEMORY[0x1E4FB13F0];
    int v27 = CNContactsUIBundle();
    double v28 = [v27 localizedStringForKey:@"RENAME_GROUP" value:&stru_1ED8AC728 table:@"Localized"];
    double v29 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pencil"];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_4;
    v46[3] = &unk_1E549BFF0;
    v46[4] = self;
    id v47 = v6;
    id v48 = v7;
    double v30 = [v26 actionWithTitle:v28 image:v29 identifier:0 handler:v46];

    uint64_t v31 = [v13 arrayByAddingObject:v30];

    id v13 = (void *)v31;
  }
  if ([v6 canDelete])
  {
    double v32 = (void *)MEMORY[0x1E4FB13F0];
    double v33 = CNContactsUIBundle();
    double v34 = [v33 localizedStringForKey:@"DELETE_GROUP" value:&stru_1ED8AC728 table:@"Localized"];
    double v35 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_5;
    v42 = &unk_1E549BFF0;
    id v43 = self;
    id v44 = v6;
    id v45 = v7;
    v36 = [v32 actionWithTitle:v34 image:v35 identifier:0 handler:&v39];

    objc_msgSend(v36, "setAttributes:", 2, v39, v40, v41, v42, v43);
    uint64_t v37 = [v13 arrayByAddingObject:v36];

    id v13 = (void *)v37;
  }

  return v13;
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) emailGroupForItem:*(void *)(a1 + 40)];
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) messageGroupForItem:*(void *)(a1 + 40)];
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) exportGroupForItem:*(void *)(a1 + 40) sourceView:*(void *)(a1 + 48)];
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) editGroupNameActionForItem:*(void *)(a1 + 40) cell:*(void *)(a1 + 48)];
}

uint64_t __58__CNAccountsAndGroupsActionsProvider_actionsForItem_cell___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteGroupActionForItem:*(void *)(a1 + 40) sourceView:*(void *)(a1 + 48) completionHandler:0];
}

- (id)contextMenuConfigurationForItem:(id)a3 cell:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__CNAccountsAndGroupsActionsProvider_contextMenuConfigurationForItem_cell_atIndexPath___block_invoke;
  aBlock[3] = &unk_1E5499788;
  aBlock[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = a5;
  id v13 = _Block_copy(aBlock);
  id v14 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:v12 previewProvider:0 actionProvider:v13];

  return v14;
}

id __87__CNAccountsAndGroupsActionsProvider_contextMenuConfigurationForItem_cell_atIndexPath___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) actionsForItem:*(void *)(a1 + 40) cell:*(void *)(a1 + 48)];
  v2 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 children:v1];

  return v2;
}

- (id)trailingActionsForItem:(id)a3 cell:(id)a4 isCollectionViewEditing:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v8 canDelete])
  {
    id v11 = (void *)MEMORY[0x1E4FB1688];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke;
    v25[3] = &unk_1E5499738;
    BOOL v27 = a5;
    v25[4] = self;
    id v26 = v8;
    id v12 = [v11 contextualActionWithStyle:1 title:0 handler:v25];
    id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash.fill"];
    [v12 setImage:v13];

    [v10 addObject:v12];
  }
  if (!a5 && [v8 canRename])
  {
    id v14 = (void *)MEMORY[0x1E4FB1688];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_2;
    v21 = &unk_1E5499760;
    BOOL v22 = self;
    id v23 = v8;
    id v24 = v9;
    v15 = [v14 contextualActionWithStyle:0 title:0 handler:&v18];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"pencil", v18, v19, v20, v21, v22);
    [v15 setImage:v16];

    [v10 addObject:v15];
  }

  return v10;
}

uint64_t __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = *(unsigned __int8 *)(a1 + 48);
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v7) {
    return [v8 authorizedDeleteGroupForItem:v9 completionHandler:a4];
  }
  else {
    return [v8 deleteGroupActionForItem:v9 sourceView:a3 completionHandler:a4];
  }
}

void __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, 1);
  dispatch_time_t v5 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_3;
  block[3] = &unk_1E549B800;
  id v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

uint64_t __90__CNAccountsAndGroupsActionsProvider_trailingActionsForItem_cell_isCollectionViewEditing___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) editGroupNameActionForItem:*(void *)(a1 + 40) cell:*(void *)(a1 + 48)];
}

- (id)leadingActionsForItem:(id)a3 cell:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 canEmail])
  {
    int v7 = (void *)MEMORY[0x1E4FB1688];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke;
    v22[3] = &unk_1E549C018;
    v22[4] = self;
    id v23 = v5;
    id v8 = [v7 contextualActionWithStyle:0 title:0 handler:v22];
    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"envelope.fill"];
    [v8 setImage:v9];

    id v10 = +[CNUIColorRepository groupsMailActionColor];
    [v8 setBackgroundColor:v10];

    [v6 addObject:v8];
  }
  if ([v5 canMessage])
  {
    id v11 = (void *)MEMORY[0x1E4FB1688];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke_2;
    uint64_t v19 = &unk_1E549C018;
    id v20 = self;
    id v21 = v5;
    id v12 = [v11 contextualActionWithStyle:0 title:0 handler:&v16];
    id v13 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"message.fill", v16, v17, v18, v19, v20);
    [v12 setImage:v13];

    id v14 = +[CNUIColorRepository groupsTextActionColor];
    [v12 setBackgroundColor:v14];

    [v6 addObject:v12];
  }

  return v6;
}

void __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a4;
  v6[2](v6, [v4 emailGroupForItem:v5]);
}

void __65__CNAccountsAndGroupsActionsProvider_leadingActionsForItem_cell___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a4;
  v6[2](v6, [v4 messageGroupForItem:v5]);
}

@end