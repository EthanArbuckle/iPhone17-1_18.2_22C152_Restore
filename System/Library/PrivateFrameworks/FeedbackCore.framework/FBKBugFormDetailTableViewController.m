@interface FBKBugFormDetailTableViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (FBKAnswer)answer;
- (FBKBugFormEditorDelegate)delegate;
- (FBKQuestion)question;
- (NSArray)searchResultChoices;
- (NSArray)visibleChoices;
- (NSSet)checkboxAnswersAtStart;
- (UISearchController)searchController;
- (id)getPathToScrollTo;
- (id)keyCommands;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)beginSearch;
- (void)commitSelection;
- (void)dealloc;
- (void)didGetClientSideResolvedNotification:(id)a3;
- (void)recordCheckboxAnswers;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)selectNext;
- (void)selectPrevious;
- (void)setAnswer:(id)a3;
- (void)setCheckboxAnswersAtStart:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQuestion:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultChoices:(id)a3;
- (void)setVisibleChoices:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCheckboxDelegateIfNeeded;
- (void)updateChoices;
- (void)updateSearchBar;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FBKBugFormDetailTableViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)FBKBugFormDetailTableViewController;
  [(FBKBugFormDetailTableViewController *)&v12 viewDidLoad];
  v3 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v3 setEstimatedSectionHeaderHeight:44.0];

  double v4 = *MEMORY[0x263F839B8];
  v5 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v5 setSectionHeaderHeight:v4];

  v6 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v6 setEstimatedRowHeight:44.0];

  v7 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v7 setRowHeight:v4];

  v8 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v8 setEstimatedSectionFooterHeight:0.0];

  v9 = [MEMORY[0x263F825C8] secondarySystemGroupedBackgroundColor];
  v10 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v10 setBackgroundColor:v9];

  v11 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v11 _setHeaderAndFooterViewsFloat:0];

  [(FBKBugFormDetailTableViewController *)self updateSearchBar];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormDetailTableViewController;
  [(FBKBugFormDetailTableViewController *)&v6 viewWillAppear:a3];
  [(FBKBugFormDetailTableViewController *)self recordCheckboxAnswers];
  if (self->_answer)
  {
    double v4 = [(FBKBugFormDetailTableViewController *)self getPathToScrollTo];
    if (v4)
    {
      v5 = [(FBKBugFormDetailTableViewController *)self tableView];
      [v5 scrollToRowAtIndexPath:v4 atScrollPosition:2 animated:0];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBKBugFormDetailTableViewController;
  [(FBKBugFormDetailTableViewController *)&v4 viewDidAppear:a3];
  [(FBKBugFormDetailTableViewController *)self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBKBugFormDetailTableViewController;
  [(FBKBugFormDetailTableViewController *)&v6 viewWillDisappear:a3];
  [(FBKBugFormDetailTableViewController *)self updateCheckboxDelegateIfNeeded];
  objc_super v4 = [(FBKBugFormDetailTableViewController *)self delegate];
  v5 = [(FBKBugFormDetailTableViewController *)self question];
  [v4 editorDidDismissForQuestion:v5];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"FBKClientSideResolvedChoicesDidChange" object:0];

  v4.receiver = self;
  v4.super_class = (Class)FBKBugFormDetailTableViewController;
  [(FBKBugFormDetailTableViewController *)&v4 dealloc];
}

- (void)setQuestion:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_question, a3);
  v5 = [v8 choiceSetResolver];

  objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
  v7 = v6;
  if (v5) {
    [v6 addObserver:self selector:sel_didGetClientSideResolvedNotification_ name:@"FBKClientSideResolvedChoicesDidChange" object:0];
  }
  else {
    [v6 removeObserver:self name:@"FBKClientSideResolvedChoicesDidChange" object:0];
  }

  [(FBKBugFormDetailTableViewController *)self updateChoices];
}

