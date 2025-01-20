@interface NPHCSBridgeCellularSettingsViewController
- (BOOL)_deleteWillPerformEUICCReset:(id)a3;
- (BOOL)_shouldShowCellularDataUsage;
- (BOOL)promptingUserForConsent;
- (BOOL)receivedRemotePlanInfo;
- (NPHCSBridgeCellularSettingsViewController)initWithStyle:(int64_t)a3;
- (NPHCSCellularPlanDataSource)cellularPlansDataSource;
- (NRActiveDeviceAssertion)tinkerDeviceAssertion;
- (NSArray)activeCellularPlans;
- (NSArray)appsDataUsageArray;
- (NSArray)inactiveCellularPlans;
- (NSArray)sections;
- (NSArray)systemServicesDataUsageArray;
- (NSArray)uninstalledAppsDataUsageArray;
- (NSTimer)tinkerCellularSetUpTaskCompletionTimeout;
- (id)_errorsForFooterMessage;
- (id)_footerStringForErrors;
- (id)_resetStatisticsCell;
- (id)_setUpCellularPlanCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)tinkerCellularSetUpBackgroundTaskID;
- (void)_checkForUpdatedCarrierBundle;
- (void)_clearStats;
- (void)_displaySoftwareUpdateAlertIfNeeded;
- (void)_expireTaskAssertion:(id)a3;
- (void)_extendBackgroundAssertion;
- (void)_getTinkerDeviceAssertion;
- (void)_promptUserForConsent:(id)a3;
- (void)_promptUserForConsentIfNecessary;
- (void)_promptUserToConfirmPlanRemoval:(id)a3 willRemoveMoreThanOnePlan:(BOOL)a4;
- (void)_removePlan:(id)a3;
- (void)_removeTinkerDeviceAssertion;
- (void)_setUpPlan;
- (void)_showManageOrDeleteForCellularPlanItem:(id)a3;
- (void)_sortCellularDataUsageItems;
- (void)_switchToCellularPlanItem:(id)a3;
- (void)_updateCellularDataUsageItems;
- (void)_updateTableView;
- (void)_userDidProvideResponse:(int64_t)a3 forPlan:(id)a4;
- (void)cellularPlansUpdated:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)presentError:(id)a3;
- (void)presentErrorMessage:(id)a3;
- (void)presentErrorWithTitle:(id)a3 message:(id)a4;
- (void)setActiveCellularPlans:(id)a3;
- (void)setAppsDataUsageArray:(id)a3;
- (void)setCellularPlansDataSource:(id)a3;
- (void)setInactiveCellularPlans:(id)a3;
- (void)setPromptingUserForConsent:(BOOL)a3;
- (void)setReceivedRemotePlanInfo:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setSystemServicesDataUsageArray:(id)a3;
- (void)setTinkerCellularSetUpBackgroundTaskID:(unint64_t)a3;
- (void)setTinkerCellularSetUpTaskCompletionTimeout:(id)a3;
- (void)setTinkerDeviceAssertion:(id)a3;
- (void)setUninstalledAppsDataUsageArray:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
- (void)sortToggleSelector;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation NPHCSBridgeCellularSettingsViewController

