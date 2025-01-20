@interface ListUserWordsController
- (BOOL)_shouldHideIndex;
- (BOOL)searchIsActive;
- (BOOL)shouldAutorotate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (NSArray)sections;
- (NSString)currentShortcut;
- (NSString)savedSearchTerm;
- (TIUserWordsManager)dictionaryController;
- (UILocalizedIndexedCollation)collation;
- (UISearchController)searchController;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_mainContentView;
- (id)mainTableView;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (unint64_t)searchNavControllerChanges;
- (void)_hideSearchBar;
- (void)_showSearchBar;
- (void)addUserWord;
- (void)dealloc;
- (void)emitNavigationEventForListUserWordsController;
- (void)inlineUserDictionaryDoneEditing;
- (void)loadView;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)reloadSections;
- (void)setCollation:(id)a3;
- (void)setCurrentShortcut:(id)a3;
- (void)setDictionaryController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setSavedSearchTerm:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchIsActive:(BOOL)a3;
- (void)setSearchNavControllerChanges:(unint64_t)a3;
- (void)setSections:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)userWordDidUpdate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation ListUserWordsController

- (id)mainTableView
{
  return [(UIView *)self->_contentView viewWithTag:1];
}

- (void)viewSafeAreaInsetsDidChange
{
  [(UIToolbar *)self->_toolbar origin];
  double v4 = v3;
  [(UIView *)self->_contentView frame];
  double v6 = v5;
  [(UIToolbar *)self->_toolbar size];
  double v8 = v6 - v7;
  objc_msgSend((id)objc_msgSend((id)-[ListUserWordsController navigationController](self, "navigationController"), "view"), "safeAreaInsets");
  -[UIToolbar setFrameOrigin:](self->_toolbar, "setFrameOrigin:", v4, v8 - v9);
  v10.receiver = self;
  v10.super_class = (Class)ListUserWordsController;
  [(ListUserWordsController *)&v10 viewSafeAreaInsetsDidChange];
}

- (id)_mainContentView
{
  id result = self->_contentView;
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    double v5 = v4;
    double v7 = v6;
    double v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, v4, v6);
    self->_contentView = v8;
    [(UIView *)v8 setAutoresizingMask:18];
    double v9 = (UITableView *)(id)objc_msgSend(objc_alloc(MEMORY[0x263F1CA40]), "initWithFrame:style:", 0, 0.0, 0.0, v5, v7);
    [(UITableView *)v9 setAutoresizingMask:18];
    [(UITableView *)v9 setCountStringInsignificantRowCount:9];
    [(UITableView *)v9 setDataSource:self];
    [(UITableView *)v9 setDelegate:self];
    [(UITableView *)v9 setEstimatedSectionHeaderHeight:0.0];
    [(UITableView *)v9 setEstimatedSectionFooterHeight:0.0];
    self->_tableView = v9;
    [(UITableView *)v9 setTag:1];
    [(UITableView *)v9 setIndexHidden:0 animated:0];
    [(UIView *)self->_contentView addSubview:v9];
    id v10 = objc_alloc(MEMORY[0x263F1CAE0]);
    self->_toolbar = (UIToolbar *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    -[UIToolbar setItems:](self->_toolbar, "setItems:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", -[ListUserWordsController editButtonItem](self, "editButtonItem"), 0));
    [(UIToolbar *)self->_toolbar setAutoresizingMask:10];
    -[UIToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v12 = v11;
    [(UITableView *)v9 frame];
    CGFloat v13 = CGRectGetMaxY(v20) - v12;
    objc_msgSend((id)objc_msgSend((id)-[ListUserWordsController navigationController](self, "navigationController"), "view"), "safeAreaInsets");
    -[UIToolbar setFrame:](self->_toolbar, "setFrame:", 0.0, v13 - v14, v5, v12);
    [(UIView *)self->_contentView addSubview:self->_toolbar];
    -[UITableView setContentInset:](v9, "setContentInset:", 0.0, 0.0, v12, 0.0);
    v15 = [SearchUserWordsController alloc];
    self->_searchResultsController = -[SearchUserWordsController initWithNavigationController:](v15, "initWithNavigationController:", [objc_loadWeak((id *)((char *)&self->super.super.super.super.isa+ (int)*MEMORY[0x263F5FE78])) navigationController]);
    v16 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:self->_searchResultsController];
    [v16 setNavigationBarHidden:1 animated:0];
    [v16 setDelegate:self];
    v17 = (UISearchController *)[objc_alloc(MEMORY[0x263F1C958]) initWithSearchResultsController:v16];
    self->_searchController = v17;
    [(UISearchController *)v17 setSearchResultsUpdater:self->_searchResultsController];
    [(UISearchController *)self->_searchController setDelegate:self];
    [(ListUserWordsController *)self setDefinesPresentationContext:1];

    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
      [(UISearchController *)self->_searchController setHidesNavigationBarDuringPresentation:0];
    }
    v18 = [(UISearchController *)self->_searchController searchBar];
    -[UISearchBar setPlaceholder:](v18, "setPlaceholder:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SEARCH_LOCAL_PLACEHOLDER", &stru_26E29DC78, @"Keyboard"));
    [(UISearchBar *)v18 setAutoresizingMask:2];
    [(UISearchBar *)v18 setAutocorrectionType:1];
    [(UISearchBar *)v18 setDelegate:self];
    objc_msgSend((id)-[ListUserWordsController navigationItem](self, "navigationItem"), "setSearchController:", self->_searchController);
    v19 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:4 target:self action:sel_addUserWord];
    objc_msgSend((id)-[ListUserWordsController navigationItem](self, "navigationItem"), "setRightBarButtonItem:", v19);

    return self->_contentView;
  }
  return result;
}

