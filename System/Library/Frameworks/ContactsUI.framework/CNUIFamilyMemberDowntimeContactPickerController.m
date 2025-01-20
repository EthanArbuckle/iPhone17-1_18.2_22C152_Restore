@interface CNUIFamilyMemberDowntimeContactPickerController
+ (id)descriptorForContactPropertiesSupportingPredicateEvaluation;
+ (id)familyCircle;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6;
- (BOOL)initialSelectionPerformed;
- (BOOL)shouldPreselectFamilyMemberContacts;
- (CNContact)preferredForNameMeContact;
- (CNContactFormatter)contactCardWarningFormatter;
- (CNContactFormatter)contactCellLabelFormatter;
- (CNContactViewController)contactViewController;
- (CNUICoreContactEditingSession)editingSessionFromContactViewController;
- (CNUIFamilyMemberContactsEditingStrategy)editingStrategy;
- (CNUIFamilyMemberDowntimeContactDataSource)dataSource;
- (CNUIFamilyMemberDowntimeContactPickerController)initWithChildFamilyMember:(id)a3 allFamilyMembers:(id)a4 contactStore:(id)a5;
- (CNUIFamilyMemberDowntimeContactPickerController)initWithChildFamilyMember:(id)a3 allFamilyMembers:(id)a4 contactStore:(id)a5 editingStrategy:(id)a6 showingFamilyMemberContacts:(BOOL)a7;
- (CNUIFamilyMemberDowntimeContactPickerControllerDelegate)delegate;
- (FAFamilyMember)childFamilyMember;
- (NSArray)allFamilyMembers;
- (NSIndexPath)presentedContactIndexPath;
- (UISearchBar)searchBar;
- (UISearchController)searchController;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)warningMessageForContact:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel:(id)a3;
- (void)configureNavigationItem;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dealloc;
- (void)done:(id)a3;
- (void)keyboardWillChange:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)saveSanitizedSelectedContacts:(id)a3;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setContactViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialSelectionPerformed:(BOOL)a3;
- (void)setPresentedContactIndexPath:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setShouldPreselectFamilyMemberContacts:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setupSearchBar;
- (void)setupSearchController;
- (void)setupTableView;
- (void)setupUI;
- (void)startObservingKeyboardChanges;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNUIFamilyMemberDowntimeContactPickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredForNameMeContact, 0);
  objc_storeStrong((id *)&self->_allFamilyMembers, 0);
  objc_storeStrong((id *)&self->_childFamilyMember, 0);
  objc_storeStrong((id *)&self->_editingStrategy, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contactCardWarningFormatter, 0);
  objc_storeStrong((id *)&self->_contactCellLabelFormatter, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_storeStrong((id *)&self->_presentedContactIndexPath, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setInitialSelectionPerformed:(BOOL)a3
{
  self->_initialSelectionPerformed = a3;
}

- (BOOL)initialSelectionPerformed
{
  return self->_initialSelectionPerformed;
}

- (CNContact)preferredForNameMeContact
{
  return self->_preferredForNameMeContact;
}

- (NSArray)allFamilyMembers
{
  return self->_allFamilyMembers;
}

- (FAFamilyMember)childFamilyMember
{
  return self->_childFamilyMember;
}

- (CNUIFamilyMemberContactsEditingStrategy)editingStrategy
{
  return self->_editingStrategy;
}

- (CNUIFamilyMemberDowntimeContactDataSource)dataSource
{
  return self->_dataSource;
}

- (CNContactFormatter)contactCardWarningFormatter
{
  return self->_contactCardWarningFormatter;
}

- (CNContactFormatter)contactCellLabelFormatter
{
  return self->_contactCellLabelFormatter;
}

- (void)setContactViewController:(id)a3
{
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setPresentedContactIndexPath:(id)a3
{
}

- (NSIndexPath)presentedContactIndexPath
{
  return self->_presentedContactIndexPath;
}

- (void)setSearchBar:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchController:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setShouldPreselectFamilyMemberContacts:(BOOL)a3
{
  self->_shouldPreselectFamilyMemberContacts = a3;
}

- (BOOL)shouldPreselectFamilyMemberContacts
{
  return self->_shouldPreselectFamilyMemberContacts;
}

- (void)setDelegate:(id)a3
{
}

- (CNUIFamilyMemberDowntimeContactPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNUIFamilyMemberDowntimeContactPickerControllerDelegate *)WeakRetained;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  if (!a4)
  {
    v5 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
    v6 = [(CNUIFamilyMemberDowntimeContactPickerController *)self presentedContactIndexPath];
    [v5 deselectRowAtIndexPath:v6 animated:1];
  }
  [(CNUIFamilyMemberDowntimeContactPickerController *)self setPresentedContactIndexPath:0];
  id v8 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationController];
  id v7 = (id)[v8 popViewControllerAnimated:1];
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  return 0;
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  [(UISearchBar *)self->_searchBar setText:&stru_1ED8AC728];
  searchController = self->_searchController;

  [(CNUIFamilyMemberDowntimeContactPickerController *)self updateSearchResultsForSearchController:searchController];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [(UISearchBar *)self->_searchBar text];
  [(CNUIFamilyMemberDowntimeContactDataSource *)self->_dataSource setFilterString:v4];
  [(UITableView *)self->_tableView reloadData];
}

- (id)warningMessageForContact:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIFamilyMemberDowntimeContactPickerController *)self contactCardWarningFormatter];
  v6 = [v5 stringFromContact:v4];

  LODWORD(v5) = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))();
  id v7 = NSString;
  id v8 = CNContactsUIBundle();
  v9 = v8;
  if (v5)
  {
    v10 = [v8 localizedStringForKey:@"DOWNTIME_PICKER_CONTACT_CARD_WARNING_NO_NAME" value:&stru_1ED8AC728 table:@"Localized"];
    v11 = [(CNUIFamilyMemberDowntimeContactPickerController *)self childFamilyMember];
    v12 = [v11 firstName];
    v13 = [(CNUIFamilyMemberDowntimeContactPickerController *)self childFamilyMember];
    v14 = [v13 firstName];
    objc_msgSend(v7, "stringWithFormat:", v10, v12, v14, v17);
  }
  else
  {
    v10 = [v8 localizedStringForKey:@"DOWNTIME_PICKER_CONTACT_CARD_WARNING" value:&stru_1ED8AC728 table:@"Localized"];
    v11 = [(CNUIFamilyMemberDowntimeContactPickerController *)self childFamilyMember];
    v12 = [v11 firstName];
    v13 = [(CNUIFamilyMemberDowntimeContactPickerController *)self childFamilyMember];
    v14 = [v13 firstName];
    objc_msgSend(v7, "stringWithFormat:", v10, v12, v6, v14);
  v15 = };

  return v15;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(CNUIFamilyMemberDowntimeContactPickerController *)self setPresentedContactIndexPath:v5];
  v6 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  id v7 = [v6 contactItemForIndexPath:v5];

  id v8 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  v9 = [v7 contact];
  v10 = +[CNContactContentViewController descriptorForRequiredKeys];
  uint64_t v11 = *MEMORY[0x1E4F1ADD8];
  v36[0] = v10;
  v36[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  v13 = [v8 completeContactFromContact:v9 fromMainStoreOnly:1 keysToFetch:v12];

  id v14 = v13;
  v15 = [(CNUIFamilyMemberDowntimeContactPickerController *)self editingSessionFromContactViewController];
  LODWORD(v10) = [v15 containsUpdatedContactMatchingContact:v14];

  if (v10)
  {
    v16 = [(CNUIFamilyMemberDowntimeContactPickerController *)self editingSessionFromContactViewController];
    id v35 = v14;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    v18 = [v16 updatedContactsMatchingContacts:v17];
    v19 = [v18 firstObject];
  }
  else
  {
    v16 = [(CNUIFamilyMemberDowntimeContactPickerController *)self editingStrategy];
    uint64_t v17 = [v16 sensitiveDataContactFilter];
    v19 = ((void (**)(void, id))v17)[2](v17, v14);
    v18 = v14;
  }

  contactViewController = self->_contactViewController;
  if (contactViewController)
  {
    [(CNContactViewController *)contactViewController setContact:v19 additionalContact:0 mode:1];
    v21 = [(CNUIFamilyMemberDowntimeContactPickerController *)self warningMessageForContact:v14];
    [(CNContactViewController *)self->_contactViewController setWarningMessage:v21];
  }
  else
  {
    v22 = +[CNContactViewController viewControllerForContact:v19];
    v23 = self->_contactViewController;
    self->_contactViewController = v22;

    v24 = [(CNUIFamilyMemberDowntimeContactPickerController *)self editingStrategy];
    v25 = [v24 prohibitedPropertyKeys];
    [(CNContactViewController *)self->_contactViewController setProhibitedPropertyKeys:v25];

    [(CNContactViewController *)self->_contactViewController setIgnoresParentalRestrictions:1];
    [(CNContactViewController *)self->_contactViewController setDisplayMode:2];
    v26 = [(CNUIFamilyMemberDowntimeContactPickerController *)self warningMessageForContact:v14];
    [(CNContactViewController *)self->_contactViewController setWarningMessage:v26];

    [(CNContactViewController *)self->_contactViewController setEditingProposedInformation:1];
    [(CNContactViewController *)self->_contactViewController setDelegate:self];
    [(CNContactViewController *)self->_contactViewController setShouldDrawNavigationBar:1];
    v27 = CNContactsUIBundle();
    v28 = [v27 localizedStringForKey:@"DOWNTIME_PICKER_CONTACT_CARD_PROMPT" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNContactViewController *)self->_contactViewController setInitialPrompt:v28];

    [(CNContactViewController *)self->_contactViewController setEditMode:2];
    [(CNContactViewController *)self->_contactViewController setActions:[(CNContactViewController *)self->_contactViewController actions] & 0xFFFFFFFFFFFFFEFFLL];
    [(CNContactViewController *)self->_contactViewController setActions:[(CNContactViewController *)self->_contactViewController actions] & 0xFFFFFFFFFFFFFFEFLL];
    [(CNContactViewController *)self->_contactViewController setAllowsActions:0];
    v29 = [(CNContactViewController *)self->_contactViewController contentViewController];
    [v29 setShouldIgnoreContactStoreDidChangeNotification:1];

    v30 = objc_alloc_init(CNUIEditingSessionSaveExecutor);
    v31 = [(CNContactViewController *)self->_contactViewController contentViewController];
    [v31 setSaveContactExecutor:v30];

    v21 = objc_alloc_init(CNUINullSaveExecutor);
    v32 = [(CNContactViewController *)self->_contactViewController contentViewController];
    [v32 setSaveLinkedContactsExecutor:v21];
  }
  [(CNContactViewController *)self->_contactViewController setEditing:1];
  v33 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationController];
  v34 = [(CNUIFamilyMemberDowntimeContactPickerController *)self contactViewController];
  [v33 pushViewController:v34 animated:1];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F5A258];
  id v6 = a4;
  id v7 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  id v8 = [v7 indexPathsForSelectedRows];
  uint64_t v9 = (*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v8) ^ 1;
  v10 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  uint64_t v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:v9];

  id v12 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  [v12 setContactItemSelected:0 forIndexPath:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F5A258];
  id v6 = a4;
  id v7 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  id v8 = [v7 indexPathsForSelectedRows];
  uint64_t v9 = (*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v8) ^ 1;
  v10 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  uint64_t v11 = [v10 rightBarButtonItem];
  [v11 setEnabled:v9];

  id v12 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  [v12 setContactItemSelected:1 forIndexPath:v6];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(CNUIFamilyMemberDowntimeContactDataSource *)self->_dataSource titleForSection:a4];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v12 = a5;
  id v7 = a4;
  id v8 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  uint64_t v9 = [v8 contactItemForIndexPath:v12];
  int v10 = [v9 selected];

  if (v10)
  {
    [v7 setSelected:1 animated:0];

    uint64_t v11 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
    [v11 selectRowAtIndexPath:v12 animated:0 scrollPosition:0];
  }
  else
  {
    [v7 setSelected:0 animated:0];

    uint64_t v11 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
    [v11 deselectRowAtIndexPath:v12 animated:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[CNUIFamilyDowntimeContactPickerCell reuseIdentifier];
  uint64_t v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  int v10 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  uint64_t v11 = [v10 contactItemForIndexPath:v6];

  id v12 = [(CNUIFamilyMemberDowntimeContactPickerController *)self contactCellLabelFormatter];
  v13 = [v11 contact];
  id v14 = [v12 stringFromContact:v13];
  v15 = [v9 textLabel];
  [v15 setText:v14];

  v16 = [v11 label];
  uint64_t v17 = [v9 detailTextLabel];
  [v17 setText:v16];

  v18 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  if ([v18 isShowingFamilyMemberContacts]) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = 4;
  }
  [v9 setEditingAccessoryType:v19];

  id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v9 setSelectedBackgroundView:v21];

  if (![(CNUIFamilyMemberDowntimeContactPickerController *)self initialSelectionPerformed]
    && [(CNUIFamilyMemberDowntimeContactPickerController *)self shouldPreselectFamilyMemberContacts])
  {
    v22 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
    if ([v22 numberOfSections] == 2)
    {
      uint64_t v23 = [v6 section];

      if (v23) {
        goto LABEL_10;
      }
      v24 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
      [v24 setContactItemSelected:1 forIndexPath:v6];

      v22 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
      v25 = [v22 rightBarButtonItem];
      [v25 setEnabled:1];
    }
  }
