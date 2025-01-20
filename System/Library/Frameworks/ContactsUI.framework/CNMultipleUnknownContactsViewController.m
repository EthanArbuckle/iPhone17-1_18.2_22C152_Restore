@interface CNMultipleUnknownContactsViewController
+ (id)contactFormatter;
+ (id)descriptorForRequiredKeys;
+ (id)log;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (CNContactFormatter)formatter;
- (CNContactStore)contactStore;
- (CNContainer)targetContainer;
- (CNGroup)targetGroup;
- (CNMultipleUnknownContactsViewController)initWithContacts:(id)a3;
- (CNMultipleUnknownContactsViewController)initWithContacts:(id)a3 targetGroup:(id)a4 targetContainer:(id)a5;
- (CNMultipleUnknownContactsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNMultipleUnknownContactsViewControllerDelegate)delegate;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (NSArray)contacts;
- (NSMutableSet)createdContactIdentifiers;
- (id)_existingMatchForUnknownContact:(id)a3;
- (id)_updatedContact:(id)a3 withPropertiesFromContact:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addToExistingContacts:(id)a3;
- (void)_createNewContacts:(id)a3;
- (void)_didComplete;
- (void)_presentUnknownContact:(id)a3;
- (void)_save:(id)a3;
- (void)_showAddAllToContactsConfirmation;
- (void)addContacts:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)setContactStore:(id)a3;
- (void)setContacts:(id)a3;
- (void)setCreatedContactIdentifiers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFormatter:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setTargetContainer:(id)a3;
- (void)setTargetGroup:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CNMultipleUnknownContactsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_createdContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_targetContainer, 0);
  objc_storeStrong((id *)&self->_targetGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (void)setFormatter:(id)a3
{
}

- (CNContactFormatter)formatter
{
  return self->_formatter;
}

- (void)setCreatedContactIdentifiers:(id)a3
{
}

- (NSMutableSet)createdContactIdentifiers
{
  return self->_createdContactIdentifiers;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setTargetContainer:(id)a3
{
}

- (void)setTargetGroup:(id)a3
{
}

- (CNGroup)targetGroup
{
  return self->_targetGroup;
}

- (void)setDelegate:(id)a3
{
}

- (CNMultipleUnknownContactsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNMultipleUnknownContactsViewControllerDelegate *)WeakRetained;
}

- (void)setContactStore:(id)a3
{
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5 = a4;
  v6 = [(CNMultipleUnknownContactsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CNMultipleUnknownContactsViewController *)self delegate];
    char v9 = [v8 multipleUnknownContactsViewController:self shouldPerformDefaultActionForContactProperty:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  if (a4)
  {
    id v5 = [a3 contact];
    v6 = [v5 identifier];

    char v7 = [(CNMultipleUnknownContactsViewController *)self contacts];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__CNMultipleUnknownContactsViewController_contactViewController_didCompleteWithContact___block_invoke;
    v14[3] = &unk_1E549C040;
    id v8 = v6;
    id v15 = v8;
    LODWORD(v6) = objc_msgSend(v7, "_cn_any:", v14);

    if (v6)
    {
      char v9 = [(CNMultipleUnknownContactsViewController *)self createdContactIdentifiers];
      objc_msgSend(v9, "_cn_addNonNilObject:", v8);
    }
    v10 = [(CNMultipleUnknownContactsViewController *)self createdContactIdentifiers];
    uint64_t v11 = [v10 count];
    v12 = [(CNMultipleUnknownContactsViewController *)self contacts];
    uint64_t v13 = [v12 count];

    if (v11 == v13) {
      [(CNMultipleUnknownContactsViewController *)self _didComplete];
    }
  }
}

uint64_t __88__CNMultipleUnknownContactsViewController_contactViewController_didCompleteWithContact___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  char v7 = [a3 dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:v6];
  if ([v6 section])
  {
    id v8 = [(CNMultipleUnknownContactsViewController *)self contacts];
    char v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v10 = [(CNMultipleUnknownContactsViewController *)self formatter];
    uint64_t v11 = [v10 stringFromContact:v9];
    v12 = [v7 textLabel];
    [v12 setText:v11];

    uint64_t v13 = [v7 textLabel];
    [v13 setTextAlignment:4];

    [v7 setAccessoryType:1];
  }
  else
  {
    v14 = NSString;
    id v15 = CNContactsUIBundle();
    v16 = [v15 localizedStringForKey:@"VCARD_ADD_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    v17 = [(CNMultipleUnknownContactsViewController *)self contacts];
    v18 = objc_msgSend(v14, "localizedStringWithFormat:", v16, objc_msgSend(v17, "count"));
    v19 = [v7 textLabel];
    [v19 setText:v18];

    v20 = [v7 textLabel];
    [v20 setTextAlignment:1];

    [v7 setAccessoryType:0];
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  uint64_t v4 = [(CNMultipleUnknownContactsViewController *)self contacts];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    char v7 = [(CNMultipleUnknownContactsViewController *)self contacts];
    id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    [(CNMultipleUnknownContactsViewController *)self _presentUnknownContact:v8];
  }
  else
  {
    [(CNMultipleUnknownContactsViewController *)self _showAddAllToContactsConfirmation];
    id v8 = [v9 indexPathForSelectedRow];
    [v9 deselectRowAtIndexPath:v8 animated:1];
  }
}

- (id)_updatedContact:(id)a3 withPropertiesFromContact:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  id v7 = (id)[v6 addAllPropertiesFromContact:v5];

  return v6;
}

- (id)_existingMatchForUnknownContact:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 contactType];
  if (v5 == 1)
  {
    id v6 = [v4 organizationName];
  }
  else
  {
    id v6 = &stru_1ED8AC728;
  }
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, __CFString *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v6))
  {
    uint64_t v8 = [v4 givenName];

    id v6 = (__CFString *)v8;
  }
  id v9 = [v4 familyName];
  if (((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9) & 1) == 0)
  {
    if ((*(unsigned int (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6))
    {
      v10 = v9;
    }
    else
    {
      v10 = [(__CFString *)v6 stringByAppendingFormat:@" %@", v9];
    }
    uint64_t v11 = v10;

    id v6 = v11;
  }
  if ((*(uint64_t (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6))
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v6];
    id v14 = objc_alloc(MEMORY[0x1E4F1B908]);
    id v15 = [(id)objc_opt_class() descriptorForRequiredKeys];
    v35[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    v17 = (void *)[v14 initWithKeysToFetch:v16];

    [v17 setPredicate:v13];
    [v17 setSortOrder:1];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__19071;
    v33 = __Block_byref_object_dispose__19072;
    id v34 = 0;
    v18 = [(CNMultipleUnknownContactsViewController *)self contactStore];
    uint64_t v27 = v5;
    id v28 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__CNMultipleUnknownContactsViewController__existingMatchForUnknownContact___block_invoke_63;
    v23[3] = &unk_1E5497CE0;
    id v25 = &__block_literal_global_62;
    id v24 = v4;
    v26 = &v29;
    int v19 = [v18 enumerateContactsWithFetchRequest:v17 error:&v28 usingBlock:v23];
    id v20 = v28;

    if (v19) {
      v21 = (void *)v30[5];
    }
    else {
      v21 = 0;
    }
    id v12 = v21;

    _Block_object_dispose(&v29, 8);
  }

  return v12;
}

void __75__CNMultipleUnknownContactsViewController__existingMatchForUnknownContact___block_invoke_63(uint64_t a1, void *a2, unsigned char *a3)
{
  id v35 = a2;
  if ([v35 contactType] != *(void *)(a1 + 56)) {
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [v35 givenName];
  uint64_t v8 = [*(id *)(a1 + 32) givenName];
  if (((*(uint64_t (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8) & 1) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [v35 middleName];
  uint64_t v11 = [*(id *)(a1 + 32) middleName];
  if (!(*(unsigned int (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11))
  {
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = [v35 familyName];
  id v14 = [*(id *)(a1 + 32) familyName];
  if (!(*(unsigned int (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v14))
  {

    goto LABEL_13;
  }
  id v34 = v13;
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = [v35 namePrefix];
  uint64_t v17 = [*(id *)(a1 + 32) namePrefix];
  v18 = *(unsigned int (**)(uint64_t, void *, uint64_t))(v15 + 16);
  uint64_t v19 = v15;
  id v20 = (void *)v16;
  v21 = (void *)v17;
  if (!v18(v19, v20, v17))
  {

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v31 = v14;
  v32 = v21;
  v33 = v20;
  uint64_t v22 = *(void *)(a1 + 40);
  uint64_t v23 = [v35 nameSuffix];
  uint64_t v24 = [*(id *)(a1 + 32) nameSuffix];
  v30 = (void *)v23;
  uint64_t v25 = v23;
  v26 = (void *)v24;
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v22 + 16))(v22, v25))
  {

    goto LABEL_12;
  }
  uint64_t v29 = *(void *)(a1 + 40);
  uint64_t v27 = [v35 organizationName];
  id v28 = [*(id *)(a1 + 32) organizationName];
  LODWORD(v29) = (*(uint64_t (**)(uint64_t, void *, void *))(v29 + 16))(v29, v27, v28);

  if (v29)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
LABEL_15:
}

BOOL __75__CNMultipleUnknownContactsViewController__existingMatchForUnknownContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4 == v5)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
    if (v4 && v5) {
      BOOL v7 = [v4 localizedCaseInsensitiveCompare:v5] == 0;
    }
  }

  return v7;
}

- (void)_presentUnknownContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNMultipleUnknownContactsViewController *)self createdContactIdentifiers];
  uint64_t v6 = [v4 identifier];
  int v7 = [v5 containsObject:v6];

  if (v7) {
    +[CNContactViewController viewControllerForContact:v4];
  }
  else {
  id v12 = +[CNContactViewController viewControllerForUnknownContact:v4];
  }

  uint64_t v8 = [(CNMultipleUnknownContactsViewController *)self contactStore];
  [v12 setContactStore:v8];

  [v12 setDelegate:self];
  uint64_t v9 = [(CNMultipleUnknownContactsViewController *)self targetGroup];
  [v12 setParentGroup:v9];

  v10 = [(CNMultipleUnknownContactsViewController *)self targetContainer];
  [v12 setParentContainer:v10];

  uint64_t v11 = [(CNMultipleUnknownContactsViewController *)self navigationController];
  [v11 pushViewController:v12 animated:1];
}

- (void)_addToExistingContacts:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = [v4 array];
  int v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke;
  v37[3] = &unk_1E5497C98;
  v37[4] = self;
  id v9 = v6;
  id v38 = v9;
  id v10 = v7;
  id v39 = v10;
  id v11 = v8;
  id v40 = v11;
  [v5 enumerateObjectsUsingBlock:v37];

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    id v12 = [(CNMultipleUnknownContactsViewController *)self contactStore];
    id v36 = 0;
    char v13 = [v12 executeSaveRequest:v11 error:&v36];
    id v14 = v36;

    if (v13)
    {
      [(CNMultipleUnknownContactsViewController *)self addContacts:v10];
    }
    else
    {
      uint64_t v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v32 = [(CNMultipleUnknownContactsViewController *)self contactStore];
        *(_DWORD *)buf = 138412546;
        v42 = v32;
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_error_impl(&dword_18B625000, v15, OS_LOG_TYPE_ERROR, "Could not save contacts in store %@: %@", buf, 0x16u);
      }
    }
  }
  if ([v9 count])
  {
    id v33 = v11;
    uint64_t v16 = NSString;
    uint64_t v17 = CNContactsUIBundle();
    v18 = [v17 localizedStringForKey:@"VCARD_UNMERGED_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, objc_msgSend(v9, "count"));

    id v20 = NSString;
    v21 = CNContactsUIBundle();
    if ([v9 count] == 1) {
      uint64_t v22 = @"VCARD_CREATE_NEW_ONE";
    }
    else {
      uint64_t v22 = @"VCARD_CREATE_NEW_MANY";
    }
    uint64_t v23 = [v21 localizedStringForKey:v22 value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v24 = objc_msgSend(v20, "localizedStringWithFormat:", v23, objc_msgSend(v9, "count"));

    uint64_t v25 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v19 message:0 preferredStyle:0];
    v26 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v27 = CNContactsUIBundle();
    id v28 = [v27 localizedStringForKey:@"VCARD_CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v29 = [v26 actionWithTitle:v28 style:1 handler:0];
    [v25 addAction:v29];

    v30 = (void *)MEMORY[0x1E4FB1410];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke_55;
    v34[3] = &unk_1E549BC48;
    v34[4] = self;
    id v35 = v9;
    uint64_t v31 = [v30 actionWithTitle:v24 style:0 handler:v34];
    [v25 addAction:v31];

    id v11 = v33;
    [(CNMultipleUnknownContactsViewController *)self presentViewController:v25 animated:1 completion:0];
  }
  else
  {
    [(CNMultipleUnknownContactsViewController *)self _didComplete];
  }
}

void __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke(id *a1, void *a2)
{
  id v3 = a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 _existingMatchForUnknownContact:v4];
  id v7 = (id)v5;
  if (v5)
  {
    uint64_t v6 = [a1[4] _updatedContact:v5 withPropertiesFromContact:v4];

    [a1[6] addObject:v6];
    [a1[7] updateContact:v6];
    id v4 = (id)v6;
  }
  else
  {
    [a1[5] addObject:v4];
  }
}

uint64_t __66__CNMultipleUnknownContactsViewController__addToExistingContacts___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createNewContacts:*(void *)(a1 + 40)];
}

