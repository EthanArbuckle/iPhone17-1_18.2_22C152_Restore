@interface HSPCNameServicesViewController
+ (id)applicableServicesForAccessory:(id)a3;
- (BOOL)_indexPathAllowsToggling:(id)a3;
- (BOOL)isServiceSelectable:(id)a3;
- (BOOL)shouldServiceBeFrozen:(id)a3;
- (BOOL)shouldServiceStartEnabled:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (HSPCNameServicesViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NSArray)serviceNames;
- (NSArray)services;
- (NSIndexPath)indexPathOfFirstResponder;
- (NSMutableSet)enabledServices;
- (NSSet)characteristicTypesToPreload;
- (NSSet)frozenServices;
- (NSSet)servicesToPreload;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_enabledServicesSetFromServices:(id)a3;
- (id)_frozenServicesFromServices:(id)a3;
- (id)_givenNameForService:(id)a3;
- (id)cellReuseIdentifierForService:(id)a3;
- (id)commitConfiguration;
- (id)hu_preloadContent;
- (id)readCharacteristics:(id)a3 inServices:(id)a4;
- (id)serviceComparator;
- (id)serviceForIndexPath:(id)a3;
- (id)suggestedNamesForServices:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_logDetailedServices;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEnabledServices:(id)a3;
- (void)setFrozenServices:(id)a3;
- (void)setIndexPathOfFirstResponder:(id)a3;
- (void)setServiceNames:(id)a3;
- (void)setServices:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HSPCNameServicesViewController

- (id)readCharacteristics:(id)a3 inServices:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100054630;
    v15[3] = &unk_1000AB1F0;
    id v16 = v7;
    v8 = [v6 na_flatMap:v15];
    v9 = [(HSPCNameServicesViewController *)self config];
    v10 = [v9 home];
    v11 = [v10 hf_characteristicValueManager];
    v12 = [v11 readValuesForCharacteristics:v8];
    v13 = [v12 flatMap:&stru_1000AB230];
  }
  else
  {
    v13 = +[NAFuture futureWithNoResult];
  }

  return v13;
}

- (HSPCNameServicesViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v10 = [objc_alloc((Class)PRXScrollableContentView) initWithCardStyle:0 scrollView:v9];
  v41.receiver = self;
  v41.super_class = (Class)HSPCNameServicesViewController;
  v11 = [(HSPCNameServicesViewController *)&v41 initWithContentView:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    id v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    [v9 setDelegate:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    [WeakRetained setDataSource:v12];

    id v15 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v15 setAllowsMultipleSelection:1];

    id v16 = +[UIColor systemBackgroundColor];
    id v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v17 setBackgroundColor:v16];

    +[HSPCRow leadingSeparatorMargin];
    double v19 = v18;
    id v20 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v20 setSeparatorInset:0.0 v19:0.0 0.0];

    id v21 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v21 _setTopPadding:0.0];

    id v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    [v22 _setBottomPadding:0.0];

    id v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    uint64_t v24 = objc_opt_class();
    v25 = +[HSPCNameServiceRow _reuseIdentifier];
    [v23 registerClass:v24 forCellReuseIdentifier:v25];

    id v26 = objc_loadWeakRetained((id *)&v12->_tableView);
    uint64_t v27 = objc_opt_class();
    v28 = +[HSPCNameServiceNoIconRow _reuseIdentifier];
    [v26 registerClass:v27 forCellReuseIdentifier:v28];

    id v29 = objc_loadWeakRetained((id *)&v12->_tableView);
    uint64_t v30 = objc_opt_class();
    v31 = +[HSPCNameToggleServiceRow _reuseIdentifier];
    [v29 registerClass:v30 forCellReuseIdentifier:v31];

    id v32 = objc_loadWeakRetained((id *)&v12->_tableView);
    uint64_t v33 = objc_opt_class();
    v34 = +[HSPCNameIdentifyServiceRow _reuseIdentifier];
    [v32 registerClass:v33 forCellReuseIdentifier:v34];

    v35 = [v7 activeTuple];
    v36 = [v35 accessoryCategoryOrPrimaryServiceType];
    v37 = HFLocalizedCategoryOrPrimaryServiceTypeString();
    [(HSPCNameServicesViewController *)v12 setTitle:v37];

    v38 = HULocalizedString();
    [(HSPCNameServicesViewController *)v12 setSubtitle:v38];

    id v39 = [(HSPCNameServicesViewController *)v12 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v12 futureSelector:"commitConfiguration"];
  }

  return v12;
}