- (void)loadView
{
  double v3 = [(ListUserWordsController *)self _mainContentView];
  self->_contentView = v3;

  [(ListUserWordsController *)self setView:v3];
}

- (void)reloadSections
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  double v3 = (void *)[MEMORY[0x263F1C798] currentCollation];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "sectionTitles"), "count");
  id v5 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
  if (v4)
  {
    uint64_t v6 = v4;
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v5 addObject:v7];

      --v6;
    }
    while (v6);
  }
  double v8 = [(TIUserWordsManager *)[(ListUserWordsController *)self dictionaryController] entries];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v3, "sectionForObject:collationStringSelector:", *(void *)(*((void *)&v18 + 1) + 8 * i), sel_shortcutForSorting)), "addObject:", *(void *)(*((void *)&v18 + 1) + 8 * i));
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  if (v4)
  {
    for (uint64_t j = 0; j != v4; ++j)
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", j, objc_msgSend(v3, "sortedArrayFromArray:collationStringSelector:", objc_msgSend(v5, "objectAtIndex:", j), sel_shortcutForSorting));
  }
  [(ListUserWordsController *)self setCollation:v3];
  [(ListUserWordsController *)self setSections:v5];
  [(UITableView *)[(ListUserWordsController *)self tableView] reloadData];
  if ([(ListUserWordsController *)self currentShortcut]
    && [(NSArray *)[(ListUserWordsController *)self sections] count])
  {
    uint64_t v14 = 0;
    while (1)
    {
      id v15 = [(NSArray *)[(ListUserWordsController *)self sections] objectAtIndexedSubscript:v14];
      if ([v15 count]) {
        break;
      }
LABEL_21:
      if (++v14 >= [(NSArray *)[(ListUserWordsController *)self sections] count]) {
        goto LABEL_22;
      }
    }
    uint64_t v16 = 0;
    while ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16), "shortcut"), "isEqualToString:", -[ListUserWordsController currentShortcut](self, "currentShortcut")) & 1) == 0)
    {
      if (++v16 >= (unint64_t)[v15 count]) {
        goto LABEL_21;
      }
    }
    v17 = [(ListUserWordsController *)self tableView];
    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](v17, "scrollToRowAtIndexPath:atScrollPosition:animated:", [MEMORY[0x263F088C8] indexPathForRow:v16 inSection:v14], 1, 1);
  }
  else
  {
LABEL_22:
    if (self->_restoreEditing)
    {
      self->_restoreEditing = 0;
      [(ListUserWordsController *)self setEditing:1 animated:0];
    }
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)ListUserWordsController;
  [(ListUserWordsController *)&v7 viewDidLoad];
  -[ListUserWordsController setTitle:](self, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SHORTCUTS", &stru_26E29DC78, @"Keyboard"));
  [(ListUserWordsController *)self parentController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = (TIUserWordsManager *)objc_msgSend((id)-[ListUserWordsController parentController](self, "parentController"), "dictionaryController");
  }
  else {
    double v3 = objc_alloc_init(TIUserWordsManager);
  }
  [(ListUserWordsController *)self setDictionaryController:v3];
  [(SearchUserWordsController *)self->_searchResultsController setDictionaryController:[(ListUserWordsController *)self dictionaryController]];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = __Block_byref_object_copy_;
  v6[4] = __Block_byref_object_dispose_;
  v6[5] = self;
  uint64_t v4 = [(ListUserWordsController *)self dictionaryController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ListUserWordsController_viewDidLoad__block_invoke;
  v5[3] = &unk_264A00CE0;
  v5[4] = v6;
  self->_observerToken = [(TIUserWordsManager *)v4 addObserver:v5];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_userWordDidUpdate_, @"EditUserWordShortcutDidUpdateNotification", 0);
  if ([(ListUserWordsController *)self savedSearchTerm])
  {
    [(UISearchBar *)[(UISearchController *)self->_searchController searchBar] setText:self->savedSearchTerm];
    [(UISearchController *)self->_searchController setActive:[(ListUserWordsController *)self searchIsActive]];
    [(ListUserWordsController *)self setSavedSearchTerm:0];
  }
  [(TIUserWordsManager *)[(ListUserWordsController *)self dictionaryController] requestSync];
  _Block_object_dispose(v6, 8);
}

