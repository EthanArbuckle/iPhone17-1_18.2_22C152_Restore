@interface TSSIMUnlockListViewController
- (BOOL)_anESIMExistsInSubscriptionContexts;
- (BOOL)_doTwoEsimsExist;
- (BOOL)_doesPhysicalSimExist;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isEsimExist;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSMutableArray)subscriptionContexts;
- (NSMutableDictionary)subscriptionActions;
- (TSSIMUnlockListViewController)initWithSubscriptionContexts:(id)a3 subscriptionActions:(id)a4 suppressCancellation:(BOOL)a5 delegate:(id)a6;
- (TSSIMUnlockListViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_nameForSIMWithSubscriptionContext:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_numberOfLockedSubscriptionContexts;
- (void)_cancelButtonItemPressed:(id)a3;
- (void)_configureAncillaryViews;
- (void)_configureFooterView;
- (void)_configureHeaderView;
- (void)_configureNavigationItem;
- (void)_configureTableFooterView;
- (void)addSubscriptionContext:(id)a3 withSubscriptionAction:(id)a4 atIndex:(unint64_t)a5;
- (void)loadView;
- (void)removeSubscriptionContextAtIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIsEsimExist:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)unlockDetailViewController:(id)a3 didCompleteWithResult:(int64_t)a4;
- (void)unlockListFooterViewContinueButtonWasPressed:(id)a3;
- (void)updateSubscriptionContext:(id)a3 withSubscriptionAction:(id)a4 atIndex:(unint64_t)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TSSIMUnlockListViewController

- (TSSIMUnlockListViewController)initWithSubscriptionContexts:(id)a3 subscriptionActions:(id)a4 suppressCancellation:(BOOL)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (sub_1000107CC())
  {
    v13 = sub_100010734();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000135BC(v13);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)TSSIMUnlockListViewController;
  v14 = [(TSSIMUnlockListViewController *)&v23 init];
  v15 = v14;
  if (v14)
  {
    v14->_suppressCancellation = a5;
    v16 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
    telephonyClient = v15->_telephonyClient;
    v15->_telephonyClient = v16;

    v18 = (NSMutableArray *)[v10 mutableCopy];
    subscriptionContexts = v15->_subscriptionContexts;
    v15->_subscriptionContexts = v18;

    v20 = (NSMutableDictionary *)[v11 mutableCopy];
    subscriptionActions = v15->_subscriptionActions;
    v15->_subscriptionActions = v20;

    objc_storeWeak((id *)&v15->_delegate, v12);
    v15->_isEsimExist = [(TSSIMUnlockListViewController *)v15 _anESIMExistsInSubscriptionContexts];
  }

  return v15;
}

