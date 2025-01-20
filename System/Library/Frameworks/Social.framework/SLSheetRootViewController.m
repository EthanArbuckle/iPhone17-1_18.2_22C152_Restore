@interface SLSheetRootViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)configurationItems;
- (SLComposeServiceViewController)delegate;
- (UIImage)serviceIconImage;
- (UITableView)tableView;
- (UIView)contentView;
- (double)_preferredTableViewHeight;
- (id)navigationItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateCell:(id)a3 withConfigurationItem:(id)a4;
- (void)_updateCellForConfigurationItem:(id)a3;
- (void)dealloc;
- (void)dismissAutoCompletionViewControllerWithContentViewChangeBlock:(id)a3;
- (void)loadView;
- (void)observeConfigurationItems:(id)a3;
- (void)presentAutoCompletionViewController:(id)a3 apparentContentHeight:(double)a4 contentViewChangeBlock:(id)a5;
- (void)resetConfigurationItems;
- (void)setConfigurationItems:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPostButtonEnabled:(BOOL)a3;
- (void)setPostButtonTitle:(id)a3;
- (void)setServiceIconImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateContentViewSize:(CGSize)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SLSheetRootViewController

- (void)dealloc
{
  _SLLog(v2, 7, @"SLSheetRootViewController dealloc");
  [(SLSheetRootViewController *)self resetConfigurationItems];
  v4.receiver = self;
  v4.super_class = (Class)SLSheetRootViewController;
  [(SLSheetRootViewController *)&v4 dealloc];
}

- (void)loadView
{
  _SLLog(v2, 7, @"SLSheetRootViewController loadView");
  v37.receiver = self;
  v37.super_class = (Class)SLSheetRootViewController;
  [(SLSheetRootViewController *)&v37 loadView];
  objc_super v4 = [(SLSheetRootViewController *)self view];
  [v4 setOpaque:0];

  v5 = [(SLSheetRootViewController *)self view];
  [v5 setAutoresizingMask:18];

  [(SLSheetRootViewController *)self setEdgesForExtendedLayout:0];
  v6 = (UITableViewController *)[objc_alloc(MEMORY[0x1E4F42EA8]) initWithStyle:0];
  tableViewController = self->_tableViewController;
  self->_tableViewController = v6;

  [(UITableViewController *)self->_tableViewController willMoveToParentViewController:self];
  [(SLSheetRootViewController *)self addChildViewController:self->_tableViewController];
  v8 = [(SLSheetRootViewController *)self view];
  v9 = [(UITableViewController *)self->_tableViewController view];
  [v8 addSubview:v9];

  v10 = [(SLSheetRootViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(UITableViewController *)self->_tableViewController view];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  v20 = [(UITableViewController *)self->_tableViewController view];
  [v20 setAutoresizingMask:34];

  [(UITableViewController *)self->_tableViewController didMoveToParentViewController:self];
  v21 = [(UITableViewController *)self->_tableViewController tableView];
  [v21 setDelegate:self];

  v22 = [(UITableViewController *)self->_tableViewController tableView];
  [v22 setDataSource:self];

  v23 = [(UITableViewController *)self->_tableViewController tableView];
  [v23 setOpaque:0];

  v24 = [MEMORY[0x1E4F428B8] clearColor];
  v25 = [(UITableViewController *)self->_tableViewController tableView];
  [v25 setBackgroundColor:v24];

  v26 = [(UITableViewController *)self->_tableViewController tableView];
  v27 = [v26 backgroundView];
  [v27 setOpaque:0];

  v28 = [MEMORY[0x1E4F428B8] clearColor];
  v29 = [(UITableViewController *)self->_tableViewController tableView];
  v30 = [v29 backgroundView];
  [v30 setBackgroundColor:v28];

  double v31 = *MEMORY[0x1E4F43D18];
  v32 = [(UITableViewController *)self->_tableViewController tableView];
  [v32 setRowHeight:v31];

  v33 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v33 lineHeight];
  double v35 = v34 + v34;
  v36 = [(UITableViewController *)self->_tableViewController tableView];
  [v36 setEstimatedRowHeight:v35];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SLSheetRootViewController;
  [(SLSheetRootViewController *)&v5 viewDidLoad];
  v3 = [(SLSheetRootViewController *)self tableView];
  [v3 setSeparatorStyle:1];

  objc_super v4 = [(SLSheetRootViewController *)self tableView];
  [v4 _setMarginWidth:0.0];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SLSheetRootViewController;
  [(SLSheetRootViewController *)&v18 viewDidLayoutSubviews];
  objc_super v4 = [(UITableViewController *)self->_tableViewController view];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  [(SLSheetRootViewController *)self _preferredTableViewHeight];
  double v12 = v11;
  double v13 = [(SLSheetRootViewController *)self view];
  [v13 frame];
  double v15 = v14;

  if (v12 >= v15) {
    double v12 = v15;
  }
  double v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v6, v8, v10, v12);
  _SLLog(v2, 7, @"SLSheetRootViewController viewDidLayoutSubviews setting _tableViewController.view.frame to %@");

  double v16 = [(UITableViewController *)self->_tableViewController view];
  objc_msgSend(v16, "setFrame:", v6, v8, v10, v12);
}