uint64_t __38__ListUserWordsController_viewDidLoad__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) searchIsActive];
  double v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "searchController"), "searchResultsUpdater");
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) searchController];
    return [v4 updateSearchResultsForSearchController:v5];
  }
  else
  {
    return [v3 reloadSections];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ListUserWordsController;
  [(ListUserWordsController *)&v4 viewWillAppear:a3];
  [(ListUserWordsController *)self reloadSections];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ListUserWordsController;
  [(ListUserWordsController *)&v4 viewDidAppear:a3];
  [(ListUserWordsController *)self emitNavigationEventForListUserWordsController];
}

- (void)dealloc
{
  [(TIUserWordsManager *)[(ListUserWordsController *)self dictionaryController] removeObserver:self->_observerToken];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(UITableView *)self->_tableView setDelegate:0];
  [(UITableView *)self->_tableView setDataSource:0];

  self->_searchController = 0;
  self->currentShortcut = 0;

  self->_dictionaryController = 0;
  self->_contentView = 0;

  self->_toolbar = 0;
  v3.receiver = self;
  v3.super_class = (Class)ListUserWordsController;
  [(ListUserWordsController *)&v3 dealloc];
}

- (BOOL)_shouldHideIndex
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  int64_t v4 = [(ListUserWordsController *)self numberOfSectionsInTableView:[(ListUserWordsController *)self tableView]];
  uint64_t v5 = 15;
  if (v3 == 1) {
    uint64_t v5 = 20;
  }
  return v4 < v5;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ListUserWordsController;
  -[ListUserWordsController setEditing:animated:](&v7, sel_setEditing_animated_);
  [(UITableView *)[(ListUserWordsController *)self tableView] setEditing:v5 animated:v4];
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  self->_manualEditing = 1;
  [(ListUserWordsController *)self setEditing:1 animated:1];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  self->_manualEditing = 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  if (a4 == 1)
  {
    if ([(ListUserWordsController *)self isEditing]) {
      BOOL v8 = !self->_manualEditing;
    }
    else {
      BOOL v8 = 0;
    }
    self->_restoreEditing = v8;
    [a3 deselectRowAtIndexPath:a5 animated:1];
    uint64_t v9 = objc_msgSend(-[NSArray objectAtIndex:](-[ListUserWordsController sections](self, "sections"), "objectAtIndex:", objc_msgSend(a5, "section")), "objectAtIndex:", objc_msgSend(a5, "row"));
    uint64_t v10 = [(ListUserWordsController *)self dictionaryController];
    v11[0] = v9;
    -[TIUserWordsManager addEntries:removeEntries:withCompletionHandler:](v10, "addEntries:removeEntries:withCompletionHandler:", 0, [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1], &__block_literal_global);
    self->_manualEditing = 0;
    if (!v8) {
      [(ListUserWordsController *)self setEditing:0 animated:1];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [a3 deselectRowAtIndexPath:a4 animated:1];
  uint64_t v6 = -[EditUserWordController initWithUserWord:]([EditUserWordController alloc], "initWithUserWord:", objc_msgSend(-[NSArray objectAtIndex:](-[ListUserWordsController sections](self, "sections"), "objectAtIndex:", objc_msgSend(a4, "section")), "objectAtIndex:", objc_msgSend(a4, "row")));
  [(EditUserWordController *)v6 setDictionaryController:[(ListUserWordsController *)self dictionaryController]];
  [(ListUserWordsController *)self showController:v6];
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(ListUserWordsController *)self sections];

  return [(NSArray *)v3 count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)[(ListUserWordsController *)self sections] objectAtIndex:a4];

  return [v4 count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = (id)[a3 dequeueReusableCellWithIdentifier:@"kCellIdentifier"];
  if (!v6)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"kCellIdentifier"];
    [v6 setAccessoryType:0];
  }
  objc_super v7 = objc_msgSend(-[NSArray objectAtIndex:](-[ListUserWordsController sections](self, "sections"), "objectAtIndex:", objc_msgSend(a4, "section")), "objectAtIndex:", objc_msgSend(a4, "row"));
  objc_msgSend((id)objc_msgSend(v6, "detailTextLabel"), "setText:", objc_msgSend(v7, "phrase"));
  objc_msgSend((id)objc_msgSend(v6, "textLabel"), "setText:", objc_msgSend(v7, "shortcut"));
  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id result = (id)objc_msgSend(-[NSArray objectAtIndex:](-[ListUserWordsController sections](self, "sections", a3), "objectAtIndex:", a4), "count");
  if (result)
  {
    objc_super v7 = [(UILocalizedIndexedCollation *)[(ListUserWordsController *)self collation] sectionTitles];
    return [(NSArray *)v7 objectAtIndex:a4];
  }
  return result;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(ListUserWordsController *)self _shouldHideIndex]
    || !objc_msgSend(-[NSArray objectAtIndex:](-[ListUserWordsController sections](self, "sections"), "objectAtIndex:", a4), "count"))
  {
    return 0.0;
  }

  [a3 sectionHeaderHeight];
  return result;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  if ([(ListUserWordsController *)self _shouldHideIndex]) {
    return 0;
  }
  BOOL v5 = [(ListUserWordsController *)self collation];

  return [(UILocalizedIndexedCollation *)v5 sectionIndexTitles];
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  if ([(ListUserWordsController *)self _shouldHideIndex]) {
    return 0;
  }
  NSInteger v8 = [(UILocalizedIndexedCollation *)[(ListUserWordsController *)self collation] sectionForSectionIndexTitleAtIndex:a5];
  int64_t v9 = [(NSArray *)[(ListUserWordsController *)self sections] count];
  if (v8 < 0)
  {
LABEL_8:
    int64_t v11 = v8 + 1;
    do
    {
      int64_t v7 = v11;
      if (v11 >= v9) {
        break;
      }
      uint64_t v12 = objc_msgSend(-[NSArray objectAtIndex:](-[ListUserWordsController sections](self, "sections"), "objectAtIndex:", v11), "count");
      int64_t v11 = v7 + 1;
    }
    while (!v12);
  }
  else
  {
    int64_t v7 = v8;
    while (!objc_msgSend(-[NSArray objectAtIndex:](-[ListUserWordsController sections](self, "sections"), "objectAtIndex:", v7), "count"))
    {
      if (v7-- <= 0) {
        goto LABEL_8;
      }
    }
  }
  if (v7 < v9) {
    return v7;
  }
  uint64_t v14 = [(ListUserWordsController *)self collation];

  return [(UILocalizedIndexedCollation *)v14 sectionForSectionIndexTitleAtIndex:a5];
}

