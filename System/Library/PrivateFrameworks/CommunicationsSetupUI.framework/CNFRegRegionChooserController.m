@interface CNFRegRegionChooserController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (CNFRegRegionChooserController)initWithRegionList:(id)a3 selectedRegionID:(id)a4;
- (CNFRegRegionChooserController)initWithStyle:(int64_t)a3;
- (CNFRegRegionChooserDelegate)delegate;
- (NSArray)filteredRegionList;
- (NSArray)regionList;
- (NSString)selectedRegionID;
- (UISearchController)searchController;
- (id)drillDownControllerList;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_drillDownControllersWithArray:(id)a3;
- (void)_hideTableViewCells;
- (void)_selectRegionID:(id)a3;
- (void)_selectRegionList:(id)a3;
- (void)_showTableViewCells;
- (void)dealloc;
- (void)didPresentSearchController:(id)a3;
- (void)handleURL:(id)a3;
- (void)loadView;
- (void)regionChooser:(id)a3 selectedRegionID:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFilteredRegionList:(id)a3;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRegionList:(id)a3;
- (void)setRootController:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSelectedRegionID:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)willPresentSearchController:(id)a3;
@end

@implementation CNFRegRegionChooserController

- (CNFRegRegionChooserController)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNFRegRegionChooserController;
  v3 = [(CNFRegRegionChooserController *)&v8 initWithStyle:a3];
  if (v3)
  {
    v4 = CommunicationsSetupUIBundle();
    v5 = CNFRegStringTableName();
    v6 = [v4 localizedStringForKey:@"FACETIME_LOCALE_COUNTRY_SELECT_LABEL" value:&stru_26D05D4F8 table:v5];
    [(CNFRegRegionChooserController *)v3 setTitle:v6];
  }
  return v3;
}

- (CNFRegRegionChooserController)initWithRegionList:(id)a3 selectedRegionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(CNFRegRegionChooserController *)self initWithStyle:0];
  v9 = v8;
  if (v8)
  {
    [(CNFRegRegionChooserController *)v8 setRegionList:v6];
    [(CNFRegRegionChooserController *)v9 setSelectedRegionID:v7];
    if (v6)
    {
      if ([v6 count])
      {
        v10 = [v6 objectAtIndex:0];
        v11 = [v10 parentRegion];
        v12 = v11;
        if (v11)
        {
          v13 = [v11 label];
          [(CNFRegRegionChooserController *)v9 setTitle:v13];
        }
      }
    }
  }

  return v9;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (void)viewDidUnload
{
  v7.receiver = self;
  v7.super_class = (Class)CNFRegRegionChooserController;
  [(CNFRegRegionChooserController *)&v7 viewDidUnload];
  v3 = [(CNFRegRegionChooserController *)self searchController];
  [v3 setDelegate:0];

  v4 = [(CNFRegRegionChooserController *)self searchController];
  [v4 setSearchResultsUpdater:0];

  v5 = [(CNFRegRegionChooserController *)self searchController];
  id v6 = [v5 searchBar];
  [v6 setDelegate:0];

  [(CNFRegRegionChooserController *)self setSearchController:0];
  [(CNFRegRegionChooserController *)self setFilteredRegionList:0];
}

- (void)dealloc
{
  self->_delegate = 0;
  [(UISearchController *)self->_searchController setDelegate:0];
  [(UISearchController *)self->_searchController setSearchResultsUpdater:0];
  v3 = [(UISearchController *)self->_searchController searchBar];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)CNFRegRegionChooserController;
  [(CNFRegRegionChooserController *)&v4 dealloc];
}