- (void)loadView
{
  v5 = objc_alloc_init(TSSIMUnlockListContainerView);
  [(TSSIMUnlockListContainerView *)v5 setAutoresizingMask:18];
  [(TSSIMUnlockListViewController *)self setView:v5];
  id v3 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"_cancelButtonItemPressed:"];
  [v3 setDirection:8];
  [v3 setDelegate:self];
  v4 = [(TSSIMUnlockListViewController *)self view];
  [v4 addGestureRecognizer:v3];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)TSSIMUnlockListViewController;
  [(TSSIMUnlockListViewController *)&v18 viewDidLoad];
  id v3 = objc_alloc_init(TSSIMUnlockListHeaderView);
  headerView = self->_headerView;
  self->_headerView = v3;

  v5 = [(TSSIMUnlockListViewController *)self _containerView];
  [v5 setHeaderView:self->_headerView];

  v6 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  tableView = self->_tableView;
  self->_tableView = v6;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setScrollEnabled:0];
  [(UITableView *)self->_tableView setTableFooterView:self->_tableFooterView];
  v8 = +[UIColor systemBackgroundColor];
  [(UITableView *)self->_tableView setBackgroundColor:v8];

  v9 = [(TSSIMUnlockListViewController *)self _containerView];
  [v9 setTableView:self->_tableView];

  if (!self->_isEsimExist && (unint64_t)[(NSMutableArray *)self->_subscriptionContexts count] >= 2)
  {
    id v10 = objc_alloc_init(TSSIMUnlockListTableFooterView);
    tableFooterView = self->_tableFooterView;
    self->_tableFooterView = v10;

    [(UITableView *)self->_tableView setTableFooterView:self->_tableFooterView];
  }
  id v12 = [[TSSIMUnlockListFooterView alloc] initWithDelegate:self];
  footerView = self->_footerView;
  self->_footerView = v12;

  v14 = +[UIColor systemBackgroundColor];
  [(TSSIMUnlockListFooterView *)self->_footerView setBackgroundColor:v14];

  v15 = [(TSSIMUnlockListViewController *)self _containerView];
  [v15 setFooterView:self->_footerView];

  v16 = [(TSSIMUnlockListViewController *)self _containerView];
  v17 = +[UIColor systemBackgroundColor];
  [v16 setBackgroundColor:v17];

  [(TSSIMUnlockListViewController *)self setEdgesForExtendedLayout:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockListViewController;
  [(TSSIMUnlockListViewController *)&v4 viewWillAppear:a3];
  [(TSSIMUnlockListViewController *)self _configureAncillaryViews];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TSSIMUnlockListViewController;
  -[TSSIMUnlockListViewController viewWillDisappear:](&v6, "viewWillDisappear:");
  v5 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  if (v5) {
    [(UITableView *)self->_tableView deselectRowAtIndexPath:v5 animated:v3];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_subscriptionContexts, "objectAtIndexedSubscript:", [a4 row]);
  v8 = [v7 uuid];
  v9 = [(NSMutableDictionary *)self->_subscriptionActions objectForKeyedSubscript:v8];
  if ([v9 actionType])
  {
    v48 = v8;
    if ([v9 actionType] == (id)1
      && ([v9 carrierName],
          id v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = [v10 length],
          v10,
          v11))
    {
      v45 = v7;
      id v46 = v6;
      id v12 = [v6 dequeueReusableCellWithIdentifier:@"SIMUnlockListUnlockedCellIdentifier"];
      v13 = [v9 carrierName];
      v14 = [v9 phoneNumber];
      id v15 = v12;
      id v16 = v13;
      id v17 = v15;
      id v44 = v15;
      if (!v15) {
        id v17 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"SIMUnlockListUnlockedCellIdentifier"];
      }
      id v18 = [v17 defaultContentConfiguration];
      [v18 setText:v16];
      v47 = v16;
      v19 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      v20 = [v18 textProperties];
      [v20 setFont:v19];

      [v18 setSecondaryText:v14];
      v21 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
      v22 = [v18 secondaryTextProperties];
      [v22 setFont:v21];

      objc_super v23 = +[UIColor lightGrayColor];
      v24 = [v18 secondaryTextProperties];
      [v24 setColor:v23];

      [v17 setContentConfiguration:v18];
      v25 = +[UIImage systemImageNamed:@"chevron.forward"];
      id v26 = [objc_alloc((Class)UIImageView) initWithImage:v25];
      id v27 = objc_alloc((Class)UIView);
      [v26 frame];
      id v28 = [v27 initWithFrame:];
      [v17 setAccessoryView:v28];
      v29 = +[NSBundle mainBundle];
      v30 = [v29 localizedStringForKey:@"SIM_UNLOCKED" value:&stru_100020AC8 table:@"Localizable"];
      v31 = [v17 contentView];
      sub_10000C7E4(v30, v31);

      v7 = v45;
      id v6 = v46;
      v8 = v48;
      v32 = v44;
    }
    else
    {
      v33 = [v6 dequeueReusableCellWithIdentifier:@"SIMUnlockListLockedCellIdentifier"];
      v34 = [(TSSIMUnlockListViewController *)self _nameForSIMWithSubscriptionContext:v7];
      switch((unint64_t)[v9 actionType])
      {
        case 1uLL:
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          CFStringRef v37 = @"SIM_UNLOCKED";
          goto LABEL_14;
        case 2uLL:
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          CFStringRef v37 = @"PIN_LOCKED";
          goto LABEL_14;
        case 3uLL:
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          CFStringRef v37 = @"PUK_LOCKED";
          goto LABEL_14;
        case 4uLL:
          v35 = +[NSBundle mainBundle];
          v36 = v35;
          CFStringRef v37 = @"PERMANENTLY_LOCKED";
LABEL_14:
          v38 = [v35 localizedStringForKey:v37 value:&stru_100020AC8 table:@"Localizable"];

          break;
        default:
          v38 = 0;
          break;
      }
      id v39 = v33;
      id v40 = v34;
      id v18 = v38;
      id v17 = v39;
      v32 = v39;
      if (!v39) {
        id v17 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"SIMUnlockListLockedCellIdentifier"];
      }
      v25 = [v17 defaultContentConfiguration];
      [v25 setText:v40];
      v41 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
      [v25 textProperties];
      v42 = v47 = v40;
      [v42 setFont:v41];

      [v17 setContentConfiguration:v25];
      [v17 setAccessoryType:1];
      id v26 = [v17 contentView];
      sub_10000C7E4(v18, v26);
      v14 = v18;
      v8 = v48;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  v5 = [self->_subscriptionContexts objectAtIndexedSubscript:[a4 row]];
  id v6 = [v5 uuid];
  v7 = [(NSMutableDictionary *)self->_subscriptionActions objectForKeyedSubscript:v6];
  BOOL v8 = (char *)[v7 actionType] - 2 < (char *)3;

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_subscriptionContexts count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  [self->_subscriptionContexts objectAtIndexedSubscript:[a4 row]];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v10 uuid];
  id v6 = [(NSMutableDictionary *)self->_subscriptionActions objectForKeyedSubscript:v5];
  if ((char *)[v6 actionType] - 2 <= (char *)2)
  {
    v7 = [(TSSIMUnlockListViewController *)self _nameForSIMWithSubscriptionContext:v10];
    BOOL v8 = [[TSSIMUnlockDetailViewController alloc] initWithSubscriptionContext:v10 subscriptionAction:v6 lockedSIMName:v7 delegate:self];
    v9 = [(TSSIMUnlockListViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
}

- (void)unlockDetailViewController:(id)a3 didCompleteWithResult:(int64_t)a4
{
  if (sub_1000107CC())
  {
    id v6 = sub_100010734();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100013640();
    }
  }
  if ((unint64_t)a4 < 4 || a4 == 6)
  {
    v7 = [(TSSIMUnlockListViewController *)self navigationController];
    id v8 = [v7 popToViewController:self animated:1];
  }
}

- (void)unlockListFooterViewContinueButtonWasPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained unlockListViewControllerDidComplete:self];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)addSubscriptionContext:(id)a3 withSubscriptionAction:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (sub_1000107CC())
  {
    id v10 = sub_100010734();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [v8 slotID];
      uint64_t v15 = CTSubscriptionSlotAsString();
      id v16 = sub_10000A36C((unint64_t)[v9 actionType]);
      *(_DWORD *)buf = 136316162;
      v19 = "-[TSSIMUnlockListViewController addSubscriptionContext:withSubscriptionAction:atIndex:]";
      __int16 v20 = 2080;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      objc_super v23 = v16;
      __int16 v24 = 2048;
      unint64_t v25 = a5;
      __int16 v26 = 2080;
      id v27 = "-[TSSIMUnlockListViewController addSubscriptionContext:withSubscriptionAction:atIndex:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[Db] %s: context %s, action %@, index %ld @%s", buf, 0x34u);
    }
  }
  id v11 = [v8 uuid];
  [(NSMutableDictionary *)self->_subscriptionActions setObject:v9 forKeyedSubscript:v11];
  [(NSMutableArray *)self->_subscriptionContexts insertObject:v8 atIndex:a5];
  if ([(TSSIMUnlockListViewController *)self isViewLoaded])
  {
    id v12 = +[NSIndexPath indexPathForRow:a5 inSection:0];
    tableView = self->_tableView;
    id v17 = v12;
    v14 = +[NSArray arrayWithObjects:&v17 count:1];
    [(UITableView *)tableView insertRowsAtIndexPaths:v14 withRowAnimation:100];

    [(TSSIMUnlockListViewController *)self _configureAncillaryViews];
  }
}

