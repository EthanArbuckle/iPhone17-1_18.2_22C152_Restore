@interface HUUserTableViewController
- (AMSUIUpdateMultiUserTokenTask)multiUserTokenFixTask;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HFUserHandle)userHandle;
- (HMHome)home;
- (HUUserItemManager)userItemManager;
- (HUUserTableViewController)initWithUserItemManager:(id)a3 home:(id)a4;
- (NAFuture)mediaAccountFuture;
- (NSAttributedString)headerMessage;
- (_HUUserAvatarHeaderView)userAvatarHeaderView;
- (id)_fetchAccountsForHome:(id)a3 forceCloudKitFetch:(BOOL)a4;
- (id)itemTableHeaderView;
- (id)user;
- (void)_presentMediaAccountErrorsIfNeeded:(BOOL)a3;
- (void)_presentMultiUserTokenFixUIForAccount:(id)a3;
- (void)_refreshSplitAccountsHeaderViewIfNeeded:(BOOL)a3;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)dealloc;
- (void)performRemovalAction:(id)a3;
- (void)setAMSiTunesAccount:(id)a3 forHome:(id)a4;
- (void)setHeaderMessage:(id)a3;
- (void)setHome:(id)a3;
- (void)setMediaAccountFuture:(id)a3;
- (void)setMultiUserTokenFixTask:(id)a3;
- (void)setUserAvatarHeaderView:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)signIniTunesAccount:(id)a3 forHome:(id)a4;
- (void)user:(id)a3 didUpdateNeedsiTunesMultiUserRepair:(BOOL)a4;
@end

@implementation HUUserTableViewController

- (HUUserTableViewController)initWithUserItemManager:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUUserTableViewController;
  v9 = [(HUItemTableViewController *)&v15 initWithItemManager:v7 tableViewStyle:1];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userItemManager, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel_applicationWillEnterForeground name:*MEMORY[0x1E4F43708] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v10 selector:sel_applicationDidEnterBackground name:*MEMORY[0x1E4F43660] object:0];

    v13 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v13 addUserObserver:v10];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(HUUserTableViewController *)self mediaAccountFuture];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)HUUserTableViewController;
  [(HUUserTableViewController *)&v5 dealloc];
}

- (void)applicationWillEnterForeground
{
}

- (void)applicationDidEnterBackground
{
  v3 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v3 layoutIfNeeded];

  v4 = [(HUUserTableViewController *)self tableView];
  [v4 layoutIfNeeded];

  objc_super v5 = [(HUUserTableViewController *)self tableView];
  [v5 beginUpdates];

  v6 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v6 dismissMultiUserTokenFixUI];

  id v7 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v7 dismissSplitAccountView];

  id v8 = [(HUUserTableViewController *)self tableView];
  [v8 layoutIfNeeded];

  id v9 = [(HUUserTableViewController *)self tableView];
  [v9 endUpdates];
}

- (id)itemTableHeaderView
{
  v3 = [(HUUserTableViewController *)self userAvatarHeaderView];

  if (!v3)
  {
    v4 = [_HUUserAvatarHeaderView alloc];
    objc_super v5 = [(HUUserTableViewController *)self user];
    v6 = [(HUUserTableViewController *)self home];
    id v7 = [(_HUUserAvatarHeaderView *)v4 initWithUser:v5 home:v6 delegate:self];
    [(HUUserTableViewController *)self setUserAvatarHeaderView:v7];

    id v8 = [(HUUserTableViewController *)self headerMessage];
    id v9 = [(HUUserTableViewController *)self userAvatarHeaderView];
    [v9 setMessage:v8];

    [(HUUserTableViewController *)self _presentMediaAccountErrorsIfNeeded:1];
  }

  return [(HUUserTableViewController *)self userAvatarHeaderView];
}