LABEL_10:

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  int64_t v6 = [v5 numberOfRowsInSection:a4];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (void)saveSanitizedSelectedContacts:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A258];
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v4) & 1) == 0)
  {
    int64_t v6 = [(CNUIFamilyMemberDowntimeContactPickerController *)self editingSessionFromContactViewController];
    id v7 = [v6 updatedContacts];
    int v8 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

    if (v8)
    {
      uint64_t v9 = [(CNUIFamilyMemberDowntimeContactPickerController *)self editingStrategy];
      int v10 = [v9 sensitiveDataContactFilter];
      uint64_t v11 = objc_msgSend(v4, "_cn_map:", v10);
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __81__CNUIFamilyMemberDowntimeContactPickerController_saveSanitizedSelectedContacts___block_invoke;
      v13[3] = &unk_1E5496630;
      v13[4] = self;
      uint64_t v11 = objc_msgSend(v4, "_cn_map:", v13);
    }
    id v12 = [(CNUIFamilyMemberDowntimeContactPickerController *)self delegate];
    [v12 downtimePickerController:self didFinishWithContacts:v11];
  }
}

id __81__CNUIFamilyMemberDowntimeContactPickerController_saveSanitizedSelectedContacts___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) editingSessionFromContactViewController];
  v12[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  int64_t v6 = [v4 updatedContactsMatchingContacts:v5];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) editingStrategy];
    int v10 = [v9 sensitiveDataContactFilter];
    ((void (**)(void, id))v10)[2](v10, v3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)done:(id)a3
{
  id v4 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  id v5 = [v4 selectedContacts];

  [(CNUIFamilyMemberDowntimeContactPickerController *)self saveSanitizedSelectedContacts:v5];
}