- (void)addContacts:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * v9);
        id v11 = [(CNMultipleUnknownContactsViewController *)self groupsAndContainersSaveManager];
        id v12 = [(CNMultipleUnknownContactsViewController *)self targetContainer];
        int v13 = [v11 isAuthorizedToAddContact:v10 toContainer:v12 ignoresParentalRestrictions:0];

        if (v13) {
          id v14 = v5;
        }
        else {
          id v14 = v6;
        }
        [v14 addObject:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  uint64_t v15 = *MEMORY[0x1E4F5A258];
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v5) & 1) == 0)
  {
    uint64_t v16 = [(CNMultipleUnknownContactsViewController *)self groupsAndContainersSaveManager];
    uint64_t v17 = [(CNMultipleUnknownContactsViewController *)self targetGroup];
    v18 = [(CNMultipleUnknownContactsViewController *)self targetContainer];
    uint64_t v19 = [v16 addContacts:v5 toGroup:v17 inContainer:v18 moveWasAuthorized:1];

    if ([v19 saveDidSucceed])
    {
      id v20 = [(CNMultipleUnknownContactsViewController *)self createdContactIdentifiers];
      v21 = [v19 addedContacts];
      uint64_t v22 = objc_msgSend(v21, "_cn_map:", &__block_literal_global_41_19096);
      [v20 addObjectsFromArray:v22];
    }
  }
  if (((*(uint64_t (**)(uint64_t, id))(v15 + 16))(v15, v6) & 1) == 0)
  {
    objc_initWeak(&location, self);
    uint64_t v23 = [(CNMultipleUnknownContactsViewController *)self groupsAndContainersSaveManager];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke_2;
    v25[3] = &unk_1E5497C70;
    objc_copyWeak(&v27, &location);
    id v26 = v6;
    [v23 authorizeForViewController:self sender:self animated:1 completionBlock:v25];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained groupsAndContainersSaveManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [WeakRetained targetGroup];
  id v5 = [WeakRetained targetContainer];
  id v6 = [v2 addContacts:v3 toGroup:v4 inContainer:v5 moveWasAuthorized:1];

  if ([v6 saveDidSucceed])
  {
    uint64_t v7 = [WeakRetained createdContactIdentifiers];
    uint64_t v8 = [v6 addedContacts];
    uint64_t v9 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_43_19098);
    [v7 addObjectsFromArray:v9];
  }
}

