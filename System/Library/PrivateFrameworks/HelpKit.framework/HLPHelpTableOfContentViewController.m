@interface HLPHelpTableOfContentViewController
- (BOOL)fullBookView;
- (BOOL)searchLogged;
- (BOOL)showTopicViewOnLoad;
- (HLPHelpBookController)helpBookController;
- (HLPHelpLocale)locale;
- (HLPHelpSearchIndexController)helpSearchIndexController;
- (HLPHelpSearchResultTableViewController)searchResultTableViewController;
- (HLPHelpTableOfContentViewController)initWithStyle:(int64_t)a3;
- (HLPHelpTableOfContentViewControllerDelegate)delegate;
- (NSArray)searchTerms;
- (NSMutableArray)displayHelpItems;
- (NSMutableArray)openSections;
- (UISearchController)searchController;
- (UIView)tableFooterView;
- (UIVisualEffectView)searchBlurEffectView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)numberOfVisibleHelpItemForSectionItem:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)appendChildrenForSectionItem:(id)a3;
- (void)cancelSpotlightSearchDelay;
- (void)closeSectionItem:(id)a3;
- (void)copyrightButtonTapped;
- (void)dealloc;
- (void)deselectCurrentRow;
- (void)didDismissSearchController:(id)a3;
- (void)loadError;
- (void)logAnalyticsContentViewedWithHelpTopicItem:(id)a3 sourceType:(id)a4;
- (void)openHelpItem:(id)a3 animated:(BOOL)a4;
- (void)openHelpItem:(id)a3 reload:(BOOL)a4 animated:(BOOL)a5;
- (void)registerTraitChanges;
- (void)scrollToHelpItem:(id)a3 deselectImmediately:(BOOL)a4 animated:(BOOL)a5;
- (void)scrollToHelpItem:(id)a3 deselectImmediately:(BOOL)a4 reload:(BOOL)a5 animated:(BOOL)a6;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayHelpItems:(id)a3;
- (void)setFullBookView:(BOOL)a3;
- (void)setHelpBookController:(id)a3;
- (void)setHelpSearchIndexController:(id)a3;
- (void)setLocale:(id)a3;
- (void)setOpenSections:(id)a3;
- (void)setSearchBlurEffectView:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchLogged:(BOOL)a3;
- (void)setSearchResultTableViewController:(id)a3;
- (void)setSearchTerms:(id)a3;
- (void)setShowTopicViewOnLoad:(BOOL)a3;
- (void)setTableFooterView:(id)a3;
- (void)showHelpBookInfo;
- (void)showTopicItem:(id)a3 fromTableView:(id)a4;
- (void)spotlightSearchDelay;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCellSelectionWithScrollPosition:(int64_t)a3 helpItem:(id)a4 animated:(BOOL)a5;
- (void)updateFooterViewBackgroundColor;
- (void)updateFooterViewLayout;
- (void)updateSearchBarBlur;
- (void)updateSearchBarLayout;
- (void)updateSearchResultViewSeparatorValue;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateWithHelpBookController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation HLPHelpTableOfContentViewController

- (HLPHelpTableOfContentViewController)initWithStyle:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HLPHelpTableOfContentViewController;
  v3 = [(HLPHelpTableOfContentViewController *)&v10 initWithStyle:a3];
  if (v3)
  {
    v4 = (void *)MEMORY[0x263EFFA68];
    uint64_t v5 = [MEMORY[0x263EFFA68] mutableCopy];
    displayHelpItems = v3->_displayHelpItems;
    v3->_displayHelpItems = (NSMutableArray *)v5;

    uint64_t v7 = [v4 mutableCopy];
    openSections = v3->_openSections;
    v3->_openSections = (NSMutableArray *)v7;

    v3->_fullBookView = 0;
  }
  return v3;
}