- (void)cancel:(id)a3
{
  id v4 = [(CNUIFamilyMemberDowntimeContactPickerController *)self delegate];
  [v4 downtimePickerController:self didFinishWithContacts:0];
}

- (void)keyboardWillChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = [(CNUIFamilyMemberDowntimeContactPickerController *)self view];
  v15 = [v14 window];
  objc_msgSend(v15, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24 = [(CNUIFamilyMemberDowntimeContactPickerController *)self view];
  objc_msgSend(v24, "convertRect:fromView:", 0, v17, v19, v21, v23);
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;

  v33 = [(CNUIFamilyMemberDowntimeContactPickerController *)self view];
  [v33 bounds];
  v61.origin.CGFloat x = v26;
  v61.origin.CGFloat y = v28;
  v61.size.CGFloat width = v30;
  v61.size.CGFloat height = v32;
  CGRect v59 = CGRectIntersection(v58, v61);
  CGFloat x = v59.origin.x;
  CGFloat y = v59.origin.y;
  CGFloat width = v59.size.width;
  CGFloat height = v59.size.height;

  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  double v38 = CGRectGetHeight(v60);
  v39 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  [v39 contentInset];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;

  v46 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  [v46 _systemContentInset];
  double v48 = v38 - v47;

  if (v48 < 0.0) {
    double v48 = 0.0;
  }
  v49 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  [v49 contentInset];
  if (v43 == v53 && v41 == v50 && v45 == v52)
  {
    double v54 = v51;

    if (v48 == v54) {
      return;
    }
  }
  else
  {
  }
  v55 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  objc_msgSend(v55, "setContentInset:", v41, v43, v48, v45);

  id v56 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  objc_msgSend(v56, "setScrollIndicatorInsets:", v41, v43, v48, v45);
}

