@interface HUUserListTableManager
- (BOOL)_indexPathIsInviteUser:(id)a3;
- (BOOL)allowsEditing;
- (BOOL)editing;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CNContactStore)contactStore;
- (HMHome)home;
- (HUUserListManagerTableDelegate)delegate;
- (HUUserListTableManager)initWithTableView:(id)a3 viewController:(id)a4;
- (NSArray)invitations;
- (NSArray)users;
- (NSIndexPath)selectedIndexPath;
- (UITableView)tableView;
- (UIViewController)viewController;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_contactForUser:(id)a3;
- (id)_displayNameForUser:(id)a3;
- (id)_monogramForUser:(id)a3;
- (id)_personViewControllerForUser:(id)a3 invitation:(id)a4;
- (id)_stringForInvitationState:(int64_t)a3;
- (id)sortedInvitations;
- (id)sortedUsers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfDataRows;
- (int64_t)sectionForPeople;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_configurePersonViewController:(id)a3 invitation:(id)a4 isRemovable:(BOOL)a5;
- (void)_didAddUser:(id)a3;
- (void)_didInsertAtIndex:(unint64_t)a3;
- (void)_didReloadAtIndex:(unint64_t)a3;
- (void)_didRemoveAtIndex:(unint64_t)a3;
- (void)_didRemoveInvitation:(id)a3;
- (void)_didRemoveUser:(id)a3;
- (void)_reinvite;
- (void)_removeInvitation:(id)a3 completion:(id)a4;
- (void)_removeUser:(id)a3 completion:(id)a4;
- (void)_stopSharing;
- (void)_stopSharingWithCompletion:(id)a3;
- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4;
- (void)addPeopleViewControllerDidCancel:(id)a3;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)home:(id)a3 didUpdateStateForOutgoingInvitations:(id)a4;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setInvitations:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTableView:(id)a3;
- (void)setUsers:(id)a3;
- (void)setViewController:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateEditingRows;
@end

@implementation HUUserListTableManager

- (HUUserListTableManager)initWithTableView:(id)a3 viewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HUUserListTableManager;
  v9 = [(HUUserListTableManager *)&v22 init];
  v10 = v9;
  if (v9)
  {
    v9->_allowsEditing = 0;
    v11 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    contactStore = v10->_contactStore;
    v10->_contactStore = v11;

    objc_storeWeak((id *)&v10->_viewController, v8);
    objc_storeStrong((id *)&v10->_tableView, a3);
    tableView = v10->_tableView;
    uint64_t v14 = objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [(UITableView *)tableView registerClass:v14 forCellReuseIdentifier:v16];

    v17 = v10->_tableView;
    uint64_t v18 = objc_opt_class();
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [(UITableView *)v17 registerClass:v18 forCellReuseIdentifier:v20];

    [(UITableView *)v10->_tableView setDelegate:v10];
    [(UITableView *)v10->_tableView setDataSource:v10];
  }

  return v10;
}

- (void)setHome:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v5 = (HMHome *)a3;
  if (self->_home == v5)
  {
    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315394;
      objc_super v22 = "-[HUUserListTableManager setHome:]";
      __int16 v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%s Skipping since same as previous home %@", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_home, a3);
    v6 = [(HUUserListTableManager *)self sortedUsers];
    [(HUUserListTableManager *)self setUsers:v6];

    id v7 = [(HUUserListTableManager *)self sortedInvitations];
    [(HUUserListTableManager *)self setInvitations:v7];

    id v8 = [(HUUserListTableManager *)self home];
    [v8 setDelegate:self];

    v9 = [(HUUserListTableManager *)self home];
    v10 = [(HUUserListTableManager *)self home];
    v11 = [v10 currentUser];
    v12 = [v9 homeAccessControlForUser:v11];
    -[HUUserListTableManager setAllowsEditing:](self, "setAllowsEditing:", [v12 isAdministrator]);

    v13 = [(HUUserListTableManager *)self tableView];
    [v13 reloadData];

    uint64_t v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(HUUserListTableManager *)self users];
      uint64_t v16 = [v15 count];
      v17 = [(HUUserListTableManager *)self users];
      uint64_t v18 = [(HUUserListTableManager *)self invitations];
      uint64_t v19 = [v18 count];
      v20 = [(HUUserListTableManager *)self invitations];
      int v21 = 136316674;
      objc_super v22 = "-[HUUserListTableManager setHome:]";
      __int16 v23 = 2112;
      v24 = v5;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      v32 = v20;
      __int16 v33 = 1024;
      BOOL v34 = [(HUUserListTableManager *)self allowsEditing];
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%s Updating to new home %@. users (%ld) %@. invitations (%ld) %@. allowsEditing %{BOOL}d", (uint8_t *)&v21, 0x44u);
    }
  }
}

