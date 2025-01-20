@interface DSTableWelcomeController
- (BOOL)isFiltering;
- (BOOL)isKeyboardActive;
- (BOOL)isModelEmpty;
- (BOOL)isSearchBarEmpty;
- (BOOL)isShowingNoResultsView;
- (BOOL)isShowingNoSharingView;
- (BOOL)isSpinnerActive;
- (BOOL)shouldShowSearchBar;
- (DSTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6 shouldShowSearchBar:(BOOL)a7;
- (OBBoldTrayButton)boldButton;
- (OBLinkTrayButton)linkButton;
- (UIActivityIndicatorView)spinner;
- (UIBarButtonItem)quickExitButton;
- (UISearchController)searchController;
- (UITapGestureRecognizer)tapGesture;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addBorderedIcon:(id)a3;
- (void)hideButtonsIfSearching;
- (void)hideKeyboard;
- (void)hideNoResultsView;
- (void)hideNoSharingView;
- (void)presentErrorAlertController:(id)a3;
- (void)presentErrorAlertController:(id)a3 okHandler:(id)a4;
- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 continueHandler:(id)a5 tryAgainHandler:(id)a6;
- (void)setBoldButton:(id)a3;
- (void)setIsFiltering:(BOOL)a3;
- (void)setIsModelEmpty:(BOOL)a3;
- (void)setIsShowingNoResultsView:(BOOL)a3;
- (void)setIsShowingNoSharingView:(BOOL)a3;
- (void)setIsSpinnerActive:(BOOL)a3;
- (void)setLinkButton:(id)a3;
- (void)setQuickExitButton:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setShouldShowSearchBar:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setupSearchBar;
- (void)setupTableView;
- (void)showNoResultsViewWithSearchText:(id)a3;
- (void)showNoSharingViewWithText:(id)a3 image:(id)a4;
- (void)startContentSpinner;
- (void)stopContentSpinner;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation DSTableWelcomeController

- (DSTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6 shouldShowSearchBar:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)DSTableWelcomeController;
  v8 = [(OBTableWelcomeController *)&v13 initWithTitle:a3 detailText:a4 icon:a5 adoptTableViewScrollView:a6];
  v9 = v8;
  if (v8)
  {
    v8->_shouldShowSearchBar = a7;
    [(DSTableWelcomeController *)v8 setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:0];
  }
  uint64_t v10 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinner = v9->_spinner;
  v9->_spinner = (UIActivityIndicatorView *)v10;

  v9->_isSpinnerActive = 0;
  return v9;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DSTableWelcomeController;
  [(OBTableWelcomeController *)&v5 viewDidLoad];
  if ([(DSTableWelcomeController *)self shouldShowSearchBar]) {
    [(DSTableWelcomeController *)self setupSearchBar];
  }
  [(DSTableWelcomeController *)self setupTableView];
  v3 = [(OBTableWelcomeController *)self tableView];
  [v3 setEditing:1];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"header"];
}

- (void)setupTableView
{
  v3 = objc_alloc_init(DSTableView);
  [(OBTableWelcomeController *)self setTableView:v3];

  v4 = [(OBTableWelcomeController *)self tableView];
  [v4 setDelegate:self];

  id v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setDataSource:self];
}

