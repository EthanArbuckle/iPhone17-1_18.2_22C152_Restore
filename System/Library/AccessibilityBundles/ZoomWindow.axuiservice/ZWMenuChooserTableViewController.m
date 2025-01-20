@interface ZWMenuChooserTableViewController
- (BOOL)_canShowWhileLocked;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ZWMenuChooserTableViewController

- (void)loadView
{
  id v9 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v3 = objc_alloc((Class)UIVisualEffectView);
  v4 = +[UIBlurEffect effectWithStyle:19];
  id v5 = [v3 initWithEffect:v4];

  v6 = [v5 contentView];
  [v6 addSubview:v9];

  [(ZWMenuChooserTableViewController *)self setView:v5];
  [(ZWMenuChooserTableViewController *)self setTableView:v9];
  [v9 setDelegate:self];
  [v9 setDataSource:self];
  [v9 setScrollEnabled:0];
  [v9 setAutoresizingMask:18];
  v7 = +[UIColor clearColor];
  [v9 setBackgroundColor:v7];

  objc_msgSend(v9, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v8 = +[UIColor whiteColor];
  [v9 setTintColor:v8];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ZWMenuChooserTableViewController;
  [(ZWMenuChooserTableViewController *)&v6 viewDidLoad];
  id v3 = [(ZWMenuChooserTableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:ZWMenuItemCellReuseID];

  v4 = [(ZWMenuChooserTableViewController *)self tableView];
  [v4 setEstimatedRowHeight:44.0];

  id v5 = [(ZWMenuChooserTableViewController *)self tableView];
  [v5 setRowHeight:UITableViewAutomaticDimension];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ZWMenuChooserTableViewController;
  [(ZWMenuChooserTableViewController *)&v9 viewWillAppear:a3];
  if (ZWUseVibrantBlendModes())
  {
    v4 = +[UIColor colorWithWhite:0.25 alpha:1.0];
    id v5 = [(ZWMenuChooserTableViewController *)self tableView];
    [v5 setSeparatorColor:v4];

    objc_super v6 = +[UIBlurEffect effectWithStyle:2];
    v7 = +[UIVibrancyEffect effectForBlurEffect:v6];
    v8 = [(ZWMenuChooserTableViewController *)self tableView];
    [v8 setSeparatorEffect:v7];
  }
  else
  {
    objc_super v6 = +[UIColor colorWithWhite:0.5 alpha:1.0];
    v7 = [(ZWMenuChooserTableViewController *)self tableView];
    [v7 setSeparatorColor:v6];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ZWMenuChooserTableViewController;
  [(ZWMenuChooserTableViewController *)&v6 viewDidAppear:a3];
  v4 = [(ZWMenuChooserTableViewController *)self tableView];
  [v4 layoutIfNeeded];

  id v5 = [(ZWMenuChooserTableViewController *)self tableView];
  [v5 contentSize];
  -[ZWMenuChooserTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)ZWMenuChooserTableViewController;
  [(ZWMenuChooserTableViewController *)&v10 viewDidLayoutSubviews];
  id v3 = [(ZWMenuChooserTableViewController *)self tableView];
  [v3 contentSize];
  double v5 = v4;
  objc_super v6 = [(ZWMenuChooserTableViewController *)self tableView];
  [v6 bounds];
  BOOL v8 = v5 > v7;
  objc_super v9 = [(ZWMenuChooserTableViewController *)self tableView];
  [v9 setScrollEnabled:v8];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [v13 deselectRowAtIndexPath:v6 animated:1];
  double v7 = (char *)[v13 numberOfRowsInSection:0];
  if (v7)
  {
    BOOL v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_super v10 = +[NSIndexPath indexPathForRow:i inSection:0];
      v11 = [v13 cellForRowAtIndexPath:v10];
      if (i == [v6 row]) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 0;
      }
      [v11 setAccessoryType:v12];
    }
  }
  [(ZWMenuChooserTableViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  double v4 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", ZWMenuItemCellReuseID, a4);
  if (ZWUseVibrantBlendModes())
  {
    if (!UIAccessibilityIsInvertColorsEnabled()) {
      [v4 _setDrawsAsBackdropOverlayWithBlendMode:3];
    }
    id v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [v5 setAutoresizingMask:18];
    double v6 = 0.25;
  }
  else
  {
    id v5 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [v5 setAutoresizingMask:18];
    double v6 = 0.5;
  }
  double v7 = +[UIColor colorWithWhite:v6 alpha:1.0];
  [v5 setBackgroundColor:v7];

  [v4 setSelectedBackgroundView:v5];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end