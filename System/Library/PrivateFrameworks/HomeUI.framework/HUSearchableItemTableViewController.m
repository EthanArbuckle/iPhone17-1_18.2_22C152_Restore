@interface HUSearchableItemTableViewController
- (HUSearchBar)searchBar;
- (HUSearchableItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HUSearchableItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 searchBar:(id)a5 searchBarPosition:(unint64_t)a6;
- (UIScrollView)searchBarWrapper;
- (unint64_t)searchBarPosition;
- (void)setupSearchBar;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateForSearch;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUSearchableItemTableViewController

- (HUSearchableItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 searchBar:(id)a5 searchBarPosition:(unint64_t)a6
{
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUSearchableItemTableViewController;
  v11 = [(HUItemTableViewController *)&v19 initWithItemManager:a3 tableViewStyle:a4];
  if (v11)
  {
    id v12 = v10;
    if (!v10) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F42DB8]);
    }
    p_searchBar = (id *)&v11->_searchBar;
    objc_storeStrong((id *)&v11->_searchBar, v12);
    if (!v10) {

    }
    v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4F42DB0]);
    searchBarWrapper = v11->_searchBarWrapper;
    v11->_searchBarWrapper = v14;

    v11->_searchBarPosition = a6;
    v16 = [*p_searchBar searchTextField];
    [v16 setDelegate:v11];

    v17 = [*p_searchBar searchTextField];
    [v17 addTarget:v11 action:sel_textFieldDidChange_ forControlEvents:0x20000];
  }
  return v11;
}

- (HUSearchableItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  return [(HUSearchableItemTableViewController *)self initWithItemManager:a3 tableViewStyle:a4 searchBar:0 searchBarPosition:0];
}

- (void)updateForSearch
{
  v3 = [(HUSearchableItemTableViewController *)self searchBar];
  v4 = [v3 searchTextField];
  v5 = [v4 text];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HUSearchableItemTableViewController_updateForSearch__block_invoke;
  aBlock[3] = &unk_1E6386108;
  id v6 = v5;
  id v10 = v6;
  v7 = _Block_copy(aBlock);
  if (![v6 length])
  {

    v7 = 0;
  }
  v8 = [(HUItemTableViewController *)self itemManager];
  [v8 _setDisplayFilter:v7 recalculateVisibility:1];
}

BOOL __54__HUSearchableItemTableViewController_updateForSearch__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 latestResults];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  BOOL v5 = [v4 rangeOfString:*(void *)(a1 + 32) options:129] != 0x7FFFFFFFFFFFFFFFLL;
  return v5;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)HUSearchableItemTableViewController;
  [(HUItemTableViewController *)&v6 viewDidLoad];
  unint64_t v3 = [(HUSearchableItemTableViewController *)self searchBarPosition];
  if (v3 == 1)
  {
    v4 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    BOOL v5 = [(HUSearchableItemTableViewController *)self tableView];
    [v5 setTableHeaderView:v4];
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = [(HUSearchableItemTableViewController *)self tableView];
    BOOL v5 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v4 addSubview:v5];
LABEL_5:
  }
  [(HUSearchableItemTableViewController *)self setupSearchBar];
}

- (void)viewDidLayoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)HUSearchableItemTableViewController;
  [(HUItemTableViewController *)&v31 viewDidLayoutSubviews];
  if (![(HUSearchableItemTableViewController *)self searchBarPosition])
  {
    unint64_t v3 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v3 frame];
    double v5 = v4;

    objc_super v6 = [(HUSearchableItemTableViewController *)self tableView];
    [v6 contentInset];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    v13 = [(HUSearchableItemTableViewController *)self tableView];
    objc_msgSend(v13, "setContentInset:", v5, v8, v10, v12);

    v14 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    v21 = [(HUSearchableItemTableViewController *)self tableView];
    [v21 contentOffset];
    double v23 = v22;

    v24 = [(HUSearchableItemTableViewController *)self navigationController];
    v25 = [v24 navigationBar];
    int v26 = [v25 isTranslucent];

    if (v26)
    {
      v27 = [(HUSearchableItemTableViewController *)self navigationController];
      v28 = [v27 navigationBar];
      [v28 bounds];
      double v23 = v23 + v29;
    }
    v30 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    objc_msgSend(v30, "setFrame:", v16, v23, v18, v20);
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  double v4 = [(HUSearchableItemTableViewController *)self searchBar];
  [v4 resignFirstResponder];

  double v5 = [(HUSearchableItemTableViewController *)self searchBar];
  objc_super v6 = [v5 searchTextField];
  [v6 resignFirstResponder];

  [(HUSearchableItemTableViewController *)self updateForSearch];
}

- (void)setupSearchBar
{
  v32[3] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HUSearchableItemTableViewController *)self searchBar];
  double v4 = [v3 superview];
  double v5 = [(HUSearchableItemTableViewController *)self searchBarWrapper];

  if (v4 != v5)
  {
    objc_super v6 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    double v7 = [(HUSearchableItemTableViewController *)self searchBar];
    [v6 addSubview:v7];

    double v8 = [(HUSearchableItemTableViewController *)self searchBar];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v9 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    v25 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v31 = [(HUSearchableItemTableViewController *)self searchBar];
    double v29 = [v31 widthAnchor];
    v30 = [(HUSearchableItemTableViewController *)self tableView];
    v28 = [v30 widthAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v32[0] = v27;
    int v26 = [(HUSearchableItemTableViewController *)self searchBar];
    v24 = [v26 heightAnchor];
    double v10 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    double v11 = [v10 heightAnchor];
    double v12 = [v24 constraintEqualToAnchor:v11];
    v32[1] = v12;
    v13 = [(HUSearchableItemTableViewController *)self searchBar];
    v14 = [v13 widthAnchor];
    double v15 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    double v16 = [v15 widthAnchor];
    double v17 = [v14 constraintEqualToAnchor:v16];
    v32[2] = v17;
    double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
    [v25 activateConstraints:v18];

    double v19 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v19 setBounces:0];

    double v20 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v20 setCanCancelContentTouches:0];

    v21 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v21 setScrollsToTop:0];

    double v22 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v22 setShowsHorizontalScrollIndicator:0];

    double v23 = [(HUSearchableItemTableViewController *)self searchBarWrapper];
    [v23 setShowsVerticalScrollIndicator:0];
  }
}

- (HUSearchBar)searchBar
{
  return self->_searchBar;
}

- (unint64_t)searchBarPosition
{
  return self->_searchBarPosition;
}

- (UIScrollView)searchBarWrapper
{
  return self->_searchBarWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarWrapper, 0);

  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end