- (id)user
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HUUserTableViewController.m", 123, @"%s is an abstract method that must be overriden by subclass %@", "-[HUUserTableViewController user]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (HFUserHandle)userHandle
{
  v3 = [(HUUserTableViewController *)self home];
  v4 = [(HUUserTableViewController *)self user];
  objc_super v5 = objc_msgSend(v3, "hf_handleForUser:", v4);

  return (HFUserHandle *)v5;
}

- (void)setHeaderMessage:(id)a3
{
  v6 = (NSAttributedString *)a3;
  if (self->_headerMessage != v6)
  {
    objc_storeStrong((id *)&self->_headerMessage, a3);
    objc_super v5 = [(HUUserTableViewController *)self userAvatarHeaderView];
    [v5 setMessage:v6];
  }
}

- (void)performRemovalAction:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HUItemTableViewController *)self itemManager];
  v6 = [(HUUserTableViewController *)self userItemManager];
  id v7 = [v6 removeItem];
  id v8 = [v5 indexPathForItem:v7];

  id v9 = [(HUUserTableViewController *)self tableView];
  v10 = [v9 cellForRowAtIndexPath:v8];

  [v10 setShowSpinner:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__HUUserTableViewController_performRemovalAction___block_invoke;
  v16[3] = &unk_1E63866E0;
  v16[4] = self;
  id v11 = (id)[v4 addSuccessBlock:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__HUUserTableViewController_performRemovalAction___block_invoke_2;
  v14[3] = &unk_1E6386708;
  id v15 = v10;
  id v12 = v10;
  id v13 = (id)[v4 addFailureBlock:v14];
}

void __50__HUUserTableViewController_performRemovalAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

void __50__HUUserTableViewController_performRemovalAction___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 setShowSpinner:0];
  id v4 = [MEMORY[0x1E4F69110] sharedHandler];
  [v4 handleError:v3 operationType:*MEMORY[0x1E4F687E0] options:0 retryBlock:0 cancelBlock:0];
}

- (void)user:(id)a3 didUpdateNeedsiTunesMultiUserRepair:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v6 dismissSplitAccountView];

  if (v4)
  {
    [(HUUserTableViewController *)self _presentMediaAccountErrorsIfNeeded:0];
  }
}

- (void)_presentMediaAccountErrorsIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(HUUserTableViewController *)self userHandle];
  if ([v12 type])
  {
  }
  else
  {
    char v5 = [MEMORY[0x1E4F69758] isAMac];

    if ((v5 & 1) == 0)
    {
      v6 = [(HUUserTableViewController *)self home];
      id v7 = [v6 currentUser];
      int v8 = [v7 needsiTunesMultiUserRepair];

      if (v8)
      {
        id v9 = [(HUUserTableViewController *)self home];
        v10 = [(HUUserTableViewController *)self _fetchAccountsForHome:v9 forceCloudKitFetch:v3];

        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke;
        v13[3] = &unk_1E63851B0;
        v13[4] = self;
        id v11 = (id)[v10 addCompletionBlock:v13];
      }
      else
      {
        [(HUUserTableViewController *)self _refreshSplitAccountsHeaderViewIfNeeded:v3];
      }
    }
  }
}

void __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  if (!a3 && (unint64_t)[v5 count] >= 2)
  {
    id v7 = (void *)MEMORY[0x1E4F7A0D8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke_2;
    v10[3] = &unk_1E6385D90;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v6;
    int v8 = objc_msgSend(MEMORY[0x1E4F7A0F0], "mainThreadScheduler", v10[0], 3221225472, __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke_2, &unk_1E6385D90, v11);
    id v9 = (id)[v7 futureWithBlock:v10 scheduler:v8];
  }
}

void __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v11 = a2;
  BOOL v4 = [v3 userAvatarHeaderView];
  [v4 layoutIfNeeded];

  id v5 = [*(id *)(a1 + 32) tableView];
  [v5 layoutIfNeeded];

  v6 = [*(id *)(a1 + 32) tableView];
  [v6 beginUpdates];

  id v7 = *(void **)(a1 + 32);
  int v8 = [*(id *)(a1 + 40) lastObject];
  [v7 _presentMultiUserTokenFixUIForAccount:v8];

  id v9 = [*(id *)(a1 + 32) tableView];
  [v9 layoutIfNeeded];

  v10 = [*(id *)(a1 + 32) tableView];
  [v10 endUpdates];

  [v11 finishWithNoResult];
}