- (NPHCSBridgeCellularSettingsViewController)initWithStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NPHCSBridgeCellularSettingsViewController;
  v3 = [(NPHCSBridgeCellularSettingsViewController *)&v8 initWithStyle:2];
  if (v3)
  {
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"BRIDGE_APP_TITLE" value:&stru_1CDE0 table:0];
    [(NPHCSBridgeCellularSettingsViewController *)v3 setTitle:v5];

    v6 = [[NPHCSCellularPlanDataSource alloc] initWithDelegate:v3];
    [(NPHCSBridgeCellularSettingsViewController *)v3 setCellularPlansDataSource:v6];
  }
  return v3;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)NPHCSBridgeCellularSettingsViewController;
  [(NPHCSBridgeCellularSettingsBaseViewController *)&v5 viewDidLoad];
  v3 = [(NPHCSBridgeCellularSettingsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"FooterHyperLinkView"];

  v4 = [(NPHCSBridgeCellularSettingsViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"SortOptionsHeaderView"];

  [(NPHCSBridgeCellularSettingsViewController *)self _checkForUpdatedCarrierBundle];
  [(NPHCSBridgeCellularSettingsViewController *)self _displaySoftwareUpdateAlertIfNeeded];
  [(NPHCSBridgeCellularSettingsViewController *)self _updateCellularDataUsageItems];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPHCSBridgeCellularSettingsViewController;
  [(NPHCSBridgeCellularSettingsViewController *)&v4 viewWillAppear:a3];
  [(NPHCSBridgeCellularSettingsViewController *)self _updateTableView];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPHCSBridgeCellularSettingsViewController;
  -[NPHCSBridgeCellularSettingsViewController willMoveToParentViewController:](&v5, "willMoveToParentViewController:");
  if (!a3) {
    [(NPHCSBridgeCellularSettingsViewController *)self _removeTinkerDeviceAssertion];
  }
}

- (void)dealloc
{
  [(NPHCSBridgeCellularSettingsViewController *)self _removeTinkerDeviceAssertion];
  v3.receiver = self;
  v3.super_class = (Class)NPHCSBridgeCellularSettingsViewController;
  [(NPHCSBridgeCellularSettingsViewController *)&v3 dealloc];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  objc_super v8 = [v7 objectAtIndexedSubscript:a4];
  v9 = [v8 objectForKeyedSubscript:@"key"];

  if ([v9 isEqualToString:@"appsDataUsageSection"])
  {
    v10 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"SortOptionsHeaderView"];
    v11 = [v10 sortToggle];
    [v11 addTarget:self action:"sortToggleSelector" forEvents:64];

    v12 = [v10 sortToggle];
    v13 = BPSBridgeTintColor();
    [v12 setTitleColor:v13 forState:0];

    [v10 setTitles];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)sortToggleSelector
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v3 BOOLForKey:@"NPHCSBridgeCellularUsageShouldSortByNameKey"] ^ 1;

  objc_super v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setBool:v4 forKey:@"NPHCSBridgeCellularUsageShouldSortByNameKey"];

  [(NPHCSBridgeCellularSettingsViewController *)self _sortCellularDataUsageItems];

  [(NPHCSBridgeCellularSettingsViewController *)self _updateTableView];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  v7 = [v6 objectAtIndexedSubscript:a4];
  objc_super v8 = [v7 objectForKeyedSubscript:@"key"];
  unsigned __int8 v9 = [v8 isEqualToString:@"appsDataUsageSection"];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
    v12 = [v11 objectAtIndexedSubscript:a4];
    v10 = [v12 objectForKeyedSubscript:@"header"];
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  objc_super v3 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  v7 = [v6 objectForKeyedSubscript:@"count"];
  id v8 = [v7 integerValue];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  unsigned __int8 v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v10 = [v9 objectForKeyedSubscript:@"key"];

  if ([v10 isEqualToString:@"activeCellularPlansSection"])
  {
    v11 = nph_general_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315394;
      v30 = "-[NPHCSBridgeCellularSettingsViewController tableView:cellForRowAtIndexPath:]";
      __int16 v31 = 1024;
      unsigned int v32 = [(NPHCSBridgeCellularSettingsViewController *)self receivedRemotePlanInfo];
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%s -- receivedRemotePlanInfo:%d", (uint8_t *)&v29, 0x12u);
    }

    if ([(NPHCSBridgeCellularSettingsViewController *)self receivedRemotePlanInfo])
    {
      v12 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
      if ([v12 count])
      {
        id v13 = [v7 row];
        v14 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
        id v15 = [v14 count];

        if (v13 < v15)
        {
          v16 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
          v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
          v18 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
          +[NPHCSCellularPlanCell cellForTableView:reuseIdentifier:cellularPlanItem:hasMultipleActiveSIM:](NPHCSCellularPlanCell, "cellForTableView:reuseIdentifier:cellularPlanItem:hasMultipleActiveSIM:", v6, @"CellularPlanCellIdentifier", v17, (unint64_t)[v18 count] > 1);
          id v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
          goto LABEL_21;
        }
      }
      else
      {
      }
      uint64_t v20 = [(NPHCSBridgeCellularSettingsViewController *)self _setUpCellularPlanCell];
    }
    else
    {
      uint64_t v20 = +[NPHCSCellularPlanCell cellForTableView:v6 reuseIdentifier:@"CellularPlanCellIdentifier" cellularPlanItem:0 hasMultipleActiveSIM:0];
    }
    goto LABEL_20;
  }
  if ([v10 isEqualToString:@"inactiveCellularPlansSection"])
  {
    v16 = [(NPHCSBridgeCellularSettingsViewController *)self inactiveCellularPlans];
    v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    id v19 = +[NPHCSCellularPlanCell cellForTableView:v6 reuseIdentifier:@"CellularPlanCellIdentifier" cellularPlanItem:v17 hasMultipleActiveSIM:0];
    goto LABEL_10;
  }
  if ([v10 isEqualToString:@"appsDataUsageSection"])
  {
    v21 = [(NPHCSBridgeCellularSettingsViewController *)self appsDataUsageArray];
    v22 = objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    unsigned int v23 = [v22 isForAnApp];
    v24 = @"CellularDataUsageDisclosureCell";
    if (v23) {
      v24 = @"CellularDataUsageCell";
    }
    v25 = v24;
    v26 = +[NPHCellularBridgeUIManager sharedInstance];
    +[NPHCSAppCellularDataUsageCell cellForTableView:reuseIdentifier:appDataUsageItem:isCellularSetup:](NPHCSAppCellularDataUsageCell, "cellForTableView:reuseIdentifier:appDataUsageItem:isCellularSetup:", v6, v25, v22, [v26 cellularPlanIsSetUp]);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
    if (v19) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if ([v10 isEqualToString:@"resetDataUsageSection"])
  {
    uint64_t v20 = [(NPHCSBridgeCellularSettingsViewController *)self _resetStatisticsCell];
LABEL_20:
    id v19 = (id)v20;
    goto LABEL_21;
  }
LABEL_22:
  v27 = nph_general_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_122E8(v27);
  }

  id v19 = objc_alloc_init((Class)UITableViewCell);