- (void)dealloc
{
  [(HLPHelpTableOfContentViewController *)self cancelSpotlightSearchDelay];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D158] object:0];

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTableOfContentViewController;
  [(HLPHelpTableOfContentViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)HLPHelpTableOfContentViewController;
  [(HLPHelpTableOfContentViewController *)&v13 viewDidLoad];
  v3 = [(HLPHelpTableOfContentViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"kTOCTableViewCellIdentifier"];
  [v3 setRowHeight:*MEMORY[0x263F1D600]];
  objc_super v4 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  tableBackgroundView = self->_tableBackgroundView;
  self->_tableBackgroundView = v4;

  v6 = [MEMORY[0x263F1C550] systemBackgroundColor];
  if (+[HLPCommonDefines isVisionOS])
  {
    uint64_t v7 = [MEMORY[0x263F1C550] clearColor];

    [v3 setBackgroundColor:v7];
    double v8 = 40.0;
    v6 = (void *)v7;
  }
  else
  {
    double v8 = 44.0;
  }
  [v3 setEstimatedRowHeight:v8];
  [(UIView *)self->_tableBackgroundView setBackgroundColor:v6];
  [v3 setBackgroundView:0];
  [v3 setBackgroundView:self->_tableBackgroundView];
  v9 = [(HLPHelpTableOfContentViewController *)self tableFooterView];
  [v3 setTableFooterView:v9];

  objc_super v10 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v11 = [v3 tableFooterView];
  [v11 setBackgroundColor:v10];

  [(HLPHelpTableOfContentViewController *)self updateFooterViewBackgroundColor];
  if (self->_fullBookView) {
    [v3 setBackgroundView:0];
  }
  v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 addObserver:self selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

  [(HLPHelpTableOfContentViewController *)self registerTraitChanges];
}

- (void)viewWillAppear:(BOOL)a3
{
  v22.receiver = self;
  v22.super_class = (Class)HLPHelpTableOfContentViewController;
  [(HLPHelpTableOfContentViewController *)&v22 viewWillAppear:a3];
  if ([(UISearchController *)self->_searchController isActive])
  {
    objc_super v4 = [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController tableView];
    uint64_t v5 = [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController tableView];
    v6 = [v5 indexPathForSelectedRow];
    [v4 deselectRowAtIndexPath:v6 animated:1];
  }
  if (!self->_initialized)
  {
    self->_initialized = 1;
    if (+[HLPCommonDefines isVisionOS])
    {
      uint64_t v7 = [(HLPHelpTableOfContentViewController *)self view];
      double v8 = [v7 superview];

      v9 = [(HLPHelpTableOfContentViewController *)self view];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_super v10 = [v9 leadingAnchor];
      v11 = [v8 leadingAnchor];
      v12 = [v10 constraintEqualToAnchor:v11];
      [v12 setActive:1];

      objc_super v13 = [v9 trailingAnchor];
      v14 = [v8 trailingAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      [v15 setActive:1];

      v16 = [v9 topAnchor];
      v17 = [v8 topAnchor];
      v18 = [v16 constraintEqualToAnchor:v17];
      [v18 setActive:1];

      v19 = [v9 bottomAnchor];
      v20 = [v8 bottomAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      [v21 setActive:1];
    }
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HLPHelpTableOfContentViewController;
  [(HLPHelpTableOfContentViewController *)&v6 viewIsAppearing:a3];
  if (self->_initialized || [(HLPHelpTableOfContentViewController *)self showTopicViewOnLoad])
  {
    objc_super v4 = [(HLPHelpTableOfContentViewController *)self delegate];
    uint64_t v5 = [v4 currentHelpTopicItemForTableOfContentViewController:self];

    [(HLPHelpTableOfContentViewController *)self scrollToHelpItem:v5 deselectImmediately:0 reload:1 animated:0];
    [(HLPHelpTableOfContentViewController *)self performSelector:sel_deselectCurrentRow withObject:0 afterDelay:0.2];
  }
}

- (UIVisualEffectView)searchBlurEffectView
{
  searchBlurEffectView = self->_searchBlurEffectView;
  if (!searchBlurEffectView)
  {
    objc_super v4 = [MEMORY[0x263F1C480] effectWithStyle:8];
    uint64_t v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v4];
    objc_super v6 = self->_searchBlurEffectView;
    self->_searchBlurEffectView = v5;

    [(UIVisualEffectView *)self->_searchBlurEffectView setAlpha:0.95];
    searchBlurEffectView = self->_searchBlurEffectView;
  }
  return searchBlurEffectView;
}

- (UISearchController)searchController
{
  if (!self->_searchController)
  {
    v3 = [[HLPHelpSearchResultTableViewController alloc] initWithStyle:0];
    searchResultTableViewController = self->_searchResultTableViewController;
    self->_searchResultTableViewController = v3;

    uint64_t v5 = [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController tableView];
    [v5 setDelegate:self];

    [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController setFullBookView:self->_fullBookView];
    objc_super v6 = (UISearchController *)[objc_alloc(MEMORY[0x263F1C958]) initWithSearchResultsController:self->_searchResultTableViewController];
    searchController = self->_searchController;
    self->_searchController = v6;

    [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
    [(UISearchController *)self->_searchController setDelegate:self];
    double v8 = [(UISearchController *)self->_searchController searchBar];
    [v8 setAutocapitalizationType:0];

    v9 = [(UISearchController *)self->_searchController searchBar];
    [v9 setAutocorrectionType:1];

    if (self->_fullBookView)
    {
      if (!+[HLPCommonDefines isVisionOS]) {
        [(UISearchController *)self->_searchController setHidesNavigationBarDuringPresentation:0];
      }
      [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
      [(HLPHelpTableOfContentViewController *)self setDefinesPresentationContext:1];
    }
  }
  objc_super v10 = self->_searchController;
  return v10;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HLPHelpTableOfContentViewController;
  [(HLPHelpTableOfContentViewController *)&v3 viewDidLayoutSubviews];
  [(HLPHelpTableOfContentViewController *)self updateFooterViewLayout];
  [(HLPHelpTableOfContentViewController *)self updateSearchBarLayout];
  [(HLPHelpTableOfContentViewController *)self updateSearchResultViewSeparatorValue];
}

- (HLPHelpSearchIndexController)helpSearchIndexController
{
  helpSearchIndexController = self->_helpSearchIndexController;
  if (!helpSearchIndexController)
  {
    int64_t v4 = [(HLPHelpBookController *)self->_helpBookController serverType];
    helpBookController = self->_helpBookController;
    if (v4 == 1)
    {
      objc_super v6 = [(HLPHelpBookController *)helpBookController remoteCSSearchIndex];

      if (v6)
      {
        uint64_t v7 = NSURL;
        double v8 = [(HLPHelpBookController *)self->_helpBookController remoteCSSearchIndex];
        v9 = [v7 URLWithString:v8];
        uint64_t v10 = 1;
LABEL_9:

LABEL_10:
        v15 = [(HLPRemoteDataController *)[HLPHelpSearchIndexController alloc] initWithURL:v9];
        v16 = self->_helpSearchIndexController;
        self->_helpSearchIndexController = v15;

        [(HLPHelpSearchIndexController *)self->_helpSearchIndexController setHelpBookController:self->_helpBookController];
        [(HLPHelpSearchIndexController *)self->_helpSearchIndexController setUseCSSearch:v10];

        helpSearchIndexController = self->_helpSearchIndexController;
        goto LABEL_11;
      }
      v9 = [(HLPHelpBookController *)self->_helpBookController remoteSearchPath];

      if (!v9)
      {
        uint64_t v10 = 0;
        goto LABEL_10;
      }
      v18 = NSURL;
      double v8 = [(HLPHelpBookController *)self->_helpBookController remoteSearchPath];
      v9 = [v18 URLWithString:v8];
    }
    else
    {
      BOOL v11 = [(HLPHelpBookController *)helpBookController isSemanticHTML];
      v12 = @"search.json";
      if (v11) {
        v12 = @"searchTree.json";
      }
      objc_super v13 = self->_helpBookController;
      v14 = v12;
      double v8 = [(HLPHelpBookController *)v13 helpBookURL];
      v9 = [v8 URLByAppendingPathComponent:v14];
    }
    uint64_t v10 = 0;
    goto LABEL_9;
  }
LABEL_11:
  return helpSearchIndexController;
}

- (UIView)tableFooterView
{
  tableFooterView = self->_tableFooterView;
  if (!tableFooterView)
  {
    int64_t v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 0.0, 100.0);
    uint64_t v5 = self->_tableFooterView;
    self->_tableFooterView = v4;

    objc_super v6 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    tableFooterSeparatorView = self->_tableFooterSeparatorView;
    self->_tableFooterSeparatorView = v6;

    [(UIView *)self->_tableFooterSeparatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_tableFooterView addSubview:self->_tableFooterSeparatorView];
    double v8 = [(UIView *)self->_tableFooterSeparatorView leadingAnchor];
    v9 = [(UIView *)self->_tableFooterView leadingAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    BOOL v11 = [(UIView *)self->_tableFooterSeparatorView trailingAnchor];
    v12 = [(UIView *)self->_tableFooterView trailingAnchor];
    objc_super v13 = [v11 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    v14 = [(UIView *)self->_tableFooterSeparatorView heightAnchor];
    v15 = [MEMORY[0x263F1C920] mainScreen];
    [v15 scale];
    v17 = [v14 constraintEqualToConstant:1.0 / v16];
    [v17 setActive:1];

    id v18 = objc_alloc(MEMORY[0x263F1C768]);
    v19 = (UILabel *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    copyrightFooterLabel = self->_copyrightFooterLabel;
    self->_copyrightFooterLabel = v19;

    [(UILabel *)self->_copyrightFooterLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_copyrightFooterLabel setTextAlignment:1];
    [(UILabel *)self->_copyrightFooterLabel setLineBreakMode:0];
    [(UILabel *)self->_copyrightFooterLabel setNumberOfLines:0];
    [(UIView *)self->_tableFooterView addSubview:self->_copyrightFooterLabel];
    v21 = [(UILabel *)self->_copyrightFooterLabel leadingAnchor];
    objc_super v22 = [(UIView *)self->_tableFooterView leadingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:10.0];

    LODWORD(v24) = 1147207680;
    [v23 setPriority:v24];
    [v23 setActive:1];
    v25 = [(UILabel *)self->_copyrightFooterLabel trailingAnchor];
    v26 = [(UIView *)self->_tableFooterView trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:-10.0];

    LODWORD(v28) = 1147207680;
    [v27 setPriority:v28];
    [v27 setActive:1];
    if (+[HLPCommonDefines isVisionOS]) {
      double v29 = 20.0;
    }
    else {
      double v29 = 40.0;
    }
    v30 = [(UILabel *)self->_copyrightFooterLabel topAnchor];
    v31 = [(UIView *)self->_tableFooterView topAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:v29];
    copyrightFooterLabelTopConstraint = self->_copyrightFooterLabelTopConstraint;
    self->_copyrightFooterLabelTopConstraint = v32;

    [(NSLayoutConstraint *)self->_copyrightFooterLabelTopConstraint setActive:1];
    v34 = [(UILabel *)self->_copyrightFooterLabel heightAnchor];
    v35 = [v34 constraintGreaterThanOrEqualToConstant:0.0];
    copyrightFooterLabelHeightConstraint = self->_copyrightFooterLabelHeightConstraint;
    self->_copyrightFooterLabelHeightConstraint = v35;

    [(NSLayoutConstraint *)self->_copyrightFooterLabelHeightConstraint setActive:1];
    v37 = [MEMORY[0x263F1C488] buttonWithType:0];
    footerViewOverlayButton = self->_footerViewOverlayButton;
    self->_footerViewOverlayButton = v37;

    [(UIButton *)self->_footerViewOverlayButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_footerViewOverlayButton addTarget:self action:sel_copyrightButtonTapped forControlEvents:64];
    [(UIView *)self->_tableFooterView addSubview:self->_footerViewOverlayButton];
    v39 = [(UIButton *)self->_footerViewOverlayButton leadingAnchor];
    v40 = [(UIView *)self->_tableFooterView leadingAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v41 setActive:1];

    v42 = [(UIButton *)self->_footerViewOverlayButton trailingAnchor];
    v43 = [(UIView *)self->_tableFooterView trailingAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v44 setActive:1];

    v45 = [(UIButton *)self->_footerViewOverlayButton topAnchor];
    v46 = [(UIView *)self->_tableFooterView topAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    [v47 setActive:1];

    v48 = [(UIButton *)self->_footerViewOverlayButton bottomAnchor];
    v49 = [(UIView *)self->_tableFooterView bottomAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    [v50 setActive:1];

    v51 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_showHelpBookInfo];
    [v51 setNumberOfTouchesRequired:1];
    [v51 setMinimumPressDuration:5.0];
    [v51 setAllowableMovement:50.0];
    [(UIButton *)self->_footerViewOverlayButton addGestureRecognizer:v51];

    tableFooterView = self->_tableFooterView;
  }
  return tableFooterView;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if ([(UISearchController *)self->_searchController isActive])
  {
    int64_t v4 = [(UISearchController *)self->_searchController searchBar];
    int v5 = [v4 isFirstResponder];

    if (v5)
    {
      id v6 = [(UISearchController *)self->_searchController searchBar];
      [v6 resignFirstResponder];
    }
  }
}

- (void)deselectCurrentRow
{
  id v5 = [(HLPHelpTableOfContentViewController *)self tableView];
  objc_super v3 = [(HLPHelpTableOfContentViewController *)self tableView];
  int64_t v4 = [v3 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v4 animated:1];
}

- (void)updateFooterViewBackgroundColor
{
  if (+[HLPCommonDefines isVisionOS])
  {
    [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
  }
  else
  {
    objc_super v3 = [(HLPHelpTableOfContentViewController *)self traitCollection];
    BOOL v4 = [v3 userInterfaceStyle] == 1;

    [MEMORY[0x263F1C550] colorWithWhite:dbl_220C05D10[v4] alpha:1.0];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIView *)self->_tableFooterSeparatorView setBackgroundColor:v5];
}

- (void)registerTraitChanges
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = objc_opt_class();
  objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__HLPHelpTableOfContentViewController_registerTraitChanges__block_invoke;
  v5[3] = &unk_264578A00;
  v5[4] = self;
  id v4 = (id)[(HLPHelpTableOfContentViewController *)self registerForTraitChanges:v3 withHandler:v5];
}

uint64_t __59__HLPHelpTableOfContentViewController_registerTraitChanges__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFooterViewBackgroundColor];
}

- (void)scrollToHelpItem:(id)a3 deselectImmediately:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)scrollToHelpItem:(id)a3 deselectImmediately:(BOOL)a4 reload:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  if (v10)
  {
    [(HLPHelpTableOfContentViewController *)self openHelpItem:v10 reload:v7 animated:0];
    if (v7)
    {
      BOOL v11 = [(HLPHelpTableOfContentViewController *)self tableView];
      [v11 reloadData];

      if ([(HLPHelpTableOfContentViewController *)self fullBookView]) {
        int64_t v12 = 350000000;
      }
      else {
        int64_t v12 = 0;
      }
    }
    else
    {
      int64_t v12 = 0;
    }
    dispatch_time_t v13 = dispatch_time(0, v12);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__HLPHelpTableOfContentViewController_scrollToHelpItem_deselectImmediately_reload_animated___block_invoke;
    block[3] = &unk_264578A28;
    block[4] = self;
    id v15 = v10;
    BOOL v16 = a6;
    BOOL v17 = a4;
    dispatch_after(v13, MEMORY[0x263EF83A0], block);
  }
}

void __92__HLPHelpTableOfContentViewController_scrollToHelpItem_deselectImmediately_reload_animated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) displayHelpItems];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [*(id *)(a1 + 32) tableView];
    id v5 = [v4 indexPathForSelectedRow];

    uint64_t v6 = [v5 row];
    if (v6 != v3)
    {
      id v12 = [MEMORY[0x263F088C8] indexPathForRow:v3 inSection:0];
      if ([*(id *)(a1 + 32) fullBookView])
      {
        uint64_t v7 = 2;
      }
      else
      {
        double v8 = [*(id *)(a1 + 32) tableView];
        v9 = [v8 indexPathsForVisibleRows];
        int v10 = [v9 containsObject:v12];

        if (v10) {
          uint64_t v7 = 0;
        }
        else {
          uint64_t v7 = 2;
        }
      }
      BOOL v11 = [*(id *)(a1 + 32) tableView];
      [v11 selectRowAtIndexPath:v12 animated:*(unsigned __int8 *)(a1 + 48) scrollPosition:v7];

      if (*(unsigned char *)(a1 + 49)) {
        [*(id *)(a1 + 32) performSelector:sel_deselectCurrentRow withObject:0 afterDelay:0.0];
      }
    }
  }
}