- (id)hu_preloadContent
{
  objc_initWeak(&location, self);
  v3 = [(HSPCNameServicesViewController *)self characteristicTypesToPreload];
  v4 = [(HSPCNameServicesViewController *)self servicesToPreload];
  v5 = [(HSPCNameServicesViewController *)self readCharacteristics:v3 inServices:v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100054BDC;
  v8[3] = &unk_1000AB258;
  objc_copyWeak(&v9, &location);
  id v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

- (id)commitConfiguration
{
  v3 = [(HSPCNameServicesViewController *)self view];
  [v3 endEditing:1];

  v4 = [(HSPCNameServicesViewController *)self serviceNames];
  v5 = +[NSSet setWithArray:v4];

  id v6 = [v5 count];
  id v7 = [(HSPCNameServicesViewController *)self serviceNames];
  id v8 = [v7 count];

  if (v6 == v8)
  {
    id v9 = [(HSPCNameServicesViewController *)self services];
    id v10 = +[NSSet setWithArray:v9];

    v11 = [(HSPCNameServicesViewController *)self enabledServices];
    v12 = [v10 na_setByRemovingObjectsFromSet:v11];

    id v13 = [(HSPCNameServicesViewController *)self config];
    v14 = [(HSPCNameServicesViewController *)self serviceNames];
    id v15 = [v13 validateNames:v14];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000550C8;
    v29[3] = &unk_1000A9E88;
    v29[4] = self;
    id v16 = [v15 flatMap:v29];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10005514C;
    v27[3] = &unk_1000A9E88;
    id v28 = v12;
    id v17 = v12;
    double v18 = [v16 flatMap:v27];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100055160;
    v26[3] = &unk_1000A9E88;
    v26[4] = self;
    double v19 = [v18 flatMap:v26];
    id v20 = [v19 hs_commitConfigurationFutureWithContextMessage:@"Service updates"];
  }
  else
  {
    id v21 = HULocalizedString();
    id v22 = HULocalizedString();
    id v10 = +[UIAlertController alertControllerWithTitle:v21 message:v22 preferredStyle:1];

    id v23 = HULocalizedString();
    uint64_t v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:0];
    [v10 addAction:v24];

    [(HSPCNameServicesViewController *)self presentViewController:v10 animated:1 completion:0];
    id v20 = +[NAFuture futureWithResult:&off_1000B0B08];
  }

  return v20;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HSPCNameServicesViewController;
  [(HSPCNameServicesViewController *)&v4 viewDidLoad];
  v3 = [(HSPCNameServicesViewController *)self tableView];
  [v3 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)HSPCNameServicesViewController;
  [(HSPCNameServicesViewController *)&v16 viewDidAppear:a3];
  objc_super v4 = [(HSPCNameServicesViewController *)self services];
  int v5 = [v4 count];

  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [(HSPCNameServicesViewController *)self services];
      id v8 = [v7 objectAtIndexedSubscript:v6];

      id v9 = [(HSPCNameServicesViewController *)self enabledServices];
      unsigned int v10 = [v9 containsObject:v8];

      if (v10)
      {
        v11 = +[NSIndexPath indexPathForRow:v6 inSection:0];
        v12 = [(HSPCNameServicesViewController *)self tableView];
        [v12 selectRowAtIndexPath:v11 animated:0 scrollPosition:0];

        id v13 = [(HSPCNameServicesViewController *)self tableView];
        [(HSPCNameServicesViewController *)self tableView:v13 didSelectRowAtIndexPath:v11];
      }
      ++v6;
      v14 = [(HSPCNameServicesViewController *)self services];
      signed int v15 = [v14 count];
    }
    while (v6 < v15);
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", [a3 tag], 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HSPCNameServicesViewController *)self setIndexPathOfFirstResponder:v4];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  int v5 = [v4 text];
  uint64_t v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];
  [v4 setText:v7];

  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v4 text];
    unsigned int v10 = [v4 placeholder];
    *(_DWORD *)buf = 136315650;
    double v19 = "-[HSPCNameServicesViewController textFieldDidEndEditing:]";
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: Title: %@ | Placeholder: %@", buf, 0x20u);
  }
  uint64_t v11 = (uint64_t)[v4 tag];
  if (v11 < 0
    || ([(HSPCNameServicesViewController *)self serviceNames],
        v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = [v12 count],
        v12,
        v11 >= (uint64_t)v13))
  {
    id v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100068B4C(self, v11, v17);
    }

    id v15 = [(HSPCNameServicesViewController *)self serviceNames];
    NSLog(@"Well this isn't right, textfield is tagged with an invalid row tag: %ld, totalRows: %ld", v11, [v15 count]);
  }
  else
  {
    v14 = [(HSPCNameServicesViewController *)self serviceNames];
    id v15 = [v14 mutableCopy];

    objc_super v16 = [v4 text];
    [v15 setObject:v16 atIndexedSubscript:v11];

    [(HSPCNameServicesViewController *)self setServiceNames:v15];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  int v5 = (char *)[v4 tag];
  uint64_t v6 = [(HSPCNameServicesViewController *)self tableView];
  int64_t v7 = [(HSPCNameServicesViewController *)self tableView:v6 numberOfRowsInSection:0];

  if ((uint64_t)v5 >= v7 - 1)
  {
    [(HSPCNameServicesViewController *)self setIndexPathOfFirstResponder:0];
    [v4 resignFirstResponder];
  }
  else
  {
    id v8 = +[NSIndexPath indexPathForRow:v5 + 1 inSection:0];
    [(HSPCNameServicesViewController *)self setIndexPathOfFirstResponder:v8];
    objc_opt_class();
    id v9 = [(HSPCNameServicesViewController *)self tableView];
    unsigned int v10 = [v9 cellForRowAtIndexPath:v8];
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      id v13 = [v12 textField];
      [v13 becomeFirstResponder];
    }
    else
    {
      id v13 = [(HSPCNameServicesViewController *)self tableView];
      [v13 scrollToRowAtIndexPath:v8 atScrollPosition:2 animated:1];
    }
  }
  return 1;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  id v8 = [(HSPCNameServicesViewController *)self indexPathOfFirstResponder];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    objc_opt_class();
    id v10 = v14;
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    id v13 = [v12 textField];
    [v13 becomeFirstResponder];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(HSPCNameServicesViewController *)self _indexPathAllowsToggling:v5]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(HSPCNameServicesViewController *)self _indexPathAllowsToggling:v5]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_indexPathAllowsToggling:(id)a3
{
  id v4 = [(HSPCNameServicesViewController *)self serviceForIndexPath:a3];
  unsigned __int8 v5 = [(HSPCNameServicesViewController *)self isServiceSelectable:v4];
  uint64_t v6 = [(HSPCNameServicesViewController *)self frozenServices];
  unsigned __int8 v7 = [v6 containsObject:v4];

  return v5 & (v7 ^ 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  objc_opt_class();
  unsigned __int8 v7 = [v6 cellForRowAtIndexPath:v12];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [(HSPCNameServicesViewController *)self serviceForIndexPath:v12];
    [v9 setSelected:1];
    uint64_t v11 = [(HSPCNameServicesViewController *)self enabledServices];
    [v11 addObject:v10];
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  objc_opt_class();
  unsigned __int8 v7 = [v6 cellForRowAtIndexPath:v12];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [(HSPCNameServicesViewController *)self serviceForIndexPath:v12];
    [v9 setSelected:0];
    uint64_t v11 = [(HSPCNameServicesViewController *)self enabledServices];
    [v11 removeObject:v10];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(HSPCNameServicesViewController *)self services];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HSPCNameServicesViewController *)self services];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  id v10 = [(HSPCNameServicesViewController *)self cellReuseIdentifierForService:v9];
  uint64_t v11 = [v6 dequeueReusableCellWithIdentifier:v10 forIndexPath:v7];

  id v12 = [(HSPCNameServicesViewController *)self serviceNames];
  id v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  [v11 updateUIWithService:v9 suggestedName:v13];
  objc_opt_class();
  id v14 = v11;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;

  if (v16)
  {
    id v17 = [(HSPCNameServicesViewController *)self frozenServices];
    [v16 setFrozen:[v17 containsObject:v9]];
  }
  double v18 = [v14 textField];
  [v18 setDelegate:self];

  id v19 = [v7 row];
  __int16 v20 = [v14 textField];
  [v20 setTag:v19];

  id v21 = (char *)[v7 row];
  __int16 v22 = (char *)-[HSPCNameServicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, [v7 section])- 1;
  id v23 = [v14 textField];
  uint64_t v24 = v23;
  if (v21 == v22) {
    uint64_t v25 = 9;
  }
  else {
    uint64_t v25 = 4;
  }
  [v23 setReturnKeyType:v25];

  return v14;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)cellReuseIdentifierForService:(id)a3
{
  id v4 = a3;
  if ([(HSPCNameServicesViewController *)self isServiceSelectable:v4])
  {
    id v5 = [v4 accessory];
    id v6 = [(HSPCNameServicesViewController *)self config];
    id v7 = [v6 addedAccessory];

    id v8 = off_1000A88E0;
    if (v5 == v7) {
      id v8 = off_1000A88F8;
    }
  }
  else
  {
    id v8 = off_1000A88F0;
  }
  id v9 = [(__objc2_class *)*v8 _reuseIdentifier];

  return v9;
}