- (id)sortedUsers
{
  v2 = [(HUUserListTableManager *)self home];
  v3 = [v2 users];
  v4 = (void *)[v3 mutableCopy];

  [v4 sortUsingComparator:&__block_literal_global_106];

  return v4;
}

uint64_t __37__HUUserListTableManager_sortedUsers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (id)sortedInvitations
{
  v2 = [(HUUserListTableManager *)self home];
  v3 = [v2 outgoingInvitations];
  id v4 = (void *)[v3 mutableCopy];

  [v4 sortUsingComparator:&__block_literal_global_5_0];

  return v4;
}

uint64_t __43__HUUserListTableManager_sortedInvitations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 invitee];
  v6 = [v5 name];
  uint64_t v7 = [v4 invitee];

  id v8 = [v7 name];
  uint64_t v9 = [v6 localizedStandardCompare:v8];

  return v9;
}

- (void)_reinvite
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__HUUserListTableManager__reinvite__block_invoke;
  v2[3] = &unk_1E638A7E8;
  v2[4] = self;
  [(HUUserListTableManager *)self _stopSharingWithCompletion:v2];
}

void __35__HUUserListTableManager__reinvite__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F2EBB8];
    id v5 = a2;
    v6 = (void *)[[v4 alloc] initWithUser:v5 administrator:0 remoteAccess:1];

    uint64_t v7 = [*(id *)(a1 + 32) home];
    v10[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __35__HUUserListTableManager__reinvite__block_invoke_2;
    v9[3] = &unk_1E63851B0;
    v9[4] = *(void *)(a1 + 32);
    [v7 inviteUsersWithInviteInformation:v8 completionHandler:v9];
  }
}

void __35__HUUserListTableManager__reinvite__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  [v3 home:v5 didUpdateStateForOutgoingInvitations:v4];

  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 managerDidSendInvitations:v4];
}

- (void)_stopSharing
{
}

- (void)_stopSharingWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HUUserListTableManager *)self selectedIndexPath];

  if (v5)
  {
    id v6 = [(HUUserListTableManager *)self selectedIndexPath];
    uint64_t v7 = [v6 row];
    id v8 = [(HUUserListTableManager *)self users];
    uint64_t v9 = [v8 count];

    if (v7 >= v9)
    {
      uint64_t v16 = [(HUUserListTableManager *)self invitations];
      v17 = [(HUUserListTableManager *)self selectedIndexPath];
      uint64_t v18 = [v17 row];
      uint64_t v19 = [(HUUserListTableManager *)self users];
      v20 = objc_msgSend(v16, "objectAtIndexedSubscript:", v18 - objc_msgSend(v19, "count"));

      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      uint64_t v26 = __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke_2;
      __int16 v27 = &unk_1E638A810;
      v13 = &v29;
      uint64_t v14 = &v28;
      v28 = v20;
      id v29 = v4;
      id v15 = v20;
      [(HUUserListTableManager *)self _removeInvitation:v15 completion:&v24];
    }
    else
    {
      v10 = [(HUUserListTableManager *)self users];
      v11 = [(HUUserListTableManager *)self selectedIndexPath];
      v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke;
      v30[3] = &unk_1E638A810;
      v13 = &v32;
      uint64_t v14 = &v31;
      __int16 v31 = v12;
      id v32 = v4;
      id v15 = v12;
      [(HUUserListTableManager *)self _removeUser:v15 completion:v30];
    }

    [(HUUserListTableManager *)self setSelectedIndexPath:0];
  }
  int v21 = [(HUUserListTableManager *)self viewController];
  objc_super v22 = [v21 navigationController];
  id v23 = (id)[v22 popViewControllerAnimated:1];
}

void __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 userID];
    (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);
  }
}

