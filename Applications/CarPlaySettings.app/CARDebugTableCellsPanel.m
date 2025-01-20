@interface CARDebugTableCellsPanel
- (CARDebugTableCellsPanel)initWithPanelController:(id)a3;
- (NSLayoutConstraint)platterLeftConstraint;
- (NSLayoutConstraint)platterRightConstraint;
- (UITableView)tableView;
- (UITableViewHeaderFooterView)headerView;
- (UIView)headerPlatter;
- (id)cellSpecifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setHeaderPlatter:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setPlatterLeftConstraint:(id)a3;
- (void)setPlatterRightConstraint:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CARDebugTableCellsPanel

- (id)cellSpecifier
{
  cellSpecifier = self->_cellSpecifier;
  if (!cellSpecifier)
  {
    objc_initWeak(&location, self);
    v4 = [CARSettingsCellSpecifier alloc];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100009B38;
    v8[3] = &unk_100092008;
    objc_copyWeak(&v9, &location);
    v5 = [(CARSettingsCellSpecifier *)v4 initWithTitle:@"Debug TableView Cells" image:0 accessoryType:1 actionBlock:v8];
    v6 = self->_cellSpecifier;
    self->_cellSpecifier = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    cellSpecifier = self->_cellSpecifier;
  }

  return cellSpecifier;
}

- (CARDebugTableCellsPanel)initWithPanelController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CARDebugTableCellsPanel;
  return [(CARSettingsPanel *)&v4 initWithPanelController:a3];
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)CARDebugTableCellsPanel;
  [(CARSettingsPanel *)&v33 viewDidLoad];
  v3 = -[DebugTableView initWithFrame:]([DebugTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CARDebugTableCellsPanel *)self setTableView:v3];

  objc_super v4 = [(CARDebugTableCellsPanel *)self tableView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(CARDebugTableCellsPanel *)self tableView];
  [v5 setDelegate:self];

  v6 = [(CARDebugTableCellsPanel *)self tableView];
  [v6 setDataSource:self];

  v7 = [(CARDebugTableCellsPanel *)self tableView];
  uint64_t v8 = objc_opt_class();
  id v9 = +[DebugTableViewCell reuseIdentifier];
  [v7 registerClass:v8 forCellReuseIdentifier:v9];

  v10 = [(CARDebugTableCellsPanel *)self view];
  v11 = [(CARDebugTableCellsPanel *)self tableView];
  [v10 addSubview:v11];

  v32 = [(CARDebugTableCellsPanel *)self tableView];
  v30 = [v32 topAnchor];
  v31 = [(CARDebugTableCellsPanel *)self view];
  v29 = [v31 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v34[0] = v28;
  v27 = [(CARDebugTableCellsPanel *)self tableView];
  v25 = [v27 leftAnchor];
  v26 = [(CARDebugTableCellsPanel *)self view];
  v24 = [v26 leftAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v34[1] = v23;
  v22 = [(CARDebugTableCellsPanel *)self tableView];
  v12 = [v22 rightAnchor];
  v13 = [(CARDebugTableCellsPanel *)self view];
  v14 = [v13 rightAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v34[2] = v15;
  v16 = [(CARDebugTableCellsPanel *)self tableView];
  v17 = [v16 bottomAnchor];
  v18 = [(CARDebugTableCellsPanel *)self view];
  v19 = [v18 bottomAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v34[3] = v20;
  v21 = +[NSArray arrayWithObjects:v34 count:4];
  +[NSLayoutConstraint activateConstraints:v21];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[DebugTableViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  v10 = [(CARDebugTableCellsPanel *)self tableView];
  [v10 _sectionContentInset];
  double v12 = v11;
  v13 = [(CARDebugTableCellsPanel *)self platterLeftConstraint];
  [v13 setConstant:v12];

  v14 = [(CARDebugTableCellsPanel *)self tableView];
  [v14 _sectionContentInset];
  double v16 = -v15;
  v17 = [(CARDebugTableCellsPanel *)self platterRightConstraint];
  [v17 setConstant:v16];

  id v18 = [v6 section];
  id v19 = [v6 row];

  v20 = +[NSString stringWithFormat:@"Section %ld row %ld", v18, v19];
  v21 = [v9 textLabel];
  [v21 setText:v20];

  [v9 setAccessoryType:1];

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return +[NSString stringWithFormat:@"%c", (char)(a4 + 65)];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 20;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [v7 indexPathForSelectedRow];

  if (v6 == v5) {
    [v7 deselectRowAtIndexPath:v5 animated:1];
  }
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UITableViewHeaderFooterView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)headerPlatter
{
  return self->_headerPlatter;
}

- (void)setHeaderPlatter:(id)a3
{
}

- (NSLayoutConstraint)platterLeftConstraint
{
  return self->_platterLeftConstraint;
}

- (void)setPlatterLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)platterRightConstraint
{
  return self->_platterRightConstraint;
}

- (void)setPlatterRightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterRightConstraint, 0);
  objc_storeStrong((id *)&self->_platterLeftConstraint, 0);
  objc_storeStrong((id *)&self->_headerPlatter, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_cellSpecifier, 0);
}

@end