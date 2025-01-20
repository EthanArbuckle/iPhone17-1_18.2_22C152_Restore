@interface VMGreetingChangeViewController
- (BOOL)arrayContainsUUID:(id)a3 uuid:(id)a4;
- (BOOL)liveVoicemailEnabled;
- (CTXPCContexts)activeContexts;
- (CoreTelephonyClient)client;
- (MPGreetingAccount)selectedAccount;
- (NSArray)accounts;
- (NSMutableArray)observations;
- (VMAccountsViewController)accountsViewController;
- (id)accountAtIndex:(unint64_t)a3;
- (id)accountsView:(id)a3 buttonForRowAtIndex:(unint64_t)a4;
- (id)greetingViewControllerForAccount:(id)a3;
- (id)liveVoicemailAccount;
- (id)titleForAccountsView:(id)a3;
- (unint64_t)numberOfRowsForAccountsView:(id)a3;
- (void)accountsView:(id)a3 buttonTappedForRowWithIndex:(unint64_t)a4;
- (void)activeSubscriptionsDidChange;
- (void)cancelAction:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setAccountsViewController:(id)a3;
- (void)setActiveContexts:(id)a3;
- (void)setObservations:(id)a3;
- (void)setSelectedAccount:(id)a3;
- (void)startObservingPreferences;
- (void)stopObservingPreferences;
- (void)updateAccounts;
- (void)updateActiveContexts;
- (void)updateView;
- (void)viewDidLoad;
- (void)voicemailGreetingViewControllerFinished:(id)a3;
@end

@implementation VMGreetingChangeViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)VMGreetingChangeViewController;
  [(VMGreetingChangeViewController *)&v9 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"ACCOUNTS_VIEW_CONTROLLER_NAVIGATION_ITEM_TITLE_GREETING" value:&stru_100285990 table:@"VoicemailUI"];
  v5 = [(VMGreetingChangeViewController *)self navigationItem];
  [v5 setTitle:v4];

  v6 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
  client = self->_client;
  self->_client = v6;

  v8 = [(VMGreetingChangeViewController *)self client];
  [v8 setDelegate:self];

  [(VMGreetingChangeViewController *)self updateActiveContexts];
  [(VMGreetingChangeViewController *)self updateAccounts];
  [(VMGreetingChangeViewController *)self updateView];
}

- (id)accountAtIndex:(unint64_t)a3
{
  v4 = [(VMGreetingChangeViewController *)self accounts];
  if ((unint64_t)[v4 count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)updateAccounts
{
  v7 = [a2 labelID];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Failed to create account for subscription %@", a1, 0xCu);
}

- (void)updateView
{
  v3 = [(VMNavigationController *)self manager];
  v4 = [v3 accounts];
  id v5 = [v4 count];

  if ((unint64_t)v5 >= 2)
  {
    v6 = [(VMGreetingChangeViewController *)self accountsViewController];
    v18 = v6;
    v7 = +[NSArray arrayWithObjects:&v18 count:1];
    [(VMGreetingChangeViewController *)self setViewControllers:v7];
    goto LABEL_8;
  }
  v8 = [(VMGreetingChangeViewController *)self accounts];
  v6 = [v8 firstObject];

  if (v6)
  {
    [(VMGreetingChangeViewController *)self setSelectedAccount:v6];
    objc_super v9 = [(VMGreetingChangeViewController *)self selectedAccount];
    v7 = [(VMGreetingChangeViewController *)self greetingViewControllerForAccount:v9];

    v17 = v7;
    v10 = &v17;
LABEL_7:
    v14 = +[NSArray arrayWithObjects:v10 count:1];
    [(VMGreetingChangeViewController *)self setViewControllers:v14];

    goto LABEL_8;
  }
  v11 = [(VMGreetingChangeViewController *)self liveVoicemailAccount];

  if (v11)
  {
    v12 = [(VMGreetingChangeViewController *)self liveVoicemailAccount];
    [(VMGreetingChangeViewController *)self setSelectedAccount:v12];

    v13 = [(VMGreetingChangeViewController *)self selectedAccount];
    v7 = [(VMGreetingChangeViewController *)self greetingViewControllerForAccount:v13];

    v16 = v7;
    v10 = &v16;
    goto LABEL_7;
  }
  v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No accounts were found.", (uint8_t *)v15, 2u);
  }
LABEL_8:
}

- (VMAccountsViewController)accountsViewController
{
  accountsViewController = self->_accountsViewController;
  if (!accountsViewController)
  {
    v4 = [VMAccountsViewController alloc];
    id v5 = [(VMNavigationController *)self manager];
    v6 = [(VMViewController *)v4 initWithManager:v5];
    v7 = self->_accountsViewController;
    self->_accountsViewController = v6;

    v8 = [(VMAccountsViewController *)self->_accountsViewController accountsView];
    [v8 setDataSource:self];

    objc_super v9 = [(VMAccountsViewController *)self->_accountsViewController accountsView];
    [v9 setDelegate:self];

    id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelAction:"];
    v11 = [(VMAccountsViewController *)self->_accountsViewController navigationItem];
    [v11 setLeftBarButtonItem:v10];

    accountsViewController = self->_accountsViewController;
  }

  return accountsViewController;
}

- (id)greetingViewControllerForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [[PHVoicemailGreetingViewController alloc] initWithAccount:v4];

  [(PHVoicemailGreetingViewController *)v5 setGreetingDelegate:self];

  return v5;
}