- (void)loadView
{
  v23.receiver = self;
  v23.super_class = (Class)CNFRegRegionChooserController;
  [(CNFRegRegionChooserController *)&v23 loadView];
  v3 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v3 styleUsesCustomTableStyle])
  {
    objc_super v4 = [v3 tableBackgroundColor];

    if (v4)
    {
      v5 = [v3 tableBackgroundColor];
      id v6 = [(CNFRegRegionChooserController *)self tableView];
      [v6 setBackgroundColor:v5];

      objc_super v7 = [(CNFRegRegionChooserController *)self tableView];
      [v7 setBackgroundView:0];
    }
    if ([v3 styleUsesCustomSeparatorStyle])
    {
      objc_super v8 = [(CNFRegRegionChooserController *)self tableView];
      [v8 _setDrawsTopShadowInGroupedSections:0];

      uint64_t v9 = [v3 tableSeparatorStyle];
      v10 = [(CNFRegRegionChooserController *)self tableView];
      [v10 setSeparatorStyle:v9];

      v11 = [v3 tableSeparatorColor];

      if (v11)
      {
        v12 = [v3 tableSeparatorColor];
        v13 = [(CNFRegRegionChooserController *)self tableView];
        [v13 setSeparatorColor:v12];
      }
      v14 = [v3 tableSeparatorTopShadowColor];

      if (v14)
      {
        v15 = [v3 tableSeparatorTopShadowColor];
        v16 = [(CNFRegRegionChooserController *)self tableView];
        [v16 setSeparatorTopShadowColor:v15];
      }
      v17 = [v3 tableSeparatorBottomShadowColor];

      if (v17)
      {
        v18 = [v3 tableSeparatorBottomShadowColor];
        v19 = [(CNFRegRegionChooserController *)self tableView];
        [v19 setSeparatorBottomShadowColor:v18];
      }
    }
    v20 = [v3 tableSectionBorderColor];

    if (v20)
    {
      v21 = [v3 tableSectionBorderColor];
      v22 = [(CNFRegRegionChooserController *)self tableView];
      [v22 setSectionBorderColor:v21];
    }
  }
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)CNFRegRegionChooserController;
  [(CNFRegRegionChooserController *)&v20 viewDidLoad];
  v3 = +[CNFRegAppearanceController globalAppearanceController];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
  [(CNFRegRegionChooserController *)self setSearchController:v4];

  v5 = [(CNFRegRegionChooserController *)self searchController];
  [v5 setDimsBackgroundDuringPresentation:0];

  id v6 = [(CNFRegRegionChooserController *)self searchController];
  [v6 setHidesNavigationBarDuringPresentation:0];

  objc_super v7 = [(CNFRegRegionChooserController *)self searchController];
  [v7 setSearchResultsUpdater:self];

  objc_super v8 = [(CNFRegRegionChooserController *)self searchController];
  uint64_t v9 = [v8 searchBar];
  [v9 setAutocapitalizationType:0];

  uint64_t v10 = [v3 navigationBarStyle];
  v11 = [(CNFRegRegionChooserController *)self searchController];
  v12 = [v11 searchBar];
  [v12 setBarStyle:v10];

  v13 = [(CNFRegRegionChooserController *)self searchController];
  v14 = [v13 searchBar];
  [v14 setDelegate:self];

  v15 = [(CNFRegRegionChooserController *)self searchController];
  v16 = [v15 searchBar];
  v17 = [(CNFRegRegionChooserController *)self tableView];
  [v17 setTableHeaderView:v16];

  v18 = [(CNFRegRegionChooserController *)self searchController];
  v19 = [v18 searchBar];
  [v19 sizeToFit];

  [(CNFRegRegionChooserController *)self setDefinesPresentationContext:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(UISearchController *)self->_searchController isActive]) {
    [(CNFRegRegionChooserController *)self filteredRegionList];
  }
  else {
  v5 = [(CNFRegRegionChooserController *)self regionList];
  }
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"RegionCell"];
  if (!v7) {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"RegionCell"];
  }
  if ([(UISearchController *)self->_searchController isActive]) {
    [(CNFRegRegionChooserController *)self filteredRegionList];
  }
  else {
  objc_super v8 = [(CNFRegRegionChooserController *)self regionList];
  }
  uint64_t v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));

  uint64_t v10 = [v9 label];
  if ([v9 isLeafNode])
  {
    v11 = [v9 regionID];
    v12 = [(CNFRegRegionChooserController *)self selectedRegionID];
    int v13 = [v11 isEqualToString:v12];

    if (v13) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }
  v15 = [v7 textLabel];
  [v15 setText:v10];

  [v7 setAccessoryType:v14];
  v16 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v16 styleUsesCustomTableStyle])
  {
    v17 = [v16 tableCellBackgroundColor];

    if (v17)
    {
      v18 = [v16 tableCellBackgroundColor];
      [v7 setBackgroundColor:v18];
    }
    v19 = [v16 tableCellTextLabelColor];

    if (v19)
    {
      objc_super v20 = [v16 tableCellTextLabelColor];
      v21 = [v7 textLabel];
      [v21 setTextColor:v20];
    }
    v22 = [v16 tableCellTextLabelBackgroundColor];

    if (v22)
    {
      objc_super v23 = [v16 tableCellTextLabelBackgroundColor];
      v24 = [v7 textLabel];
      [v24 setBackgroundColor:v23];
    }
    v25 = [v16 tableCellDetailLabelColor];

    if (v25)
    {
      v26 = [v16 tableCellDetailLabelColor];
      v27 = [v7 detailTextLabel];
      [v27 setTextColor:v26];
    }
    v28 = [v16 tableCellDetailLabelBackgroundColor];

    if (v28)
    {
      v29 = [v16 tableCellDetailLabelBackgroundColor];
      v30 = [v7 detailTextLabel];
      [v30 setBackgroundColor:v29];
    }
  }

  return v7;
}