- (CNUICoreContactEditingSession)editingSessionFromContactViewController
{
  objc_opt_class();
  id v3 = [(CNUIFamilyMemberDowntimeContactPickerController *)self contactViewController];
  id v4 = [v3 contentViewController];
  id v5 = [v4 saveContactExecutor];
  if (objc_opt_isKindOfClass()) {
    double v6 = v5;
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;
  double v8 = [v7 editingSession];

  return (CNUICoreContactEditingSession *)v8;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  [(CNUIFamilyMemberDowntimeContactPickerController *)&v4 viewDidAppear:a3];
  [(CNUIFamilyMemberDowntimeContactPickerController *)self setInitialSelectionPerformed:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  [(CNUIFamilyMemberDowntimeContactPickerController *)&v7 viewWillAppear:a3];
  objc_super v4 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  id v5 = [(CNUIFamilyMemberDowntimeContactPickerController *)self tableView];
  double v6 = [v5 indexPathsForVisibleRows];
  [v4 reloadRowsAtIndexPaths:v6 withRowAnimation:5];
}

- (void)startObservingKeyboardChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C58] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C50] object:0];
}

- (void)configureNavigationItem
{
  id v3 = [(CNUIFamilyMemberDowntimeContactPickerController *)self childFamilyMember];
  id v31 = [v3 firstName];

  id v4 = [(CNUIFamilyMemberDowntimeContactPickerController *)self dataSource];
  int v5 = [v4 isShowingFamilyMemberContacts];

  searchController = self->_searchController;
  objc_super v7 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  [v7 setSearchController:searchController];

  double v8 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  [v8 setHidesSearchBarWhenScrolling:0];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    double v9 = NSString;
    double v10 = CNContactsUIBundle();
    double v11 = [v10 localizedStringForKey:@"DOWNTIME_PICKER_PROMPT" value:&stru_1ED8AC728 table:@"Localized"];
    double v12 = objc_msgSend(v9, "stringWithFormat:", v11, v31);
    double v13 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
    [v13 setPrompt:v12];

    if (v5)
    {
      id v14 = NSString;
      v15 = CNContactsUIBundle();
      double v16 = [v15 localizedStringForKey:@"DOWNTIME_PICKER_TITLE_MEMBER" value:&stru_1ED8AC728 table:@"Localized"];
      double v17 = objc_msgSend(v14, "stringWithFormat:", v16, v31);
    }
    else
    {
      v15 = CNContactsUIBundle();
      double v17 = [v15 localizedStringForKey:@"DOWNTIME_PICKER_TITLE_THIS_DEVICE" value:&stru_1ED8AC728 table:@"Localized"];
      double v16 = v17;
    }
    double v23 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
    [v23 setTitle:v17];

    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
    double v18 = CNContactsUIBundle();
    double v19 = v18;
    if (v5) {
      double v20 = @"DOWNTIME_PICKER_TITLE";
    }
    else {
      double v20 = @"DOWNTIME_PICKER_TITLE_THIS_DEVICE";
    }
    double v21 = [v18 localizedStringForKey:v20 value:&stru_1ED8AC728 table:@"Localized"];
    double v22 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
    [v22 setTitle:v21];

    v15 = CNContactsUIBundle();
    double v16 = [v15 localizedStringForKey:@"DOWNTIME_PICKER_PROMPT_DEFAULT_NAME" value:&stru_1ED8AC728 table:@"Localized"];
    double v17 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
    [v17 setPrompt:v16];
  }