- (void)userWordDidUpdate:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"shortcut");

  [(ListUserWordsController *)self setCurrentShortcut:v4];
}

- (void)addUserWord
{
  uint64_t v3 = objc_alloc_init(EditUserWordController);
  [(EditUserWordController *)v3 setDictionaryController:[(ListUserWordsController *)self dictionaryController]];
  [(ListUserWordsController *)self showController:v3];
}

- (void)inlineUserDictionaryDoneEditing
{
  int v2 = (void *)[(ListUserWordsController *)self navigationController];

  [v2 popViewControllerAnimated:1];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if ([(ListUserWordsController *)self searchNavControllerChanges])
  {
    id v8 = (id)objc_msgSend((id)objc_msgSend(a3, "viewControllers"), "firstObject");
    int64_t v9 = (void *)[a3 transitionCoordinator];
    uint64_t v10 = [(UISearchBar *)[(UISearchController *)self->_searchController searchBar] superview];
    if (v8 == a4)
    {
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      v30 = __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke;
      v31 = &unk_264A00D28;
      v32 = self;
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      v25 = __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke_2;
      v26 = &unk_264A00D28;
      v27 = self;
      int64_t v11 = &v28;
      uint64_t v12 = &v23;
    }
    else
    {
      v17 = self;
      uint64_t v18 = MEMORY[0x263EF8330];
      uint64_t v19 = 3221225472;
      long long v20 = __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke_3;
      long long v21 = &unk_264A00D28;
      v22 = self;
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      id v15 = __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke_4;
      uint64_t v16 = &unk_264A00D28;
      int64_t v11 = &v18;
      uint64_t v12 = &v13;
    }
    objc_msgSend(v9, "animateAlongsideTransitionInView:animation:completion:", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32);
    [a3 setNavigationBarHidden:v8 == a4 animated:1];
  }
  [(ListUserWordsController *)self setSearchNavControllerChanges:[(ListUserWordsController *)self searchNavControllerChanges] + 1];
}