- (void)showHelpBookInfo
{
  id v3 = [(HLPHelpTableOfContentViewController *)self delegate];
  [v3 tableOfContentViewControllerShowHelpBookInfo:self];
}

- (void)copyrightButtonTapped
{
  helpBookController = self->_helpBookController;
  id v4 = [(HLPHelpBookController *)helpBookController copyrightTopicIdentifier];
  id v6 = [(HLPHelpBookController *)helpBookController helpTopicItemForID:v4];

  if (v6)
  {
    id v5 = [(HLPHelpTableOfContentViewController *)self tableView];
    [(HLPHelpTableOfContentViewController *)self showTopicItem:v6 fromTableView:v5];
  }
}

- (void)updateFooterViewLayout
{
  v35[1] = *MEMORY[0x263EF8340];
  if ((+[HLPCommonDefines isVisionOS] || !self->_fullBookView)
    && ([(UILabel *)self->_copyrightFooterLabel isHidden] & 1) == 0)
  {
    id v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
    [(UILabel *)self->_copyrightFooterLabel setFont:v3];

    id v4 = [(HLPHelpTableOfContentViewController *)self tableView];
    [v4 bounds];
    CGFloat v5 = CGRectGetWidth(v36) + -16.0;

    id v6 = [(UILabel *)self->_copyrightFooterLabel text];
    uint64_t v34 = *MEMORY[0x263F814F0];
    uint64_t v7 = [(UILabel *)self->_copyrightFooterLabel font];
    v35[0] = v7;
    double v8 = [NSDictionary dictionaryWithObjects:v35 forKeys:&v34 count:1];
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v5, 1.79769313e308);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v37.origin.x = v10;
    v37.origin.y = v12;
    v37.size.width = v14;
    v37.size.height = v16;
    [(NSLayoutConstraint *)self->_copyrightFooterLabelHeightConstraint setConstant:ceil(CGRectGetHeight(v37))];
    [(UIView *)self->_tableFooterView frame];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [(NSLayoutConstraint *)self->_copyrightFooterLabelTopConstraint constant];
    double v24 = v23;
    [(NSLayoutConstraint *)self->_copyrightFooterLabelHeightConstraint constant];
    double v26 = v24 + v25 + 20.0;
    v38.origin.x = v18;
    v38.origin.y = v20;
    v38.size.width = v22;
    v38.size.height = v26;
    double Height = CGRectGetHeight(v38);
    double v28 = [(HLPHelpTableOfContentViewController *)self tableView];
    double v29 = [v28 tableFooterView];
    [v29 frame];
    double v30 = CGRectGetHeight(v39);

    if (Height != v30)
    {
      -[UIView setFrame:](self->_tableFooterView, "setFrame:", v18, v20, v22, v26);
      v31 = [(HLPHelpTableOfContentViewController *)self tableView];
      [v31 setTableFooterView:0];

      tableFooterView = self->_tableFooterView;
      v33 = [(HLPHelpTableOfContentViewController *)self tableView];
      [v33 setTableFooterView:tableFooterView];
    }
  }
}