LABEL_25:

  return v19;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  id v8 = [v7 objectAtIndexedSubscript:a4];
  unsigned __int8 v9 = [v8 objectForKeyedSubscript:@"key"];

  v10 = [(NPHCSBridgeCellularSettingsViewController *)self _footerStringForErrors];
  v11 = 0;
  if ([v9 isEqualToString:@"activeCellularPlansSection"] && v10)
  {
    v11 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"FooterHyperLinkView"];
    v12 = [v11 textView];
    [v12 setText:v10];
  }

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v5 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 objectForKeyedSubscript:@"key"];

  if ([v7 isEqualToString:@"appsDataUsageSection"])
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v9 = [v8 localizedStringForKey:@"CELLULAR_DATA_USAGE_GROUP_FOOTER" value:&stru_1CDE0 table:0];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  id v8 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  unsigned __int8 v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v10 = [v9 objectForKeyedSubscript:@"key"];

  if ([v10 isEqualToString:@"resetDataUsageSection"])
  {
    [(NPHCSBridgeCellularSettingsViewController *)self _clearStats];
    goto LABEL_19;
  }
  if ([v10 isEqualToString:@"appsDataUsageSection"])
  {
    v11 = [v6 cellForRowAtIndexPath:v7];
    v12 = [v11 appDataUsageItem];
    id v13 = [v12 childObjects];

    if (v13)
    {
      v14 = NPHCSCellularSettingsDetailsViewController;
    }
    else
    {
      if (![v12 isForAnApp]
        || !+[NPHSharedUtilities isActiveWatchChinaRegionCellular])
      {
        goto LABEL_14;
      }
      v14 = NPHCSDataPolicySelectionViewController;
    }
    id v15 = [[v14 alloc] initWithStyle:2];
    [v15 setAppDataUsageItem:v12];
    v16 = +[NPHCellularBridgeUIManager sharedInstance];
    objc_msgSend(v15, "setCellularSetup:", objc_msgSend(v16, "cellularPlanIsSetUp"));

    v17 = [(NPHCSBridgeCellularSettingsViewController *)self navigationController];
    [v17 pushViewController:v15 animated:1];

LABEL_14:
    goto LABEL_19;
  }
  if (![v10 isEqualToString:@"activeCellularPlansSection"]) {
    goto LABEL_19;
  }
  id v18 = [v7 row];
  id v19 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
  if (v18 >= [v19 count])
  {
  }
  else
  {
    uint64_t v20 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
    id v21 = [v20 count];

    if (v21)
    {
      v11 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
      v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      [(NPHCSBridgeCellularSettingsViewController *)self _switchToCellularPlanItem:v12];
      goto LABEL_14;
    }
  }
  v22 = nph_general_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_1232C(v7, v22);
  }

LABEL_19:
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = nph_general_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "accessoryButtonTappedForRowWithIndexPath:%@", (uint8_t *)&v13, 0xCu);
  }

  id v7 = [(NPHCSBridgeCellularSettingsViewController *)self sections];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  unsigned __int8 v9 = [v8 objectForKeyedSubscript:@"key"];

  if ([v9 isEqualToString:@"activeCellularPlansSection"])
  {
    v10 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
  }
  else
  {
    if (![v9 isEqualToString:@"inactiveCellularPlansSection"])
    {
      v12 = 0;
      goto LABEL_9;
    }
    v10 = [(NPHCSBridgeCellularSettingsViewController *)self inactiveCellularPlans];
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));

LABEL_9:
  [(NPHCSBridgeCellularSettingsViewController *)self _showManageOrDeleteForCellularPlanItem:v12];
}

- (id)_setUpCellularPlanCell
{
  id v3 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
  id v4 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
  id v5 = [v4 count];
  id v6 = [(NPHCSBridgeCellularSettingsViewController *)self inactiveCellularPlans];
  id v7 = (char *)[v6 count];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v9 = v8;
  if (&v7[(void)v5]) {
    CFStringRef v10 = @"CELLULAR_PLAN_BUTTON_ADD_CELLULAR";
  }
  else {
    CFStringRef v10 = @"CELLULAR_PLAN_BUTTON_SET_UP_CELLULAR";
  }
  v11 = [v8 localizedStringForKey:v10 value:&stru_1CDE0 table:0];
  v12 = [v3 textLabel];
  [v12 setText:v11];

  int v13 = BPSBridgeTintColor();
  uint64_t v14 = [v3 textLabel];
  [(id)v14 setTextColor:v13];

  id v15 = +[NPHCellularBridgeUIManager sharedInstance];
  LOBYTE(v14) = [v15 shouldAllowUserToAddOrSetUpPlan];

  if (v14)
  {
    id v16 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_setUpPlan"];
    [v16 setNumberOfTapsRequired:1];
    v17 = [v3 textLabel];
    [v17 addGestureRecognizer:v16];

    id v18 = [v3 textLabel];
    [v18 setUserInteractionEnabled:1];
  }
  else
  {
    id v19 = [v3 textLabel];
    [v19 setEnabled:0];

    [v3 setEnabled:0];
  }

  return v3;
}