- (void)_drillDownControllersWithArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 addObject:self];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(CNFRegRegionChooserController *)self regionList];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [(CNFRegRegionChooserController *)self selectedRegionID];
        v12 = [v10 regionWithID:v11];

        if (v12)
        {
          if (([v10 isLeafNode] & 1) == 0)
          {
            int v13 = [CNFRegRegionChooserController alloc];
            uint64_t v14 = [v10 subRegions];
            v15 = [(CNFRegRegionChooserController *)self selectedRegionID];
            v16 = [(CNFRegRegionChooserController *)v13 initWithRegionList:v14 selectedRegionID:v15];

            [(CNFRegRegionChooserController *)v16 setDelegate:self];
            v17 = [(CNFRegRegionChooserController *)self parentController];
            [(CNFRegRegionChooserController *)v16 setParentController:v17];

            v18 = [(CNFRegRegionChooserController *)self rootController];
            [(CNFRegRegionChooserController *)v16 setRootController:v18];

            v19 = [(CNFRegRegionChooserController *)self specifier];
            [(CNFRegRegionChooserController *)v16 setSpecifier:v19];

            [(CNFRegRegionChooserController *)v16 _drillDownControllersWithArray:v4];
          }
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)drillDownControllerList
{
  v3 = [MEMORY[0x263EFF980] array];
  [(CNFRegRegionChooserController *)self _drillDownControllersWithArray:v3];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)_selectRegionList:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    if ([v4 count])
    {
      v5 = [CNFRegRegionChooserController alloc];
      uint64_t v6 = [(CNFRegRegionChooserController *)self selectedRegionID];
      uint64_t v7 = [(CNFRegRegionChooserController *)v5 initWithRegionList:v11 selectedRegionID:v6];

      [(CNFRegRegionChooserController *)v7 setDelegate:self];
      uint64_t v8 = [(CNFRegRegionChooserController *)self parentController];
      [(CNFRegRegionChooserController *)v7 setParentController:v8];

      uint64_t v9 = [(CNFRegRegionChooserController *)self rootController];
      [(CNFRegRegionChooserController *)v7 setRootController:v9];

      uint64_t v10 = [(CNFRegRegionChooserController *)self specifier];
      [(CNFRegRegionChooserController *)v7 setSpecifier:v10];

      [(CNFRegRegionChooserController *)self showController:v7];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_selectRegionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    if ([v4 length])
    {
      [(CNFRegRegionChooserController *)self setSelectedRegionID:v10];
      uint64_t v5 = [(CNFRegRegionChooserController *)self delegate];
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        uint64_t v7 = [(CNFRegRegionChooserController *)self delegate];
        char v8 = objc_opt_respondsToSelector();

        if (v8)
        {
          uint64_t v9 = [(CNFRegRegionChooserController *)self delegate];
          [v9 regionChooser:self selectedRegionID:v10];
        }
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  searchController = self->_searchController;
  id v6 = a4;
  if ([(UISearchController *)searchController isActive]) {
    [(CNFRegRegionChooserController *)self filteredRegionList];
  }
  else {
  uint64_t v7 = [(CNFRegRegionChooserController *)self regionList];
  }
  uint64_t v8 = [v6 row];

  id v10 = [v7 objectAtIndex:v8];

  if ([v10 isLeafNode])
  {
    uint64_t v9 = [v10 regionID];
    [(CNFRegRegionChooserController *)self _selectRegionID:v9];
  }
  else
  {
    uint64_t v9 = [v10 subRegions];
    [(CNFRegRegionChooserController *)self _selectRegionList:v9];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 searchBar];
  id v6 = [v5 text];

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [(CNFRegRegionChooserController *)self regionList];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v11++) search:v6 withResults:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }

  [v7 sortUsingComparator:&__block_literal_global_13];
  v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    long long v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEBUG, "Search results for {%@} : %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v14 = v6;
    id v15 = v7;
    IMLogString();
  }
  -[CNFRegRegionChooserController setFilteredRegionList:](self, "setFilteredRegionList:", v7, v14, v15);
  int v13 = [(CNFRegRegionChooserController *)self tableView];
  [v13 reloadData];
}