void __53__HUUserListTableManager__stopSharingWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v6 = [v3 invitee];
    id v5 = [v6 userID];
    (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);
  }
}

- (void)_removeUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HUUserListTableManager *)self _didRemoveUser:v6];
  id v8 = [(HUUserListTableManager *)self home];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HUUserListTableManager__removeUser_completion___block_invoke;
  v11[3] = &unk_1E638A838;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 removeUserWithoutConfirmation:v10 completionHandler:v11];
}

void __49__HUUserListTableManager__removeUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v12 = v3;
  if (v3)
  {
    [v4 _didAddUser:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [v4 delegate];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [*(id *)(a1 + 32) delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        v11 = [*(id *)(a1 + 32) delegate];
        [v11 managerDidRemoveUser:*(void *)(a1 + 40) error:0];
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = v12;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v12);
    id v6 = v12;
  }
}

- (void)_removeInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __55__HUUserListTableManager__removeInvitation_completion___block_invoke;
  v10[3] = &unk_1E638A838;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [v9 cancelInviteWithCompletionHandler:v10];
}

void __55__HUUserListTableManager__removeInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (!v10) {
    [*(id *)(a1 + 32) _didRemoveInvitation:*(void *)(a1 + 40)];
  }
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) delegate];
      [v7 managerDidCancelInvite:*(void *)(a1 + 40) error:v10];
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = v10;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
    id v9 = v10;
  }
}

- (void)_didAddUser:(id)a3
{
  id v10 = a3;
  id v4 = [(HUUserListTableManager *)self users];
  uint64_t v5 = [v4 indexOfObject:v10];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v6 = [(HUUserListTableManager *)self users];
    id v7 = (void *)[v6 mutableCopy];

    [v7 addObject:v10];
    [v7 sortUsingComparator:&__block_literal_global_16_1];
    [(HUUserListTableManager *)self setUsers:v7];
    uint64_t v8 = [(HUUserListTableManager *)self users];
    uint64_t v9 = [v8 indexOfObject:v10];

    [(HUUserListTableManager *)self _didInsertAtIndex:v9];
  }
}

uint64_t __38__HUUserListTableManager__didAddUser___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  char v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (void)_didRemoveUser:(id)a3
{
  id v8 = a3;
  id v4 = [(HUUserListTableManager *)self users];
  uint64_t v5 = [v4 indexOfObject:v8];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v6 = [(HUUserListTableManager *)self users];
    uint64_t v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:v8];
    [(HUUserListTableManager *)self setUsers:v7];
    [(HUUserListTableManager *)self _didRemoveAtIndex:v5];
  }
}

- (void)_didRemoveInvitation:(id)a3
{
  id v10 = a3;
  id v4 = [(HUUserListTableManager *)self invitations];
  uint64_t v5 = [v4 indexOfObject:v10];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    char v6 = [(HUUserListTableManager *)self invitations];
    uint64_t v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:v10];
    [(HUUserListTableManager *)self setInvitations:v7];
    id v8 = [(HUUserListTableManager *)self users];
    uint64_t v9 = [v8 count] + v5;

    [(HUUserListTableManager *)self _didRemoveAtIndex:v9];
  }
}

- (void)_didInsertAtIndex:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HUUserListTableManager *)self tableView];
  char v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, -[HUUserListTableManager sectionForPeople](self, "sectionForPeople"));
  v8[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 insertRowsAtIndexPaths:v7 withRowAnimation:100];
}

- (void)_didRemoveAtIndex:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HUUserListTableManager *)self tableView];
  char v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, -[HUUserListTableManager sectionForPeople](self, "sectionForPeople"));
  v8[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 deleteRowsAtIndexPaths:v7 withRowAnimation:100];
}

- (void)_didReloadAtIndex:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HUUserListTableManager *)self tableView];
  char v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, -[HUUserListTableManager sectionForPeople](self, "sectionForPeople"));
  v8[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 reloadRowsAtIndexPaths:v7 withRowAnimation:100];
}

