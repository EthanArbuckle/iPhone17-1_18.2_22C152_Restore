@interface HSPCGuestAccessTableViewController
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HSPCGuestAccessTableViewController)init;
- (HSPCGuestAccessTableViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSPCGuestAccessTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NAFuture)commitInProgress;
- (id)_enableAccessIncludingGuestPinCodeItems:(id)a3;
- (id)commitConfiguration;
- (void)_updateCellInTableView:(id)a3 atIndexPath:(id)a4;
- (void)setCommitInProgress:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewDidLoad;
@end

@implementation HSPCGuestAccessTableViewController

- (HSPCGuestAccessTableViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[HFHomeKitDispatcher sharedDispatcher];
  v10 = [v8 home];
  v11 = [v9 pinCodeManagerForHome:v10];

  v12 = [HSPCGuestAccessItemManager alloc];
  v13 = [v8 home];
  v14 = [v8 addedAccessory];
  v15 = [(HSPCGuestAccessItemManager *)v12 initWithPinCodeManager:v11 delegate:self home:v13 forAccessory:v14];

  v20.receiver = self;
  v20.super_class = (Class)HSPCGuestAccessTableViewController;
  v16 = [(HSPCGuestAccessTableViewController *)&v20 initWithItemManager:v15 tableViewStyle:2];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_config, a4);
    objc_storeStrong((id *)&v17->_coordinator, a3);
    commitInProgress = v17->_commitInProgress;
    v17->_commitInProgress = 0;
  }
  return v17;
}

- (HSPCGuestAccessTableViewController)init
{
  v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("initWithCoordinator:config:");
  [v4 handleFailureInMethod:a2 object:self file:@"HSPCGuestAccessTableViewController.m" lineNumber:56 description:@"%s is unavailable; use %@ instead"];
    "-[HSPCGuestAccessTableViewController init]",
    v5);

  return 0;
}

- (HSPCGuestAccessTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  v6 = +[NSAssertionHandler currentHandler];
  id v7 = NSStringFromSelector("initWithCoordinator:config:");
  [v6 handleFailureInMethod:a2 object:self file:@"HSPCGuestAccessTableViewController.m" lineNumber:62 description:@"%s is unavailable; use %@ instead"];
    "-[HSPCGuestAccessTableViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)HSPCGuestAccessTableViewController;
  [(HSPCGuestAccessTableViewController *)&v10 viewDidLoad];
  [(HSPCGuestAccessTableViewController *)self setWantsPreferredContentSize:1];
  v3 = [(HSPCGuestAccessTableViewController *)self tableView];
  [v3 setAllowsMultipleSelection:1];

  v4 = [(HSPCGuestAccessTableViewController *)self tableView];
  v5 = [v4 layer];
  [v5 setMasksToBounds:1];

  v6 = [(HSPCGuestAccessTableViewController *)self tableView];
  id v7 = [v6 layer];
  [v7 setCornerRadius:20.0];

  id v8 = [(HSPCGuestAccessTableViewController *)self tableView];
  [v8 setEstimatedRowHeight:88.0];

  v9 = [(HSPCGuestAccessTableViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];
}

- (id)_enableAccessIncludingGuestPinCodeItems:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(HSPCGuestAccessTableViewController *)self itemManager];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 pinCodeManager];
  v9 = [(HSPCGuestAccessTableViewController *)self config];
  objc_super v10 = [v9 addedAccessory];
  v11 = [v8 enablePinCodesForNewAccessory:v10 forGuestItems:v4];

  return v11;
}

- (void)_updateCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HSPCGuestAccessTableViewController *)self itemManager];
  id v10 = [v8 displayedItemAtIndexPath:v6];

  v9 = [v7 cellForRowAtIndexPath:v6];

  [(HSPCGuestAccessTableViewController *)self updateCell:v9 forItem:v10 indexPath:v6 animated:1];
}