- (id)_resetStatisticsCell
{
  id v3 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"RESET_STATISTICS_TITLE" value:&stru_1CDE0 table:0];
  id v6 = [v3 textLabel];
  [v6 setText:v5];

  id v7 = [(NPHCSBridgeCellularSettingsViewController *)self view];
  id v8 = [v7 tintColor];
  unsigned __int8 v9 = [v3 textLabel];
  [v9 setTextColor:v8];

  return v3;
}

- (void)_updateTableView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C84C;
  block[3] = &unk_1CA00;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_checkForUpdatedCarrierBundle
{
  if (CTSUServerConnectionRef())
  {
    __CTServerConnectionGetUpdatedCarrierBundle();
  }
}

- (void)_displaySoftwareUpdateAlertIfNeeded
{
  id v3 = [(NPHCSBridgeCellularSettingsViewController *)self _errorsForFooterMessage];
  id v5 = [v3 firstObjectPassingTest:&stru_1CA40];

  id v4 = v5;
  if (v5)
  {
    [(NPHCSBridgeCellularSettingsViewController *)self presentError:v5];
    id v4 = v5;
  }
}

- (void)_switchToCellularPlanItem:(id)a3
{
  id v4 = a3;
  if ([v4 isSelectable] && (objc_msgSend(v4, "isSelected") & 1) == 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_CE94;
    v6[3] = &unk_1CAB8;
    id v7 = v4;
    id v8 = self;
    nph_ensure_on_main_queue(v6);
    id v5 = v7;
  }
  else
  {
    id v5 = nph_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_123CC();
    }
  }
}

- (void)_promptUserForConsentIfNecessary
{
  id v3 = +[NPHCellularBridgeUIManager sharedInstance];
  id v4 = [v3 selectedCellularPlan];

  id v5 = [v4 plan];
  unsigned int v6 = [v5 status];

  id v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    unsigned __int8 v9 = "-[NPHCSBridgeCellularSettingsViewController _promptUserForConsentIfNecessary]";
    __int16 v10 = 1024;
    BOOL v11 = v6 == 7;
    __int16 v12 = 1024;
    unsigned int v13 = [(NPHCSBridgeCellularSettingsViewController *)self promptingUserForConsent];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s consentRequired:%d promptingUserForConsent:%d", (uint8_t *)&v8, 0x18u);
  }

  if (v6 == 7 && ![(NPHCSBridgeCellularSettingsViewController *)self promptingUserForConsent]) {
    [(NPHCSBridgeCellularSettingsViewController *)self _promptUserForConsent:v4];
  }
}

- (void)_userDidProvideResponse:(int64_t)a3 forPlan:(id)a4
{
  id v6 = a4;
  id v7 = +[CTCellularPlanManager sharedManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_D358;
  v8[3] = &unk_1CB08;
  v8[4] = self;
  [v7 userDidProvideConsentResponse:a3 forPlan:v6 isRemote:1 completion:v8];
}

- (void)_promptUserForConsent:(id)a3
{
  id v4 = a3;
  id v5 = +[NPHCellularBridgeUIManager sharedInstance];
  id v24 = 0;
  id v6 = [v5 consentRequiredRelevantCellularPlanItem:&v24];
  id v7 = v24;

  int v8 = +[NPHCellularBridgeUIManager sharedInstance];
  unsigned __int8 v9 = [v8 userConsentMessageForConsentType:v6 relevantPlanItem:v7];

  if (v9)
  {
    [(NPHCSBridgeCellularSettingsViewController *)self setPromptingUserForConsent:1];
    __int16 v10 = nph_general_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[NPHCSBridgeCellularSettingsViewController _promptUserForConsent:]";
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s - consentMessage:%@", buf, 0x16u);
    }

    BOOL v11 = +[UIAlertController alertControllerWithTitle:0 message:v9 preferredStyle:0];
    __int16 v12 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v13 = [v12 localizedStringForKey:@"CONSENT_ACTION" value:&stru_1CDE0 table:0];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_D8D0;
    v22[3] = &unk_1CB30;
    v22[4] = self;
    id v19 = v4;
    id v14 = v4;
    id v23 = v14;
    id v15 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v22];

    [v11 addAction:v15];
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"REPLACE_PLAN_CANCEL" value:&stru_1CDE0 table:0];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_D8E0;
    v20[3] = &unk_1CB30;
    v20[4] = self;
    id v21 = v14;
    id v18 = +[UIAlertAction actionWithTitle:v17 style:1 handler:v20];

    [v11 addAction:v18];
    [(NPHCSBridgeCellularSettingsViewController *)self presentViewController:v11 animated:1 completion:0];

    id v4 = v19;
  }
}

