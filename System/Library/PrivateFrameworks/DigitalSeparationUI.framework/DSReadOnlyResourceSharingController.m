@interface DSReadOnlyResourceSharingController
- (BOOL)shouldShow;
- (DSNavigationDelegate)delegate;
- (DSReadOnlyResourceSharingController)init;
- (DSSharingPermissions)permissions;
- (NSMutableSet)selectedPeople;
- (NSMutableSet)selectedTypes;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)scope;
- (void)_pushDetailPaneForSharingPeople:(id)a3;
- (void)_pushDetailPaneForSharingTypes:(id)a3;
- (void)_reviewAllSharing;
- (void)_updateButton;
- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4;
- (void)learnMorePressedForSharingType:(id)a3;
- (void)reloadTableViewData;
- (void)reviewReadOnlySharingCompleted;
- (void)reviewSelectedSharing;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setPermissions:(id)a3;
- (void)setScope:(unint64_t)a3;
- (void)setSelectedPeople:(id)a3;
- (void)setSelectedTypes:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DSReadOnlyResourceSharingController

- (DSReadOnlyResourceSharingController)init
{
  v3 = DSUILocStringForKey(@"READ_ONLY_SHARING_TITLE");
  v4 = +[DSUIUtilities valueForUnfinalizedString:v3];
  v5 = DSUILocStringForKey(@"READ_ONLY_SHARING_BY_PEOPLE_DETAIL");
  v6 = +[DSUIUtilities valueForUnfinalizedString:v5];
  v18.receiver = self;
  v18.super_class = (Class)DSReadOnlyResourceSharingController;
  v7 = [(DSTableWelcomeController *)&v18 initWithTitle:v4 detailText:v6 icon:0 adoptTableViewScrollView:1 shouldShowSearchBar:1];

  if (v7)
  {
    v8 = DSUILocStringForKey(@"SKIP");
    v9 = +[DSUIUtilities setUpBoldButtonForController:v7 title:v8 target:v7 selector:sel_reviewReadOnlySharingCompleted];
    [(DSTableWelcomeController *)v7 setBoldButton:v9];

    v10 = DSUILocStringForKey(@"READ_ONLY_SHARING_REVIEW_ALL");
    v11 = +[DSUIUtilities valueForUnfinalizedString:v10];
    v12 = +[DSUIUtilities setUpLinkButtonForController:v7 title:v11 target:v7 selector:sel__reviewAllSharing];
    [(DSTableWelcomeController *)v7 setLinkButton:v12];

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    selectedPeople = v7->_selectedPeople;
    v7->_selectedPeople = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    selectedTypes = v7->_selectedTypes;
    v7->_selectedTypes = v15;
  }
  return v7;
}

- (BOOL)shouldShow
{
  v3 = [(DSReadOnlyResourceSharingController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 fetchedSharingPermissions];
    [(DSReadOnlyResourceSharingController *)self setPermissions:v4];

    v5 = [(DSReadOnlyResourceSharingController *)self permissions];
    v6 = [v5 allReadOnlySharingTypes];
    if ([v6 count])
    {
      BOOL v7 = 1;
    }
    else
    {
      v8 = [(DSReadOnlyResourceSharingController *)self permissions];
      v9 = [v8 allReadOnlySharingPeople];
      BOOL v7 = [v9 count] != 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSReadOnlyResourceSharingController;
  [(OBTableWelcomeController *)&v4 viewWillAppear:a3];
  [(DSReadOnlyResourceSharingController *)self reloadTableViewData];
  [(DSReadOnlyResourceSharingController *)self _updateButton];
}

- (void)viewDidLoad
{
  v12[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)DSReadOnlyResourceSharingController;
  [(DSTableWelcomeController *)&v11 viewDidLoad];
  v3 = DSUILocStringForKey(@"BY_PERSON");
  v12[0] = v3;
  objc_super v4 = DSUILocStringForKey(@"BY_TYPE");
  v12[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v6 = [(DSTableWelcomeController *)self searchController];
  BOOL v7 = [v6 searchBar];
  [v7 setScopeButtonTitles:v5];

  v8 = DSUILocStringForKey(@"SEARCH_SHARING_TYPE_PLACEHOLDER");
  v9 = [(DSTableWelcomeController *)self searchController];
  v10 = [v9 searchBar];
  [v10 setPlaceholder:v8];
}

- (void)_reviewAllSharing
{
  unint64_t v3 = [(DSReadOnlyResourceSharingController *)self scope];
  objc_super v4 = [(DSReadOnlyResourceSharingController *)self permissions];
  id v6 = v4;
  if (v3 == 1)
  {
    v5 = [v4 allReadOnlySharingTypes];
    [(DSReadOnlyResourceSharingController *)self _pushDetailPaneForSharingTypes:v5];
  }
  else
  {
    v5 = [v4 allReadOnlySharingPeople];
    [(DSReadOnlyResourceSharingController *)self _pushDetailPaneForSharingPeople:v5];
  }
}

- (void)_pushDetailPaneForSharingTypes:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    objc_super v4 = +[DSReadOnlyResourceSharingDetailController initWithSharingTypes:v6 startingViewController:self delegate:self];
    v5 = [(DSReadOnlyResourceSharingController *)self navigationController];
    [v5 pushViewController:v4 animated:1];
  }
}

- (void)_pushDetailPaneForSharingPeople:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    objc_super v4 = +[DSReadOnlyResourceSharingDetailController initWithSharingPeople:v6 startingViewController:self delegate:self];
    v5 = [(DSReadOnlyResourceSharingController *)self navigationController];
    [v5 pushViewController:v4 animated:1];
  }
}