- (void)_presentMultiUserTokenFixUIForAccount:(id)a3
{
  id v4 = a3;
  id v6 = [(HUUserTableViewController *)self userAvatarHeaderView];
  id v5 = [(HUUserTableViewController *)self home];
  [v6 presentMultiUserTokenFixUIForMediaAccount:v4 inHome:v5];
}

- (void)_refreshSplitAccountsHeaderViewIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUUserTableViewController *)self userHandle];
  uint64_t v6 = [v5 type];

  if (!v6)
  {
    id v7 = [(HUUserTableViewController *)self home];
    int v8 = [(HUUserTableViewController *)self _fetchAccountsForHome:v7 forceCloudKitFetch:v3];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke;
    v10[3] = &unk_1E63851B0;
    void v10[4] = self;
    id v9 = (id)[v8 addCompletionBlock:v10];
  }
}

void __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (!a3)
  {
    id v7 = (void *)MEMORY[0x1E4F7A0D8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke_2;
    v10[3] = &unk_1E6385D90;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v5;
    int v8 = objc_msgSend(MEMORY[0x1E4F7A0F0], "mainThreadScheduler", v10[0], 3221225472, __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke_2, &unk_1E6385D90, v11);
    id v9 = (id)[v7 futureWithBlock:v10 scheduler:v8];
  }
}

void __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v13 = a2;
  id v4 = [v3 userAvatarHeaderView];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) home];
  [v4 setAccounts:v5 forHome:v6];

  id v7 = [*(id *)(a1 + 32) userAvatarHeaderView];
  [v7 layoutIfNeeded];

  int v8 = [*(id *)(a1 + 32) tableView];
  [v8 layoutIfNeeded];

  id v9 = [*(id *)(a1 + 32) tableView];
  [v9 beginUpdates];

  v10 = [*(id *)(a1 + 32) userAvatarHeaderView];
  [v10 showSplitAccountViewIfNeeded];

  uint64_t v11 = [*(id *)(a1 + 32) tableView];
  [v11 layoutIfNeeded];

  id v12 = [*(id *)(a1 + 32) tableView];
  [v12 endUpdates];

  [v13 finishWithNoResult];
}

- (id)_fetchAccountsForHome:(id)a3 forceCloudKitFetch:(BOOL)a4
{
  id v7 = a3;
  int v8 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  id v15 = v7;
  BOOL v17 = a4;
  SEL v16 = a2;
  id v9 = (void *)MEMORY[0x1E4F7A0F0];
  id v10 = v7;
  uint64_t v11 = objc_msgSend(v9, "globalAsyncScheduler", v14, 3221225472, __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke, &unk_1E638C118, self);
  id v12 = [v8 futureWithBlock:&v14 scheduler:v11];

  return v12;
}