- (void)presentError:(id)a3
{
  id v4 = a3;
  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[NPHCSBridgeCellularSettingsViewController presentError:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s - Error: %@", (uint8_t *)&v11, 0x16u);
  }

  if (v4)
  {
    id v6 = [v4 domain];
    if ([v6 isEqualToString:CTCellularPlanErrorDomain])
    {
      id v7 = (int *)[v4 code];

      if (v7 == &dword_10)
      {
LABEL_11:
        __int16 v10 = [v4 description];
        BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();

        goto LABEL_12;
      }
    }
    else
    {
    }
    int v8 = [v4 domain];
    unsigned int v9 = [v8 isEqualToString:NPHCellularDataUsageErrorDomain];

    if (v9 && [v4 code] != (char *)&stru_20.cmd + 3) {
      goto LABEL_11;
    }
    +[NPHCellularBridgeUIManager presentCellularError:v4 onViewController:self];
  }
LABEL_12:
}

- (void)presentErrorMessage:(id)a3
{
}

- (void)presentErrorWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = nph_general_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    id v15 = "-[NPHCSBridgeCellularSettingsViewController presentErrorWithTitle:message:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s - errorTitle:%@ errorMessage:%@", (uint8_t *)&v14, 0x20u);
  }

  if (!v6)
  {
    unsigned int v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v9 localizedStringForKey:@"ERROR_TITLE" value:&stru_1CDE0 table:0];
  }
  __int16 v10 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  int v11 = +[NSBundle bundleForClass:objc_opt_class()];
  __int16 v12 = [v11 localizedStringForKey:@"ERROR_OK" value:&stru_1CDE0 table:0];
  __int16 v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:0];

  [v10 addAction:v13];
  [(NPHCSBridgeCellularSettingsViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (id)_errorsForFooterMessage
{
  id v3 = +[NPHCellularBridgeUIManager sharedInstance];
  id v4 = [v3 cellularUseErrors];

  if (![v4 count])
  {
    id v5 = +[NPHCellularBridgeUIManager sharedInstance];
    unsigned __int8 v6 = [v5 cellularPlanIsSetUp];

    if ((v6 & 1) == 0)
    {
      unsigned int v9 = +[NSError NPHCellularErrorWithCode:4 forSubscriptionContext:0];
      int v29 = v9;
      __int16 v10 = &v29;
      goto LABEL_6;
    }
    id v7 = +[NPHCellularBridgeUIManager sharedInstance];
    unsigned int v8 = [v7 LTEMayImpactService];

    if (v8)
    {
      unsigned int v9 = +[NSError NPHCellularErrorWithCode:5 forSubscriptionContext:0];
      v28 = v9;
      __int16 v10 = &v28;
LABEL_6:
      uint64_t v11 = +[NSArray arrayWithObjects:v10 count:1];

      id v4 = (void *)v11;
    }
  }
  __int16 v12 = +[NPHCellularBridgeUIManager sharedInstance];
  __int16 v13 = [v12 serviceSubscriptionsShouldShowAddNewRemotePlan];
  id v14 = [v13 count];

  if (v14)
  {
    id v15 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
    id v16 = [v15 count];
    id v17 = [(NPHCSBridgeCellularSettingsViewController *)self inactiveCellularPlans];
    __int16 v18 = (char *)[v17 count];

    if (&v18[(void)v16])
    {
      uint64_t v19 = [v4 objectsPassingTest:&stru_1CB50];

      id v4 = (void *)v19;
    }
  }
  uint64_t v20 = +[NSSet setWithArray:v4];
  id v21 = [v20 allObjects];

  v22 = nph_general_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315394;
    v25 = "-[NPHCSBridgeCellularSettingsViewController _errorsForFooterMessage]";
    __int16 v26 = 2112;
    __int16 v27 = v21;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%s - cellularUseErrors:%@", (uint8_t *)&v24, 0x16u);
  }

  return v21;
}

- (id)_footerStringForErrors
{
  v2 = [(NPHCSBridgeCellularSettingsViewController *)self _errorsForFooterMessage];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    id v4 = [v3 userInfo];
    id v5 = [v4 objectForKeyedSubscript:NSLocalizedDescriptionKey];

    unsigned __int8 v6 = +[NSMutableString stringWithString:v5];
    if ((unint64_t)[v2 count] >= 2)
    {
      unint64_t v7 = 1;
      do
      {
        [v6 appendString:@"\r\r"];
        unsigned int v8 = [v2 objectAtIndexedSubscript:v7];
        unsigned int v9 = [v8 userInfo];
        __int16 v10 = [v9 objectForKeyedSubscript:NSLocalizedDescriptionKey];

        [v6 appendString:v10];
        ++v7;
      }
      while (v7 < (unint64_t)[v2 count]);
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  id v11 = [v6 copy];

  return v11;
}

- (void)cellularPlansUpdated:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NPHCSBridgeCellularSettingsViewController *)self setReceivedRemotePlanInfo:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_E18C;
  v10[3] = &unk_1CB78;
  id v11 = v7;
  __int16 v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  nph_ensure_on_main_queue(v10);
}