- (void)updateActiveContexts
{
  id v5 = [a1 client];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to get active contexts from client %@: %@", (uint8_t *)&v6, 0x16u);
}

- (void)cancelAction:(id)a3
{
  id v3 = [(VMGreetingChangeViewController *)self accountsViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (id)accountsView:(id)a3 buttonForRowAtIndex:(unint64_t)a4
{
  int v6 = +[VMAccountButton accountButton];
  v7 = [(VMGreetingChangeViewController *)self accountAtIndex:a4];
  __int16 v8 = [v7 accountDescription];
  uint64_t v9 = [(VMNavigationController *)self manager];
  id v10 = [v9 accounts];
  id v11 = [v10 count];

  if (v11 == (id)1)
  {
    v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"ACCOUNTS_VIEW_BUTTON_TITLE_CHANGE_GREETING" value:&stru_100285990 table:@"VoicemailUI"];

    __int16 v8 = (void *)v13;
  }
  [v6 setTitle:v8 forState:0];

  return v6;
}

- (unint64_t)numberOfRowsForAccountsView:(id)a3
{
  id v3 = [(VMGreetingChangeViewController *)self accounts];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)titleForAccountsView:(id)a3
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"ACCOUNTS_VIEW_MESSAGE_TITLE_CHANGE_GREETING" value:&stru_100285990 table:@"VoicemailUI"];

  return v4;
}

- (void)accountsView:(id)a3 buttonTappedForRowWithIndex:(unint64_t)a4
{
  int v6 = [(VMGreetingChangeViewController *)self accountAtIndex:a4];
  if (v6)
  {
    [(VMGreetingChangeViewController *)self setSelectedAccount:v6];
    v7 = [(VMGreetingChangeViewController *)self selectedAccount];
    __int16 v8 = [(VMGreetingChangeViewController *)self greetingViewControllerForAccount:v7];

    [(VMGreetingChangeViewController *)self pushViewController:v8 animated:1];
  }
  else
  {
    uint64_t v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      unint64_t v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Could not retrieve account at index %lu", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)voicemailGreetingViewControllerFinished:(id)a3
{
}

- (void)activeSubscriptionsDidChange
{
  [(VMGreetingChangeViewController *)self updateActiveContexts];

  [(VMGreetingChangeViewController *)self updateAccounts];
}

- (NSMutableArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (MPGreetingAccount)selectedAccount
{
  return self->_selectedAccount;
}

- (void)setSelectedAccount:(id)a3
{
}

- (void)setAccountsViewController:(id)a3
{
}

- (CTXPCContexts)activeContexts
{
  return self->_activeContexts;
}

- (void)setActiveContexts:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_activeContexts, 0);
  objc_storeStrong((id *)&self->_accountsViewController, 0);
  objc_storeStrong((id *)&self->_selectedAccount, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_storeStrong((id *)&self->_observations, 0);
}

- (id)liveVoicemailAccount
{
  v2 = self;
  if ([(VMGreetingChangeViewController *)v2 liveVoicemailEnabled])
  {
    id v3 = objc_allocWithZone((Class)type metadata accessor for GreetingAccount());
    id v4 = GreetingAccount.init(accountType:)(0, 2);
  }
  else
  {

    id v4 = 0;
  }

  return v4;
}

- (BOOL)liveVoicemailEnabled
{
  uint64_t v2 = one-time initialization token for featureFlags;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  char v4 = TUCallScreeningEnabled();

  return v4;
}

- (void)startObservingPreferences
{
  uint64_t v2 = self;
  VMGreetingChangeViewController.startObservingPreferences()();
}

- (BOOL)arrayContainsUUID:(id)a3 uuid:(id)a4
{
  type metadata accessor for GreetingAccount();
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  LOBYTE(v6) = specialized Sequence.contains(where:)(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)stopObservingPreferences
{
  type metadata accessor for NSMutableArray();
  id v3 = self;
  id v4 = (id)NSArray.init(arrayLiteral:)();
  [(VMGreetingChangeViewController *)v3 setObservations:v4];
}

@end