- (void)_updateButton
{
  unint64_t v3 = [(DSTableWelcomeController *)self searchController];
  objc_super v4 = [v3 searchBar];
  uint64_t v5 = [v4 selectedScopeButtonIndex];

  if (v5) {
    [(DSReadOnlyResourceSharingController *)self selectedTypes];
  }
  else {
  id v6 = [(DSReadOnlyResourceSharingController *)self selectedPeople];
  }
  uint64_t v7 = [v6 count];

  v8 = [(DSTableWelcomeController *)self boldButton];
  [v8 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

  if (v7)
  {
    v9 = [(DSTableWelcomeController *)self boldButton];
    v10 = DSUILocStringForKey(@"REVIEW_SHARING");
    [v9 setTitle:v10 forState:0];

    objc_super v11 = [(DSTableWelcomeController *)self boldButton];
    [v11 addTarget:self action:sel_reviewSelectedSharing forControlEvents:64];
  }
  else
  {
    v12 = [(DSReadOnlyResourceSharingController *)self permissions];
    if ([v12 readOnlySharingPeopleCountWithFilter:0]) {
      v13 = @"SKIP";
    }
    else {
      v13 = @"CONTINUE";
    }
    objc_super v11 = DSUILocStringForKey(v13);

    v14 = [(DSTableWelcomeController *)self boldButton];
    [v14 setTitle:v11 forState:0];

    v15 = [(DSTableWelcomeController *)self boldButton];
    [v15 addTarget:self action:sel_reviewReadOnlySharingCompleted forControlEvents:64];
  }
  [(DSTableWelcomeController *)self hideButtonsIfSearching];
}

- (void)reviewSelectedSharing
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(OBTableWelcomeController *)self tableView];
  objc_super v4 = [v3 indexPathsForSelectedRows];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_14];

  unint64_t v6 = [(DSReadOnlyResourceSharingController *)self scope];
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  if (v6 == 1)
  {
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long v30 = 0uLL;
    long long v31 = 0uLL;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v14 = [(DSReadOnlyResourceSharingController *)self permissions];
          v15 = objc_msgSend(v14, "readOnlySharingType:withFilter:", objc_msgSend(v13, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));

          if (v15) {
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v10);
    }

    [(DSReadOnlyResourceSharingController *)self _pushDetailPaneForSharingTypes:v7];
  }
  else
  {
    long long v28 = 0uLL;
    long long v29 = 0uLL;
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          v22 = [(DSReadOnlyResourceSharingController *)self permissions];
          v23 = objc_msgSend(v22, "readOnlySharingPerson:withFilter:", objc_msgSend(v21, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));

          if (v23) {
            [v7 addObject:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v18);
    }

    [(DSReadOnlyResourceSharingController *)self _pushDetailPaneForSharingPeople:v7];
  }

  v24 = [(DSReadOnlyResourceSharingController *)self selectedTypes];
  [v24 removeAllObjects];

  v25 = [(DSReadOnlyResourceSharingController *)self selectedPeople];
  [v25 removeAllObjects];

  [(DSReadOnlyResourceSharingController *)self _updateButton];
}

uint64_t __60__DSReadOnlyResourceSharingController_reviewSelectedSharing__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 row];
  if (v6 >= [v5 row])
  {
    uint64_t v8 = [v4 row];
    uint64_t v7 = v8 > [v5 row];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v7 = [a3 searchBar];
  id v4 = [v7 text];
  id v5 = [(DSTableWelcomeController *)self searchController];
  uint64_t v6 = [v5 searchBar];
  -[DSReadOnlyResourceSharingController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v4, [v6 selectedScopeButtonIndex]);
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  [(DSReadOnlyResourceSharingController *)self setScope:a4];
  [(DSReadOnlyResourceSharingController *)self _updateButton];
  id v8 = [(DSTableWelcomeController *)self searchController];
  uint64_t v6 = [v8 searchBar];
  id v7 = [v6 text];
  [(DSReadOnlyResourceSharingController *)self filterContentForSearchText:v7 category:a4];
}

- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4
{
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"displayName contains[c] %@", a4, a3];
  unint64_t scope = self->_scope;
  id v11 = (id)v5;
  if (scope)
  {
    if (scope != 1) {
      goto LABEL_6;
    }
    id v7 = [(DSReadOnlyResourceSharingController *)self permissions];
    [v7 filterReadOnlySharingTypesWithPredicate:v11];
  }
  else
  {
    id v7 = [(DSReadOnlyResourceSharingController *)self permissions];
    [v7 filterReadOnlySharingPeopleWithPredicate:v11];
  }

LABEL_6:
  id v8 = [(DSReadOnlyResourceSharingController *)self headerView];
  [v8 setTitle:&stru_26E9097D0];

  uint64_t v9 = [(DSReadOnlyResourceSharingController *)self headerView];
  [v9 setDetailText:&stru_26E9097D0];

  uint64_t v10 = [(OBTableWelcomeController *)self tableView];
  [v10 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(DSReadOnlyResourceSharingController *)self scope];
  if (!v6)
  {
    v13 = [(DSReadOnlyResourceSharingController *)self permissions];
    id v8 = objc_msgSend(v13, "readOnlySharingPerson:withFilter:", objc_msgSend(v5, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));

    uint64_t v9 = [v8 displayName];
    uint64_t v10 = [v8 iconForTable];
    v14 = [(DSReadOnlyResourceSharingController *)self selectedPeople];
    int v15 = [v14 containsObject:v8];

    if (!v15)
    {
LABEL_7:

      goto LABEL_9;
    }
LABEL_6:
    id v16 = [(OBTableWelcomeController *)self tableView];
    [v16 selectRowAtIndexPath:v5 animated:1 scrollPosition:0];

    goto LABEL_7;
  }
  if (v6 == 1)
  {
    id v7 = [(DSReadOnlyResourceSharingController *)self permissions];
    id v8 = objc_msgSend(v7, "readOnlySharingType:withFilter:", objc_msgSend(v5, "row"), -[DSTableWelcomeController isFiltering](self, "isFiltering"));

    uint64_t v9 = [v8 displayName];
    uint64_t v10 = [v8 iconForTable];
    id v11 = [(DSReadOnlyResourceSharingController *)self selectedTypes];
    char v12 = [v11 containsObject:v8];

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v10 = 0;
  uint64_t v9 = 0;
LABEL_9:
  uint64_t v17 = [(OBTableWelcomeController *)self tableView];
  uint64_t v18 = +[DSIconTableViewCell iconTableViewCellFromTableView:v17 withText:v9 detail:&stru_26E9097D0 icon:v10];

  [v18 setAccessoryType:0];
  return v18;
}

