@interface NPHCSCellularPlanDataSource
- (CoreTelephonyClient)coreTelephonyClient;
- (NPHCSCellularPlanDataSource)initWithDelegate:(id)a3;
- (NPHCSCellularPlanDataSourceDelegate)delegate;
- (NSDictionary)cellularPlansDictionary;
- (void)_cellularPlanInfoDidChange:(id)a3;
- (void)setCellularPlansDictionary:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation NPHCSCellularPlanDataSource

- (NPHCSCellularPlanDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NPHCSCellularPlanDataSource;
  v5 = [(NPHCSCellularPlanDataSource *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(NPHCSCellularPlanDataSource *)v5 setDelegate:v4];
    id v7 = objc_alloc((Class)CoreTelephonyClient);
    v8 = dispatch_get_global_queue(0, 0);
    id v9 = [v7 initWithQueue:v8];
    [(NPHCSCellularPlanDataSource *)v6 setCoreTelephonyClient:v9];

    v10 = [(NPHCSCellularPlanDataSource *)v6 coreTelephonyClient];
    [v10 setDelegate:v6];

    v11 = +[NPHCellularBridgeUIManager sharedInstance];
    [v11 startRemoteProvisioning];

    v12 = +[NPHCellularBridgeUIManager sharedInstance];
    [v12 updateCellularPlansWithFetch:1];

    v13 = +[NSNotificationCenter defaultCenter];
    uint64_t v14 = NPHCellularPlanInfoDidChangeNotification;
    v15 = +[NPHCellularBridgeUIManager sharedInstance];
    [v13 addObserver:v6 selector:"_cellularPlanInfoDidChange:" name:v14 object:v15];
  }
  return v6;
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[NPHCSCellularPlanDataSource simStatusDidChange:status:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s context:%@ status:%@", (uint8_t *)&v11, 0x20u);
  }

  id v9 = [(NPHCSCellularPlanDataSource *)self delegate];
  v10 = [(NPHCSCellularPlanDataSource *)self cellularPlansDictionary];
  [v9 cellularPlansUpdated:v10 error:0];
}

- (void)_cellularPlanInfoDidChange:(id)a3
{
  id v4 = a3;
  v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[NPHCSCellularPlanDataSource _cellularPlanInfoDidChange:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s - notification:%@", buf, 0x16u);
  }

  id v6 = +[NPHCellularBridgeUIManager sharedInstance];
  id v7 = [v6 cellularPlans];

  v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[NPHCSCellularPlanDataSource _cellularPlanInfoDidChange:]";
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s -- cellularPlans:%@", buf, 0x16u);
  }

  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v16, "shouldDisplay", (void)v25))
        {
          if ([v16 isSelectable]) {
            objc_super v17 = v9;
          }
          else {
            objc_super v17 = v10;
          }
          [v17 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v13);
  }

  v29[0] = kActiveCellularPlans;
  id v18 = [v9 copy];
  v29[1] = kInactiveCellularPlans;
  v30[0] = v18;
  id v19 = [v10 copy];
  v30[1] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  [(NPHCSCellularPlanDataSource *)self setCellularPlansDictionary:v20];

  v21 = [(NPHCSCellularPlanDataSource *)self delegate];
  v22 = [(NPHCSCellularPlanDataSource *)self cellularPlansDictionary];
  v23 = [v4 userInfo];
  v24 = [v23 objectForKeyedSubscript:NPHCellularPlanInfoError];
  [v21 cellularPlansUpdated:v22 error:v24];
}

- (NPHCSCellularPlanDataSourceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)cellularPlansDictionary
{
  return self->_cellularPlansDictionary;
}

- (void)setCellularPlansDictionary:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_cellularPlansDictionary, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end