- (void)updateSubscriptionContext:(id)a3 withSubscriptionAction:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (sub_1000107CC())
  {
    id v10 = sub_100010734();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [v8 slotID];
      uint64_t v15 = CTSubscriptionSlotAsString();
      id v16 = sub_10000A36C((unint64_t)[v9 actionType]);
      *(_DWORD *)buf = 136316162;
      v19 = "-[TSSIMUnlockListViewController updateSubscriptionContext:withSubscriptionAction:atIndex:]";
      __int16 v20 = 2080;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      objc_super v23 = v16;
      __int16 v24 = 2048;
      unint64_t v25 = a5;
      __int16 v26 = 2080;
      id v27 = "-[TSSIMUnlockListViewController updateSubscriptionContext:withSubscriptionAction:atIndex:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[Db] %s: context %s, action %@, index %ld @%s", buf, 0x34u);
    }
  }
  id v11 = [v8 uuid];
  [(NSMutableDictionary *)self->_subscriptionActions setObject:v9 forKeyedSubscript:v11];
  [(NSMutableArray *)self->_subscriptionContexts replaceObjectAtIndex:a5 withObject:v8];
  if ([(TSSIMUnlockListViewController *)self isViewLoaded])
  {
    id v12 = +[NSIndexPath indexPathForRow:a5 inSection:0];
    tableView = self->_tableView;
    id v17 = v12;
    v14 = +[NSArray arrayWithObjects:&v17 count:1];
    [(UITableView *)tableView reloadRowsAtIndexPaths:v14 withRowAnimation:100];

    [(TSSIMUnlockListViewController *)self _configureAncillaryViews];
  }
}

