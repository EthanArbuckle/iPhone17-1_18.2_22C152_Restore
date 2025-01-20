@interface ProfileBuddyViewController
- (NSArray)dataEntryItems;
- (ProfileBuddyViewController)init;
- (ProfileBuddyViewController)initWithBuddyFlowUserInfo:(id)a3;
- (ProfileBuddyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ProfileBuddyViewControllerDelegate)delegate;
- (WDBuddyFlowUserInfo)buddyFlowUserInfo;
- (id)_createTableFooterView;
- (id)_createTableHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureHeaderView:(id)a3;
- (void)_localeDidChange:(id)a3;
- (void)_setupObservers;
- (void)_updateForCurrentSizeCategory;
- (void)continueButtonTapped:(id)a3;
- (void)dataEntryItemDonePressed:(id)a3;
- (void)dataEntryItemNextPressed:(id)a3;
- (void)dataEntryItemPrevPressed:(id)a3;
- (void)dealloc;
- (void)focusItemAtIndex:(int64_t)a3;
- (void)setDataEntryItems:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUpHeaderAndFooterViewsIfNeeded;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ProfileBuddyViewController

- (ProfileBuddyViewController)init
{
  v3 = [MEMORY[0x1E4F67880] buddyFlowUserInfoWithDemographicsInformation:0];
  v4 = [(ProfileBuddyViewController *)self initWithBuddyFlowUserInfo:v3];

  return v4;
}

- (ProfileBuddyViewController)initWithBuddyFlowUserInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ProfileBuddyViewController;
  v6 = [(ProfileBuddyViewController *)&v9 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userInfo, a3);
    v7->_hasSetUpHeaderAndFooterViews = 0;
  }

  return v7;
}

- (WDBuddyFlowUserInfo)buddyFlowUserInfo
{
  return self->_userInfo;
}

- (ProfileBuddyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ProfileBuddyViewController;
  [(ProfileBuddyViewController *)&v4 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfileBuddyViewController;
  [(ProfileBuddyViewController *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(ProfileBuddyViewController *)self traitCollection];
    uint64_t v6 = [v5 preferredContentSizeCategory];
    v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__ProfileBuddyViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E5E7CB60;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __55__ProfileBuddyViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentSizeCategory];
}

- (void)_setupObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__localeDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
}

- (NSArray)dataEntryItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dataEntryItems = self->_dataEntryItems;
  if (!dataEntryItems)
  {
    dataEntryItems = self->_userInfo;
    if (dataEntryItems)
    {
      id v4 = [dataEntryItems defaultDataEntryItems];
      id v5 = self->_dataEntryItems;
      self->_dataEntryItems = v4;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v6 = self->_dataEntryItems;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setToolbarDelegate:", self, (void)v12);
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v8);
      }

      dataEntryItems = self->_dataEntryItems;
    }
  }
  return (NSArray *)dataEntryItems;
}

- (void)continueButtonTapped:(id)a3
{
  id v4 = [(ProfileBuddyViewController *)self view];
  [v4 endEditing:1];

  id v5 = [(ProfileBuddyViewController *)self delegate];
  [v5 profileBuddyViewControllerDidTapContinue:self];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ProfileBuddyViewController;
  [(HKTableViewController *)&v6 viewDidLoad];
  id v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v4 = [(ProfileBuddyViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(ProfileBuddyViewController *)self tableView];
  [v5 setKeyboardDismissMode:1];

  [(ProfileBuddyViewController *)self _updateForCurrentSizeCategory];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ProfileBuddyViewController;
  [(ProfileBuddyViewController *)&v10 viewWillAppear:a3];
  [(ProfileBuddyViewController *)self setUpHeaderAndFooterViewsIfNeeded];
  id v4 = [(ProfileBuddyViewController *)self navigationController];
  [v4 setNavigationBarHidden:0 animated:0];

  id v5 = [(ProfileBuddyViewController *)self navigationController];
  objc_super v6 = [v5 navigationBar];
  [v6 _setHidesShadow:1];

  uint64_t v7 = [(ProfileBuddyViewController *)self navigationController];
  uint64_t v8 = [v7 navigationBar];
  uint64_t v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v8 setBarTintColor:v9];
}

- (void)setUpHeaderAndFooterViewsIfNeeded
{
  if (!self->_hasSetUpHeaderAndFooterViews)
  {
    id v3 = [(ProfileBuddyViewController *)self _createTableHeaderView];
    headerView = self->_headerView;
    self->_headerView = v3;

    id v5 = [(ProfileBuddyViewController *)self _createTableFooterView];
    footerView = self->_footerView;
    self->_footerView = v5;

    uint64_t v7 = self->_headerView;
    uint64_t v8 = [(ProfileBuddyViewController *)self tableView];
    [v8 setTableHeaderView:v7];

    uint64_t v9 = self->_footerView;
    objc_super v10 = [(ProfileBuddyViewController *)self tableView];
    [v10 setTableFooterView:v9];

    self->_hasSetUpHeaderAndFooterViews = 1;
  }
}