- (void)updateSearchBarBlur
{
  if (+[HLPCommonDefines isVisionOS])
  {
    id v3 = [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController searchResults];

    if (v3)
    {
      id v4 = [(UISearchController *)self->_searchController view];
      [v4 frame];
      -[UIVisualEffectView setFrame:](self->_searchBlurEffectView, "setFrame:");

      id v6 = [(UISearchController *)self->_searchController searchBar];
      CGFloat v5 = [(HLPHelpTableOfContentViewController *)self searchBlurEffectView];
      [v6 insertSubview:v5 atIndex:0];
    }
    else
    {
      id v6 = [(HLPHelpTableOfContentViewController *)self searchBlurEffectView];
      [v6 removeFromSuperview];
    }
  }
}

- (void)updateSearchBarLayout
{
  if (+[HLPCommonDefines isVisionOS])
  {
    id v3 = [MEMORY[0x263F1C550] clearColor];
    id v4 = [(UISearchController *)self->_searchController searchBar];
    [v4 setBackgroundColor:v3];

    id v6 = (id)objc_opt_new();
    CGFloat v5 = [(UISearchController *)self->_searchController searchBar];
    [v5 setBackgroundImage:v6];
  }
}

- (void)updateWithHelpBookController:(id)a3
{
  CGFloat v5 = (HLPHelpBookController *)a3;
  if (self->_helpBookController != v5)
  {
    v31 = v5;
    objc_storeStrong((id *)&self->_helpBookController, a3);
    [(NSMutableArray *)self->_displayHelpItems removeAllObjects];
    id v6 = [(HLPHelpBookController *)v31 rootSectionItem];
    [(HLPHelpTableOfContentViewController *)self appendChildrenForSectionItem:v6];

    uint64_t v7 = [(HLPHelpBookController *)v31 copyrightTopicIdentifier];
    double v8 = [(HLPHelpBookController *)v31 helpTopicItemForID:v7];

    double v9 = [(HLPHelpBookController *)v31 copyrightText];
    CGFloat v10 = v9;
    if (v9)
    {
      double v11 = v9;
    }
    else
    {
      double v11 = [v8 name];
    }
    CGFloat v12 = v11;

    if (v12) {
      double v13 = v12;
    }
    else {
      double v13 = &stru_26D29FC58;
    }
    [(UILabel *)self->_copyrightFooterLabel setText:v13];
    [(UILabel *)self->_copyrightFooterLabel setHidden:[(__CFString *)v12 length] == 0];
    CGFloat v14 = [v8 hrefID];
    uint64_t v15 = [v14 length];

    if (v15) {
      [MEMORY[0x263F1C550] linkColor];
    }
    else {
    CGFloat v16 = [MEMORY[0x263F1C550] secondaryLabelColor];
    }
    [(UILabel *)self->_copyrightFooterLabel setEnabled:v15 != 0];
    [(UILabel *)self->_copyrightFooterLabel setTextColor:v16];
    double v17 = [(HLPHelpBookController *)v31 helpItemMap];
    double v18 = (void *)[v17 count];

    if (v18)
    {
      double v19 = [(HLPHelpTableOfContentViewController *)self helpSearchIndexController];
      double v18 = [v19 URL];
      double v20 = [v18 lastPathComponent];
      int v21 = [v20 isEqualToString:@"search.cshelpindex"];

      double v22 = [(HLPHelpTableOfContentViewController *)self helpSearchIndexController];
      double v23 = v22;
      if (v21)
      {
        double v24 = @"search.cshelpindex";
        double v25 = &__block_literal_global;
        uint64_t v26 = 2;
      }
      else
      {
        double v24 = @"searchTree.json";
        double v25 = &__block_literal_global_55;
        uint64_t v26 = 1;
      }
      [v22 fetchDataWithDataType:v26 identifier:v24 completionHandler:v25];
    }
    if (self->_fullBookView)
    {
      uint64_t v27 = [(NSMutableArray *)self->_displayHelpItems count];
      if (v27)
      {
        double v18 = [(HLPHelpTableOfContentViewController *)self searchController];
        double v28 = [v18 searchBar];
      }
      else
      {
        double v28 = 0;
      }
      double v29 = [(HLPHelpTableOfContentViewController *)self tableView];
      [v29 setTableHeaderView:v28];

      if (v27)
      {
      }
    }
    [(UIButton *)self->_footerViewOverlayButton setHidden:[(NSMutableArray *)self->_displayHelpItems count] == 0];
    double v30 = [(HLPHelpTableOfContentViewController *)self tableView];
    [v30 reloadData];
  }
  MEMORY[0x270F9A758]();
}

