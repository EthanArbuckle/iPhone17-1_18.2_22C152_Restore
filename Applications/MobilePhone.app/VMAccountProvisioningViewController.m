@interface VMAccountProvisioningViewController
- (NSArray)accounts;
- (VMAccount)selectedAccount;
- (id)accountAtIndex:(unint64_t)a3;
- (id)accountsView:(id)a3 buttonForRowAtIndex:(unint64_t)a4;
- (id)titleForAccountsView:(id)a3;
- (unint64_t)numberOfRowsForAccountsView:(id)a3;
- (void)accountsView:(id)a3 buttonTappedForRowWithIndex:(unint64_t)a4;
- (void)setAccounts:(id)a3;
- (void)setPINViewControllerFinished:(id)a3 success:(BOOL)a4 oldPIN:(id)a5 newPIN:(id)a6;
- (void)setSelectedAccount:(id)a3;
- (void)updateAccounts;
- (void)viewDidLoad;
- (void)voicemailGreetingViewControllerFinished:(id)a3;
@end

@implementation VMAccountProvisioningViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)VMAccountProvisioningViewController;
  [(VMAccountsViewController *)&v8 viewDidLoad];
  [(VMAccountProvisioningViewController *)self updateAccounts];
  v3 = [(VMAccountsViewController *)self accountsView];
  v4 = +[UIColor systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 setDataSource:self];
  [v3 setDelegate:self];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"ACCOUNTS_VIEW_CONTROLLER_NAVIGATION_ITEM_TITLE_VOICEMAIL" value:&stru_100285990 table:@"VoicemailUI"];
  v7 = [(VMAccountProvisioningViewController *)self navigationItem];
  [v7 setTitle:v6];
}

- (id)accountAtIndex:(unint64_t)a3
{
  v4 = [(VMAccountProvisioningViewController *)self accounts];
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
  v3 = +[NSMutableArray array];
  v4 = [(VMViewController *)self manager];
  v5 = [v4 accounts];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 handle:v15];
        if (v12)
        {
          v13 = (void *)v12;
          unsigned __int8 v14 = [v11 isProvisioned];

          if ((v14 & 1) == 0) {
            [v3 addObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(VMAccountProvisioningViewController *)self setAccounts:v3];
}

- (id)accountsView:(id)a3 buttonForRowAtIndex:(unint64_t)a4
{
  id v6 = +[VMAccountButton accountButton];
  id v7 = [(VMAccountProvisioningViewController *)self accountAtIndex:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 accountDescription];
    v10 = [(VMViewController *)self manager];
    v11 = [v10 accounts];
    id v12 = [v11 count];

    if (v12 == (id)1)
    {
      v13 = +[NSBundle mainBundle];
      uint64_t v14 = [v13 localizedStringForKey:@"ACCOUNTS_VIEW_BUTTON_TITLE_SET_UP" value:&stru_100285990 table:@"VoicemailUI"];

      uint64_t v9 = (void *)v14;
    }
    [v6 setTitle:v9 forState:0];
  }

  return v6;
}

- (unint64_t)numberOfRowsForAccountsView:(id)a3
{
  v3 = [(VMAccountProvisioningViewController *)self accounts];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)titleForAccountsView:(id)a3
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"ACCOUNTS_VIEW_MESSAGE_TITLE_SET_UP" value:&stru_100285990 table:@"VoicemailUI"];

  return v4;
}

- (void)accountsView:(id)a3 buttonTappedForRowWithIndex:(unint64_t)a4
{
  id v23 = a3;
  id v6 = [(VMAccountProvisioningViewController *)self accountAtIndex:a4];
  if (v6)
  {
    [(VMAccountProvisioningViewController *)self setSelectedAccount:v6];
    id v7 = [(VMViewController *)self manager];
    id v8 = [v6 UUID];
    id v9 = [v7 minimumPasscodeLengthForAccountUUID:v8];

    v10 = [(VMViewController *)self manager];
    v11 = [v6 UUID];
    id v12 = [v10 maximumPasscodeLengthForAccountUUID:v11];

    id v13 = [objc_alloc((Class)TPSetPINViewController) initForNewPINWithMinLength:v9 maxLength:v12 confirmPIN:1];
    [v13 setDelegate:self];
    uint64_t v14 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    long long v15 = [v14 localizedStringForKey:@"SETUP_PASSCODE_CONFIRM_ENTRY_PROMPT" value:&stru_100285990 table:@"Voicemail"];
    [v13 setPromptTextForConfirmingNewPIN:v15];

    long long v16 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    long long v17 = [v16 localizedStringForKey:@"SETUP_PASSCODE_FIRST_ENTRY_PROMPT" value:&stru_100285990 table:@"Voicemail"];
    [v13 setPromptTextForNewPIN:v17];

    long long v18 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v19 = [v18 localizedStringForKey:@"SAVING_PASSWORD" value:&stru_100285990 table:@"Voicemail"];
    [v13 setPromptTextForSavingPIN:v19];

    id v20 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v13];
    v21 = [v23 window];
    v22 = [v21 rootViewController];
    [v22 presentViewController:v20 animated:1 completion:0];
  }
}