- (void)_updateForCurrentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 _scaledValueForValue:60.0];
  double v4 = v3;
  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    double v5 = *MEMORY[0x1E4FB2F28];
    objc_super v6 = [(ProfileBuddyViewController *)self tableView];
    [v6 setRowHeight:v5];

    uint64_t v7 = [(ProfileBuddyViewController *)self tableView];
    [v7 setEstimatedRowHeight:v4];
  }
  else
  {
    uint64_t v7 = [(ProfileBuddyViewController *)self tableView];
    [v7 setRowHeight:v4];
  }

  [(ProfileBuddyViewController *)self _configureHeaderView:self->_headerView];
  uint64_t v8 = [(ProfileBuddyViewController *)self tableView];
  [v8 reloadData];
}

- (id)_createTableHeaderView
{
  double v3 = [(ProfileBuddyViewController *)self view];
  [v3 frame];
  double Height = CGRectGetHeight(v17);
  double v5 = [(ProfileBuddyViewController *)self view];
  [v5 frame];
  double v7 = (Height + v6) * 0.33 + -64.0;

  if (v7 < 150.0) {
    double v7 = 150.0;
  }
  uint64_t v8 = [(ProfileBuddyViewController *)self tableView];
  [v8 frame];
  double Width = CGRectGetWidth(v18);

  objc_super v10 = (void *)[objc_alloc(MEMORY[0x1E4F67C80]) initWithTopInset:self parentViewController:v7];
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  long long v12 = [v11 localizedStringForKey:@"HEALTH_DETAILS do not loc" value:&stru_1F04402E8 table:0];
  [v10 setTitleText:v12];

  long long v13 = [v10 widthAnchor];
  long long v14 = [v13 constraintEqualToConstant:Width];
  [v14 setActive:1];

  [(ProfileBuddyViewController *)self _configureHeaderView:v10];
  return v10;
}

- (void)_configureHeaderView:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F28B50];
  id v13 = a3;
  double v5 = [v4 mainBundle];
  double v6 = [v5 localizedStringForKey:@"HEALTH_DETAILS_DESCRIPTION do not loc" value:&stru_1F04402E8 table:0];
  [v13 setBodyText:v6];

  [v13 setBodyTextAlignment:0];
  double v7 = [(ProfileBuddyViewController *)self tableView];
  [v7 frame];
  objc_msgSend(v13, "systemLayoutSizeFittingSize:", v8, *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v10, v12);
  [v13 setBodyTextAlignment:1];
}

- (id)_createTableFooterView
{
  double v3 = [(ProfileBuddyViewController *)self tableView];
  [v3 frame];
  double Width = CGRectGetWidth(v9);

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F67878]) initWithTarget:self action:sel_continueButtonTapped_ bottomInset:1 width:40.0 isLastScreen:Width];
  double v6 = [v5 continueButton];
  [v6 addTarget:self action:sel_continueButtonTapped_ forEvents:64];

  return v5;
}

- (void)_localeDidChange:(id)a3
{
}

- (void)dataEntryItemDonePressed:(id)a3
{
  id v3 = [(ProfileBuddyViewController *)self view];
  [v3 endEditing:0];
}

- (void)dataEntryItemPrevPressed:(id)a3
{
  uint64_t v4 = [(NSArray *)self->_dataEntryItems indexOfObject:a3];
  if (v4 <= 0) {
    uint64_t v4 = [(NSArray *)self->_dataEntryItems count];
  }
  [(ProfileBuddyViewController *)self focusItemAtIndex:v4 - 1];
}

- (void)dataEntryItemNextPressed:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_dataEntryItems indexOfObject:a3];
  if (v4 + 1 < [(NSArray *)self->_dataEntryItems count]) {
    NSUInteger v5 = v4 + 1;
  }
  else {
    NSUInteger v5 = 0;
  }
  [(ProfileBuddyViewController *)self focusItemAtIndex:v5];
}

- (void)focusItemAtIndex:(int64_t)a3
{
  -[NSArray objectAtIndexedSubscript:](self->_dataEntryItems, "objectAtIndexedSubscript:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 beginEditing];
  NSUInteger v5 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  double v6 = [(ProfileBuddyViewController *)self tableView];
  [v6 scrollToRowAtIndexPath:v5 atScrollPosition:3 animated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  NSUInteger v4 = [(ProfileBuddyViewController *)self dataEntryItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(ProfileBuddyViewController *)self dataEntryItems];
  uint64_t v7 = [v5 row];

  double v8 = [v6 objectAtIndex:v7];

  CGRect v9 = [v8 cell];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = [(ProfileBuddyViewController *)self dataEntryItems];
  uint64_t v8 = [v6 row];

  id v9 = [v7 objectAtIndex:v8];

  [v9 beginEditing];
}

- (ProfileBuddyViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ProfileBuddyViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataEntryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end