- (void)reloadTableViewData
{
  unint64_t v3 = [(DSReadOnlyResourceSharingController *)self permissions];
  [v3 sort];

  id v4 = [(OBTableWelcomeController *)self tableView];
  id v5 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  [v4 reloadSections:v5 withRowAnimation:100];

  id v6 = [(OBTableWelcomeController *)self tableView];
  [v6 layoutIfNeeded];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5 = [(DSReadOnlyResourceSharingController *)self scope];
  id v6 = [(DSReadOnlyResourceSharingController *)self permissions];
  BOOL v7 = [(DSTableWelcomeController *)self isFiltering];
  if (v5 == 1) {
    uint64_t v8 = [v6 readOnlySharingTypesCountWithFilter:v7];
  }
  else {
    uint64_t v8 = [v6 readOnlySharingPeopleCountWithFilter:v7];
  }
  int64_t v9 = v8;

  if (![(DSTableWelcomeController *)self isFiltering])
  {
    if (v9)
    {
      [(DSTableWelcomeController *)self hideNoSharingView];
      uint64_t v10 = [(DSReadOnlyResourceSharingController *)self headerView];
      id v11 = DSUILocStringForKey(@"READ_ONLY_SHARING_TITLE");
      char v12 = +[DSUIUtilities valueForUnfinalizedString:v11];
      [v10 setTitle:v12];

      v13 = [(DSReadOnlyResourceSharingController *)self headerView];
      if ([(DSReadOnlyResourceSharingController *)self scope] == 1) {
        v14 = @"READ_ONLY_SHARING_BY_TYPE_DETAIL";
      }
      else {
        v14 = @"READ_ONLY_SHARING_BY_PEOPLE_DETAIL";
      }
      int v15 = DSUILocStringForKey(v14);
      id v16 = +[DSUIUtilities valueForUnfinalizedString:v15];
      [v13 setDetailText:v16];

      goto LABEL_18;
    }
    if ([(DSReadOnlyResourceSharingController *)self scope] == 1) {
      uint64_t v19 = @"READ_ONLY_NO_SHARING_TYPE";
    }
    else {
      uint64_t v19 = @"READ_ONLY_NO_SHARING_PEOPLE";
    }
    v20 = DSUILocStringForKey(v19);
    v13 = +[DSUIUtilities valueForUnfinalizedString:v20];

    uint64_t v17 = [MEMORY[0x263F827E8] _systemImageNamed:@"app.3.stack.3d.fill"];
    [(DSTableWelcomeController *)self showNoSharingViewWithText:v13 image:v17];
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  if (!v9)
  {
    v13 = [(DSTableWelcomeController *)self searchController];
    uint64_t v17 = [v13 searchBar];
    uint64_t v18 = [v17 text];
    [(DSTableWelcomeController *)self showNoResultsViewWithSearchText:v18];

    goto LABEL_17;
  }
  [(DSTableWelcomeController *)self hideNoResultsView];
LABEL_19:
  [(DSReadOnlyResourceSharingController *)self _updateButton];
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DSTableWelcomeController *)self searchController];
  BOOL v7 = [v6 searchBar];
  uint64_t v8 = [v7 selectedScopeButtonIndex];

  if (v8)
  {
    int64_t v9 = [(DSReadOnlyResourceSharingController *)self selectedTypes];
    uint64_t v10 = [(DSReadOnlyResourceSharingController *)self permissions];
    uint64_t v11 = [v5 row];

    objc_msgSend(v10, "readOnlySharingType:withFilter:", v11, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  }
  else
  {
    int64_t v9 = [(DSReadOnlyResourceSharingController *)self selectedPeople];
    uint64_t v10 = [(DSReadOnlyResourceSharingController *)self permissions];
    uint64_t v12 = [v5 row];

    objc_msgSend(v10, "readOnlySharingPerson:withFilter:", v12, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  v13 = };
  [v9 addObject:v13];

  [(DSReadOnlyResourceSharingController *)self _updateButton];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(DSTableWelcomeController *)self searchController];
  BOOL v7 = [v6 searchBar];
  uint64_t v8 = [v7 selectedScopeButtonIndex];

  if (v8)
  {
    int64_t v9 = [(DSReadOnlyResourceSharingController *)self selectedTypes];
    uint64_t v10 = [(DSReadOnlyResourceSharingController *)self permissions];
    uint64_t v11 = [v5 row];

    objc_msgSend(v10, "readOnlySharingType:withFilter:", v11, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  }
  else
  {
    int64_t v9 = [(DSReadOnlyResourceSharingController *)self selectedPeople];
    uint64_t v10 = [(DSReadOnlyResourceSharingController *)self permissions];
    uint64_t v12 = [v5 row];

    objc_msgSend(v10, "readOnlySharingPerson:withFilter:", v12, -[DSTableWelcomeController isFiltering](self, "isFiltering"));
  v13 = };
  [v9 removeObject:v13];

  [(DSReadOnlyResourceSharingController *)self _updateButton];
}

- (void)reviewReadOnlySharingCompleted
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(DSReadOnlyResourceSharingController *)self selectedTypes];
  [v3 removeAllObjects];

  id v4 = [(DSReadOnlyResourceSharingController *)self selectedPeople];
  [v4 removeAllObjects];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [(OBTableWelcomeController *)self tableView];
  id v6 = [v5 indexPathsForSelectedRows];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * v10);
        uint64_t v12 = [(OBTableWelcomeController *)self tableView];
        [v12 deselectRowAtIndexPath:v11 animated:0];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  v13 = [(DSReadOnlyResourceSharingController *)self delegate];
  [v13 pushPaneAfterPaneType:objc_opt_class()];

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v15 = [(DSReadOnlyResourceSharingController *)self navigationController];
  id v16 = [v15 viewControllers];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v14 addObject:v21];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  v22 = [(DSReadOnlyResourceSharingController *)self navigationController];
  [v22 setViewControllers:v14];
}

- (void)learnMorePressedForSharingType:(id)a3
{
  DSUILocStringForKey(@"NAVIGATION_LEARN_MORE_URL");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [(DSReadOnlyResourceSharingController *)self delegate];
  [v4 learnMorePressedForController:self withURL:v5];
}

- (DSNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DSSharingPermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(id)a3
{
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScope:(unint64_t)a3
{
  self->_unint64_t scope = a3;
}

- (NSMutableSet)selectedPeople
{
  return self->_selectedPeople;
}

- (void)setSelectedPeople:(id)a3
{
}

- (NSMutableSet)selectedTypes
{
  return self->_selectedTypes;
}

- (void)setSelectedTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedTypes, 0);
  objc_storeStrong((id *)&self->_selectedPeople, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end