- (void)loadError
{
  BOOL v3 = [(NSMutableArray *)self->_displayHelpItems count] == 0;
  footerViewOverlayButton = self->_footerViewOverlayButton;
  [(UIButton *)footerViewOverlayButton setHidden:v3];
}

- (void)appendChildrenForSectionItem:(id)a3
{
  id v4 = [a3 children];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__HLPHelpTableOfContentViewController_appendChildrenForSectionItem___block_invoke;
  v5[3] = &unk_264578A70;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __68__HLPHelpTableOfContentViewController_appendChildrenForSectionItem___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [*(id *)(a1 + 32) displayHelpItems];
  [v3 addObject:v6];

  id v4 = [*(id *)(a1 + 32) openSections];
  int v5 = [v4 containsObject:v6];

  if (v5) {
    [*(id *)(a1 + 32) appendChildrenForSectionItem:v6];
  }
}

- (void)updateCellSelectionWithScrollPosition:(int64_t)a3 helpItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [(NSMutableArray *)self->_displayHelpItems indexOfObject:a4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = 0;
    CGFloat v10 = 0;
  }
  else
  {
    CGFloat v10 = [MEMORY[0x263F088C8] indexPathForRow:v8 inSection:0];
    double v11 = [(HLPHelpTableOfContentViewController *)self tableView];
    double v9 = [v11 cellForRowAtIndexPath:v10];
  }
  CGFloat v12 = [(HLPHelpTableOfContentViewController *)self tableView];
  double v13 = [v12 indexPathsForSelectedRows];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __95__HLPHelpTableOfContentViewController_updateCellSelectionWithScrollPosition_helpItem_animated___block_invoke;
  v16[3] = &unk_264578A98;
  id v14 = v10;
  id v17 = v14;
  double v18 = self;
  BOOL v19 = v5;
  [v13 enumerateObjectsUsingBlock:v16];

  if (v14 && (!v9 || ([v9 isSelected] & 1) == 0 && (objc_msgSend(v9, "isHighlighted") & 1) == 0))
  {
    uint64_t v15 = [(HLPHelpTableOfContentViewController *)self tableView];
    [v15 selectRowAtIndexPath:v14 animated:v5 scrollPosition:a3];
  }
}

