@interface NPHCSCellularSettingsDetailsViewController
- (BOOL)isCellularSetup;
- (NPHCSAppCellularDataUsageItem)appDataUsageItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)titleForHeaderInSection:(unint64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAppDataUsageItem:(id)a3;
- (void)setCellularSetup:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation NPHCSCellularSettingsDetailsViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)NPHCSCellularSettingsDetailsViewController;
  [(NPHCSCellularSettingsDetailsViewController *)&v10 viewDidLoad];
  v3 = [(NPHCSCellularSettingsDetailsViewController *)self appDataUsageItem];
  v4 = [v3 displayName];
  [(NPHCSCellularSettingsDetailsViewController *)self setTitle:v4];

  v5 = [(NPHCSCellularSettingsDetailsViewController *)self appDataUsageItem];
  v6 = [v5 childObjects];
  v7 = +[NPHCSAppCellularDataUsageItem userSelectedComparator];
  v8 = [v6 sortedArrayUsingComparator:v7];
  v9 = [(NPHCSCellularSettingsDetailsViewController *)self appDataUsageItem];
  [v9 setChildObjects:v8];
}

- (id)titleForHeaderInSection:(unint64_t)a3
{
  if (a3
    || ([(NPHCSCellularSettingsDetailsViewController *)self appDataUsageItem],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isForAnApp],
        v4,
        !v5))
  {
    objc_super v10 = 0;
  }
  else
  {
    v6 = [(NPHCSCellularSettingsDetailsViewController *)self appDataUsageItem];
    v7 = [v6 displayName];

    if ([v7 length])
    {
      v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = [v8 localizedStringForKey:@"ALLOW_DATA_ACCESS_FORMAT" value:&stru_1CDE0 table:0];
      objc_super v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);
    }
    else
    {
      v8 = +[NSBundle bundleForClass:objc_opt_class()];
      objc_super v10 = [v8 localizedStringForKey:@"ALLOW_DATA_ACCESS" value:&stru_1CDE0 table:0];
    }
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(NPHCSCellularSettingsDetailsViewController *)self appDataUsageItem];
  unsigned int v5 = [v4 childObjects];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NPHCSCellularSettingsDetailsViewController *)self appDataUsageItem];
  v9 = [v8 childObjects];
  id v10 = [v6 row];

  v11 = [v9 objectAtIndexedSubscript:v10];
  v12 = +[NPHCSAppCellularDataUsageCell cellForTableView:v7 reuseIdentifier:@"cellularDetailViewCellIdentifier" appDataUsageItem:v11 isCellularSetup:[(NPHCSCellularSettingsDetailsViewController *)self isCellularSetup]];

  v13 = [v12 imageView];
  [v13 setImage:0];

  [v12 setAccessoryView:0];
  [v12 setAccessoryType:0];
  if (+[NPHSharedUtilities isActiveWatchChinaRegionCellular])
  {
    v14 = [v12 detailTextLabel];
    [v14 setText:0];
  }

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NPHCSCellularSettingsDetailsViewController *)self titleForHeaderInSection:a4];
}

- (NPHCSAppCellularDataUsageItem)appDataUsageItem
{
  return self->_appDataUsageItem;
}

- (void)setAppDataUsageItem:(id)a3
{
}

- (BOOL)isCellularSetup
{
  return self->_cellularSetup;
}

- (void)setCellularSetup:(BOOL)a3
{
  self->_cellularSetup = a3;
}

- (void).cxx_destruct
{
}

@end