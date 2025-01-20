@interface HSPCAssociatedTypeSelectionViewController
- (HMService)service;
- (HSPCAssociatedTypeSelectionViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NSArray)possibleAssociatedServiceTypes;
- (NSString)associatedServiceType;
- (NSString)defaultAssociatedServiceType;
- (UITableView)tableView;
- (id)commitConfiguration;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAssociatedServiceType:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCAssociatedTypeSelectionViewController

- (HSPCAssociatedTypeSelectionViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v10 = [objc_alloc((Class)PRXScrollableContentView) initWithCardStyle:0 scrollView:v9];
  v42.receiver = self;
  v42.super_class = (Class)HSPCAssociatedTypeSelectionViewController;
  v11 = [(HSPCAssociatedTypeSelectionViewController *)&v42 initWithContentView:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    id v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    [v9 setDelegate:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    [WeakRetained setDataSource:v12];

    v15 = +[UIColor systemBackgroundColor];
    id v16 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v16 setBackgroundColor:v15];

    id v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v17 setRowHeight:44.0];

    +[HSPCRow leadingSeparatorMargin];
    double v19 = v18;
    id v20 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v20 setSeparatorInset:0.0, v19, 0.0, 0.0];

    id v21 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v21 _setTopPadding:0.0];

    id v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v22 _setBottomPadding:0.0];

    id v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"Cell"];

    v24 = [(HSPCAssociatedTypeSelectionViewController *)v12 config];
    v25 = [v24 addedAccessory];
    uint64_t v26 = [v25 hf_primaryService];
    service = v12->_service;
    v12->_service = (HMService *)v26;

    uint64_t v28 = [(HMService *)v12->_service serviceType];
    defaultAssociatedServiceType = v12->_defaultAssociatedServiceType;
    v12->_defaultAssociatedServiceType = (NSString *)v28;

    v30 = [(HMService *)v12->_service serviceType];
    uint64_t v31 = +[HFAssociatedServiceTypeFactory associatedServiceTypesArrayFor:v30];
    possibleAssociatedServiceTypes = v12->_possibleAssociatedServiceTypes;
    v12->_possibleAssociatedServiceTypes = (NSArray *)v31;

    v33 = HULocalizedString();
    [(HSPCAssociatedTypeSelectionViewController *)v12 setTitle:v33];

    v34 = [v7 activeTuple];
    v35 = [v34 accessoryCategoryOrPrimaryServiceType];
    v36 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCAssociatedTypeSelectionViewController *)v12 setSubtitle:v36];

    id v37 = [(HSPCAssociatedTypeSelectionViewController *)v12 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v12 futureSelector:"commitConfiguration"];
    v38 = HFLogForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v12->_service;
      *(_DWORD *)buf = 136315394;
      v44 = "-[HSPCAssociatedTypeSelectionViewController initWithCoordinator:config:]";
      __int16 v45 = 2112;
      v46 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s acting on %@", buf, 0x16u);
    }

    v40 = v12;
  }

  return v12;
}

- (id)commitConfiguration
{
  v3 = [(HSPCAssociatedTypeSelectionViewController *)self tableView];
  v4 = [v3 indexPathForSelectedRow];
  id v5 = [v4 row];

  v6 = [(HSPCAssociatedTypeSelectionViewController *)self possibleAssociatedServiceTypes];
  id v7 = [v6 objectAtIndexedSubscript:v5];

  id v8 = +[NAFuture futureWithResult:&off_1000B0568];
  id v9 = [(HSPCAssociatedTypeSelectionViewController *)self service];
  id v10 = v9;
  if (v9)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004C25C;
    v26[3] = &unk_1000A99C0;
    id v11 = v9;
    id v27 = v11;
    id v12 = v7;
    id v28 = v12;
    id v13 = +[NAFuture futureWithErrorOnlyHandlerAdapterBlock:v26];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10004C26C;
    v22[3] = &unk_1000AAB08;
    id v23 = v12;
    id v24 = v11;
    id v14 = v8;
    id v25 = v14;
    v15 = [v13 flatMap:v22];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004C338;
    v20[3] = &unk_1000A90D8;
    id v21 = v14;
    id v16 = v14;
    id v8 = [v15 recover:v20];
  }
  else
  {
    id v17 = [(HSPCAssociatedTypeSelectionViewController *)self config];
    double v18 = [v17 addedAccessory];
    NSLog(@"Attempting to set an associated service on an accessory without any services that support that: %@", v18);
  }

  return v8;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCAssociatedTypeSelectionViewController;
  [(HSPCAssociatedTypeSelectionViewController *)&v4 viewDidLoad];
  v3 = [(HSPCAssociatedTypeSelectionViewController *)self tableView];
  [v3 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)HSPCAssociatedTypeSelectionViewController;
  [(HSPCAssociatedTypeSelectionViewController *)&v19 viewWillAppear:a3];
  objc_super v4 = [(HSPCAssociatedTypeSelectionViewController *)self tableView];
  [v4 reloadData];

  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = v5;
    id v7 = [(HSPCAssociatedTypeSelectionViewController *)self possibleAssociatedServiceTypes];
    id v8 = [v7 count];

    if (v6 >= (uint64_t)v8) {
      break;
    }
    id v9 = [(HSPCAssociatedTypeSelectionViewController *)self possibleAssociatedServiceTypes];
    id v10 = [v9 objectAtIndexedSubscript:v6];

    id v11 = [(HSPCAssociatedTypeSelectionViewController *)self defaultAssociatedServiceType];
    unsigned int v12 = [v10 isEqualToString:v11];

    uint64_t v5 = v6 + 1;
  }
  while (!v12);
  id v13 = +[NSIndexPath indexPathForRow:v6 inSection:0];
  id v14 = [(HSPCAssociatedTypeSelectionViewController *)self tableView];
  [v14 selectRowAtIndexPath:v13 animated:1 scrollPosition:0];

  v15 = [(HSPCAssociatedTypeSelectionViewController *)self tableView];
  [v15 layoutIfNeeded];

  id v16 = [(HSPCAssociatedTypeSelectionViewController *)self contentView];
  [v16 setNeedsUpdateConstraints];

  id v17 = [(HSPCAssociatedTypeSelectionViewController *)self view];
  [v17 bounds];
  [(HSPCAssociatedTypeSelectionViewController *)self updatePreferredContentSizeForCardWidth:v18];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 cellForRowAtIndexPath:v5];
  [v6 setAccessoryType:3];

  return v5;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 cellForRowAtIndexPath:v5];
  [v6 setAccessoryType:0];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(HSPCAssociatedTypeSelectionViewController *)self possibleAssociatedServiceTypes];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v6];
  id v9 = [(HSPCAssociatedTypeSelectionViewController *)self possibleAssociatedServiceTypes];
  id v10 = [v9 objectAtIndexedSubscript:[v6 row]];

  [v8 updateUIWithServiceType:v10];
  id v11 = [v7 indexPathForSelectedRow];

  LODWORD(v7) = [v11 isEqual:v6];
  if (v7) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 0;
  }
  [v8 setAccessoryType:v12];

  return v8;
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

- (HMService)service
{
  return self->_service;
}

- (NSString)defaultAssociatedServiceType
{
  return self->_defaultAssociatedServiceType;
}

- (NSArray)possibleAssociatedServiceTypes
{
  return self->_possibleAssociatedServiceTypes;
}

- (NSString)associatedServiceType
{
  return self->_associatedServiceType;
}

- (void)setAssociatedServiceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_possibleAssociatedServiceTypes, 0);
  objc_storeStrong((id *)&self->_defaultAssociatedServiceType, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end