- (BOOL)_shouldShowCellularDataUsage
{
  id v3 = [(NPHCSBridgeCellularSettingsViewController *)self appsDataUsageArray];
  if ([v3 count])
  {
    id v4 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
    if ([v4 count]) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = +[NPHSharedUtilities isActiveWatchChinaRegionCellular];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateCellularDataUsageItems
{
  id v3 = objc_alloc_init(NPHCSCellularDataUsageDataSource);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E368;
  v4[3] = &unk_1CBA0;
  v4[4] = self;
  [(NPHCSCellularDataUsageDataSource *)v3 getCellularDataUsage:v4];
}

- (void)_sortCellularDataUsageItems
{
  id v5 = [(NPHCSBridgeCellularSettingsViewController *)self appsDataUsageArray];
  id v3 = +[NPHCSAppCellularDataUsageItem userSelectedComparator];
  id v4 = [v5 sortedArrayUsingComparator:v3];
  [(NPHCSBridgeCellularSettingsViewController *)self setAppsDataUsageArray:v4];
}

- (void)_setUpPlan
{
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[NPHCSBridgeCellularSettingsViewController _setUpPlan]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(NPHCSBridgeCellularSettingsViewController *)self _getTinkerDeviceAssertion];
  id v4 = [objc_alloc((Class)NPHCellularSetupViewController) initWithConfiguration:1];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [(NPHCSBridgeCellularSettingsViewController *)self presentViewController:v5 animated:1 completion:&stru_1CBC0];
}

- (void)_clearStats
{
  uint64_t v12 = kCTCellularUsageDeviceID;
  uint64_t v13 = kCTCellularUsageRemoteDevice;
  v2 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CTSUServerConnectionRef();
  id v3 = CTSUServerQueue();
  uint64_t v4 = _CTServerConnectionEraseCellularDataUsageRecordsEx();

  id v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v7 = "-[NPHCSBridgeCellularSettingsViewController _clearStats]";
    __int16 v8 = 1024;
    int v9 = v4;
    __int16 v10 = 1024;
    int v11 = HIDWORD(v4);
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: domain: %d, error: %d", buf, 0x18u);
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "-[NPHCSBridgeCellularSettingsViewController simSetupFlowCompleted:]";
    __int16 v7 = 2048;
    unint64_t v8 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s: %lu", (uint8_t *)&v5, 0x16u);
  }
}

- (BOOL)_deleteWillPerformEUICCReset:(id)a3
{
  id v4 = a3;
  int v5 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
  int v6 = (char *)[v5 count];
  __int16 v7 = [(NPHCSBridgeCellularSettingsViewController *)self inactiveCellularPlans];
  if (&v6[(void)[v7 count]] == (unsigned char *)&dword_0 + 1)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    int v9 = [v4 plan];
    unsigned __int8 v8 = [v9 isDeleteNotAllowed];
  }
  return v8;
}

- (void)_showManageOrDeleteForCellularPlanItem:(id)a3
{
  id v4 = a3;
  if ([(NPHCSBridgeCellularSettingsViewController *)self _deleteWillPerformEUICCReset:v4])
  {
    int v5 = [(NPHCSBridgeCellularSettingsViewController *)self activeCellularPlans];
    int v6 = (char *)[v5 count];
    __int16 v7 = [(NPHCSBridgeCellularSettingsViewController *)self inactiveCellularPlans];
    BOOL v8 = &v6[(void)[v7 count]] > (unsigned char *)&dword_0 + 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  v33 = [v4 name];
  unsigned int v32 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  int v9 = [v4 plan];
  __int16 v10 = [v9 accountURL];
  id v11 = [v10 length];

  uint64_t v12 = &_s10Foundation17NSLocalizedString_9tableName6bundle5value7commentS2S_SSSgSo8NSBundleCS2StF_ptr;
  if (v11)
  {
    uint64_t v13 = nph_general_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v4 plan];
      id v15 = [v14 accountURL];
      *(_DWORD *)buf = 138412290;
      v41 = v15;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "manage plan URL:%@", buf, 0xCu);
    }
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"MANAGE_PLAN_ACTION" value:&stru_1CDE0 table:0];
    __int16 v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v33);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_EF1C;
    v37[3] = &unk_1CB30;
    id v38 = v4;
    v39 = self;
    uint64_t v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:v37];

    [v32 addAction:v19];
    uint64_t v12 = &_s10Foundation17NSLocalizedString_9tableName6bundle5value7commentS2S_SSSgSo8NSBundleCS2StF_ptr;
  }
  uint64_t v20 = @"REMOVE_PLAN_ACTION";
  if (v8) {
    uint64_t v20 = @"REMOVE_MULTILE_PLANS_ACTION";
  }
  id v21 = v12[136];
  v22 = v20;
  id v23 = +[NSBundle bundleForClass:objc_opt_class()];
  [v23 localizedStringForKey:v22 value:&stru_1CDE0 table:0];
  v25 = BOOL v24 = v8;

  __int16 v26 = objc_msgSend(v21, "stringWithFormat:", v25, v33);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_F114;
  v34[3] = &unk_1CC38;
  v34[4] = self;
  id v35 = v4;
  BOOL v36 = v24;
  id v27 = v4;
  v28 = +[UIAlertAction actionWithTitle:v26 style:2 handler:v34];

  [v32 addAction:v28];
  int v29 = +[NSBundle bundleForClass:objc_opt_class()];
  v30 = [v29 localizedStringForKey:@"MANAGE_OR_REMOVE_PLAN_CANCEL" value:&stru_1CDE0 table:0];
  __int16 v31 = +[UIAlertAction actionWithTitle:v30 style:1 handler:0];

  [v32 addAction:v31];
  [(NPHCSBridgeCellularSettingsViewController *)self presentViewController:v32 animated:1 completion:0];
}