- (void)updateChoices
{
  v3 = [(FBKBugFormDetailTableViewController *)self question];
  objc_super v4 = [v3 visibleChoices];
  [(FBKBugFormDetailTableViewController *)self setVisibleChoices:v4];

  v5 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
  [(FBKBugFormDetailTableViewController *)self setSearchResultChoices:v5];

  [(FBKBugFormDetailTableViewController *)self updateSearchBar];
  id v6 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v6 reloadData];
}

- (void)updateSearchBar
{
  id v22 = (id)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"Choice"];
  [v22 frame];
  double v4 = v3;
  v5 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
  unint64_t v6 = [v5 count];

  v7 = [(FBKBugFormDetailTableViewController *)self question];
  if ([v7 answerType] != 2) {
    goto LABEL_6;
  }
  double v8 = v4 * (double)v6;
  v9 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v9 frame];
  if (v8 <= v10)
  {

LABEL_6:
    goto LABEL_7;
  }
  searchController = self->_searchController;

  if (!searchController)
  {
    objc_super v12 = (UISearchController *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
    v13 = self->_searchController;
    self->_searchController = v12;

    v14 = [(FBKBugFormDetailTableViewController *)self searchController];
    [v14 setSearchResultsUpdater:self];

    v15 = self->_searchController;
    v16 = [(FBKBugFormDetailTableViewController *)self navigationItem];
    [v16 setSearchController:v15];

    v17 = [(FBKBugFormDetailTableViewController *)self searchController];
    [v17 setDelegate:self];

    v18 = [(FBKBugFormDetailTableViewController *)self searchController];
    [v18 setObscuresBackgroundDuringPresentation:0];

    v19 = [(FBKBugFormDetailTableViewController *)self searchController];
    v20 = [v19 searchBar];
    [v20 setDelegate:self];

    v21 = [(FBKBugFormDetailTableViewController *)self searchController];
    [v21 setHidesNavigationBarDuringPresentation:0];

    [(FBKBugFormDetailTableViewController *)self setDefinesPresentationContext:1];
  }
LABEL_7:
}

- (void)updateCheckboxDelegateIfNeeded
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v3 = [(FBKBugFormDetailTableViewController *)self question];
  uint64_t v4 = [v3 answerType];

  if (v4 == 4)
  {
    v5 = [(FBKBugFormDetailTableViewController *)self checkboxAnswersAtStart];
    unint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v7 = [(FBKBugFormDetailTableViewController *)self answer];
    double v8 = [v7 values];
    v9 = [v6 setWithArray:v8];
    char v10 = [v5 isEqualToSet:v9];

    if ((v10 & 1) == 0)
    {
      v11 = +[FBKLog appHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_super v12 = [(FBKBugFormDetailTableViewController *)self question];
        v13 = [v12 role];
        int v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_INFO, "Checkbox answers changed for question [%{public}@]", (uint8_t *)&v16, 0xCu);
      }
      v14 = [(FBKBugFormDetailTableViewController *)self delegate];
      v15 = [(FBKBugFormDetailTableViewController *)self question];
      [v14 answerDidChangeForQuestion:v15];
    }
  }
}