- (id)serviceForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(HSPCNameServicesViewController *)self services];
  id v6 = [v4 row];

  id v7 = [v5 objectAtIndexedSubscript:v6];

  return v7;
}

- (BOOL)isServiceSelectable:(id)a3
{
  v3 = [a3 serviceType];
  if ([v3 isEqualToString:HMServiceTypeInputSource]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:HMServiceTypeValve];
  }

  return v4;
}

- (id)serviceComparator
{
  return +[HMService hf_serviceComparator];
}

- (NSSet)servicesToPreload
{
  v2 = [(HSPCNameServicesViewController *)self config];
  v3 = [v2 addedAccessory];

  unsigned __int8 v4 = [(id)objc_opt_class() applicableServicesForAccessory:v3];

  return (NSSet *)v4;
}

- (NSSet)characteristicTypesToPreload
{
  v5[0] = HMCharacteristicTypeIsConfigured;
  v5[1] = HMCharacteristicTypeConfiguredName;
  v5[2] = HMCharacteristicTypeName;
  v2 = +[NSArray arrayWithObjects:v5 count:3];
  v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

+ (id)applicableServicesForAccessory:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 hf_primaryService];
  id v5 = [v3 hf_visibleServices];

  id v6 = [v4 hf_childServices];
  id v7 = [v5 setByAddingObjectsFromSet:v6];

  +[NSSet setWithObjects:](NSSet, "setWithObjects:", HMServiceTypeIrrigationSystem, HMServiceTypeValve, HMServiceTypeTelevision, HMServiceTypeInputSource, HMServiceTypeHeaterCooler, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100056294;
  v14[3] = &unk_1000AB280;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v15;
  id v9 = [v7 na_filter:v14];
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v7 count];
    id v12 = [v9 count];
    *(_DWORD *)buf = 136315650;
    id v17 = "+[HSPCNameServicesViewController applicableServicesForAccessory:]";
    __int16 v18 = 2048;
    id v19 = v11;
    __int16 v20 = 2048;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s found %ld total services, %ld should be shown to user", buf, 0x20u);
  }

  return v9;
}