uint64_t __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showSearchBar];
}

uint64_t __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 _hideSearchBar];
  }
  return result;
}

uint64_t __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideSearchBar];
}

uint64_t __80__ListUserWordsController_navigationController_willShowViewController_animated___block_invoke_4(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 1160) searchBar];

  return [v1 setHidden:1];
}

- (void)willPresentSearchController:(id)a3
{
  [(ListUserWordsController *)self setSearchNavControllerChanges:0];

  [(ListUserWordsController *)self setSearchIsActive:1];
}

- (void)willDismissSearchController:(id)a3
{
}

- (void)_hideSearchBar
{
  [(UISearchBar *)[(UISearchController *)self->_searchController searchBar] frame];
  -[UISearchBar setFrame:]([(UISearchController *)self->_searchController searchBar], "setFrame:", v5.origin.x - CGRectGetWidth(v5), v5.origin.y, v5.size.width, v5.size.height);
  uint64_t v3 = [(UISearchController *)self->_searchController searchBar];

  [(UISearchBar *)v3 resignFirstResponder];
}

- (void)_showSearchBar
{
  [(UISearchBar *)[(UISearchController *)self->_searchController searchBar] frame];
  double y = v8.origin.y;
  double width = v8.size.width;
  double height = v8.size.height;
  CGFloat v6 = CGRectGetWidth(v8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__ListUserWordsController__showSearchBar__block_invoke;
  v7[3] = &unk_264A00D50;
  v7[4] = self;
  *(double *)&v7[5] = -v6;
  *(double *)&v7[6] = y;
  *(double *)&v7[7] = width;
  *(double *)&v7[8] = height;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v7];
  -[UISearchBar setFrame:]([(UISearchController *)self->_searchController searchBar], "setFrame:", 0.0, y, width, height);
  [(UISearchBar *)[(UISearchController *)self->_searchController searchBar] becomeFirstResponder];
}

uint64_t __41__ListUserWordsController__showSearchBar__block_invoke(double *a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*((void *)a1 + 4) + 1160), "searchBar"), "setHidden:", 0);
  double v2 = a1[5];
  double v3 = a1[6];
  double v4 = a1[7];
  double v5 = a1[8];
  CGFloat v6 = (void *)[*(id *)(*((void *)a1 + 4) + 1160) searchBar];

  return objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);
}

- (void)emitNavigationEventForListUserWordsController
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/Keyboard/USER_DICTIONARY"];
  id v4 = +[KeyboardController localizedStringForGeneralKeyboardSpecifier];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v6 = [MEMORY[0x263EFF960] currentLocale];
  v7[0] = v4;
  -[ListUserWordsController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", @"com.apple.graphic-icon.keyboard", objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", @"SHORTCUTS", @"Keyboard", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "bundleURL")), objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v7, 2), v3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (TIUserWordsManager)dictionaryController
{
  return self->_dictionaryController;
}

- (void)setDictionaryController:(id)a3
{
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (void)setCollation:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSString)savedSearchTerm
{
  return self->savedSearchTerm;
}

- (void)setSavedSearchTerm:(id)a3
{
}

- (BOOL)searchIsActive
{
  return self->searchIsActive;
}

- (void)setSearchIsActive:(BOOL)a3
{
  self->searchIsActive = a3;
}

- (NSString)currentShortcut
{
  return self->currentShortcut;
}

- (void)setCurrentShortcut:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (unint64_t)searchNavControllerChanges
{
  return self->_searchNavControllerChanges;
}

- (void)setSearchNavControllerChanges:(unint64_t)a3
{
  self->_searchNavControllerChanges = a3;
}

@end