- (id)_contactForUser:(id)a3
{
  v35[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userID];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1B908]);
    uint64_t v7 = *MEMORY[0x1E4F1ADF0];
    v35[0] = *MEMORY[0x1E4F1ADC8];
    v35[1] = v7;
    v35[2] = *MEMORY[0x1E4F1ADE0];
    id v8 = [MEMORY[0x1E4F1BBE8] descriptorForRequiredKeysIncludingImage:1];
    v35[3] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
    v35[4] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
    id v11 = (void *)[v6 initWithKeysToFetch:v10];

    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__13;
    id v29 = __Block_byref_object_dispose__13;
    id v30 = 0;
    id v12 = [(HUUserListTableManager *)self contactStore];
    id v24 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __42__HUUserListTableManager__contactForUser___block_invoke;
    v21[3] = &unk_1E638A880;
    id v13 = v4;
    id v22 = v13;
    id v23 = &v25;
    char v14 = [v12 enumerateContactsWithFetchRequest:v11 error:&v24 usingBlock:v21];
    id v15 = v24;

    if (v15) {
      char v16 = v14;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v20 = [v13 userID];
        *(_DWORD *)buf = 138412546;
        id v32 = v15;
        __int16 v33 = 2112;
        BOOL v34 = v20;
        _os_log_error_impl(&dword_1BE345000, v17, OS_LOG_TYPE_ERROR, "Error %@ looking up user: %@", buf, 0x16u);
      }
    }
    id v18 = (id)v26[5];

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void __42__HUUserListTableManager__contactForUser___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v6 = [v10 emailAddresses];
  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_23_0);

  id v8 = [*(id *)(a1 + 32) userID];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

uint64_t __42__HUUserListTableManager__contactForUser___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)_displayNameForUser:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUUserListTableManager *)self _contactForUser:v4];
  if (!v5
    || ([MEMORY[0x1E4F1B910] stringFromContact:v5 style:0],
        (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = [v4 userID];
    if (v7) {
      [v4 userID];
    }
    else {
    id v6 = _HULocalizedStringWithDefaultValue(@"HUUserManagementUnknownUser", @"HUUserManagementUnknownUser", 1);
    }
  }

  return v6;
}

- (id)_stringForInvitationState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = HFLocalizedString();
  }
  return v4;
}

- (id)_monogramForUser:(id)a3
{
  id v4 = a3;
  if (!_monogramForUser__monogrammer)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1BBE8]) initWithStyle:0 diameter:40.0];
    id v6 = (void *)_monogramForUser__monogrammer;
    _monogramForUser__monogrammer = v5;
  }
  uint64_t v7 = [(HUUserListTableManager *)self _contactForUser:v4];
  if (!v7
    || ([(id)_monogramForUser__monogrammer monogramForContact:v7],
        (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = [(id)_monogramForUser__monogrammer silhouetteMonogram];
  }

  return v8;
}

- (id)_personViewControllerForUser:(id)a3 invitation:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUUserListTableManager *)self _contactForUser:v6];
  if (v8)
  {
    int v9 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v8];
    [v9 setAllowsEditing:0];
    id v10 = [(HUUserListTableManager *)self home];
    id v11 = [v10 owner];
    -[HUUserListTableManager _configurePersonViewController:invitation:isRemovable:](self, "_configurePersonViewController:invitation:isRemovable:", v9, v7, [v11 isEqual:v6] ^ 1);
  }
  else
  {
    int v9 = [v6 userID];

    if (!v9) {
      goto LABEL_6;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    id v12 = (void *)MEMORY[0x1E4F1BA20];
    uint64_t v13 = *MEMORY[0x1E4F1B6F8];
    char v14 = [v6 userID];
    id v15 = [v12 labeledValueWithLabel:v13 value:v14];
    v19[0] = v15;
    char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v10 setEmailAddresses:v16];

    int v9 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v10];
    objc_msgSend(v9, "setActions:", objc_msgSend(v9, "actions") & 0xFFFFFFFFFFFFFFDFLL);
    id v11 = [(HUUserListTableManager *)self home];
    v17 = [v11 owner];
    -[HUUserListTableManager _configurePersonViewController:invitation:isRemovable:](self, "_configurePersonViewController:invitation:isRemovable:", v9, v7, [v17 isEqual:v6] ^ 1);
  }
LABEL_6:

  return v9;
}