- (void)recordCheckboxAnswers
{
  double v3 = [(FBKBugFormDetailTableViewController *)self question];
  uint64_t v4 = [v3 answerType];

  if (v4 == 4)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    id v8 = [(FBKBugFormDetailTableViewController *)self answer];
    unint64_t v6 = [v8 values];
    v7 = [v5 setWithArray:v6];
    [(FBKBugFormDetailTableViewController *)self setCheckboxAnswersAtStart:v7];
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(FBKBugFormDetailTableViewController *)self tableView];
  id v8 = [v7 dequeueReusableCellWithIdentifier:@"FBKDetailTableViewHeaderCell"];

  v9 = [v8 contentView];
  char v10 = [v9 backgroundColor];
  [v8 setBackgroundColor:v10];

  v11 = [MEMORY[0x263F825C8] labelColor];
  objc_super v12 = [v8 textLabel];
  [v12 setTextColor:v11];

  v13 = [(FBKBugFormDetailTableViewController *)self tableView:v6 titleForHeaderInSection:a4];

  v14 = [v8 textLabel];
  [v14 setText:v13];

  v15 = [(FBKBugFormDetailTableViewController *)self question];
  uint64_t v16 = [v15 answerType];
  if (v16 == 4)
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v14 localizedStringForKey:@"CHECKBOX_FOOTER_TITLE" value:&stru_26DDF6A30 table:0];
  }
  else
  {
    v17 = 0;
  }
  uint64_t v18 = [v8 detailTextLabel];
  [v18 setText:v17];

  if (v16 == 4)
  {
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(FBKBugFormDetailTableViewController *)self searchController];
  int v6 = [v5 isActive];

  if (v6)
  {
    v7 = [(FBKBugFormDetailTableViewController *)self searchResultChoices];
    if (v7)
    {
      id v8 = [(FBKBugFormDetailTableViewController *)self searchResultChoices];
      int64_t v9 = [v8 count];
    }
    else
    {
      int64_t v9 = 0;
    }
  }
  else
  {
    v7 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
    int64_t v9 = [v7 count];
  }

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4 = [(FBKBugFormDetailTableViewController *)self question];
  v5 = [v4 text];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"Choice" forIndexPath:v6];
  if (!v7) {
    v7 = [[FBKChoiceCell alloc] initWithStyle:0 reuseIdentifier:@"Choice"];
  }
  id v8 = [(FBKBugFormDetailTableViewController *)self searchController];
  if ([v8 isActive]) {
    [(FBKBugFormDetailTableViewController *)self searchResultChoices];
  }
  else {
  int64_t v9 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
  }
  char v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));

  [(FBKChoiceCell *)v7 updateWithChoice:v10];
  v11 = [(FBKBugFormDetailTableViewController *)self question];
  uint64_t v12 = [v11 answerType];

  if ((unint64_t)(v12 - 2) < 2)
  {
    v13 = [(FBKBugFormDetailTableViewController *)self answer];
    v14 = [v13 value];
    [(FBKChoiceCell *)v7 evaluateSelectionWithValue:v14];
LABEL_13:

    goto LABEL_14;
  }
  if (v12 == 4)
  {
    v13 = [(FBKBugFormDetailTableViewController *)self answer];
    v14 = [v13 values];
    [(FBKChoiceCell *)v7 evaluateSelectionWithValues:v14];
    goto LABEL_13;
  }
  if (v12 != 11) {
    goto LABEL_15;
  }
  v13 = +[FBKLog appHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[FBKBugFormDetailTableViewController tableView:cellForRowAtIndexPath:](v13);
  }
LABEL_14:

LABEL_15:

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v4 = [a3 searchBar];
  id v14 = [v4 text];

  if ([v14 length])
  {
    v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v6 = [v14 stringByTrimmingCharactersInSet:v5];

    v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"title CONTAINS[cd] %@", v6];
    id v8 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
    int64_t v9 = [v8 filteredArrayUsingPredicate:v7];
    char v10 = (NSArray *)[v9 mutableCopy];
    searchResultChoices = self->_searchResultChoices;
    self->_searchResultChoices = v10;
  }
  else
  {
    uint64_t v12 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
    id v6 = self->_searchResultChoices;
    self->_searchResultChoices = v12;
  }

  v13 = [(FBKBugFormDetailTableViewController *)self tableView];
  [v13 reloadData];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  uint64_t v4 = [(FBKBugFormDetailTableViewController *)self tableView];
  id v6 = [v4 indexPathForSelectedRow];

  if (v6)
  {
    v5 = [(FBKBugFormDetailTableViewController *)self tableView];
    [v5 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7 = a3;
  int v8 = [a5 isEqualToString:@"\t"];
  if (v8)
  {
    [v7 endEditing:1];
    [(FBKBugFormDetailTableViewController *)self becomeFirstResponder];
    [(FBKBugFormDetailTableViewController *)self selectNext];
  }

  return v8 ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  int v8 = [(FBKBugFormDetailTableViewController *)self searchController];
  if ([v8 isActive]) {
    [(FBKBugFormDetailTableViewController *)self searchResultChoices];
  }
  else {
  int64_t v9 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
  }
  char v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));

  v11 = [(FBKBugFormDetailTableViewController *)self question];
  uint64_t v12 = [v11 answerType];

  if ((unint64_t)(v12 - 2) < 2)
  {
    v13 = [v6 visibleCells];
    [v13 enumerateObjectsUsingBlock:&__block_literal_global];

    id v14 = [(FBKBugFormDetailTableViewController *)self answer];
    v15 = [v10 value];
    [v14 setValue:v15];

    uint64_t v16 = [v6 cellForRowAtIndexPath:v7];
    v17 = [(FBKBugFormDetailTableViewController *)self answer];
    uint64_t v18 = [v17 value];
    [v16 evaluateSelectionWithValue:v18];

    v19 = [(FBKBugFormDetailTableViewController *)self delegate];
    v20 = [(FBKBugFormDetailTableViewController *)self question];
    [v19 answerDidChangeForQuestion:v20];

    v21 = [(FBKBugFormDetailTableViewController *)self searchController];
    LODWORD(v20) = [v21 isActive];

    if (v20) {
      [(FBKBugFormDetailTableViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
    [(FBKBugFormDetailTableViewController *)self dismissViewControllerAnimated:1 completion:0];
    goto LABEL_13;
  }
  if (v12 == 4)
  {
    id v22 = [(FBKAnswer *)self->_answer values];
    v23 = [v10 value];
    int v24 = [v22 containsObject:v23];

    v25 = [(FBKAnswer *)self->_answer values];
    if (v24)
    {
      v26 = (void *)MEMORY[0x263F08A98];
      v27 = [v10 value];
      v28 = [v26 predicateWithFormat:@"SELF != %@", v27];
      v29 = [v25 filteredArrayUsingPredicate:v28];
      [(FBKAnswer *)self->_answer setValues:v29];
    }
    else
    {
      v27 = [v10 value];
      v28 = [v25 arrayByAddingObject:v27];
      [(FBKAnswer *)self->_answer setValues:v28];
    }

    uint64_t v16 = [v6 visibleCells];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __73__FBKBugFormDetailTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v30[3] = &unk_264873DB0;
    v30[4] = self;
    [v16 enumerateObjectsUsingBlock:v30];
LABEL_13:
  }
}

uint64_t __73__FBKBugFormDetailTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessoryType:0];
}

void __73__FBKBugFormDetailTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 answer];
  uint64_t v4 = [v5 values];
  [v3 evaluateSelectionWithValues:v4];
}

- (void)didGetClientSideResolvedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 object];
  id v5 = [(FBKBugFormDetailTableViewController *)self question];
  id v6 = [v5 choiceSetResolver];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    int v8 = +[FBKLog appHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int64_t v9 = [(FBKBugFormDetailTableViewController *)self question];
      char v10 = [v9 allChoices];
      v11[0] = 67109120;
      v11[1] = [v10 count];
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "updating choice set with [%i] choices", (uint8_t *)v11, 8u);
    }
    [(FBKBugFormDetailTableViewController *)self updateChoices];
  }
}

