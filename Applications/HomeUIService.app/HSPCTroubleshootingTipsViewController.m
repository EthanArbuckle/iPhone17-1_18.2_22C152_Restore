@interface HSPCTroubleshootingTipsViewController
- (HSPCTroubleshootingTipsViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (UITableView)tableView;
- (id)commitConfiguration;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_tipCount;
- (unint64_t)_tipForIndexPath:(id)a3;
- (unint64_t)page;
- (void)actionInvokedForTip:(unint64_t)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setPage:(unint64_t)a3;
- (void)setTableView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HSPCTroubleshootingTipsViewController

- (HSPCTroubleshootingTipsViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v10 = [objc_alloc((Class)PRXScrollableContentView) initWithCardStyle:0 scrollView:v9];
  v20.receiver = self;
  v20.super_class = (Class)HSPCTroubleshootingTipsViewController;
  v11 = [(HSPCTroubleshootingTipsViewController *)&v20 initWithContentView:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_coordinator, a3);
    objc_storeStrong((id *)&v12->_config, a4);
    id v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    [v9 setAllowsSelection:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    [WeakRetained setDataSource:v12];

    id v15 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v15 setDelegate:v12];

    v16 = +[UIColor clearColor];
    id v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v17 setSeparatorColor:v16];

    id v18 = [(HSPCTroubleshootingTipsViewController *)v12 addProminentDismissButtonWithTitleKey:@"HUDoneTitle"];
  }

  return v12;
}

- (void)setPage:(unint64_t)a3
{
  self->_page = a3;
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    v4 = @"HSTroubleshootingTipCantScanCodePageTitle";
  }
  else
  {
    v4 = @"HSTroubleshootingTipAccessoryNotShownPageTitle";
  }
  sub_100060C64(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(HSPCTroubleshootingTipsViewController *)self setTitle:v5];
}

- (id)commitConfiguration
{
  return +[NAFuture futureWithResult:&off_1000B0328];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCTroubleshootingTipsViewController;
  [(HSPCTroubleshootingTipsViewController *)&v4 viewDidLoad];
  v3 = [(HSPCTroubleshootingTipsViewController *)self tableView];
  [v3 reloadData];
}

- (void)actionInvokedForTip:(unint64_t)a3
{
  if (a3)
  {
    objc_super v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unknown action to invoke for tip %lu", buf, 0xCu);
    }
  }
  else
  {
    v6 = [(HSPCTroubleshootingTipsViewController *)self coordinator];
    id v7 = [v6 didReceiveSetupCode:0 fromViewController:self];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100036FEC;
    v9[3] = &unk_1000AA2E8;
    v9[4] = self;
    id v8 = [v7 addCompletionBlock:v9];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(HSPCTroubleshootingTipsViewController *)self _tipCount];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7) {
    id v7 = [[HSSetupTroubleshootingTipCell alloc] initWithStyle:0 reuseIdentifier:@"Cell"];
  }
  [(HSSetupTroubleshootingTipCell *)v7 setTip:[(HSPCTroubleshootingTipsViewController *)self _tipForIndexPath:v6]];
  [(HSSetupTroubleshootingTipCell *)v7 setDelegate:self];

  return v7;
}

- (unint64_t)_tipForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HSPCTroubleshootingTipsViewController *)self _tips];
  id v6 = [v5 objectAtIndexedSubscript:[self page]];
  id v7 = [v4 row];

  id v8 = [v6 objectAtIndexedSubscript:v7];
  id v9 = [v8 unsignedIntegerValue];

  return (unint64_t)v9;
}

- (unint64_t)_tipCount
{
  v3 = [(HSPCTroubleshootingTipsViewController *)self _tips];
  id v4 = [v3 objectAtIndexedSubscript:[self page]];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (unint64_t)page
{
  return self->_page;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end