- (id)commitConfiguration
{
  uint64_t v3 = [(HSPCGuestAccessTableViewController *)self commitInProgress];
  if (v3
    && (id v4 = (void *)v3,
        [(HSPCGuestAccessTableViewController *)self commitInProgress],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isFinished],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v26 = +[NAFuture futureWithResult:&off_1000AFEC0];
  }
  else
  {
    id v7 = [(HSPCGuestAccessTableViewController *)self tableView];
    id v8 = [v7 indexPathsForSelectedRows];

    v9 = +[NSMutableArray array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v16 = [(HSPCGuestAccessTableViewController *)self itemManager];
          v17 = [v16 displayedItemAtIndexPath:v15];

          objc_opt_class();
          id v18 = v17;
          if (objc_opt_isKindOfClass()) {
            v19 = v18;
          }
          else {
            v19 = 0;
          }
          id v20 = v19;

          [v9 na_safeAddObject:v20];
        }
        id v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    v21 = [(HSPCGuestAccessTableViewController *)self _enableAccessIncludingGuestPinCodeItems:v9];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100006240;
    v28[3] = &unk_1000A8D98;
    v28[4] = self;
    v22 = [v21 addCompletionBlock:v28];
    [(HSPCGuestAccessTableViewController *)self setCommitInProgress:v22];

    v23 = [(HSPCGuestAccessTableViewController *)self itemManager];
    [v23 disableExternalUpdatesWithReason:@"setupGuestAccessTableViewControllerUpdatesDisabledReason "];

    v24 = [(HSPCGuestAccessTableViewController *)self commitInProgress];
    v25 = [v24 flatMap:&stru_1000A8DD8];
    v26 = [v25 recover:&stru_1000A8E18];
  }

  return v26;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HSPCGuestAccessTableViewController;
  [(HSPCGuestAccessTableViewController *)&v19 setupCell:v8 forItem:v9 indexPath:a5];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    uint64_t v13 = +[UIListContentConfiguration cellConfiguration];
    v14 = +[HUListContentConfigurationUtilities labelConfiguration:v13 forItem:v12];

    [v14 setPrefersSideBySideTextAndSecondaryText:0];
    double v15 = HUDefaultAvatarSize;
    v16 = [v14 imageProperties];
    [v16 setReservedLayoutSize:v15, v15];

    v17 = +[UIColor systemGray2Color];
    id v18 = [v14 imageProperties];
    [v18 setTintColor:v17];

    [v14 setAxesPreservingSuperviewLayoutMargins:2];
    [v8 setContentConfiguration:v14];
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)HSPCGuestAccessTableViewController;
  [(HSPCGuestAccessTableViewController *)&v28 updateCell:v10 forItem:v11 indexPath:v12 animated:v6];
  objc_opt_class();
  id v13 = v10;
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  objc_opt_class();
  id v16 = v11;
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v18) {
    BOOL v19 = v15 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19)
  {
    v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v20 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138413058;
      long long v30 = v20;
      __int16 v31 = 2080;
      long long v32 = "-[HSPCGuestAccessTableViewController updateCell:forItem:indexPath:animated:]";
      __int16 v33 = 2112;
      id v34 = v13;
      __int16 v35 = 2112;
      id v36 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "(%@:%s) cell %@ should be UITableViewCell, and item %@ should be HFPinCodeItem", buf, 0x2Au);
    }
  }
  else
  {
    v21 = [(HSPCGuestAccessTableViewController *)self tableView];
    v22 = [v21 indexPathsForSelectedRows];

    if ([v22 containsObject:v12]) {
      CFStringRef v24 = @"checkmark.circle.fill";
    }
    else {
      CFStringRef v24 = @"circle";
    }
    v25 = +[UIImage systemImageNamed:v24];
    id v26 = [objc_alloc((Class)UIImageView) initWithImage:v25];

    [v15 setAccessoryView:v26];
    v27 = +[UIColor clearColor];
    [v15 setBackgroundColor:v27];

    [v15 setSelectionStyle:0];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCGuestAccessTableViewController;
  id v6 = a4;
  id v7 = a3;
  [(HSPCGuestAccessTableViewController *)&v8 tableView:v7 didSelectRowAtIndexPath:v6];
  -[HSPCGuestAccessTableViewController _updateCellInTableView:atIndexPath:](self, "_updateCellInTableView:atIndexPath:", v7, v6, v8.receiver, v8.super_class);
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

- (NAFuture)commitInProgress
{
  return self->_commitInProgress;
}

- (void)setCommitInProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitInProgress, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end