- (void)voicemailGreetingViewControllerFinished:(id)a3
{
  id v4 = a3;
  [(VMAccountProvisioningViewController *)self setSelectedAccount:0];
  v5 = [v4 navigationController];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __79__VMAccountProvisioningViewController_voicemailGreetingViewControllerFinished___block_invoke;
  v6[3] = &unk_10027C670;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:1 completion:v6];
}

void __79__VMAccountProvisioningViewController_voicemailGreetingViewControllerFinished___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 accountsViewControllerDidFinish:*(void *)(a1 + 32)];
  }
}

- (void)setPINViewControllerFinished:(id)a3 success:(BOOL)a4 oldPIN:(id)a5 newPIN:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(VMAccountProvisioningViewController *)self selectedAccount];
  if (v8)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke;
    v31[3] = &unk_10027CD38;
    id v14 = v10;
    id v32 = v14;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke_2;
    block[3] = &unk_10027CD60;
    long long v15 = objc_retainBlock(v31);
    id v30 = v15;
    dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_time_t v17 = dispatch_time(0, 30000000000);
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v16);
    objc_initWeak(&location, self);
    long long v18 = [(VMViewController *)self manager];
    v19 = [v13 UUID];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke_3;
    v22[3] = &unk_10027CDB0;
    id v20 = v16;
    id v25 = v20;
    objc_copyWeak(&v27, &location);
    id v23 = v13;
    id v24 = v14;
    v21 = v15;
    id v26 = v21;
    [v18 setPasscode:v12 forAccountUUID:v19 completion:v22];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    [(VMAccountProvisioningViewController *)self setSelectedAccount:0];
    [v10 dismissViewControllerAnimated:1 completion:0];
  }
}

void __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v11 = 0;
    id v12 = 0;
    [v3 displayedErrorTitle:&v12 message:&v11];
    id v5 = v12;
    id v6 = v11;
  }
  else
  {
    id v6 = 0;
    id v5 = 0;
  }
  if (![v5 length] && !objc_msgSend(v6, "length"))
  {
    id v7 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    uint64_t v8 = [v7 localizedStringForKey:@"VOICEMAIL_ERROR_TITLE_ERROR" value:&stru_100285990 table:@"Voicemail"];

    id v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    uint64_t v10 = [v9 localizedStringForKey:@"VOICEMAIL_ERROR_MSG_TRY_AGAIN_LATER" value:&stru_100285990 table:@"Voicemail"];

    id v6 = (id)v10;
    id v5 = (id)v8;
  }
  [*(id *)(a1 + 32) resetWithErrorPrompt:v6 title:v5];
}

uint64_t __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke_3(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke_4;
  block[3] = &unk_10027CD88;
  id v11 = a1[6];
  char v14 = a2;
  objc_copyWeak(&v13, a1 + 8);
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = v5;
  id v12 = a1[7];
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v13);
}

void __90__VMAccountProvisioningViewController_setPINViewControllerFinished_success_oldPIN_newPIN___block_invoke_4(uint64_t a1)
{
  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 56));
  if (*(unsigned char *)(a1 + 80))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v3 = [WeakRetained manager];
    id v4 = [*(id *)(a1 + 32) UUID];
    unsigned int v5 = [v3 isGreetingChangeSupportedForAccountUUID:v4];

    if (v5)
    {
      id v6 = [[MPGreetingAccount alloc] initWithAccount:*(void *)(a1 + 32)];
      id v7 = [[PHVoicemailGreetingViewController alloc] initWithAccount:v6];
      [(PHVoicemailGreetingViewController *)v7 setGreetingDelegate:WeakRetained];
      [(PHVoicemailGreetingViewController *)v7 setPresentedFromSetup:1];
      id v8 = [*(id *)(a1 + 40) navigationController];
      [v8 pushViewController:v7 animated:1];
    }
    else
    {
      [WeakRetained setSelectedAccount:0];
      [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
    }
  }
  if (*(void *)(a1 + 48))
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v9();
  }
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (VMAccount)selectedAccount
{
  return self->_selectedAccount;
}

- (void)setSelectedAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAccount, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

@end