void __95__HLPHelpTableOfContentViewController_updateCellSelectionWithScrollPosition_helpItem_animated___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!*(void *)(a1 + 32) || (uint64_t v3 = [v5 row], v3 != objc_msgSend(*(id *)(a1 + 32), "row")))
  {
    id v4 = [*(id *)(a1 + 40) tableView];
    [v4 deselectRowAtIndexPath:v5 animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)showTopicItem:(id)a3 fromTableView:(id)a4
{
  id v6 = a3;
  id v5 = [(HLPHelpTableOfContentViewController *)self delegate];
  [v5 tableOfContentViewController:self showHelpTopicItem:v6];

  [(HLPHelpTableOfContentViewController *)self updateCellSelectionWithScrollPosition:0 helpItem:v6 animated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_displayHelpItems count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"kTOCTableViewCellIdentifier" forIndexPath:v6];
  [v7 setUpdateSeparatorInsetAutomatically:1];
  objc_msgSend(v7, "setShowFirstLevelIcon:", -[HLPHelpBookController hasSectionIcon](self->_helpBookController, "hasSectionIcon"));
  displayHelpItems = self->_displayHelpItems;
  uint64_t v9 = [v6 row];

  CGFloat v10 = [(NSMutableArray *)displayHelpItems objectAtIndexedSubscript:v9];
  [v7 setHelpItem:v10];
  objc_msgSend(v7, "setClosed:", -[NSMutableArray indexOfObject:](self->_openSections, "indexOfObject:", v10) == 0x7FFFFFFFFFFFFFFFLL);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HLPHelpTableOfContentViewController *)self tableView];
  if (v8 == v6)
  {
    CGFloat v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_displayHelpItems, "objectAtIndexedSubscript:", [v7 row]);
  }
  else
  {
    uint64_t v9 = [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController searchResults];
    CGFloat v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      [v12 toggle];
      [v6 deselectRowAtIndexPath:v7 animated:1];
      id v13 = v10;
      [v6 beginUpdates];
      if ([v12 closed])
      {
        [(HLPHelpTableOfContentViewController *)self closeSectionItem:v13];
      }
      else
      {
        id v20 = [(NSMutableArray *)self->_displayHelpItems lastObject];

        if (v13 == v20)
        {
          int v21 = [(HLPHelpTableOfContentViewController *)self tableView];
          double v22 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", -[NSMutableArray count](self->_displayHelpItems, "count") - 1, 0);
          v28[0] = v22;
          double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
          [v21 reloadRowsAtIndexPaths:v23 withRowAnimation:5];
        }
        [(HLPHelpTableOfContentViewController *)self openHelpItem:v13 animated:1];
      }
      [v6 endUpdates];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    id v11 = v10;
    id v14 = [v11 hrefID];
    int v15 = [v14 hasPrefix:@"http"];

    if (v15)
    {
      CGFloat v16 = [MEMORY[0x263F1C408] sharedApplication];
      id v17 = NSURL;
      double v18 = [v11 hrefID];
      BOOL v19 = [v17 URLWithString:v18];
      [v16 openURL:v19 options:MEMORY[0x263EFFA78] completionHandler:0];

      [v6 deselectRowAtIndexPath:v7 animated:1];
    }
    else
    {
      [(HLPHelpTableOfContentViewController *)self showTopicItem:v11 fromTableView:v6];
    }
    id v24 = [(HLPHelpTableOfContentViewController *)self tableView];
    double v25 = HLPAnalyticsViewSourceTypeTOC;
    if (v24 != v6) {
      double v25 = HLPAnalyticsViewSourceTypeSearch;
    }
    uint64_t v26 = *v25;

    [(HLPHelpTableOfContentViewController *)self logAnalyticsContentViewedWithHelpTopicItem:v11 sourceType:v26];
  }

LABEL_20:
  if (self->_fullBookView)
  {
    uint64_t v27 = [(UISearchController *)self->_searchController searchBar];
    [v27 resignFirstResponder];
  }
}

- (int64_t)numberOfVisibleHelpItemForSectionItem:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  CGFloat v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [v4 children];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__HLPHelpTableOfContentViewController_numberOfVisibleHelpItemForSectionItem___block_invoke;
  v8[3] = &unk_264578AC0;
  v8[4] = self;
  v8[5] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];

  int64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __77__HLPHelpTableOfContentViewController_numberOfVisibleHelpItemForSectionItem___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [*(id *)(a1 + 32) openSections];
    uint64_t v4 = [v3 indexOfObject:v5];

    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(a1 + 32) numberOfVisibleHelpItemForSectionItem:v5];
    }
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)openHelpItem:(id)a3 animated:(BOOL)a4
{
}

- (void)openHelpItem:(id)a3 reload:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v37 = a3;
  if (-[NSMutableArray indexOfObject:](self->_openSections, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(NSMutableArray *)self->_displayHelpItems indexOfObject:v37];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_5;
    }
    uint64_t v9 = [v37 parent];

    if (v9)
    {
      CGFloat v10 = [v37 parent];
      [(HLPHelpTableOfContentViewController *)self openHelpItem:v10 reload:v6 animated:v5];

      uint64_t v8 = [(NSMutableArray *)self->_displayHelpItems indexOfObject:v37];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_5:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v36 = v6;
          BOOL v34 = v5;
          id v11 = v37;
          unint64_t v12 = v8 + 1;
          id v13 = (void *)MEMORY[0x263F088D0];
          id v14 = [v11 children];
          int v15 = objc_msgSend(v13, "indexSetWithIndexesInRange:", v12, objc_msgSend(v14, "count"));

          v35 = v15;
          CGFloat v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
          id v17 = [v11 children];
          unint64_t v18 = [v17 count] + v12;

          if (v12 < v18)
          {
            unint64_t v19 = v12;
            do
            {
              id v20 = [MEMORY[0x263F088C8] indexPathForRow:v19 inSection:0];
              [v16 addObject:v20];

              ++v19;
              int v21 = [v11 children];
              unint64_t v22 = [v21 count] + v12;
            }
            while (v19 < v22);
          }
          id v23 = v11;
          id v24 = v23;
          do
          {
            uint64_t v25 = [(NSMutableArray *)self->_openSections indexOfObject:v24];
            if (v25 != 0x7FFFFFFFFFFFFFFFLL) {
              [(NSMutableArray *)self->_openSections removeObjectAtIndex:v25];
            }
            [(NSMutableArray *)self->_openSections insertObject:v24 atIndex:0];
            uint64_t v26 = [v24 parent];

            id v24 = (void *)v26;
          }
          while (v26);
          displayHelpItems = self->_displayHelpItems;
          double v28 = [v23 children];
          [(NSMutableArray *)displayHelpItems insertObjects:v28 atIndexes:v35];

          if (!v36)
          {
            [MEMORY[0x263F1CB60] setAnimationsEnabled:0];
            double v29 = [(HLPHelpTableOfContentViewController *)self tableView];
            [v29 beginUpdates];

            double v30 = [(HLPHelpTableOfContentViewController *)self tableView];
            v31 = v30;
            if (v34) {
              uint64_t v32 = 3;
            }
            else {
              uint64_t v32 = 5;
            }
            [v30 insertRowsAtIndexPaths:v16 withRowAnimation:v32];

            v33 = [(HLPHelpTableOfContentViewController *)self tableView];
            [v33 endUpdates];

            [MEMORY[0x263F1CB60] setAnimationsEnabled:1];
          }
        }
      }
    }
  }
}