void __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = [*(id *)(a1 + 32) userHandle];
  uint64_t v6 = [v5 userID];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) userHandle];
    int v8 = [v7 userID];
    [v4 addObject:v8];
  }
  id v9 = [MEMORY[0x1E4F68F00] sharedInstance];
  id v10 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v11 = [v10 UUIDString];
  id v12 = [v9 mediaAccountForHomeIdentifier:v11];

  if (v12 && !*(unsigned char *)(a1 + 56))
  {
    v26 = HFLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v30 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v31 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v38 = v30;
      __int16 v39 = 2112;
      v40 = v12;
      __int16 v41 = 2112;
      uint64_t v42 = v31;
      _os_log_error_impl(&dword_1BE345000, v26, OS_LOG_TYPE_ERROR, "%@ Found amsMediaAccount [%@] for home [%@]", buf, 0x20u);
    }
    [v4 addObject:v12];
    if ([v4 count])
    {
      v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412546;
        v38 = v28;
        __int16 v39 = 2112;
        v40 = v4;
        _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@ Found accounts [%@]", buf, 0x16u);
      }
      [v3 finishWithResult:v4];
    }
    else
    {
      v29 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 55);
      [v3 finishWithError:v29];
    }
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) mediaAccountFuture];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      id v15 = [*(id *)(a1 + 32) mediaAccountFuture];
      if ([v15 isCancelled])
      {
      }
      else
      {
        SEL v16 = [*(id *)(a1 + 32) mediaAccountFuture];
        int v17 = [v16 isFinished];

        if (!v17) {
          goto LABEL_12;
        }
      }
    }
    v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v38 = v19;
      __int16 v39 = 2112;
      v40 = v20;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@ Kicking of AMS fetch for Media Account for Home [%@]", buf, 0x16u);
    }
    v21 = [MEMORY[0x1E4F68F00] sharedInstance];
    v22 = [v21 executeHomeMediaAccountFetchForHome:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setMediaAccountFuture:v22];

    v23 = [*(id *)(a1 + 32) mediaAccountFuture];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke_24;
    v32[3] = &unk_1E638C0F0;
    v24 = *(void **)(a1 + 40);
    uint64_t v36 = *(void *)(a1 + 48);
    id v33 = v24;
    id v34 = v4;
    id v35 = v3;
    id v25 = (id)[v23 addCompletionBlock:v32];
  }
LABEL_12:
}

void __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8) {
      goto LABEL_12;
    }
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
    id v10 = *(void **)(a1 + 32);
    int v21 = 138412546;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@ Error fetching Media Account for Home [%@]", (uint8_t *)&v21, 0x16u);
  }
  else
  {
    if (v8)
    {
      uint64_t v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v21 = 138412546;
      v22 = v11;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@ Successfuly fetched Media Account [%@]", (uint8_t *)&v21, 0x16u);
    }
    id v12 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v13 = [v12 UUIDString];
    uint64_t v14 = [v5 objectForKeyedSubscript:v13];

    objc_opt_class();
    id v7 = v14;
    if (objc_opt_isKindOfClass()) {
      id v15 = v7;
    }
    else {
      id v15 = 0;
    }
    id v9 = v15;

    if (v9) {
      [*(id *)(a1 + 40) addObject:v9];
    }
  }

LABEL_12:
  if ([*(id *)(a1 + 40) count])
  {
    SEL v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = NSStringFromSelector(*(SEL *)(a1 + 56));
      v18 = *(void **)(a1 + 40);
      int v21 = 138412546;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@ Found accounts [%@]", (uint8_t *)&v21, 0x16u);
    }
    [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 40)];
  }
  else
  {
    v19 = *(void **)(a1 + 48);
    v20 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 55);
    [v19 finishWithError:v20];
  }
}

- (void)setAMSiTunesAccount:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4F68F00] sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__HUUserTableViewController_setAMSiTunesAccount_forHome___block_invoke;
  v21[3] = &unk_1E638C140;
  v21[4] = self;
  id v22 = v6;
  id v23 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 setAMSiTunesAccount:v10 forHome:v9 completion:v21];

  id v11 = objc_alloc(MEMORY[0x1E4F69710]);
  id v12 = [v9 currentUser];
  uint64_t v13 = (void *)[v11 initWithHome:v9 user:v12 nameStyle:0];

  id v14 = (id)[v13 setDismissUserSplitMediaAccountWarning:1];
  id v15 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v15 layoutIfNeeded];

  SEL v16 = [(HUUserTableViewController *)self tableView];
  [v16 layoutIfNeeded];

  int v17 = [(HUUserTableViewController *)self tableView];
  [v17 beginUpdates];

  v18 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v18 dismissSplitAccountView];

  v19 = [(HUUserTableViewController *)self tableView];
  [v19 layoutIfNeeded];

  v20 = [(HUUserTableViewController *)self tableView];
  [v20 endUpdates];
}