- (UITableView)tableView
{
  id v3 = (id)[(SLSheetRootViewController *)self view];
  tableViewController = self->_tableViewController;

  return [(UITableViewController *)tableViewController tableView];
}

- (void)setContentView:(id)a3
{
  p_contentView = &self->_contentView;
  objc_storeStrong((id *)&self->_contentView, a3);
  id v6 = a3;
  double v7 = [(SLSheetRootViewController *)self tableView];
  [v7 bounds];
  double v9 = v8;
  [(UIView *)*p_contentView intrinsicContentSize];
  -[UIView setBounds:](*p_contentView, "setBounds:", 0.0, 0.0, v9, v10);

  double v11 = *p_contentView;
  id v12 = [(SLSheetRootViewController *)self tableView];
  [v12 setTableHeaderView:v11];
}

- (void)setTitle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SLSheetRootViewController;
  id v4 = a3;
  [(SLSheetRootViewController *)&v7 setTitle:v4];
  -[SLSheetTitleView setTitle:](self->_titleView, "setTitle:", v4, v7.receiver, v7.super_class);
  [(SLSheetTitleView *)self->_titleView intrinsicContentSize];
  -[SLSheetTitleView setBounds:](self->_titleView, "setBounds:", 0.0, 0.0, v5, v6);
  [(UINavigationItem *)self->_navItem setTitle:v4];
}

- (void)setServiceIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIconImage, a3);
  id v7 = a3;
  [(SLSheetTitleView *)self->_titleView setServiceIconImage:v7];
  [(SLSheetTitleView *)self->_titleView intrinsicContentSize];
  -[SLSheetTitleView setBounds:](self->_titleView, "setBounds:", 0.0, 0.0, v5, v6);
}

- (void)setPostButtonTitle:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"setPostButtonTitle %@");
  id v6 = [(UINavigationItem *)self->_navItem rightBarButtonItem];
  [v6 setTitle:v5];
}

- (void)setPostButtonEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  BOOL v6 = a3;
  _SLLog(v3, 7, @"setPostButtonEnabled %d");
  id v7 = [(UINavigationItem *)self->_navItem rightBarButtonItem];
  [v7 setEnabled:v4];
}

- (double)_preferredTableViewHeight
{
  uint64_t v2 = [(UITableViewController *)self->_tableViewController tableView];
  objc_msgSend(v2, "sizeThatFits:", 0.0, 1100.0);
  double v4 = v3;

  return v4;
}

- (id)navigationItem
{
  navItem = self->_navItem;
  if (!navItem)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42C00]);
    id v5 = [(SLSheetRootViewController *)self title];
    BOOL v6 = (UINavigationItem *)[v4 initWithTitle:v5];
    id v7 = self->_navItem;
    self->_navItem = v6;

    id v8 = objc_alloc(MEMORY[0x1E4F427C0]);
    double v9 = SLSocialFrameworkBundle();
    double v10 = [v9 localizedStringForKey:@"CANCEL" value:&stru_1F1E28690 table:@"Localizable"];
    double v11 = [(SLSheetRootViewController *)self delegate];
    id v12 = (void *)[v8 initWithTitle:v10 style:0 target:v11 action:sel_cancelButtonTapped_];
    [(UINavigationItem *)self->_navItem setLeftBarButtonItem:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F427C0]);
    double v14 = SLSocialFrameworkBundle();
    double v15 = [v14 localizedStringForKey:@"POST" value:&stru_1F1E28690 table:@"Localizable"];
    double v16 = [(SLSheetRootViewController *)self delegate];
    double v17 = (void *)[v13 initWithTitle:v15 style:2 target:v16 action:sel_postButtonTapped_];
    [(UINavigationItem *)self->_navItem setRightBarButtonItem:v17];

    objc_super v18 = objc_alloc_init(SLSheetTitleView);
    titleView = self->_titleView;
    self->_titleView = v18;

    v20 = self->_titleView;
    v21 = [(SLSheetRootViewController *)self serviceIconImage];
    [(SLSheetTitleView *)v20 setServiceIconImage:v21];

    v22 = self->_titleView;
    v23 = [(SLSheetRootViewController *)self title];
    [(SLSheetTitleView *)v22 setTitle:v23];

    [(SLSheetTitleView *)self->_titleView intrinsicContentSize];
    -[SLSheetTitleView setBounds:](self->_titleView, "setBounds:", 0.0, 0.0, v24, v25);
    [(UINavigationItem *)self->_navItem setTitleView:self->_titleView];
    navItem = self->_navItem;
  }

  return navItem;
}