uint64_t __72__CNFRegRegionChooserController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 label];
  id v6 = [v4 label];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)_hideTableViewCells
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CNFRegRegionChooserController *)self tableView];
  v3 = [v2 visibleCells];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setAlpha:0.0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_showTableViewCells
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CNFRegRegionChooserController *)self tableView];
  v3 = [v2 visibleCells];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setAlpha:1.0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v23 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v23 styleUsesCustomTableStyle])
  {
    uint64_t v4 = [v23 tableBackgroundColor];

    if (v4)
    {
      uint64_t v5 = [v23 tableBackgroundColor];
      uint64_t v6 = [(CNFRegRegionChooserController *)self tableView];
      [v6 setBackgroundColor:v5];

      uint64_t v7 = [(CNFRegRegionChooserController *)self tableView];
      [v7 setBackgroundView:0];
    }
    if ([v23 styleUsesCustomSearchResultsStyle])
    {
      long long v8 = [(CNFRegRegionChooserController *)self tableView];
      [v8 _setDrawsTopShadowInGroupedSections:0];

      uint64_t v9 = [v23 searchResultsTableSeparatorStyle];
      long long v10 = [(CNFRegRegionChooserController *)self tableView];
      [v10 setSeparatorStyle:v9];

      long long v11 = [v23 searchResultsTableSeparatorColor];

      if (v11)
      {
        v12 = [v23 searchResultsTableSeparatorColor];
        uint64_t v13 = [(CNFRegRegionChooserController *)self tableView];
        [v13 setSeparatorColor:v12];
      }
      uint64_t v14 = [v23 searchResultsTableSeparatorTopShadowColor];

      if (v14)
      {
        id v15 = [v23 searchResultsTableSeparatorTopShadowColor];
        long long v16 = [(CNFRegRegionChooserController *)self tableView];
        [v16 setSeparatorTopShadowColor:v15];
      }
      long long v17 = [v23 searchResultsTableSeparatorBottomShadowColor];

      if (v17)
      {
        long long v18 = [v23 searchResultsTableSeparatorBottomShadowColor];
        long long v19 = [(CNFRegRegionChooserController *)self tableView];
        [v19 setSeparatorBottomShadowColor:v18];
      }
    }
    long long v20 = [v23 tableSectionBorderColor];

    if (v20)
    {
      long long v21 = [v23 tableSectionBorderColor];
      __int16 v22 = [(CNFRegRegionChooserController *)self tableView];
      [v22 setSectionBorderColor:v21];
    }
    [(CNFRegRegionChooserController *)self _hideTableViewCells];
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v4 styleUsesCustomTableStyle]) {
    [(CNFRegRegionChooserController *)self _showTableViewCells];
  }
}

- (void)regionChooser:(id)a3 selectedRegionID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6 && [v6 length]) {
    [(CNFRegRegionChooserController *)self _selectRegionID:v7];
  }
}

- (void)setParentController:(id)a3
{
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setRootController:(id)a3
{
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setSpecifier:(id)a3
{
  if (self->_specifier != a3) {
    objc_storeStrong((id *)&self->_specifier, a3);
  }
  MEMORY[0x270F9A758]();
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
}

- (id)readPreferenceValue:(id)a3
{
  return (id)[MEMORY[0x263F5FC20] readPreferenceValue:a3];
}

- (void)showController:(id)a3
{
}

- (void)systemSettingsSpecifiersProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)handleURL:(id)a3
{
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (NSArray)regionList
{
  return self->_regionList;
}

- (void)setRegionList:(id)a3
{
}

- (NSString)selectedRegionID
{
  return self->_selectedRegionID;
}

- (void)setSelectedRegionID:(id)a3
{
}

- (CNFRegRegionChooserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegRegionChooserDelegate *)a3;
}

- (NSArray)filteredRegionList
{
  return self->_filteredRegionList;
}

- (void)setFilteredRegionList:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong((id *)&self->_filteredRegionList, 0);
  objc_storeStrong((id *)&self->_regionList, 0);
  objc_storeStrong((id *)&self->_selectedRegionID, 0);
}

@end