uint64_t __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __55__CNMultipleUnknownContactsViewController_addContacts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_createNewContacts:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__CNMultipleUnknownContactsViewController__createNewContacts___block_invoke;
  v5[3] = &unk_1E549C040;
  v5[4] = self;
  id v4 = objc_msgSend(a3, "_cn_filter:", v5);
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [(CNMultipleUnknownContactsViewController *)self addContacts:v4];
  }
  [(CNMultipleUnknownContactsViewController *)self _didComplete];
}

uint64_t __62__CNMultipleUnknownContactsViewController__createNewContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 createdContactIdentifiers];
  id v5 = [v3 identifier];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

- (void)_didComplete
{
  id v3 = [(CNMultipleUnknownContactsViewController *)self delegate];
  [v3 multipleUnknownContactsViewControllerDidComplete:self];
}

- (void)_save:(id)a3
{
  id v4 = [(CNMultipleUnknownContactsViewController *)self contacts];
  [(CNMultipleUnknownContactsViewController *)self _createNewContacts:v4];
}

- (void)_showAddAllToContactsConfirmation
{
  id v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v4 = [(CNMultipleUnknownContactsViewController *)self contacts];
  id v5 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v6 = CNContactsUIBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"VCARD_CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v8 = [v5 actionWithTitle:v7 style:1 handler:0];
  [v3 addAction:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = CNContactsUIBundle();
  id v11 = [v10 localizedStringForKey:@"VCARD_CREATE" value:&stru_1ED8AC728 table:@"Localized"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke;
  v23[3] = &unk_1E549BC48;
  void v23[4] = self;
  id v12 = v4;
  id v24 = v12;
  int v13 = [v9 actionWithTitle:v11 style:0 handler:v23];
  [v3 addAction:v13];

  id v14 = NSString;
  uint64_t v15 = CNContactsUIBundle();
  uint64_t v16 = [v15 localizedStringForKey:@"VCARD_ADD_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, objc_msgSend(v12, "count"));

  v18 = (void *)MEMORY[0x1E4FB1410];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke_2;
  v21[3] = &unk_1E549BC48;
  v21[4] = self;
  id v22 = v12;
  id v19 = v12;
  id v20 = [v18 actionWithTitle:v17 style:0 handler:v21];
  [v3 addAction:v20];

  [(CNMultipleUnknownContactsViewController *)self presentViewController:v3 animated:1 completion:0];
}

uint64_t __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createNewContacts:*(void *)(a1 + 40)];
}

uint64_t __76__CNMultipleUnknownContactsViewController__showAddAllToContactsConfirmation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addToExistingContacts:*(void *)(a1 + 40)];
}