- (BOOL)shouldServiceStartEnabled:(id)a3
{
  return 1;
}

- (id)_enabledServicesSetFromServices:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005636C;
  void v5[3] = &unk_1000AB280;
  v5[4] = self;
  id v3 = [a3 na_filter:v5];

  return v3;
}

- (BOOL)shouldServiceBeFrozen:(id)a3
{
  return 0;
}

- (id)_frozenServicesFromServices:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100056408;
  void v5[3] = &unk_1000AB280;
  v5[4] = self;
  id v3 = [a3 na_filter:v5];

  return v3;
}

- (id)suggestedNamesForServices:(id)a3
{
  id v4 = a3;
  +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000564F0;
  v8[3] = &unk_1000AB2A8;
  void v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  id v6 = [v4 na_map:v8];

  return v6;
}

- (id)_givenNameForService:(id)a3
{
  id v3 = a3;
  id v4 = [v3 configuredName];
  id v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 configuredName];
  }
  else
  {
    id v7 = [v3 serviceType];
    unsigned int v8 = [v7 isEqualToString:HMServiceTypeInputSource];

    if (v8
      && ([v3 defaultName],
          id v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 length],
          v9,
          v10))
    {
      uint64_t v6 = [v3 defaultName];
    }
    else
    {
      uint64_t v6 = [v3 hf_userFriendlyLocalizedCapitalizedDescription];
    }
  }
  id v11 = (void *)v6;

  return v11;
}