- (void)closeSectionItem:(id)a3
{
  id v44 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_displayHelpItems, "indexOfObject:");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_20;
  }
  uint64_t v5 = v4;
  if ([(NSMutableArray *)self->_openSections indexOfObject:v44] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_20;
  }
  BOOL v6 = [(HLPHelpTableOfContentViewController *)self tableView];
  id v7 = [MEMORY[0x263F088C8] indexPathForRow:v5 inSection:0];
  uint64_t v8 = [v6 cellForRowAtIndexPath:v7];

  if (v8) {
    [v8 setClosed:1];
  }
  uint64_t v9 = [(HLPHelpTableOfContentViewController *)self numberOfVisibleHelpItemForSectionItem:v44];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = v5 + 1;
    unint64_t v12 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v5 + 1, v9);
    [(NSMutableArray *)self->_displayHelpItems removeObjectsAtIndexes:v12];
    id v13 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    uint64_t v14 = v10 + v11;
    do
    {
      int v15 = [MEMORY[0x263F088C8] indexPathForRow:v11 inSection:0];
      [v13 addObject:v15];

      ++v11;
    }
    while (v11 < v14);
    CGFloat v16 = [(HLPHelpTableOfContentViewController *)self tableView];
    [v16 estimatedRowHeight];
    double v18 = v17;

    unint64_t v19 = [(HLPHelpTableOfContentViewController *)self tableView];
    [v19 contentSize];
    double v21 = v20;

    double v22 = v21 - v18 * (double)(unint64_t)[v13 count];
    id v23 = [(HLPHelpTableOfContentViewController *)self view];
    [v23 bounds];
    double Height = CGRectGetHeight(v46);

    uint64_t v25 = [(HLPHelpTableOfContentViewController *)self tableView];
    uint64_t v26 = v25;
    if (v22 >= Height)
    {
      [v25 contentOffset];
      double v30 = v29;

      double v31 = Height + v30;
      if (Height + v30 <= v22)
      {
LABEL_13:
        uint64_t v32 = [(HLPHelpTableOfContentViewController *)self tableView];
        [v32 beginUpdates];

        v33 = [(HLPHelpTableOfContentViewController *)self tableView];
        [v33 deleteRowsAtIndexPaths:v13 withRowAnimation:3];

        BOOL v34 = [(HLPHelpTableOfContentViewController *)self tableView];
        [v34 endUpdates];

        goto LABEL_14;
      }
      uint64_t v26 = [(HLPHelpTableOfContentViewController *)self tableView];
      objc_msgSend(v26, "setContentOffset:animated:", 1, 0.0, v22 - Height);
    }
    else
    {
      uint64_t v27 = [(HLPHelpTableOfContentViewController *)self view];
      [v27 safeAreaInsets];
      objc_msgSend(v26, "setContentOffset:animated:", 1, 0.0, -v28);
    }
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v35 = [(NSMutableArray *)self->_openSections indexOfObject:v44];
  BOOL v36 = [MEMORY[0x263EFF9A0] dictionary];
  id v37 = [v44 identifier];
  [v36 setObject:v44 forKeyedSubscript:v37];

  for (unint64_t i = v35 + 1; i < [(NSMutableArray *)self->_openSections count]; ++i)
  {
    CGRect v39 = [(NSMutableArray *)self->_openSections objectAtIndexedSubscript:i];
    v40 = [v39 parent];
    v41 = [v40 identifier];
    v42 = [v36 objectForKeyedSubscript:v41];

    if (v42)
    {
      v43 = [v39 identifier];
      [v36 setObject:v39 forKeyedSubscript:v43];
    }
  }
  -[NSMutableArray removeObjectsInRange:](self->_openSections, "removeObjectsInRange:", v35, [v36 count]);

LABEL_20:
}

- (void)logAnalyticsContentViewedWithHelpTopicItem:(id)a3 sourceType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = [v7 name];
  uint64_t v10 = [(HLPHelpTableOfContentViewController *)self traitCollection];
  +[HLPAnalyticsEventContentViewed eventWithTopicID:topicTitle:source:interfaceStyle:](HLPAnalyticsEventContentViewed, "eventWithTopicID:topicTitle:source:interfaceStyle:", v8, v9, v6, [v10 userInterfaceStyle]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  [v15 log];
  uint64_t v11 = [(HLPHelpTableOfContentViewController *)self delegate];
  unint64_t v12 = [v7 identifier];
  id v13 = [v7 name];

  uint64_t v14 = [(HLPHelpTableOfContentViewController *)self traitCollection];
  [v11 tableOfContentViewControllerToCContentViewed:self topicID:v12 topicTitle:v13 source:v6 interfaceStyle:objc_msgSend(v14 fromTopicID:"userInterfaceStyle") externalURLString:&stru_26D29FC58];
}

- (void)updateSearchResultViewSeparatorValue
{
  uint64_t v3 = [(HLPHelpTableOfContentViewController *)self tableView];
  uint64_t v4 = [v3 visibleCells];
  id v7 = [v4 firstObject];

  searchResultTableViewController = self->_searchResultTableViewController;
  id v6 = [v7 accessoryImageView];
  [v6 bounds];
  [(HLPHelpSearchResultTableViewController *)searchResultTableViewController preferSeparatorValue:CGRectGetWidth(v9) + 8.0 * 2.0];
}

- (void)willPresentSearchController:(id)a3
{
  if (+[HLPCommonDefines isVisionOS])
  {
    uint64_t v4 = [(HLPHelpTableOfContentViewController *)self tableView];
    [v4 setHidden:1];
  }
  [(HLPHelpTableOfContentViewController *)self updateSearchResultViewSeparatorValue];
}