- (void)setupSearchBar
{
  v3 = (UISearchController *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
  searchController = self->_searchController;
  self->_searchController = v3;

  id v5 = [(DSTableWelcomeController *)self searchController];
  [v5 setSearchResultsUpdater:self];

  v6 = [(DSTableWelcomeController *)self searchController];
  [v6 setObscuresBackgroundDuringPresentation:0];

  v7 = [(DSTableWelcomeController *)self searchController];
  v8 = [v7 searchBar];
  [v8 setPlaceholder:&stru_26E9097D0];

  [(DSTableWelcomeController *)self setDefinesPresentationContext:1];
  v9 = [(DSTableWelcomeController *)self searchController];
  [v9 setDelegate:self];

  uint64_t v10 = [(DSTableWelcomeController *)self searchController];
  v11 = [v10 searchBar];
  [v11 setShowsScopeBar:1];

  v12 = [(DSTableWelcomeController *)self searchController];
  objc_super v13 = [v12 searchBar];
  [v13 setDelegate:self];

  v14 = [(DSTableWelcomeController *)self searchController];
  v15 = [(OBBaseWelcomeController *)self navigationItem];
  [v15 setSearchController:v14];

  id v16 = [(OBBaseWelcomeController *)self navigationItem];
  [v16 setHidesSearchBarWhenScrolling:0];
}

- (BOOL)isSearchBarEmpty
{
  v2 = [(DSTableWelcomeController *)self searchController];
  v3 = [v2 searchBar];
  v4 = [v3 text];
  BOOL v5 = [v4 length] == 0;

  return v5;
}

- (BOOL)isFiltering
{
  if ([(DSTableWelcomeController *)self isSearchBarEmpty]) {
    return 0;
  }
  v4 = [(DSTableWelcomeController *)self searchController];
  char v5 = [v4 isActive];

  return v5;
}

- (BOOL)isKeyboardActive
{
  v2 = [(DSTableWelcomeController *)self searchController];
  v3 = [v2 searchBar];
  v4 = [v3 searchTextField];
  char v5 = [v4 isFirstResponder];

  return v5;
}

- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 continueHandler:(id)a5 tryAgainHandler:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x263F82418];
  id v11 = a6;
  id v12 = a5;
  id v19 = [v10 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  objc_super v13 = (void *)MEMORY[0x263F82400];
  v14 = DSUILocStringForKey(@"CONTINUE");
  v15 = [v13 actionWithTitle:v14 style:0 handler:v12];

  id v16 = (void *)MEMORY[0x263F82400];
  v17 = DSUILocStringForKey(@"TRY_AGAIN");
  v18 = [v16 actionWithTitle:v17 style:0 handler:v11];

  [v19 addAction:v15];
  [v19 addAction:v18];
  [(DSTableWelcomeController *)self presentViewController:v19 animated:1 completion:0];
}

- (void)presentErrorAlertController:(id)a3
{
}

