@interface VMAccountsViewController
- (NSArray)accounts;
- (VMAccountsView)accountsView;
- (VMAccountsViewControllerDelegate)delegate;
- (id)accountAtIndex:(unint64_t)a3;
- (void)handleVMVoicemailManagerAccountsDidChangeNotification:(id)a3;
- (void)loadView;
- (void)setAccounts:(id)a3;
- (void)setAccountsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateAccounts;
- (void)updateAccountsView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VMAccountsViewController

- (void)loadView
{
  v3 = objc_alloc_init(VMAccountsView);
  [(VMAccountsView *)v3 setAutoresizingMask:2];
  [(VMAccountsViewController *)self setAccountsView:v3];
  [(VMAccountsViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)VMAccountsViewController;
  [(VMAccountsViewController *)&v8 viewDidLoad];
  v3 = [(VMAccountsViewController *)self accountsView];
  v4 = +[UIColor dynamicBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = VMVoicemailManagerAccountsDidChangeNotification;
  v7 = [(VMViewController *)self manager];
  [v5 addObserver:self selector:"handleVMVoicemailManagerAccountsDidChangeNotification:" name:v6 object:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VMAccountsViewController;
  [(VMAccountsViewController *)&v5 viewWillAppear:a3];
  v4 = [(VMAccountsViewController *)self accounts];

  if (!v4)
  {
    [(VMAccountsViewController *)self updateAccounts];
    [(VMAccountsViewController *)self updateAccountsView];
  }
}

- (VMAccountsView)accountsView
{
  accountsView = self->_accountsView;
  if (!accountsView)
  {
    v4 = [(VMAccountsViewController *)self view];
    objc_super v5 = self->_accountsView;
    self->_accountsView = v4;

    accountsView = self->_accountsView;
  }

  return accountsView;
}

- (id)accountAtIndex:(unint64_t)a3
{
  v4 = [(VMAccountsViewController *)self accounts];
  if ((unint64_t)[v4 count] <= a3)
  {
    objc_super v5 = 0;
  }
  else
  {
    objc_super v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)updateAccounts
{
  id v4 = [(VMViewController *)self manager];
  v3 = [v4 accounts];
  [(VMAccountsViewController *)self setAccounts:v3];
}

- (void)updateAccountsView
{
  id v2 = [(VMAccountsViewController *)self accountsView];
  [v2 reloadData];
}

- (void)handleVMVoicemailManagerAccountsDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v7, 0x16u);
  }
  [(VMAccountsViewController *)self updateAccounts];
  [(VMAccountsViewController *)self updateAccountsView];
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (void)setAccountsView:(id)a3
{
}

- (VMAccountsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMAccountsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountsView, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

@end