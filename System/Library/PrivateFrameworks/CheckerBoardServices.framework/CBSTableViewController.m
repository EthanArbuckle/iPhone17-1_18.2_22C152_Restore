@interface CBSTableViewController
- (BOOL)isTitleAlignedByLastBaseline;
- (CGRect)containerFooterViewFrame;
- (NSAttributedString)attributedDetailDescriptionText;
- (NSString)detailDescriptionText;
- (NSString)titleText;
- (UITableView)tableView;
- (UIView)containerFooterView;
- (double)headerToFooterViewSpacing;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)footerView;
- (id)headerView;
- (id)iconName;
- (id)iconTintColor;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupFooterView;
- (void)_setupTableView;
- (void)_setupView;
- (void)_updateHeaderView;
- (void)setAttributedDetailDescriptionText:(id)a3;
- (void)setContainerFooterView:(id)a3;
- (void)setContainerFooterViewFrame:(CGRect)a3;
- (void)setDetailDescriptionText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidLoad;
@end

@implementation CBSTableViewController

- (void)viewDidLoad
{
  v3 = CheckerBoardLogHandleForCategory(4);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23EA9B000, v3, OS_LOG_TYPE_DEFAULT, "Created a square", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CBSTableViewController;
  [(CBSTableViewController *)&v4 viewDidLoad];
  [(CBSTableViewController *)self _setupView];
  [(CBSTableViewController *)self _updateHeaderView];
}

- (void)_setupView
{
  [(CBSTableViewController *)self _setupTableView];
  [(CBSTableViewController *)self _setupFooterView];
}

- (void)_setupTableView
{
  id v3 = objc_alloc(MEMORY[0x263F1CA40]);
  objc_super v4 = [(CBSTableViewController *)self view];
  [v4 frame];
  v5 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v5;

  v7 = [MEMORY[0x263F1C550] clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v7];

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAutoresizingMask:18];
  id v8 = [(CBSTableViewController *)self view];
  [v8 addSubview:self->_tableView];
}

- (void)_updateHeaderView
{
  id v3 = [(CBSTableViewController *)self headerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v16 = [(CBSTableViewController *)self titleText];
    v5 = [(CBSTableViewController *)self detailDescriptionText];
    v6 = [(CBSTableViewController *)self attributedDetailDescriptionText];
    v7 = [(CBSTableViewController *)self iconName];
    id v8 = [(CBSTableViewController *)self iconTintColor];
    v9 = [(CBSTableViewController *)self headerView];
    if ([v16 length] || objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
    {
      [v9 setTitleText:v16];
      uint64_t v10 = [v6 length];
      v11 = [v9 detailTextLabel];
      v12 = v11;
      if (v10) {
        [v11 setAttributedText:v6];
      }
      else {
        [v11 setText:v5];
      }
    }
    if (v7 && [v7 length])
    {
      v13 = [MEMORY[0x263F1C6B0] imageNamed:v7];
      v14 = v13;
      if (v8)
      {
        uint64_t v15 = [v13 _flatImageWithColor:v8];

        v14 = (void *)v15;
      }
      [v9 setIcon:v14];
    }
  }
}

- (void)_setupFooterView
{
  id v3 = [(CBSTableViewController *)self footerView];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    v5 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    v7 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, 0.0, dbl_23EAA3600[(v6 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
    [(CBSTableViewController *)self setContainerFooterView:v7];

    id v8 = [(CBSTableViewController *)self containerFooterView];
    [v8 frame];
    -[CBSTableViewController setContainerFooterViewFrame:](self, "setContainerFooterViewFrame:");

    id v10 = [(CBSTableViewController *)self containerFooterView];
    v9 = [(CBSTableViewController *)self footerView];
    [v10 addSubview:v9];
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return *MEMORY[0x263F1D600];
  }
  id v6 = a3;
  v7 = [(CBSTableViewController *)self headerView];
  [v6 frame];
  double v9 = v8;

  objc_msgSend(v7, "systemLayoutSizeFittingSize:", v9, *(double *)(MEMORY[0x263F1D490] + 8));
  double v11 = v10;
  [(CBSTableViewController *)self headerToFooterViewSpacing];
  double v4 = v11 + v12;

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  if (a4) {
    return *MEMORY[0x263F1D600];
  }
  v5 = [(CBSTableViewController *)self containerFooterView];
  [v5 frame];
  double v4 = v6;

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [(CBSTableViewController *)self headerView];
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [(CBSTableViewController *)self containerFooterView];
  }
  return v6;
}

- (void)setTitleText:(id)a3
{
  if (self->_titleText != a3)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    if ([(CBSTableViewController *)self isViewLoaded]) {
      [(CBSTableViewController *)self _updateHeaderView];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)setDetailDescriptionText:(id)a3
{
  if (self->_detailDescriptionText != a3)
  {
    objc_storeStrong((id *)&self->_detailDescriptionText, a3);
    if ([(CBSTableViewController *)self isViewLoaded]) {
      [(CBSTableViewController *)self _updateHeaderView];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)setAttributedDetailDescriptionText:(id)a3
{
  if (self->_attributedDetailDescriptionText != a3)
  {
    objc_storeStrong((id *)&self->_attributedDetailDescriptionText, a3);
    if ([(CBSTableViewController *)self isViewLoaded]) {
      [(CBSTableViewController *)self _updateHeaderView];
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    id v4 = objc_alloc(MEMORY[0x263F68038]);
    uint64_t v5 = (BFFPaneHeaderView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_headerView;
    self->_headerView = v5;

    headerView = self->_headerView;
  }
  return headerView;
}

- (id)iconName
{
  return 0;
}

- (id)iconTintColor
{
  return 0;
}

- (double)headerToFooterViewSpacing
{
  return 0.0;
}

- (id)footerView
{
  return 0;
}

- (BOOL)isTitleAlignedByLastBaseline
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CBSTableViewController numberOfSectionsInTableView:]", "CBSTableViewController.m", 232, "0");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = a3;
  __assert_rtn("-[CBSTableViewController tableView:numberOfRowsInSection:]", "CBSTableViewController.m", 239, "0");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CBSTableViewController tableView:cellForRowAtIndexPath:]", "CBSTableViewController.m", 246, "0");
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (CGRect)containerFooterViewFrame
{
  double x = self->_containerFooterViewFrame.origin.x;
  double y = self->_containerFooterViewFrame.origin.y;
  double width = self->_containerFooterViewFrame.size.width;
  double height = self->_containerFooterViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerFooterViewFrame:(CGRect)a3
{
  self->_containerFooterViewFrame = a3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailDescriptionText
{
  return self->_detailDescriptionText;
}

- (NSAttributedString)attributedDetailDescriptionText
{
  return self->_attributedDetailDescriptionText;
}

- (UIView)containerFooterView
{
  return self->_containerFooterView;
}

- (void)setContainerFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerFooterView, 0);
  objc_storeStrong((id *)&self->_attributedDetailDescriptionText, 0);
  objc_storeStrong((id *)&self->_detailDescriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end