- (CNContainer)targetContainer
{
  v13[1] = *MEMORY[0x1E4F143B8];
  targetContainer = self->_targetContainer;
  if (targetContainer)
  {
    id v3 = targetContainer;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1B9B0];
    uint64_t v6 = [(CNMultipleUnknownContactsViewController *)self contactStore];
    uint64_t v7 = [v6 defaultContainerIdentifier];
    v13[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v9 = [v5 predicateForContainersWithIdentifiers:v8];

    uint64_t v10 = [(CNMultipleUnknownContactsViewController *)self contactStore];
    id v11 = [v10 containersMatchingPredicate:v9 error:0];
    id v3 = [v11 firstObject];
  }

  return v3;
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  if (!groupsAndContainersSaveManager)
  {
    id v4 = [CNUIGroupsAndContainersSaveManager alloc];
    id v5 = [(CNMultipleUnknownContactsViewController *)self contactStore];
    uint64_t v6 = [(CNUIGroupsAndContainersSaveManager *)v4 initWithContactStore:v5];
    uint64_t v7 = self->_groupsAndContainersSaveManager;
    self->_groupsAndContainersSaveManager = v6;

    groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
  }
  uint64_t v8 = groupsAndContainersSaveManager;

  return v8;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CNMultipleUnknownContactsViewController;
  [(CNMultipleUnknownContactsViewController *)&v4 viewDidLoad];
  id v3 = [(CNMultipleUnknownContactsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"UITableViewCell"];
}

- (CNMultipleUnknownContactsViewController)initWithContacts:(id)a3 targetGroup:(id)a4 targetContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CNMultipleUnknownContactsViewController;
  id v11 = [(CNMultipleUnknownContactsViewController *)&v27 initWithStyle:1];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    contacts = v11->_contacts;
    v11->_contacts = (NSArray *)v12;

    id v14 = v11->_contacts;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __88__CNMultipleUnknownContactsViewController_initWithContacts_targetGroup_targetContainer___block_invoke;
    v25[3] = &unk_1E5497C48;
    uint64_t v15 = v11;
    id v26 = v15;
    [(NSArray *)v14 enumerateObjectsUsingBlock:v25];
    uint64_t v16 = [(id)objc_opt_class() contactFormatter];
    formatter = v15->_formatter;
    v15->_formatter = (CNContactFormatter *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    createdContactIdentifiers = v15->_createdContactIdentifiers;
    v15->_createdContactIdentifiers = v18;

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:3 target:v15 action:sel__save_];
    v21 = [(CNMultipleUnknownContactsViewController *)v15 navigationItem];
    [v21 setRightBarButtonItem:v20];

    id v22 = [(CNMultipleUnknownContactsViewController *)v15 navigationItem];
    [v22 setLargeTitleDisplayMode:2];

    objc_storeStrong((id *)&v15->_targetGroup, a4);
    objc_storeStrong((id *)&v15->_targetContainer, a5);
    uint64_t v23 = v15;
  }
  return v11;
}

