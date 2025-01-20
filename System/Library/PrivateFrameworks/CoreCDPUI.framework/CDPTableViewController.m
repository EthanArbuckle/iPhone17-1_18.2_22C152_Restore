@interface CDPTableViewController
- (BFFPaneHeaderView)headerView;
- (BOOL)isIPad;
- (BOOL)isiPhone5OrSmaller;
- (BOOL)uiTestMode;
- (CDPTableViewController)initWithTitle:(id)a3 subTitle:(id)a4;
- (NSString)deviceClass;
- (NSString)headerSubTitle;
- (NSString)headerTitle;
- (UIImage)icon;
- (UITableView)tableView;
- (UIView)containerView;
- (double)heightForHeaderInTableView:(id)a3;
- (id)completionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (void)loadView;
- (void)setCompletionHandler:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setHeaderSubTitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIcon:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewStyle:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CDPTableViewController

- (CDPTableViewController)initWithTitle:(id)a3 subTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPTableViewController;
  v9 = [(CDPTableViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_headerTitle, a3);
    objc_storeStrong((id *)&v10->_headerSubTitle, a4);
    v10->_tableViewStyle = 1;
  }

  return v10;
}

- (NSString)deviceClass
{
  v2 = [MEMORY[0x263F343A8] sharedInstance];
  v3 = [v2 deviceClass];

  return (NSString *)v3;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  containerView = self->_containerView;
  self->_containerView = v8;

  v10 = self->_containerView;
  v11 = [getBFFStyleClass() sharedStyle];
  -[UIView setBackgroundColor:](v10, "setBackgroundColor:", [v11 backgroundColor]);

  objc_super v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82C78]), "initWithFrame:style:", self->_tableViewStyle, v4, v5, v6, v7);
  [(CDPTableViewController *)self setTableView:v12];

  v13 = [(CDPTableViewController *)self tableView];
  [v13 setDelegate:self];

  v14 = [(CDPTableViewController *)self tableView];
  [v14 setDataSource:self];

  v15 = [(CDPTableViewController *)self tableView];
  v16 = [MEMORY[0x263F825C8] clearColor];
  [v15 setBackgroundColor:v16];

  v17 = [(CDPTableViewController *)self tableView];
  [v17 setBackgroundView:0];

  v18 = [(CDPTableViewController *)self tableView];
  [v18 setAlwaysBounceVertical:0];

  v19 = self->_containerView;
  v20 = [(UITableView *)self->_tableView panGestureRecognizer];
  [(UIView *)v19 addGestureRecognizer:v20];

  [(UIView *)self->_containerView addSubview:self->_tableView];
  v21 = self->_containerView;

  [(CDPTableViewController *)self setView:v21];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPTableViewController;
  -[CDPTableViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  double v5 = [(CDPTableViewController *)self tableView];
  double v6 = [v5 indexPathForSelectedRow];

  if (v6)
  {
    double v7 = [(CDPTableViewController *)self tableView];
    id v8 = [(CDPTableViewController *)self tableView];
    v9 = [v8 indexPathForSelectedRow];
    [v7 deselectRowAtIndexPath:v9 animated:v3];
  }
}

- (BFFPaneHeaderView)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    double v4 = (void *)getBFFPaneHeaderViewClass_softClass_0;
    uint64_t v15 = getBFFPaneHeaderViewClass_softClass_0;
    if (!getBFFPaneHeaderViewClass_softClass_0)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __getBFFPaneHeaderViewClass_block_invoke_0;
      v11[3] = &unk_26433D708;
      v11[4] = &v12;
      __getBFFPaneHeaderViewClass_block_invoke_0((uint64_t)v11);
      double v4 = (void *)v13[3];
    }
    double v5 = v4;
    _Block_object_dispose(&v12, 8);
    double v6 = (BFFPaneHeaderView *)objc_alloc_init(v5);
    double v7 = self->_headerView;
    self->_headerView = v6;

    [(BFFPaneHeaderView *)self->_headerView setTitleText:self->_headerTitle];
    headerSubTitle = self->_headerSubTitle;
    v9 = [(BFFPaneHeaderView *)self->_headerView detailTextLabel];
    [v9 setText:headerSubTitle];

    [(BFFPaneHeaderView *)self->_headerView setIcon:self->_icon];
    headerView = self->_headerView;
  }

  return headerView;
}

- (void)setHeaderTitle:(id)a3
{
  double v4 = (NSString *)[a3 copy];
  headerTitle = self->_headerTitle;
  self->_headerTitle = v4;

  headerView = self->_headerView;
  double v7 = self->_headerTitle;

  [(BFFPaneHeaderView *)headerView setTitleText:v7];
}

- (void)setHeaderSubTitle:(id)a3
{
  double v4 = (NSString *)[a3 copy];
  headerSubTitle = self->_headerSubTitle;
  self->_headerSubTitle = v4;

  double v6 = self->_headerSubTitle;
  id v7 = [(BFFPaneHeaderView *)self->_headerView detailTextLabel];
  [v7 setText:v6];
}

- (BOOL)isIPad
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (BOOL)isiPhone5OrSmaller
{
  if ([(CDPTableViewController *)self isIPad]) {
    return 0;
  }
  BOOL v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 _referenceBounds];
  BOOL v2 = v4 <= 568.0;

  return v2;
}

- (BOOL)uiTestMode
{
  return CFPreferencesGetAppBooleanValue(@"UITest", @"com.apple.corecdp", 0) != 0;
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)CDPTableViewController;
  [(CDPTableViewController *)&v20 viewDidLayoutSubviews];
  [(UIView *)self->_containerView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CDPTableViewController *)self navigationController];
  uint64_t v12 = [v11 modalPresentationStyle];

  v13 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if (v14 == 1 && v12 == 0)
  {
    v16 = [getBFFStyleClass() sharedStyle];
    [v16 edgeInsetsForTable:self->_tableView];
    double v4 = v17;
    double v19 = v18;

    double v8 = v8 - (v4 + v19);
  }
  -[UITableView setFrame:](self->_tableView, "setFrame:", v4, v6, v8, v10);
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4 = a3;
  double v5 = [(CDPTableViewController *)self headerView];
  [v4 bounds];
  [v5 heightForWidth:v4 inView:v6];
  double v8 = v7;

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x263F82C80]);

  return v4;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubTitle
{
  return self->_headerSubTitle;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_headerSubTitle, 0);

  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end