- (void)_configurePersonViewController:(id)a3 invitation:(id)a4 isRemovable:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  [v15 setAllowsActions:0];
  if ([(HUUserListTableManager *)self allowsEditing])
  {
    [v15 setDisplayMode:2];
    int v9 = [v15 contentViewController];
    if (v8)
    {
      if ([v8 invitationState] == 4 || objc_msgSend(v8, "invitationState") == 6)
      {
        id v10 = _HULocalizedStringWithDefaultValue(@"HUUserManagementInviteAgain", @"HUUserManagementInviteAgain", 1);
        id v11 = [v9 cardTopGroup];
        [v9 addActionWithTitle:v10 target:self selector:sel__reinvite inGroup:v11 destructive:1];
      }
      id v12 = @"HUUserManagementCancelInvite";
    }
    else
    {
      if (!v5)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v12 = @"HUUserManagementStopSharing";
    }
    uint64_t v13 = _HULocalizedStringWithDefaultValue(v12, v12, 1);
    char v14 = [v9 cardTopGroup];
    [v9 addActionWithTitle:v13 target:self selector:sel__stopSharing inGroup:v14 destructive:1];

    goto LABEL_10;
  }
LABEL_11:
}

- (void)addPeopleViewControllerDidCancel:(id)a3
{
  id v4 = [(HUUserListTableManager *)self delegate];

  if (v4)
  {
    id v5 = [(HUUserListTableManager *)self delegate];
    [v5 managerDidDismissWithError:0];
  }
}

- (void)addPeopleViewController:(id)a3 didSendInvitations:(id)a4
{
  id v15 = a4;
  id v5 = [(HUUserListTableManager *)self sortedInvitations];
  [(HUUserListTableManager *)self setInvitations:v5];

  id v6 = [(HUUserListTableManager *)self tableView];
  [v6 reloadData];

  id v7 = [(HUUserListTableManager *)self viewController];
  id v8 = [v7 navigationController];
  id v9 = (id)[v8 popViewControllerAnimated:1];

  id v10 = [(HUUserListTableManager *)self delegate];

  if (v10)
  {
    id v11 = [(HUUserListTableManager *)self delegate];
    [v11 managerDidSendInvitations:v15];

    id v12 = [(HUUserListTableManager *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      char v14 = [(HUUserListTableManager *)self delegate];
      [v14 managerDidUpdateUserList];
    }
  }
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HUUserListTableManager_home_didAddUser___block_invoke;
  v7[3] = &unk_1E63850E0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __42__HUUserListTableManager_home_didAddUser___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didAddUser:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 managerDidUpdateUserList];
    }
  }
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HUUserListTableManager_home_didRemoveUser___block_invoke;
  v7[3] = &unk_1E63850E0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __45__HUUserListTableManager_home_didRemoveUser___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didRemoveUser:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 managerDidUpdateUserList];
    }
  }
}

- (void)home:(id)a3 didUpdateStateForOutgoingInvitations:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HUUserListTableManager_home_didUpdateStateForOutgoingInvitations___block_invoke;
  v7[3] = &unk_1E63850E0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __68__HUUserListTableManager_home_didUpdateStateForOutgoingInvitations___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) invitations];
  uint64_t v3 = [*(id *)(a1 + 32) sortedInvitations];
  [*(id *)(a1 + 32) setInvitations:v3];

  id v4 = [*(id *)(a1 + 32) tableView];
  [v4 beginUpdates];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v11 = [v2 indexOfObject:v10];
        uint64_t v12 = [v10 invitationState];
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v12 != 2) {
            continue;
          }
          char v13 = *(void **)(a1 + 32);
          char v14 = [v13 invitations];
          uint64_t v15 = [v14 indexOfObject:v10];
          [*(id *)(a1 + 32) users];
          v17 = id v16 = v5;
          objc_msgSend(v13, "_didInsertAtIndex:", objc_msgSend(v17, "count") + v15);

          id v5 = v16;
        }
        else if (v12 == 3 || [v10 invitationState] == 1)
        {
          id v18 = *(void **)(a1 + 32);
          char v14 = [v18 users];
          objc_msgSend(v18, "_didRemoveAtIndex:", objc_msgSend(v14, "count") + v11);
        }
        else
        {
          uint64_t v19 = *(void **)(a1 + 32);
          char v14 = [v19 users];
          objc_msgSend(v19, "_didReloadAtIndex:", objc_msgSend(v14, "count") + v11);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v7);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) invitations];
  uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        if ([v2 indexOfObject:v24] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v25 = *(void **)(a1 + 32);
          uint64_t v26 = [v25 invitations];
          uint64_t v27 = [v26 indexOfObject:v24];
          v28 = [*(id *)(a1 + 32) users];
          objc_msgSend(v25, "_didInsertAtIndex:", objc_msgSend(v28, "count") + v27);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v21);
  }

  id v29 = [*(id *)(a1 + 32) tableView];
  [v29 endUpdates];

  uint64_t v30 = [*(id *)(a1 + 32) delegate];
  if (v30)
  {
    __int16 v31 = (void *)v30;
    id v32 = [*(id *)(a1 + 32) delegate];
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      BOOL v34 = [*(id *)(a1 + 32) delegate];
      [v34 managerDidUpdateUserList];
    }
  }
}