- (void)_promptUserToConfirmPlanRemoval:(id)a3 willRemoveMoreThanOnePlan:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  __int16 v7 = nph_general_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "cellularPlanItem:%@", buf, 0xCu);
  }

  BOOL v8 = @"REMOVE_PLAN_CONFIRMATION_MESSAGE";
  if (v4)
  {
    BOOL v8 = @"REMOVE_MORE_THAN_ONE_PLAN_CONFIRMATION_MESSAGE";
    int v9 = @"REMOVE_MORE_THAN_ONE_PLAN_ACTION";
  }
  else
  {
    int v9 = @"REMOVE_PLAN_ACTION";
  }
  __int16 v10 = v8;
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:v10 value:&stru_1CDE0 table:0];

  uint64_t v13 = [v6 name];
  id v14 = [v6 name];
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13, v14);
  id v16 = +[UIAlertController alertControllerWithTitle:0 message:v15 preferredStyle:0];

  id v17 = v9;
  __int16 v18 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:v17 value:&stru_1CDE0 table:0];

  uint64_t v20 = [v6 name];
  id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v20);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_F4DC;
  v28[3] = &unk_1CB30;
  id v29 = v6;
  v30 = self;
  id v22 = v6;
  id v23 = +[UIAlertAction actionWithTitle:v21 style:2 handler:v28];

  [v16 addAction:v23];
  BOOL v24 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"REMOVE_PLAN_CANCEL" value:&stru_1CDE0 table:0];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_F58C;
  v27[3] = &unk_1CC60;
  v27[4] = self;
  __int16 v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:v27];

  [v16 addAction:v26];
  [(NPHCSBridgeCellularSettingsViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)_removePlan:(id)a3
{
  id v4 = a3;
  int v5 = nph_general_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[NPHCSBridgeCellularSettingsViewController _removePlan:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(NPHCSBridgeCellularSettingsViewController *)self _getTinkerDeviceAssertion];
  unsigned int v6 = [(NPHCSBridgeCellularSettingsViewController *)self _deleteWillPerformEUICCReset:v4];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_F744;
  id v16 = &unk_1CA90;
  id v7 = v4;
  id v17 = v7;
  __int16 v18 = self;
  BOOL v8 = objc_retainBlock(&v13);
  int v9 = +[CTCellularPlanManager sharedManager];
  __int16 v10 = v9;
  if (v6)
  {
    id v11 = +[NPHCellularBridgeUIManager sharedInstance];
    uint64_t v12 = [v11 _currentDeviceCSN];
    [v10 eraseAllRemotePlansWithCSN:v12 completion:v8];
  }
  else
  {
    [v9 didDeleteRemotePlanItem:v7 completion:v8];
  }
}

- (void)_getTinkerDeviceAssertion
{
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v9 = "-[NPHCSBridgeCellularSettingsViewController _getTinkerDeviceAssertion]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (+[NPHSharedUtilities isActiveDeviceTinker])
  {
    [(NPHCSBridgeCellularSettingsViewController *)self _extendBackgroundAssertion];
    if ([(NPHCSBridgeCellularSettingsViewController *)self tinkerCellularSetUpBackgroundTaskID] == UIBackgroundTaskInvalid)
    {
      id v4 = +[UIApplication sharedApplication];
      -[NPHCSBridgeCellularSettingsViewController setTinkerCellularSetUpBackgroundTaskID:](self, "setTinkerCellularSetUpBackgroundTaskID:", [v4 beginBackgroundTaskWithName:@"Cellular-Setup-Flow" expirationHandler:&stru_1CC80]);
    }
    int v5 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v6 = +[NRDevice activeDevice];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_FBEC;
    v7[3] = &unk_1CCA8;
    v7[4] = self;
    [v5 setActivePairedDevice:v6 withActiveDeviceAssertionHandler:v7];
  }
}

- (void)_removeTinkerDeviceAssertion
{
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[NPHCSBridgeCellularSettingsViewController _removeTinkerDeviceAssertion]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(NPHCSBridgeCellularSettingsViewController *)self tinkerDeviceAssertion];
  unsigned int v5 = [v4 isActive];

  if (v5)
  {
    unsigned int v6 = +[UIApplication sharedApplication];
    objc_msgSend(v6, "endBackgroundTask:", -[NPHCSBridgeCellularSettingsViewController tinkerCellularSetUpBackgroundTaskID](self, "tinkerCellularSetUpBackgroundTaskID"));

    [(NPHCSBridgeCellularSettingsViewController *)self setTinkerCellularSetUpBackgroundTaskID:UIBackgroundTaskInvalid];
    id v7 = [(NPHCSBridgeCellularSettingsViewController *)self tinkerDeviceAssertion];
    [v7 invalidate];
  }
}