- (void)updateContentViewSize:(CGSize)a3
{
  double height = a3.height;
  id v12 = [MEMORY[0x1E4F29238] valueWithCGSize:a3.width];
  _SLLog(v3, 7, @"SLSheetRootViewController updateContentViewSize: %@");

  BOOL v6 = [(SLSheetRootViewController *)self tableView];
  [v6 bounds];
  double v8 = v7;
  double v9 = [(SLSheetRootViewController *)self contentView];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v8, height);

  if (!self->_autoCompletionViewController)
  {
    double v10 = [(SLSheetRootViewController *)self contentView];
    double v11 = [(SLSheetRootViewController *)self tableView];
    [v11 setTableHeaderView:v10];
  }
  id v13 = [(SLSheetRootViewController *)self view];
  [v13 setNeedsLayout];
}

- (void)presentAutoCompletionViewController:(id)a3 apparentContentHeight:(double)a4 contentViewChangeBlock:(id)a5
{
  double v9 = (UIViewController *)a3;
  id v10 = a5;
  _SLLog(v5, 7, @"SLSheetRootViewController presentAutoCompletionViewController:");
  autoCompletionViewController = self->_autoCompletionViewController;
  self->_autoCompletionViewController = v9;
  id v12 = v9;

  id v13 = [(SLSheetRootViewController *)self tableView];
  [v13 setTableHeaderView:0];

  double v14 = [(SLSheetRootViewController *)self view];
  double v15 = [(SLSheetRootViewController *)self contentView];
  [v14 addSubview:v15];

  double v16 = [(SLSheetRootViewController *)self tableView];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = [(SLSheetRootViewController *)self contentView];
  [v25 frame];
  double v27 = v20 + v26;

  v28 = [(SLSheetRootViewController *)self contentView];
  [v28 frame];
  double v30 = v24 - v29;

  double v31 = [(SLSheetRootViewController *)self tableView];
  objc_msgSend(v31, "setFrame:", v18, v27, v22, v30);

  v32 = [(UIViewController *)self->_autoCompletionViewController view];
  [v32 setAlpha:0.0];

  [(UIViewController *)self->_autoCompletionViewController willMoveToParentViewController:self];
  [(SLSheetRootViewController *)self addChildViewController:self->_autoCompletionViewController];
  v33 = [(SLSheetRootViewController *)self view];
  double v34 = [(UIViewController *)self->_autoCompletionViewController view];
  [v33 addSubview:v34];

  [(UIViewController *)self->_autoCompletionViewController didMoveToParentViewController:self];
  double v35 = [(SLSheetRootViewController *)self view];
  [v35 bounds];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  v44 = [(SLSheetRootViewController *)self contentView];
  [v44 frame];
  double v46 = v39 + v45 + a4;

  v47 = [(UIViewController *)self->_autoCompletionViewController view];
  objc_msgSend(v47, "setFrame:", v37, v46, v41, v43 - v46);

  v48 = [(UIViewController *)self->_autoCompletionViewController view];
  [v48 setAutoresizingMask:18];

  v49 = [(SLSheetRootViewController *)self view];
  v50 = [(UIViewController *)self->_autoCompletionViewController view];
  [v49 bringSubviewToFront:v50];

  v51 = (void *)MEMORY[0x1E4F42FF0];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __110__SLSheetRootViewController_presentAutoCompletionViewController_apparentContentHeight_contentViewChangeBlock___block_invoke;
  v53[3] = &unk_1E6467460;
  v53[4] = self;
  id v54 = v10;
  id v52 = v10;
  [v51 animateWithDuration:v53 animations:0.200000003];
}

uint64_t __110__SLSheetRootViewController_presentAutoCompletionViewController_apparentContentHeight_contentViewChangeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tableView];
  [v2 setAlpha:0.0];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1008) view];
  [v3 setAlpha:1.0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)dismissAutoCompletionViewControllerWithContentViewChangeBlock:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLSheetRootViewController dismissAutoCompletionViewController");
  BOOL v6 = [(SLSheetRootViewController *)self tableView];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(SLSheetRootViewController *)self contentView];
  [v13 frame];
  double v15 = v14;

  double v16 = [(SLSheetRootViewController *)self tableView];
  objc_msgSend(v16, "setFrame:", v8, v15, v10, v12);

  double v17 = (void *)MEMORY[0x1E4F42FF0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke;
  v20[3] = &unk_1E6467460;
  v20[4] = self;
  id v21 = v5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke_2;
  v19[3] = &unk_1E64678C8;
  v19[4] = self;
  id v18 = v5;
  [v17 animateWithDuration:v20 animations:v19 completion:0.200000003];
}