- (int64_t)sectionForPeople
{
  return 0;
}

- (int64_t)numberOfDataRows
{
  uint64_t v3 = [(HUUserListTableManager *)self users];
  uint64_t v4 = [v3 count];
  id v5 = [(HUUserListTableManager *)self invitations];
  int64_t v6 = [v5 count] + v4;

  return v6;
}

- (BOOL)_indexPathIsInviteUser:(id)a3
{
  uint64_t v4 = [a3 row];
  return v4 == [(HUUserListTableManager *)self numberOfDataRows];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5 = [(HUUserListTableManager *)self numberOfDataRows];
  return v5 + [(HUUserListTableManager *)self allowsEditing];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return _HULocalizedStringWithDefaultValue(@"HUUserManagementUserHeaderTitle", @"HUUserManagementUserHeaderTitle", 1);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return _HULocalizedStringWithDefaultValue(@"HUUserManagementUserFooterTitle", @"HUUserManagementUserFooterTitle", 1);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  if ([(HUUserListTableManager *)self _indexPathIsInviteUser:a4]) {
    return 0;
  }

  return [(HUUserListTableManager *)self allowsEditing];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 row];
  id v9 = [(HUUserListTableManager *)self users];
  uint64_t v10 = [v9 count];
  uint64_t v11 = [(HUUserListTableManager *)self invitations];
  uint64_t v12 = [v11 count] + v10;

  if (v8 >= v12)
  {
    uint64_t v21 = (objc_class *)objc_opt_class();
    uint64_t v22 = NSStringFromClass(v21);
    uint64_t v15 = [v7 dequeueReusableCellWithIdentifier:v22];

    id v23 = _HULocalizedStringWithDefaultValue(@"HUUserManagementInvitePeopleButton", @"HUUserManagementInvitePeopleButton", 1);
    uint64_t v24 = [v15 textLabel];
    [v24 setText:v23];

    uint64_t v25 = [MEMORY[0x1E4F428B8] systemBlueColor];
    uint64_t v26 = [v15 textLabel];
    [v26 setTextColor:v25];

    objc_msgSend(v15, "setUserInteractionEnabled:", -[HUUserListTableManager editing](self, "editing") ^ 1);
    uint64_t v27 = [(HUUserListTableManager *)self editing] ^ 1;
    v28 = [v15 textLabel];
    [v28 setEnabled:v27];

    id v29 = [v15 detailTextLabel];
    [v29 setText:0];

    [v15 setAccessoryType:0];
  }
  else
  {
    char v13 = (objc_class *)objc_opt_class();
    char v14 = NSStringFromClass(v13);
    uint64_t v15 = [v7 dequeueReusableCellWithIdentifier:v14];

    uint64_t v16 = [v6 row];
    v17 = [(HUUserListTableManager *)self users];
    uint64_t v18 = [v17 count];

    if (v16 >= v18)
    {
      uint64_t v30 = [v6 row];
      __int16 v31 = [(HUUserListTableManager *)self users];
      uint64_t v32 = v30 - [v31 count];

      char v33 = [(HUUserListTableManager *)self invitations];
      BOOL v34 = [v33 objectAtIndexedSubscript:v32];

      uint64_t v20 = [v34 invitee];
      uint64_t v35 = -[HUUserListTableManager _stringForInvitationState:](self, "_stringForInvitationState:", [v34 invitationState]);
      [v15 setInvitationStatusString:v35];
    }
    else
    {
      uint64_t v19 = [(HUUserListTableManager *)self users];
      uint64_t v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

      [v15 setInvitationStatusString:0];
    }
    long long v36 = [(HUUserListTableManager *)self _displayNameForUser:v20];
    [v15 setDisplayName:v36];

    long long v37 = [v20 userID];

    if (!v37) {
      [v15 setSelectionStyle:0];
    }
  }

  return v15;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v19 = a5;
  uint64_t v6 = [v19 row];
  id v7 = [(HUUserListTableManager *)self users];
  uint64_t v8 = [v7 count];

  if (v6 >= v8)
  {
    uint64_t v11 = [v19 row];
    uint64_t v12 = [(HUUserListTableManager *)self users];
    uint64_t v13 = [v12 count];
    char v14 = [(HUUserListTableManager *)self invitations];
    uint64_t v15 = [v14 count] + v13;

    if (v11 >= v15) {
      goto LABEL_6;
    }
    uint64_t v16 = [v19 row];
    v17 = [(HUUserListTableManager *)self users];
    uint64_t v18 = v16 - [v17 count];

    id v9 = [(HUUserListTableManager *)self invitations];
    uint64_t v10 = [v9 objectAtIndexedSubscript:v18];
    [(HUUserListTableManager *)self _removeInvitation:v10 completion:0];
  }
  else
  {
    id v9 = [(HUUserListTableManager *)self users];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));
    [(HUUserListTableManager *)self _removeUser:v10 completion:0];
  }