- (void)_logDetailedServices
{
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HSPCNameServicesViewController is operating on the following services:", buf, 2u);
  }

  id v4 = [(HSPCNameServicesViewController *)self services];
  id v5 = [v4 count];

  if (v5)
  {
    unint64_t v7 = 0;
    *(void *)&long long v6 = 138413058;
    long long v19 = v6;
    do
    {
      unsigned int v8 = [(HSPCNameServicesViewController *)self services];
      id v9 = [v8 objectAtIndexedSubscript:v7];

      id v10 = [(HSPCNameServicesViewController *)self serviceNames];
      id v11 = [v10 objectAtIndexedSubscript:v7];

      id v12 = [(HSPCNameServicesViewController *)self frozenServices];
      unsigned int v13 = [v12 containsObject:v9];

      id v14 = [(HSPCNameServicesViewController *)self enabledServices];
      unsigned int v15 = [v14 containsObject:v9];

      id v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v19;
        id v21 = v11;
        __int16 v22 = 1024;
        unsigned int v23 = v13;
        __int16 v24 = 1024;
        unsigned int v25 = v15;
        __int16 v26 = 2112;
        uint64_t v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ : isFrozen: %d : startsEnabled: %d : %@", buf, 0x22u);
      }

      ++v7;
      id v17 = [(HSPCNameServicesViewController *)self services];
      id v18 = [v17 count];
    }
    while (v7 < (unint64_t)v18);
  }
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

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (NSSet)frozenServices
{
  return self->_frozenServices;
}

- (void)setFrozenServices:(id)a3
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

- (NSArray)serviceNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceNames:(id)a3
{
}

- (NSMutableSet)enabledServices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEnabledServices:(id)a3
{
}

- (NSIndexPath)indexPathOfFirstResponder
{
  return self->_indexPathOfFirstResponder;
}

- (void)setIndexPathOfFirstResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathOfFirstResponder, 0);
  objc_storeStrong((id *)&self->_enabledServices, 0);
  objc_storeStrong((id *)&self->_serviceNames, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_frozenServices, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end