- (void)willDismissSearchController:(id)a3
{
  id v10 = a3;
  if (+[HLPCommonDefines isVisionOS])
  {
    uint64_t v4 = [(HLPHelpTableOfContentViewController *)self tableView];
    [v4 setHidden:0];

    uint64_t v5 = [(HLPHelpTableOfContentViewController *)self searchResultTableViewController];
    id v6 = [v5 tableView];
    id v7 = [v6 indexPathForSelectedRow];

    if (v7)
    {
      uint64_t v8 = [v10 searchBar];
      [v8 setAlpha:0.0];
    }
  }
  searchTerms = self->_searchTerms;
  self->_searchTerms = 0;

  self->_searchLogged = 0;
  [(HLPHelpTableOfContentViewController *)self cancelSpotlightSearchDelay];
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  if (+[HLPCommonDefines isVisionOS])
  {
    uint64_t v3 = [v4 searchBar];
    [v3 setAlpha:1.0];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HLPHelpTableOfContentViewController *)self locale];
  id v6 = [v5 isoCodes];

  if (v6)
  {
    id v7 = [v4 searchBar];
    uint64_t v8 = [v7 text];

    if ([v8 length])
    {
      if (!self->_searchLogged)
      {
        CGRect v9 = +[HLPAnalyticsEvent event];
        [v9 log];

        id v10 = [(HLPHelpTableOfContentViewController *)self delegate];
        [v10 tableOfContentViewControllerSearchUsed:self];

        self->_searchLogged = 1;
      }
      if ([(HLPHelpSearchIndexController *)self->_helpSearchIndexController useCSSearch])
      {
        v24[0] = v8;
        uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
        searchTerms = self->_searchTerms;
        self->_searchTerms = v11;

        [(HLPHelpTableOfContentViewController *)self cancelSpotlightSearchDelay];
        [(HLPHelpTableOfContentViewController *)self performSelector:sel_spotlightSearchDelay withObject:0 afterDelay:0.2];
      }
      else
      {
        uint64_t v14 = [v8 lowercaseString];

        helpSearchIndexController = self->_helpSearchIndexController;
        CGFloat v16 = [(HLPHelpTableOfContentViewController *)self locale];
        double v17 = [v16 isoCodes];
        double v18 = [v17 firstObject];
        id v23 = 0;
        unint64_t v19 = [(HLPHelpSearchIndexController *)helpSearchIndexController resultsWithSearchText:v14 localeCode:v18 searchTerms:&v23];
        double v20 = (NSArray *)v23;

        double v21 = self->_searchTerms;
        self->_searchTerms = v20;
        double v22 = v20;

        [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController updateWithSearchText:v14 searchResults:v19];
        uint64_t v8 = (void *)v14;
      }
    }
    else
    {
      id v13 = self->_searchTerms;
      self->_searchTerms = 0;

      [(HLPHelpSearchResultTableViewController *)self->_searchResultTableViewController updateWithSearchText:&stru_26D29FC58 searchResults:0];
    }
    [(HLPHelpTableOfContentViewController *)self updateSearchBarBlur];
  }
}

- (void)cancelSpotlightSearchDelay
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_spotlightSearchDelay object:0];
  helpSearchIndexController = self->_helpSearchIndexController;
  [(HLPHelpSearchIndexController *)helpSearchIndexController cancelSpotlightSearch];
}

- (void)spotlightSearchDelay
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(HLPHelpTableOfContentViewController *)self searchController];
  id v4 = [v3 searchBar];
  uint64_t v5 = [v4 text];

  helpSearchIndexController = self->_helpSearchIndexController;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke;
  v8[3] = &unk_264578B10;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [(HLPHelpSearchIndexController *)helpSearchIndexController CSSearchForSearchText:v7 completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (v3)
  {
    id v6 = HLPLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_220BD8000, v6, OS_LOG_TYPE_DEFAULT, "error getting spotlight search results %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [WeakRetained helpSearchIndexController];
    uint64_t v8 = [v7 spotlightSearchResults];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke_2;
    block[3] = &unk_264578AE8;
    block[4] = v5;
    id v10 = *(id *)(a1 + 32);
    id v11 = v8;
    id v6 = v8;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __59__HLPHelpTableOfContentViewController_spotlightSearchDelay__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchResultTableViewController];
  [v2 updateWithSearchText:*(void *)(a1 + 40) searchResults:*(void *)(a1 + 48)];
}

- (BOOL)fullBookView
{
  return self->_fullBookView;
}

- (void)setFullBookView:(BOOL)a3
{
  self->_fullBookView = a3;
}

- (BOOL)showTopicViewOnLoad
{
  return self->_showTopicViewOnLoad;
}

- (void)setShowTopicViewOnLoad:(BOOL)a3
{
  self->_showTopicViewOnLoad = a3;
}

- (HLPHelpTableOfContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HLPHelpTableOfContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (void)setSearchController:(id)a3
{
}

- (HLPHelpLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (HLPHelpBookController)helpBookController
{
  return self->_helpBookController;
}

- (void)setHelpBookController:(id)a3
{
}

- (NSMutableArray)openSections
{
  return self->_openSections;
}

- (void)setOpenSections:(id)a3
{
}

- (NSMutableArray)displayHelpItems
{
  return self->_displayHelpItems;
}

- (void)setDisplayHelpItems:(id)a3
{
}

- (void)setTableFooterView:(id)a3
{
}

- (void)setSearchBlurEffectView:(id)a3
{
}

- (void)setHelpSearchIndexController:(id)a3
{
}

- (HLPHelpSearchResultTableViewController)searchResultTableViewController
{
  return self->_searchResultTableViewController;
}

- (void)setSearchResultTableViewController:(id)a3
{
}

- (BOOL)searchLogged
{
  return self->_searchLogged;
}

- (void)setSearchLogged:(BOOL)a3
{
  self->_searchLogged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultTableViewController, 0);
  objc_storeStrong((id *)&self->_helpSearchIndexController, 0);
  objc_storeStrong((id *)&self->_searchBlurEffectView, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_displayHelpItems, 0);
  objc_storeStrong((id *)&self->_openSections, 0);
  objc_storeStrong((id *)&self->_helpBookController, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_copyrightFooterLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_copyrightFooterLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_footerViewOverlayButton, 0);
  objc_storeStrong((id *)&self->_copyrightFooterLabel, 0);
  objc_storeStrong((id *)&self->_tableFooterSeparatorView, 0);
  objc_storeStrong((id *)&self->_tableBackgroundView, 0);
}

@end