void __57__HUUserTableViewController_setAMSiTunesAccount_forHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 138412802;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Error setting AMS iTunes Account - [%@] for Home - [%@] - [%@]", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _refreshSplitAccountsHeaderViewIfNeeded:0];
  }
}

- (void)signIniTunesAccount:(id)a3 forHome:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  __int16 v9 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v9 layoutIfNeeded];

  uint64_t v10 = [(HUUserTableViewController *)self tableView];
  [v10 layoutIfNeeded];

  __int16 v11 = [(HUUserTableViewController *)self tableView];
  [v11 beginUpdates];

  id v12 = [(HUUserTableViewController *)self userAvatarHeaderView];
  [v12 dismissMultiUserTokenFixUI];

  uint64_t v13 = [(HUUserTableViewController *)self tableView];
  [v13 layoutIfNeeded];

  id v14 = [(HUUserTableViewController *)self tableView];
  [v14 endUpdates];

  id v15 = objc_alloc(MEMORY[0x1E4F4E020]);
  SEL v16 = [v7 uniqueIdentifier];
  int v17 = (void *)[v15 initWithAccount:v8 homeIdentifier:v16 viewController:self];

  [(HUUserTableViewController *)self setMultiUserTokenFixTask:v17];
  v18 = [(HUUserTableViewController *)self multiUserTokenFixTask];
  v19 = [v18 performTask];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke;
  v21[3] = &unk_1E6388A40;
  id v23 = self;
  SEL v24 = a2;
  id v22 = v7;
  id v20 = v7;
  [v19 addFinishBlock:v21];
}

void __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = HFLogForCategory();
  id v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "%@ Error in fixing MultiUser Token for MediaAccount [%@] in Home [%@]", buf, 0x20u);
    }
    id v8 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    __int16 v9 = __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_29;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      int v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@ Successfully fixed MultiUser Token for MediaAccount [%@] in Home [%@]", buf, 0x20u);
    }
    id v8 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    __int16 v9 = __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_31;
  }
  v8[2] = v9;
  v8[3] = &unk_1E6386018;
  v8[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

uint64_t __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentMediaAccountErrorsIfNeeded:0];
}

uint64_t __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshSplitAccountsHeaderViewIfNeeded:1];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = [(HUUserTableViewController *)self userItemManager];
  id v8 = [v7 removeItem];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = objc_opt_class();
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HUUserTableViewController.m", 391, @"Couldn't find a cell class for item: %@", v6 object file lineNumber description];

    uint64_t v10 = 0;
  }

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = [(HUUserTableViewController *)self userItemManager];
  int v9 = [v8 removeItem];
  int v10 = [v7 isEqual:v9];

  if (v10)
  {
    id v11 = v12;
    [v11 setDestructive:1];
    [v11 setUseFullWidthSeparator:0];
    [v11 setAccessibilityIdentifier:@"Home.Users.RemovePerson"];
  }
}

- (HUUserItemManager)userItemManager
{
  return self->_userItemManager;
}

- (NSAttributedString)headerMessage
{
  return self->_headerMessage;
}

- (_HUUserAvatarHeaderView)userAvatarHeaderView
{
  return self->_userAvatarHeaderView;
}

- (void)setUserAvatarHeaderView:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NAFuture)mediaAccountFuture
{
  return self->_mediaAccountFuture;
}

- (void)setMediaAccountFuture:(id)a3
{
}

- (AMSUIUpdateMultiUserTokenTask)multiUserTokenFixTask
{
  return self->_multiUserTokenFixTask;
}

- (void)setMultiUserTokenFixTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserTokenFixTask, 0);
  objc_storeStrong((id *)&self->_mediaAccountFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_userAvatarHeaderView, 0);
  objc_storeStrong((id *)&self->_headerMessage, 0);

  objc_storeStrong((id *)&self->_userItemManager, 0);
}

@end