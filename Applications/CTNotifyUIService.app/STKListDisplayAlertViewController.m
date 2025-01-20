@interface STKListDisplayAlertViewController
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)validateAction:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_simToolkitListItems;
- (id)newTopBar;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_selectListItem:(unint64_t)a3;
- (void)leftNavigationButtonPressed;
- (void)rightNavigationButtonPressed;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STKListDisplayAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_simToolkitListItems
{
  v2 = [(STKBaseAlertViewController *)self sessionAction];
  id v3 = [v2 sessionData];
  v4 = [v3 listItems];

  return v4;
}

- (void)_selectListItem:(unint64_t)a3
{
  id v4 = [(STKBaseAlertViewController *)self sessionAction];
  [v4 sendSuccessWithSelectedItemIndex:a3];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)STKListDisplayAlertViewController;
  [(STKBaseAlertViewController *)&v24 viewDidLoad];
  id v3 = [(STKListDisplayAlertViewController *)self view];
  id v4 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  table = self->_table;
  self->_table = v4;

  [(UITableView *)self->_table setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_table setDelegate:self];
  [(UITableView *)self->_table setDataSource:self];
  v6 = self->_table;
  v7 = +[UIColor clearColor];
  [(UITableView *)v6 setBackgroundColor:v7];

  [(UITableView *)self->_table setAlpha:1.0];
  [(UITableView *)self->_table setOpaque:0];
  [(UITableView *)self->_table setEstimatedRowHeight:100.0];
  [(UITableView *)self->_table setRowHeight:UITableViewAutomaticDimension];
  [v3 addSubview:self->_table];
  v23 = [(UITableView *)self->_table widthAnchor];
  v22 = [v3 widthAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v25[0] = v21;
  v20 = [(UITableView *)self->_table centerXAnchor];
  v18 = v3;
  v19 = [v3 centerXAnchor];
  v8 = [v20 constraintEqualToAnchor:v19];
  v25[1] = v8;
  v9 = [(UITableView *)self->_table topAnchor];
  v10 = [(STKBaseAlertViewController *)self topBar];
  v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v25[2] = v12;
  v13 = [(UITableView *)self->_table bottomAnchor];
  v14 = [v3 safeAreaLayoutGuide];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v25[3] = v16;
  v17 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(STKBaseAlertViewController *)self sessionAction];
  v6 = [v5 sessionData];
  v7 = [v6 text];

  v8 = [(STKBaseAlertViewController *)self sessionAction];
  v9 = [v8 sessionData];
  v10 = [v9 simLabel];

  if (v10)
  {
    v11 = [(STKBaseAlertViewController *)self sessionAction];
    v12 = [v11 sessionData];
    uint64_t v13 = [v12 simLabel];
    v14 = (void *)v13;
    CFStringRef v15 = &stru_100018540;
    if (v7) {
      CFStringRef v15 = v7;
    }
    v16 = +[NSString stringWithFormat:@"(%@) %@", v13, v15];
  }
  else
  {
    CFStringRef v17 = &stru_100018540;
    if (v7) {
      CFStringRef v17 = v7;
    }
    v16 = +[NSString stringWithFormat:@"%@", v17];
  }
  if ([v16 length])
  {
    id v18 = objc_alloc((Class)UILabel);
    [(UITableView *)self->_table bounds];
    id v20 = [v18 initWithSize:v19, 20.0];
    v21 = +[UIColor blackColor];
    [v20 setBackgroundColor:v21];

    v22 = +[UIColor whiteColor];
    [v20 setTextColor:v22];

    [v20 setTextAlignment:1];
    [v20 setText:v16];
    [v20 setNumberOfLines:0];
    [v20 sizeToFit];
    [v20 bounds];
    [v20 setBounds:];
    [(UITableView *)self->_table setTableHeaderView:v20];
  }
  [(UITableView *)self->_table reloadData];
  v23 = [(STKListDisplayAlertViewController *)self view];
  [v23 bringSubviewToFront:self->_table];

  v24.receiver = self;
  v24.super_class = (Class)STKListDisplayAlertViewController;
  [(STKListDisplayAlertViewController *)&v24 viewWillAppear:v3];
}

- (void)leftNavigationButtonPressed
{
  BOOL v3 = [(STKBaseAlertViewController *)self sessionAction];
  [v3 sendResponse:4];

  [(STKBaseAlertViewController *)self dismiss];
}

- (void)rightNavigationButtonPressed
{
  BOOL v3 = [(STKBaseAlertViewController *)self sessionAction];
  [v3 sendResponse:1];

  [(STKBaseAlertViewController *)self dismiss];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(STKListDisplayAlertViewController *)self _simToolkitListItems];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"name"];
  v7 = [(STKListDisplayAlertViewController *)self _simToolkitListItems];
  id v8 = [v5 row];

  v9 = [v7 objectAtIndex:v8];

  if ([v9 isSelected]) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 0;
  }
  [v6 setAccessoryType:v10];
  v11 = [v6 textLabel];
  [v11 setLineBreakMode:0];

  v12 = [v6 textLabel];
  [v12 setNumberOfLines:0];

  uint64_t v13 = [v6 textLabel];
  v14 = [v9 text];
  [v13 setText:v14];

  CFStringRef v15 = [v6 textLabel];
  [v15 setTextAlignment:1];

  v16 = [v6 textLabel];
  CFStringRef v17 = +[UIColor whiteColor];
  [v16 setTextColor:v17];

  id v18 = [v6 textLabel];
  [v18 setOpaque:0];

  double v19 = [v6 textLabel];
  id v20 = +[UIColor clearColor];
  [v19 setBackgroundColor:v20];

  [v6 setOpaque:0];
  v21 = +[UIColor clearColor];
  [v6 setBackgroundColor:v21];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [(UITableView *)self->_table indexPathForSelectedRow];
  if (v5)
  {
    id v6 = v5;
    -[STKListDisplayAlertViewController _selectListItem:](self, "_selectListItem:", [v5 row]);
    [(UITableView *)self->_table deselectRowAtIndexPath:v6 animated:1];
    [(STKBaseAlertViewController *)self dismiss];
    id v5 = v6;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)newTopBar
{
  id v3 = objc_alloc_init((Class)UINavigationBar);
  [v3 setDelegate:self];
  [v3 _setHidesShadow:1];
  [v3 setBarStyle:1];
  id v4 = objc_alloc_init((Class)UIImage);
  [v3 setBackgroundImage:v4 forBarMetrics:0];

  id v5 = objc_alloc((Class)UINavigationItem);
  id v6 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v7 = [v6 localizedStringForKey:@"BACK" value:&stru_100018540 table:@"SIMToolkitUI"];
  id v8 = [v5 initWithTitle:v7];

  [v3 pushNavigationItem:v8 animated:0];
  id v9 = [objc_alloc((Class)UINavigationItem) initWithTitle:&stru_100018540];
  id v10 = objc_alloc((Class)UIBarButtonItem);
  v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CTNotifyUIService"];
  v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_100018540 table:@"SIMToolkitUI"];
  id v13 = [v10 initWithTitle:v12 style:0 target:self action:"rightNavigationButtonPressed"];

  [v9 setRightBarButtonItem:v13];
  [v3 pushNavigationItem:v9 animated:0];

  return v3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  if (objc_opt_respondsToSelector()) {
    [(STKListDisplayAlertViewController *)self performSelector:"leftNavigationButtonPressed" withObject:0];
  }
  return 0;
}

- (void).cxx_destruct
{
}

@end