uint64_t __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tableView];
  [v2 setAlpha:1.0];

  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1008) view];
  [v3 setAlpha:0.0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) tableView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = [*(id *)(a1 + 32) contentView];
  [v10 frame];
  double v12 = v9 + v11;

  _SLLog(v1, 7, @"presentAutoCompletionViewController restored tableView.frame %g %g %g %g");
  id v13 = objc_msgSend(*(id *)(a1 + 32), "tableView", *(void *)&v5, 0, *(void *)&v7, *(void *)&v12);
  objc_msgSend(v13, "setFrame:", v5, 0.0, v7, v12);

  double v14 = [*(id *)(a1 + 32) contentView];
  double v15 = [*(id *)(a1 + 32) tableView];
  [v15 setTableHeaderView:v14];

  [*(id *)(*(void *)(a1 + 32) + 1008) willMoveToParentViewController:0];
  [*(id *)(*(void *)(a1 + 32) + 1008) removeFromParentViewController];
  double v16 = [*(id *)(*(void *)(a1 + 32) + 1008) view];
  [v16 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 32) + 1008) didMoveToParentViewController:0];
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 1008);
  *(void *)(v17 + 1008) = 0;
}

- (void)resetConfigurationItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_configurationItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "setChangeObserver:", 0, (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  configurationItems = self->_configurationItems;
  self->_configurationItems = 0;
}

- (void)observeConfigurationItems:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_configurationItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setChangeObserver:", self, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setConfigurationItems:(id)a3
{
  id v4 = a3;
  [(SLSheetRootViewController *)self resetConfigurationItems];
  uint64_t v5 = (NSArray *)[v4 copy];

  configurationItems = self->_configurationItems;
  self->_configurationItems = v5;

  [(SLSheetRootViewController *)self observeConfigurationItems:self->_configurationItems];
  uint64_t v7 = [(SLSheetRootViewController *)self tableView];
  [v7 reloadData];

  id v8 = [(SLSheetRootViewController *)self view];
  [v8 setNeedsLayout];
}

- (NSArray)configurationItems
{
  return self->_configurationItems;
}

- (void)_updateCellForConfigurationItem:(id)a3
{
  id v7 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[NSArray indexOfObject:](self->_configurationItems, "indexOfObject:"), 0);
  uint64_t v5 = [(SLSheetRootViewController *)self tableView];
  uint64_t v6 = [v5 cellForRowAtIndexPath:v4];

  if (v6)
  {
    [(SLSheetRootViewController *)self _updateCell:v6 withConfigurationItem:v7];
    [v6 setNeedsLayout];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_configurationItems count];
}

- (void)_updateCell:(id)a3 withConfigurationItem:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 title];
  id v7 = [v14 textLabel];
  [v7 setText:v6];

  id v8 = [v5 value];
  long long v9 = [v14 detailTextLabel];
  [v9 setText:v8];

  if ([v5 valuePending])
  {
    long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [v14 setAccessoryView:v10];
    [v10 startAnimating];
    [v14 setSelectionStyle:2];
  }
  else
  {
    long long v11 = [v5 tapHandler];

    [v14 setAccessoryView:0];
    if (v11)
    {
      [v14 setAccessoryType:1];
      long long v12 = v14;
      uint64_t v13 = 2;
    }
    else
    {
      [v14 setAccessoryType:0];
      long long v12 = v14;
      uint64_t v13 = 0;
    }
    [v12 setSelectionStyle:v13];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"SLComposeSheetConfigurationItemCell"];
  if (!v7)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:1 reuseIdentifier:@"SLComposeSheetConfigurationItemCell"];
    [v7 setAccessoryType:1];
    [v7 separatorInset];
    objc_msgSend(v7, "setSeparatorInset:");
  }
  id v8 = -[NSArray objectAtIndexedSubscript:](self->_configurationItems, "objectAtIndexedSubscript:", [v6 row]);
  [(SLSheetRootViewController *)self _updateCell:v7 withConfigurationItem:v8];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setOpaque:0];
  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  configurationItems = self->_configurationItems;
  id v6 = a4;
  -[NSArray objectAtIndexedSubscript:](configurationItems, "objectAtIndexedSubscript:", [v6 row]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v10 tapHandler];

  if (v7)
  {
    id v8 = [v10 tapHandler];
    v8[2]();
  }
  long long v9 = [(SLSheetRootViewController *)self tableView];
  [v9 deselectRowAtIndexPath:v6 animated:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SLComposeServiceViewController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SLComposeServiceViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIImage)serviceIconImage
{
  return self->_serviceIconImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIconImage, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoCompletionViewController, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);

  objc_storeStrong((id *)&self->_configurationItems, 0);
}

@end