LABEL_6:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 row];
  uint64_t v8 = [(HUUserListTableManager *)self users];
  uint64_t v9 = [v8 count];
  uint64_t v10 = [(HUUserListTableManager *)self invitations];
  uint64_t v11 = [v10 count] + v9;

  if (v7 < v11)
  {
    uint64_t v12 = [v6 row];
    uint64_t v13 = [(HUUserListTableManager *)self users];
    uint64_t v14 = [v13 count];

    if (v12 >= v14)
    {
      uint64_t v21 = [v6 row];
      uint64_t v22 = [(HUUserListTableManager *)self users];
      uint64_t v23 = v21 - [v22 count];

      uint64_t v24 = [(HUUserListTableManager *)self invitations];
      v17 = [v24 objectAtIndexedSubscript:v23];

      uint64_t v16 = [v17 invitee];
    }
    else
    {
      uint64_t v15 = [(HUUserListTableManager *)self users];
      objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      uint64_t v16 = (HUAddPeopleViewController *)objc_claimAutoreleasedReturnValue();

      v17 = 0;
    }
    [(HUUserListTableManager *)self setSelectedIndexPath:v6];
    uint64_t v20 = [(HUUserListTableManager *)self _personViewControllerForUser:v16 invitation:v17];
    if (v20)
    {
      uint64_t v25 = [(HUUserListTableManager *)self viewController];
      uint64_t v26 = [v25 navigationController];
      [v26 pushViewController:v20 animated:1];
    }
    goto LABEL_10;
  }
  if ([(HUUserListTableManager *)self allowsEditing]
    && [(HUUserListTableManager *)self _indexPathIsInviteUser:v6])
  {
    uint64_t v18 = [HUAddPeopleViewController alloc];
    id v19 = [(HUUserListTableManager *)self home];
    uint64_t v16 = [(HUAddPeopleViewController *)v18 initWithHome:v19 viewContext:0];

    [(HUAddPeopleViewController *)v16 setDelegate:self];
    v17 = [(HUUserListTableManager *)self viewController];
    uint64_t v20 = [v17 navigationController];
    [v20 pushViewController:v16 animated:1];
LABEL_10:
  }
  [v27 deselectRowAtIndexPath:v6 animated:1];
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    uint64_t v4 = [(HUUserListTableManager *)self tableView];
    [v4 beginUpdates];

    [(HUUserListTableManager *)self updateEditingRows];
    id v5 = [(HUUserListTableManager *)self tableView];
    [v5 endUpdates];
  }
}

- (void)updateEditingRows
{
  int64_t v3 = [(HUUserListTableManager *)self numberOfDataRows];

  [(HUUserListTableManager *)self _didReloadAtIndex:v3];
}

- (HUUserListManagerTableDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUUserListManagerTableDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (NSArray)invitations
{
  return self->_invitations;
}

- (void)setInvitations:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_invitations, 0);
  objc_storeStrong((id *)&self->_users, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end