void __88__CNMultipleUnknownContactsViewController_initWithContacts_targetGroup_targetContainer___block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [(id)objc_opt_class() descriptorForRequiredKeys];
  v5[0] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 assertKeysAreAvailable:v4];
}

- (CNMultipleUnknownContactsViewController)initWithContacts:(id)a3
{
  return [(CNMultipleUnknownContactsViewController *)self initWithContacts:a3 targetGroup:0 targetContainer:0];
}

- (CNMultipleUnknownContactsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNMultipleUnknownContactsViewController initWithContacts:](self, "initWithContacts:", MEMORY[0x1E4F1CBF0], a4);
}

+ (id)descriptorForRequiredKeys
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1B8F8];
  objc_super v4 = +[CNContactViewController descriptorForRequiredKeys];
  v11[0] = v4;
  id v5 = [a1 contactFormatter];
  uint64_t v6 = [v5 descriptorForRequiredKeys];
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v8 = [NSString stringWithUTF8String:"+[CNMultipleUnknownContactsViewController descriptorForRequiredKeys]"];
  id v9 = [v3 descriptorWithKeyDescriptors:v7 description:v8];

  return v9;
}

+ (id)contactFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v2 setStyle:0];
  [v2 setFallbackStyle:-1];

  return v2;
}

+ (id)log
{
  if (log_cn_once_token_1_19120 != -1) {
    dispatch_once(&log_cn_once_token_1_19120, &__block_literal_global_19121);
  }
  id v2 = (void *)log_cn_once_object_1_19122;

  return v2;
}

void __46__CNMultipleUnknownContactsViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNMultipleUnknownContactsViewController");
  v1 = (void *)log_cn_once_object_1_19122;
  log_cn_once_object_1_19122 = (uint64_t)v0;
}

@end