- (id)getPathToScrollTo
{
  id v3 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
  uint64_t v4 = (void *)MEMORY[0x263F08A98];
  id v5 = [(FBKAnswer *)self->_answer value];
  id v6 = [v4 predicateWithFormat:@"value ==[c] %@", v5];
  int v7 = [v3 filteredArrayUsingPredicate:v6];

  if ([v7 count])
  {
    int v8 = [(FBKBugFormDetailTableViewController *)self visibleChoices];
    int64_t v9 = [v7 firstObject];
    uint64_t v10 = [v8 indexOfObject:v9];

    v11 = [MEMORY[0x263F088C8] indexPathForRow:v10 inSection:0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)beginSearch
{
  id v3 = [(FBKBugFormDetailTableViewController *)self searchController];

  if (v3)
  {
    id v5 = [(FBKBugFormDetailTableViewController *)self searchController];
    uint64_t v4 = [v5 searchBar];
    [v4 becomeFirstResponder];
  }
}

- (void)selectNext
{
  id v3 = [(FBKBugFormDetailTableViewController *)self tableView];
  id v12 = [v3 indexPathForSelectedRow];

  uint64_t v4 = [(FBKBugFormDetailTableViewController *)self tableView];
  uint64_t v5 = [v4 numberOfRowsInSection:0];

  uint64_t v6 = [v12 row];
  if (v12 || v5 < 1)
  {
    uint64_t v10 = v6 + 1;
    if (v6 + 1 >= v5) {
      goto LABEL_7;
    }
    int v7 = [(FBKBugFormDetailTableViewController *)self tableView];
    int v8 = (void *)MEMORY[0x263F088C8];
    uint64_t v9 = v10;
  }
  else
  {
    int v7 = [(FBKBugFormDetailTableViewController *)self tableView];
    int v8 = (void *)MEMORY[0x263F088C8];
    uint64_t v9 = 0;
  }
  v11 = [v8 indexPathForRow:v9 inSection:0];
  [v7 selectRowAtIndexPath:v11 animated:1 scrollPosition:2];

LABEL_7:
}

- (void)selectPrevious
{
  id v3 = [(FBKBugFormDetailTableViewController *)self tableView];
  id v11 = [v3 indexPathForSelectedRow];

  uint64_t v4 = [(FBKBugFormDetailTableViewController *)self tableView];
  uint64_t v5 = [v4 numberOfRowsInSection:0];

  uint64_t v6 = [v11 row];
  if (!v11 && (v7 = v5 < 1, uint64_t v8 = v5 - 1, !v7) || (uint64_t v8 = v6 - 1, v6 >= 1))
  {
    uint64_t v9 = [(FBKBugFormDetailTableViewController *)self tableView];
    uint64_t v10 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:0];
    [v9 selectRowAtIndexPath:v10 animated:1 scrollPosition:2];
  }
}

- (void)commitSelection
{
  id v3 = [(FBKBugFormDetailTableViewController *)self tableView];
  id v5 = [v3 indexPathForSelectedRow];

  if (v5)
  {
    uint64_t v4 = [(FBKBugFormDetailTableViewController *)self tableView];
    [(FBKBugFormDetailTableViewController *)self tableView:v4 didSelectRowAtIndexPath:v5];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F82890] keyCommandWithInput:@"f" modifierFlags:0x100000 action:sel_beginSearch];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SEARCH" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [v2 setDiscoverabilityTitle:v4];

  id v5 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83770] modifierFlags:0 action:sel_selectPrevious];
  uint64_t v6 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83750] modifierFlags:0 action:sel_selectNext];
  BOOL v7 = [MEMORY[0x263F82890] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_commitSelection];
  v10[0] = v2;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];

  return v8;
}

- (FBKBugFormEditorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBKBugFormEditorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBKQuestion)question
{
  return self->_question;
}

- (FBKAnswer)answer
{
  return self->_answer;
}

- (void)setAnswer:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (NSArray)visibleChoices
{
  return self->_visibleChoices;
}

- (void)setVisibleChoices:(id)a3
{
}

- (NSArray)searchResultChoices
{
  return self->_searchResultChoices;
}

- (void)setSearchResultChoices:(id)a3
{
}

- (NSSet)checkboxAnswersAtStart
{
  return self->_checkboxAnswersAtStart;
}

- (void)setCheckboxAnswersAtStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkboxAnswersAtStart, 0);
  objc_storeStrong((id *)&self->_searchResultChoices, 0);
  objc_storeStrong((id *)&self->_visibleChoices, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_answer, 0);
  objc_storeStrong((id *)&self->_question, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)tableView:(os_log_t)log cellForRowAtIndexPath:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[FBKBugFormDetailTableViewController tableView:cellForRowAtIndexPath:]";
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "TODO handle Modal in %s", (uint8_t *)&v1, 0xCu);
}

@end