LABEL_11:
  v24 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  [v24 setLargeTitleDisplayMode:2];

  double v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
  CGFloat v26 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  [v26 setLeftBarButtonItem:v25];

  double v27 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
  CGFloat v28 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  [v28 setRightBarButtonItem:v27];

  double v29 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationItem];
  CGFloat v30 = [v29 rightBarButtonItem];
  [v30 setEnabled:0];
}

- (void)setupSearchBar
{
  id v3 = [(UISearchController *)self->_searchController searchBar];
  id v4 = CNContactsUIBundle();
  int v5 = [v4 localizedStringForKey:@"SEARCH_LOCAL_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
  [(UISearchBar *)v3 setPlaceholder:v5];

  [(UISearchBar *)v3 setAutoresizingMask:2];
  [(UISearchBar *)v3 setAutocorrectionType:1];
  [(UISearchBar *)v3 setDelegate:self];
  [(UISearchBar *)v3 sizeToFit];
  [(UISearchBar *)v3 setAutoresizingMask:2];
  searchBar = self->_searchBar;
  self->_searchBar = v3;
}

- (void)setupSearchController
{
  id v3 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  searchController = self->_searchController;
  self->_searchController = v3;

  [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
  [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
  int v5 = self->_searchController;

  [(UISearchController *)v5 setDelegate:self];
}

- (void)setupTableView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = [(CNUIFamilyMemberDowntimeContactPickerController *)self view];
  [v4 bounds];
  int v5 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v5;

  objc_super v7 = self->_tableView;
  uint64_t v8 = objc_opt_class();
  double v9 = +[CNUIFamilyDowntimeContactPickerCell reuseIdentifier];
  [(UITableView *)v7 registerClass:v8 forCellReuseIdentifier:v9];

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsMultipleSelectionDuringEditing:1];
  [(UITableView *)self->_tableView setKeyboardDismissMode:2];
  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setEditing:1];
  id v10 = [(CNUIFamilyMemberDowntimeContactPickerController *)self view];
  [v10 addSubview:self->_tableView];
}

