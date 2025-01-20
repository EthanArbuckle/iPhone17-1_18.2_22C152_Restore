@interface HSPCResumeSelectAccessoryViewController
- (HSPCResumeSelectAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NSArray)accessoriesPendingConfiguration;
- (NSMutableSet)selectedAccessories;
- (PRXAction)continueAction;
- (UITableView)tableView;
- (id)commitConfiguration;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAccessoriesPendingConfiguration:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContinueAction:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setSelectedAccessories:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCResumeSelectAccessoryViewController

- (HSPCResumeSelectAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v10 = [objc_alloc((Class)PRXScrollableContentView) initWithCardStyle:0 scrollView:v9];
  v39.receiver = self;
  v39.super_class = (Class)HSPCResumeSelectAccessoryViewController;
  v11 = [(HSPCResumeSelectAccessoryViewController *)&v39 initWithContentView:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v13 = HULocalizedString();
    [(HSPCResumeSelectAccessoryViewController *)v12 setTitle:v13];

    id v14 = objc_storeWeak((id *)&v12->_tableView, v9);
    [v9 setDelegate:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    [WeakRetained setDataSource:v12];

    v16 = +[UIColor systemBackgroundColor];
    id v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v17 setBackgroundColor:v16];

    id v18 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v18 setRowHeight:44.0];

    +[HSPCRow leadingSeparatorMargin];
    double v20 = v19;
    id v21 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v21 setSeparatorInset:0.0, v20, 0.0, 0.0];

    id v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v22 _setTopPadding:0.0];

    id v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v23 _setBottomPadding:0.0];

    id v24 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v24 setAllowsMultipleSelection:1];

    id v25 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v25 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

    uint64_t v26 = [(HSPCResumeSelectAccessoryViewController *)v12 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v12 futureSelector:"commitConfiguration"];
    continueAction = v12->_continueAction;
    v12->_continueAction = (PRXAction *)v26;

    v28 = [v7 topAccessoryTuple];
    v29 = +[NSMutableArray arrayWithObject:v28];

    v30 = [v7 bridgedAccessories];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100043B04;
    v37[3] = &unk_1000AAC98;
    id v38 = v7;
    v31 = [v30 na_filter:v37];
    [v29 addObjectsFromArray:v31];

    v32 = (NSArray *)[v29 copy];
    accessoriesPendingConfiguration = v12->_accessoriesPendingConfiguration;
    v12->_accessoriesPendingConfiguration = v32;

    uint64_t v34 = +[NSMutableSet setWithArray:v12->_accessoriesPendingConfiguration];
    selectedAccessories = v12->_selectedAccessories;
    v12->_selectedAccessories = (NSMutableSet *)v34;
  }
  return v12;
}

- (id)commitConfiguration
{
  v3 = [(HSPCResumeSelectAccessoryViewController *)self coordinator];
  v4 = [(HSPCResumeSelectAccessoryViewController *)self selectedAccessories];
  v5 = [v4 na_map:&stru_1000AACD8];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100043CBC;
  v10[3] = &unk_1000A9600;
  id v11 = v3;
  id v12 = v5;
  id v6 = v5;
  id v7 = v3;
  id v8 = +[NAFuture futureWithBlock:v10];

  return v8;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HSPCResumeSelectAccessoryViewController;
  [(HSPCResumeSelectAccessoryViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)HSPCResumeSelectAccessoryViewController;
  [(HSPCResumeSelectAccessoryViewController *)&v14 viewWillAppear:a3];
  v4 = [(HSPCResumeSelectAccessoryViewController *)self tableView];
  [v4 reloadData];

  v5 = [(HSPCResumeSelectAccessoryViewController *)self tableView];
  uint64_t v6 = (uint64_t)[v5 numberOfRowsInSection:0];

  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v8 = +[NSIndexPath indexPathForRow:i inSection:0];
      id v9 = [(HSPCResumeSelectAccessoryViewController *)self tableView];
      [v9 selectRowAtIndexPath:v8 animated:0 scrollPosition:0];
    }
  }
  id v10 = [(HSPCResumeSelectAccessoryViewController *)self tableView];
  [v10 layoutIfNeeded];

  id v11 = [(HSPCResumeSelectAccessoryViewController *)self contentView];
  [v11 setNeedsUpdateConstraints];

  id v12 = [(HSPCResumeSelectAccessoryViewController *)self view];
  [v12 bounds];
  [(HSPCResumeSelectAccessoryViewController *)self updatePreferredContentSizeForCardWidth:v13];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 cellForRowAtIndexPath:v6];
  id v8 = [v7 accessoryView];
  [v8 setHidden:0];

  id v9 = [(HSPCResumeSelectAccessoryViewController *)self selectedAccessories];
  id v10 = [(HSPCResumeSelectAccessoryViewController *)self accessoriesPendingConfiguration];
  id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  [v9 addObject:v11];

  id v12 = [(HSPCResumeSelectAccessoryViewController *)self selectedAccessories];
  BOOL v13 = [v12 count] != 0;
  objc_super v14 = [(HSPCResumeSelectAccessoryViewController *)self continueAction];
  [v14 setEnabled:v13];

  return v6;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 cellForRowAtIndexPath:v6];
  id v8 = [v7 accessoryView];
  [v8 setHidden:1];

  id v9 = [(HSPCResumeSelectAccessoryViewController *)self selectedAccessories];
  id v10 = [(HSPCResumeSelectAccessoryViewController *)self accessoriesPendingConfiguration];
  id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  [v9 removeObject:v11];

  id v12 = [(HSPCResumeSelectAccessoryViewController *)self selectedAccessories];
  BOOL v13 = [v12 count] != 0;
  objc_super v14 = [(HSPCResumeSelectAccessoryViewController *)self continueAction];
  [v14 setEnabled:v13];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(HSPCResumeSelectAccessoryViewController *)self accessoriesPendingConfiguration];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];
  id v8 = [(HSPCResumeSelectAccessoryViewController *)self accessoriesPendingConfiguration];
  id v9 = [v6 row];

  id v10 = [v8 objectAtIndexedSubscript:v9];
  [v7 updateUIWithTuple:v10];

  id v11 = objc_alloc((Class)UIImageView);
  id v12 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
  id v13 = [v11 initWithImage:v12];
  [v7 setAccessoryView:v13];

  return v7;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
}

- (NSArray)accessoriesPendingConfiguration
{
  return self->_accessoriesPendingConfiguration;
}

- (void)setAccessoriesPendingConfiguration:(id)a3
{
}

- (NSMutableSet)selectedAccessories
{
  return self->_selectedAccessories;
}

- (void)setSelectedAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAccessories, 0);
  objc_storeStrong((id *)&self->_accessoriesPendingConfiguration, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end