- (void)presentErrorAlertController:(id)a3 okHandler:(id)a4
{
  v6 = (void *)MEMORY[0x263F82400];
  id v7 = a4;
  id v8 = a3;
  v9 = DSUILocStringForKey(@"OK");
  id v10 = [v6 actionWithTitle:v9 style:0 handler:v7];

  [v8 addAction:v10];
  [(DSTableWelcomeController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)hideKeyboard
{
  v3 = [(DSTableWelcomeController *)self searchController];
  v4 = [v3 searchBar];
  char v5 = [v4 searchTextField];
  [v5 resignFirstResponder];

  v6 = [(DSTableWelcomeController *)self boldButton];
  [v6 setHidden:0];

  id v7 = [(DSTableWelcomeController *)self linkButton];
  objc_msgSend(v7, "setHidden:", -[DSTableWelcomeController isModelEmpty](self, "isModelEmpty"));
}

- (void)willPresentSearchController:(id)a3
{
  v4 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_hideKeyboard];
  tapGesture = self->_tapGesture;
  self->_tapGesture = v4;

  v6 = [(DSTableWelcomeController *)self tapGesture];
  [v6 setCancelsTouchesInView:0];

  id v8 = [(DSTableWelcomeController *)self view];
  id v7 = [(DSTableWelcomeController *)self tapGesture];
  [v8 addGestureRecognizer:v7];
}

- (void)willDismissSearchController:(id)a3
{
  id v5 = [(OBTableWelcomeController *)self tableView];
  v4 = [(DSTableWelcomeController *)self tapGesture];
  [v5 removeGestureRecognizer:v4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"DSCell", a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4) {
    id v4 = objc_alloc_init(MEMORY[0x263F82C80]);
  }
  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v5 = 0;
  }
  else
  {
    if ([(DSTableWelcomeController *)self isSpinnerActive])
    {
      id v5 = [(DSTableWelcomeController *)self spinner];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 3;
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v7 = [(OBTableWelcomeController *)self tableView];
  v6 = [v7 cellForRowAtIndexPath:v5];

  [v6 setHighlighted:0];
}

- (void)startContentSpinner
{
  v3 = [(DSTableWelcomeController *)self spinner];
  [v3 startAnimating];

  uint64_t v4 = [(DSTableWelcomeController *)self spinner];
  [v4 setHidesWhenStopped:1];

  [(DSTableWelcomeController *)self setIsSpinnerActive:1];
  id v5 = [(OBTableWelcomeController *)self tableView];
  [v5 reloadData];
}

- (void)stopContentSpinner
{
  v3 = [(DSTableWelcomeController *)self spinner];
  [v3 stopAnimating];

  [(DSTableWelcomeController *)self setIsSpinnerActive:0];
  id v4 = [(OBTableWelcomeController *)self tableView];
  [v4 reloadData];
}

- (void)addBorderedIcon:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F82828];
  id v5 = a3;
  id v28 = (id)[[v4 alloc] initWithImage:v5];

  [v28 _setCornerRadius:13.0];
  [v28 setClipsToBounds:1];
  v6 = [MEMORY[0x263F82DA0] currentTraitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v7 != 2)
  {
    id v8 = [MEMORY[0x263F825C8] systemLightGrayColor];
    uint64_t v9 = [v8 CGColor];
    id v10 = [v28 layer];
    [v10 setBorderColor:v9];

    id v11 = [v28 layer];
    [v11 setBorderWidth:1.0];
  }
  id v12 = [(DSTableWelcomeController *)self headerView];
  objc_super v13 = [v12 customIconContainerView];
  [v13 addSubview:v28];

  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [v28 heightAnchor];
  v15 = [v14 constraintEqualToConstant:60.0];
  [v15 setActive:1];

  id v16 = [v28 widthAnchor];
  v17 = [v16 constraintEqualToConstant:60.0];
  [v17 setActive:1];

  v18 = [v28 centerXAnchor];
  id v19 = [(DSTableWelcomeController *)self headerView];
  v20 = [v19 customIconContainerView];
  v21 = [v20 centerXAnchor];
  v22 = [v18 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [v28 centerYAnchor];
  v24 = [(DSTableWelcomeController *)self headerView];
  v25 = [v24 customIconContainerView];
  v26 = [v25 centerYAnchor];
  v27 = [v23 constraintEqualToAnchor:v26];
  [v27 setActive:1];
}

- (void)showNoSharingViewWithText:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DSTableWelcomeController *)self setIsShowingNoSharingView:1];
  id v8 = [(DSTableWelcomeController *)self headerView];
  [v8 setTitle:&stru_26E9097D0];

  uint64_t v9 = [(DSTableWelcomeController *)self headerView];
  [v9 setDetailText:&stru_26E9097D0];

  id v10 = [(OBTableWelcomeController *)self tableView];
  [v10 setHidden:1];

  id v11 = [MEMORY[0x263F82600] emptyProminentConfiguration];
  [v11 setSecondaryText:v7];

  [v11 setImage:v6];
  [(DSTableWelcomeController *)self _setContentUnavailableConfiguration:v11];
}

- (void)hideNoSharingView
{
  [(DSTableWelcomeController *)self setIsShowingNoSharingView:0];
  [(DSTableWelcomeController *)self _setContentUnavailableConfiguration:0];
  id v3 = [(OBTableWelcomeController *)self tableView];
  [v3 setHidden:0];
}

- (void)showNoResultsViewWithSearchText:(id)a3
{
  id v4 = a3;
  [(DSTableWelcomeController *)self setIsShowingNoResultsView:1];
  if ([(DSTableWelcomeController *)self isShowingNoSharingView]) {
    [(DSTableWelcomeController *)self hideNoSharingView];
  }
  id v10 = [MEMORY[0x263F82600] emptyProminentConfiguration];
  id v5 = DSUILocStringForKey(@"NO_RESULTS_TITLE");
  [v10 setText:v5];

  id v6 = NSString;
  id v7 = DSUILocStringForKey(@"NO_RESULTS_SECONDARY");
  id v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v4);

  [v10 setSecondaryText:v8];
  uint64_t v9 = [MEMORY[0x263F827E8] systemImageNamed:@"magnifyingglass"];
  [v10 setImage:v9];

  [(DSTableWelcomeController *)self _setContentUnavailableConfiguration:v10];
}