- (void)removeSubscriptionContextAtIndex:(unint64_t)a3
{
  if (sub_1000107CC())
  {
    v5 = sub_100010734();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000136C0();
    }
  }
  id v6 = [(NSMutableArray *)self->_subscriptionContexts objectAtIndexedSubscript:a3];
  v7 = [v6 uuid];
  [(NSMutableDictionary *)self->_subscriptionActions setObject:0 forKeyedSubscript:v7];
  [(NSMutableArray *)self->_subscriptionContexts removeObjectAtIndex:a3];
  if ([(TSSIMUnlockListViewController *)self isViewLoaded])
  {
    id v8 = +[NSIndexPath indexPathForRow:a3 inSection:0];
    tableView = self->_tableView;
    id v11 = v8;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(UITableView *)tableView deleteRowsAtIndexPaths:v10 withRowAnimation:100];

    [(TSSIMUnlockListViewController *)self _configureAncillaryViews];
  }
}

- (void)_configureAncillaryViews
{
  [(TSSIMUnlockListViewController *)self _configureNavigationItem];
  [(TSSIMUnlockListViewController *)self _configureHeaderView];
  [(TSSIMUnlockListViewController *)self _configureTableFooterView];

  [(TSSIMUnlockListViewController *)self _configureFooterView];
}

- (void)_configureNavigationItem
{
  if (self->_suppressCancellation
    || (id v3 = [(NSMutableArray *)self->_subscriptionContexts count],
        v3 != (id)[(TSSIMUnlockListViewController *)self _numberOfLockedSubscriptionContexts]))
  {
    cancelButtonItem = self->_cancelButtonItem;
    if (!cancelButtonItem) {
      goto LABEL_8;
    }
    self->_cancelButtonItem = 0;
  }
  else
  {
    if (self->_cancelButtonItem) {
      goto LABEL_8;
    }
    objc_super v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonItemPressed:"];
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v4;
  }

LABEL_8:
  id v6 = [(TSSIMUnlockListViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:self->_cancelButtonItem];

  id v9 = +[UIColor systemBackgroundColor];
  v7 = [(TSSIMUnlockListViewController *)self navigationController];
  id v8 = [v7 view];
  [v8 setBackgroundColor:v9];
}

- (void)_configureHeaderView
{
  v6[0] = @"NumOfSimsAvailKey";
  id v3 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_subscriptionContexts count]];
  v7[0] = v3;
  v6[1] = @"kPhysicalSimExists";
  objc_super v4 = +[NSNumber numberWithBool:[(TSSIMUnlockListViewController *)self _doesPhysicalSimExist]];
  v7[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  [(TSSIMUnlockListHeaderView *)self->_headerView setNumberOfSIMsToUnlockAndanESIMExists:v5];
}

- (void)_configureTableFooterView
{
  if (self->_tableFooterView)
  {
    [(UITableView *)self->_tableView bounds];
    -[TSSIMUnlockListTableFooterView sizeThatFits:](self->_tableFooterView, "sizeThatFits:", v3, v4);
    double v6 = v5;
    [(TSSIMUnlockListTableFooterView *)self->_tableFooterView frame];
    -[TSSIMUnlockListTableFooterView setFrame:](self->_tableFooterView, "setFrame:");
    tableView = self->_tableView;
    [(UITableView *)tableView _tableFooterHeightDidChangeToHeight:v6];
  }
}

- (void)_configureFooterView
{
  id v3 = [(TSSIMUnlockListViewController *)self _numberOfLockedSubscriptionContexts];
  footerView = self->_footerView;
  if (v3 == [(NSMutableArray *)self->_subscriptionContexts count]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }

  [(TSSIMUnlockListFooterView *)footerView setMode:v5];
}

- (unint64_t)_numberOfLockedSubscriptionContexts
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMutableDictionary *)self->_subscriptionActions allValues];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if (((unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) actionType] & 0xFFFFFFFFFFFFFFFELL) == 2) {
          ++v5;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_cancelButtonItemPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained unlockListViewControllerDidComplete:self];
}