- (void)_extendBackgroundAssertion
{
  id v3 = nph_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[NPHCSBridgeCellularSettingsViewController _extendBackgroundAssertion]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s Wants to take/extend background assertion timeout.", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(NPHCSBridgeCellularSettingsViewController *)self tinkerCellularSetUpTaskCompletionTimeout];
  [v4 invalidate];

  unsigned int v5 = +[NSTimer timerWithTimeInterval:self target:"_expireTaskAssertion:" selector:0 userInfo:0 repeats:600.0];
  [(NPHCSBridgeCellularSettingsViewController *)self setTinkerCellularSetUpTaskCompletionTimeout:v5];

  unsigned int v6 = +[NSRunLoop currentRunLoop];
  id v7 = [(NPHCSBridgeCellularSettingsViewController *)self tinkerCellularSetUpTaskCompletionTimeout];
  [v6 addTimer:v7 forMode:NSRunLoopCommonModes];
}

- (void)_expireTaskAssertion:(id)a3
{
  id v4 = nph_general_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[NPHCSBridgeCellularSettingsViewController _expireTaskAssertion:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s Released Background Assertion due to a timeout.", (uint8_t *)&v7, 0xCu);
  }

  if ([(NPHCSBridgeCellularSettingsViewController *)self tinkerCellularSetUpBackgroundTaskID] != UIBackgroundTaskInvalid)
  {
    unsigned int v5 = nph_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "-[NPHCSBridgeCellularSettingsViewController _expireTaskAssertion:]";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s Setup Background Assertion Expired", (uint8_t *)&v7, 0xCu);
    }

    unsigned int v6 = +[UIApplication sharedApplication];
    objc_msgSend(v6, "endBackgroundTask:", -[NPHCSBridgeCellularSettingsViewController tinkerCellularSetUpBackgroundTaskID](self, "tinkerCellularSetUpBackgroundTaskID"));

    [(NPHCSBridgeCellularSettingsViewController *)self setTinkerCellularSetUpBackgroundTaskID:UIBackgroundTaskInvalid];
  }
}

- (BOOL)promptingUserForConsent
{
  return self->_promptingUserForConsent;
}

- (void)setPromptingUserForConsent:(BOOL)a3
{
  self->_promptingUserForConsent = a3;
}

- (BOOL)receivedRemotePlanInfo
{
  return self->_receivedRemotePlanInfo;
}

- (void)setReceivedRemotePlanInfo:(BOOL)a3
{
  self->_receivedRemotePlanInfo = a3;
}

- (NPHCSCellularPlanDataSource)cellularPlansDataSource
{
  return self->_cellularPlansDataSource;
}

- (void)setCellularPlansDataSource:(id)a3
{
}

- (NSArray)appsDataUsageArray
{
  return self->_appsDataUsageArray;
}

- (void)setAppsDataUsageArray:(id)a3
{
}

- (NSArray)uninstalledAppsDataUsageArray
{
  return self->_uninstalledAppsDataUsageArray;
}

- (void)setUninstalledAppsDataUsageArray:(id)a3
{
}

- (NSArray)systemServicesDataUsageArray
{
  return self->_systemServicesDataUsageArray;
}

- (void)setSystemServicesDataUsageArray:(id)a3
{
}

- (NSArray)activeCellularPlans
{
  return self->_activeCellularPlans;
}

- (void)setActiveCellularPlans:(id)a3
{
}

- (NSArray)inactiveCellularPlans
{
  return self->_inactiveCellularPlans;
}

- (void)setInactiveCellularPlans:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NRActiveDeviceAssertion)tinkerDeviceAssertion
{
  return self->_tinkerDeviceAssertion;
}

- (void)setTinkerDeviceAssertion:(id)a3
{
}

- (unint64_t)tinkerCellularSetUpBackgroundTaskID
{
  return self->_tinkerCellularSetUpBackgroundTaskID;
}

- (void)setTinkerCellularSetUpBackgroundTaskID:(unint64_t)a3
{
  self->_tinkerCellularSetUpBackgroundTaskID = a3;
}

- (NSTimer)tinkerCellularSetUpTaskCompletionTimeout
{
  return self->_tinkerCellularSetUpTaskCompletionTimeout;
}

- (void)setTinkerCellularSetUpTaskCompletionTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tinkerCellularSetUpTaskCompletionTimeout, 0);
  objc_storeStrong((id *)&self->_tinkerDeviceAssertion, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_inactiveCellularPlans, 0);
  objc_storeStrong((id *)&self->_activeCellularPlans, 0);
  objc_storeStrong((id *)&self->_systemServicesDataUsageArray, 0);
  objc_storeStrong((id *)&self->_uninstalledAppsDataUsageArray, 0);
  objc_storeStrong((id *)&self->_appsDataUsageArray, 0);
  objc_storeStrong((id *)&self->_cellularPlansDataSource, 0);

  objc_storeStrong((id *)&self->_flow, 0);
}

@end