- (void)hideNoResultsView
{
  [(DSTableWelcomeController *)self setIsShowingNoResultsView:0];
  [(DSTableWelcomeController *)self _setContentUnavailableConfiguration:0];
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)DSTableWelcomeController;
  [(OBTableWelcomeController *)&v19 viewDidLayoutSubviews];
  if ([(DSTableWelcomeController *)self isShowingNoSharingView])
  {
    id v3 = [(OBTableWelcomeController *)self scrollView];
    [v3 safeAreaInsets];
    double v5 = v4;

    id v6 = [(DSTableWelcomeController *)self view];
    [v6 layoutMargins];
    double v8 = v7;
    uint64_t v9 = [(DSTableWelcomeController *)self view];
    [v9 layoutMargins];
    double v11 = v10;
    id v12 = [(OBTableWelcomeController *)self scrollView];
    [v12 contentInset];
    double v14 = v5 + v13;
    v15 = [(DSTableWelcomeController *)self view];
    [v15 layoutMargins];
    double v17 = v16;
    v18 = [(DSTableWelcomeController *)self view];
    objc_msgSend(v18, "setLayoutMargins:", v8, v11, v14, v17);
  }
}

- (void)hideButtonsIfSearching
{
  if ([(DSTableWelcomeController *)self isKeyboardActive])
  {
    id v3 = [(DSTableWelcomeController *)self headerView];
    [v3 setTitle:&stru_26E9097D0];

    double v4 = [(DSTableWelcomeController *)self headerView];
    [v4 setDetailText:&stru_26E9097D0];

    double v5 = [(DSTableWelcomeController *)self boldButton];
    [v5 setHidden:1];

    id v6 = [(DSTableWelcomeController *)self linkButton];
    id v9 = v6;
    BOOL v7 = 1;
  }
  else
  {
    double v8 = [(DSTableWelcomeController *)self boldButton];
    [v8 setHidden:0];

    id v9 = [(DSTableWelcomeController *)self linkButton];
    BOOL v7 = [(DSTableWelcomeController *)self isModelEmpty];
    id v6 = v9;
  }
  [v6 setHidden:v7];
}

- (OBBoldTrayButton)boldButton
{
  return self->_boldButton;
}

- (void)setBoldButton:(id)a3
{
}

- (OBLinkTrayButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (BOOL)shouldShowSearchBar
{
  return self->_shouldShowSearchBar;
}

- (void)setShouldShowSearchBar:(BOOL)a3
{
  self->_shouldShowSearchBar = a3;
}

- (void)setIsFiltering:(BOOL)a3
{
  self->_isFiltering = a3;
}

- (BOOL)isModelEmpty
{
  return self->_isModelEmpty;
}

- (void)setIsModelEmpty:(BOOL)a3
{
  self->_isModelEmpty = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIBarButtonItem)quickExitButton
{
  return self->_quickExitButton;
}

- (void)setQuickExitButton:(id)a3
{
}

- (BOOL)isShowingNoSharingView
{
  return self->_isShowingNoSharingView;
}

- (void)setIsShowingNoSharingView:(BOOL)a3
{
  self->_isShowingNoSharingView = a3;
}

- (BOOL)isShowingNoResultsView
{
  return self->_isShowingNoResultsView;
}

- (void)setIsShowingNoResultsView:(BOOL)a3
{
  self->_isShowingNoResultsView = a3;
}

- (BOOL)isSpinnerActive
{
  return self->_isSpinnerActive;
}

- (void)setIsSpinnerActive:(BOOL)a3
{
  self->_isSpinnerActive = a3;
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_quickExitButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_boldButton, 0);
}

@end