- (BOOL)_anESIMExistsInSubscriptionContexts
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->_subscriptionContexts;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[CoreTelephonyClient getSimHardwareInfo:error:](self->_telephonyClient, "getSimHardwareInfo:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        id v9 = [v8 hardwareType];

        if (v9 == (id)2)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_doesPhysicalSimExist
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->_subscriptionContexts;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = -[CoreTelephonyClient getSimHardwareInfo:error:](self->_telephonyClient, "getSimHardwareInfo:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        id v9 = [v8 hardwareType];

        if (v9 != (id)2)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_doTwoEsimsExist
{
  if (!self->_isEsimExist || (unint64_t)[(NSMutableDictionary *)self->_subscriptionActions count] < 2) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_subscriptionContexts;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[CoreTelephonyClient getSimHardwareInfo:error:](self->_telephonyClient, "getSimHardwareInfo:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        id v10 = [v9 hardwareType];

        if (v10 != (id)2)
        {
          BOOL v3 = 0;
          goto LABEL_14;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 1;
LABEL_14:

  return v3;
}

- (id)_nameForSIMWithSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(CoreTelephonyClient *)self->_telephonyClient getSimLabel:v4 error:0];
  id v6 = [(CoreTelephonyClient *)self->_telephonyClient getSimHardwareInfo:v4 error:0];
  if (v5 && [v5 didSetup])
  {
    uint64_t v7 = [v5 text];
    BOOL v8 = [v7 length] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (!self->_isEsimExist && [(NSMutableArray *)self->_subscriptionContexts count] != (id)1)
  {
    id v14 = [v6 simLocation];
    if (v14 == (id)2)
    {
      if (!v8)
      {
        id v9 = +[NSBundle mainBundle];
        id v10 = v9;
        CFStringRef v11 = @"HARDWARE_SLOT_TWO_NAME";
        goto LABEL_17;
      }
      goto LABEL_27;
    }
    if (v14 != (id)1) {
      goto LABEL_25;
    }
    if (!v8)
    {
      id v9 = +[NSBundle mainBundle];
      id v10 = v9;
      CFStringRef v11 = @"HARDWARE_SLOT_ONE_NAME";
      goto LABEL_17;
    }
LABEL_27:
    id v10 = [v5 text];
    uint64_t v13 = +[NSString stringWithString:v10];
    goto LABEL_28;
  }
  if ([v6 hardwareType] != (id)2)
  {
    if (v8)
    {
      long long v12 = [v5 text];
      goto LABEL_29;
    }
    id v9 = +[NSBundle mainBundle];
    id v10 = v9;
    CFStringRef v11 = @"COMBINATION_SIMS_PHYSICAL_NAME";
    goto LABEL_17;
  }
  if (![(TSSIMUnlockListViewController *)self _doTwoEsimsExist])
  {
    if (!v8)
    {
      id v9 = +[NSBundle mainBundle];
      id v10 = v9;
      CFStringRef v11 = @"COMBINATION_SIMS_ESIM_NAME";
      goto LABEL_17;
    }
    goto LABEL_27;
  }
  if ([v4 slotID] != (id)1)
  {
    if ([v4 slotID] == (id)2)
    {
      if (!v8)
      {
        id v9 = +[NSBundle mainBundle];
        id v10 = v9;
        CFStringRef v11 = @"COMBINATION_SIMS_ESIM_2_NAME";
        goto LABEL_17;
      }
      goto LABEL_27;
    }
LABEL_25:
    long long v12 = 0;
    goto LABEL_29;
  }
  if (v8) {
    goto LABEL_27;
  }
  id v9 = +[NSBundle mainBundle];
  id v10 = v9;
  CFStringRef v11 = @"COMBINATION_SIMS_ESIM_1_NAME";
LABEL_17:
  uint64_t v13 = [v9 localizedStringForKey:v11 value:&stru_100020AC8 table:@"Localizable"];
LABEL_28:
  long long v12 = (void *)v13;

LABEL_29:

  return v12;
}

- (NSMutableArray)subscriptionContexts
{
  return self->_subscriptionContexts;
}

- (NSMutableDictionary)subscriptionActions
{
  return self->_subscriptionActions;
}

- (TSSIMUnlockListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSSIMUnlockListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEsimExist
{
  return self->_isEsimExist;
}

- (void)setIsEsimExist:(BOOL)a3
{
  self->_isEsimExist = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscriptionActions, 0);
  objc_storeStrong((id *)&self->_subscriptionContexts, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);

  objc_storeStrong((id *)&self->_telephonyClient, 0);
}

@end