- (void)setupUI
{
  [(CNUIFamilyMemberDowntimeContactPickerController *)self setupTableView];
  [(CNUIFamilyMemberDowntimeContactPickerController *)self setupSearchController];
  [(CNUIFamilyMemberDowntimeContactPickerController *)self setupSearchBar];
  [(CNUIFamilyMemberDowntimeContactPickerController *)self configureNavigationItem];

  [(CNUIFamilyMemberDowntimeContactPickerController *)self startObservingKeyboardChanges];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  [(CNUIFamilyMemberDowntimeContactPickerController *)&v5 viewDidLoad];
  [(CNUIFamilyMemberDowntimeContactPickerController *)self setupUI];
  id v3 = [(CNUIFamilyMemberDowntimeContactPickerController *)self navigationController];
  id v4 = [v3 presentationController];
  [v4 setDelegate:self];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  [(CNUIFamilyMemberDowntimeContactPickerController *)&v4 dealloc];
}

- (CNUIFamilyMemberDowntimeContactPickerController)initWithChildFamilyMember:(id)a3 allFamilyMembers:(id)a4 contactStore:(id)a5 editingStrategy:(id)a6 showingFamilyMemberContacts:(BOOL)a7
{
  uint64_t v7 = a7;
  v40[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v39.receiver = self;
  v39.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  double v17 = [(CNUIFamilyMemberDowntimeContactPickerController *)&v39 init];
  double v18 = v17;
  if (v17)
  {
    unsigned int v36 = v7;
    objc_storeStrong((id *)&v17->_childFamilyMember, a3);
    double v19 = v14;
    if (!v14)
    {
      self = [(id)objc_opt_class() familyCircle];
      uint64_t v7 = [(CNUIFamilyMemberDowntimeContactPickerController *)self members];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __151__CNUIFamilyMemberDowntimeContactPickerController_initWithChildFamilyMember_allFamilyMembers_contactStore_editingStrategy_showingFamilyMemberContacts___block_invoke;
      v37[3] = &unk_1E5496608;
      id v35 = &v38;
      id v38 = v13;
      double v19 = objc_msgSend((id)v7, "_cn_filter:", v37);
    }
    objc_storeStrong((id *)&v18->_allFamilyMembers, v19);
    if (!v14)
    {
    }
    objc_storeStrong((id *)&v18->_editingStrategy, a6);
    double v20 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    contactCellLabelFormatter = v18->_contactCellLabelFormatter;
    v18->_contactCellLabelFormatter = v20;

    [(CNContactFormatter *)v18->_contactCellLabelFormatter setStyle:0];
    [(CNContactFormatter *)v18->_contactCellLabelFormatter setEmphasizesPrimaryNameComponent:1];
    [(CNContactFormatter *)v18->_contactCellLabelFormatter setFallbackStyle:-1];
    double v22 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    contactCardWarningFormatter = v18->_contactCardWarningFormatter;
    v18->_contactCardWarningFormatter = v22;

    [(CNContactFormatter *)v18->_contactCardWarningFormatter setIgnoresNickname:1];
    [(CNContactFormatter *)v18->_contactCardWarningFormatter setIgnoresOrganization:1];
    [(CNContactFormatter *)v18->_contactCardWarningFormatter setStyle:1000];
    if (v15)
    {
      id v24 = v15;
    }
    else
    {
      id v24 = [MEMORY[0x1E4F1B980] storeWithOptions:1];
    }
    double v25 = v24;
    CGFloat v26 = [CNUIFamilyMemberDowntimeContactDataSource alloc];
    allFamilyMembers = v18->_allFamilyMembers;
    CGFloat v28 = +[CNContactContentViewController descriptorForRequiredKeys];
    uint64_t v29 = *MEMORY[0x1E4F1ADD8];
    v40[0] = v28;
    v40[1] = v29;
    CGFloat v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    uint64_t v31 = [(CNUIFamilyMemberDowntimeContactDataSource *)v26 initWithStore:v25 familyMembers:allFamilyMembers requiredKeys:v30];
    dataSource = v18->_dataSource;
    v18->_dataSource = (CNUIFamilyMemberDowntimeContactDataSource *)v31;

    [(CNUIFamilyMemberDowntimeContactDataSource *)v18->_dataSource setIsShowingFamilyMemberContacts:v36];
    v33 = v18;

    if (!v14) {
  }
    }

  return v18;
}

uint64_t __151__CNUIFamilyMemberDowntimeContactPickerController_initWithChildFamilyMember_allFamilyMembers_contactStore_editingStrategy_showingFamilyMemberContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) firstName];
  objc_super v5 = [v3 firstName];
  if ([v4 isEqualToString:v5])
  {
    double v6 = [*(id *)(a1 + 32) lastName];
    uint64_t v7 = [v3 lastName];
    uint64_t v8 = [v6 isEqualToString:v7] ^ 1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (CNUIFamilyMemberDowntimeContactPickerController)initWithChildFamilyMember:(id)a3 allFamilyMembers:(id)a4 contactStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = +[CNUIFamilyMemberContactsEditingStrategy whitelistedContactsStrategy];
  double v12 = [(CNUIFamilyMemberDowntimeContactPickerController *)self initWithChildFamilyMember:v10 allFamilyMembers:v9 contactStore:v8 editingStrategy:v11 showingFamilyMemberContacts:0];

  return v12;
}

+ (id)familyCircle
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F61858]);
  [v2 setPromptUserToResolveAuthenticatonFailure:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F5A4B8]);
  objc_super v4 = [v3 completionHandlerAdapter];
  [v2 startRequestWithCompletionHandler:v4];

  objc_super v5 = [v3 future];
  double v6 = [v5 recover:&__block_literal_global_56_295];

  uint64_t v7 = [v6 result:0];

  return v7;
}

id __63__CNUIFamilyMemberDowntimeContactPickerController_familyCircle__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F5A408];
  id v1 = objc_alloc_init(MEMORY[0x1E4F61840]);
  id v2 = [v0 futureWithResult:v1];

  return v2;
}

+ (id)descriptorForContactPropertiesSupportingPredicateEvaluation
{
  return +[CNContactContentViewController descriptorForRequiredKeys];
}

@end