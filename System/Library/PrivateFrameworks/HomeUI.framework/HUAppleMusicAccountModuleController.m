@interface HUAppleMusicAccountModuleController
- (BOOL)_canExecuteAccountAction;
- (BOOL)canSelectItem:(id)a3;
- (Class)cellClassForItem:(id)a3;
- (HUAppleMusicAccountModule)module;
- (HUAppleMusicAccountModuleController)initWithModule:(id)a3;
- (HUAppleMusicAccountModuleControllerDelegate)delegate;
- (HUButtonCell)activeAuthCell;
- (HUButtonCell)loginButton;
- (HUButtonCell)logoutButton;
- (NAFuture)loginFuture;
- (NAFuture)logoutFuture;
- (NSMapTable)itemToCellMap;
- (id)_authCells;
- (id)_authenticationContextForAccessory:(id)a3 account:(id)a4;
- (id)_companionLoginWithAccount:(id)a3 cell:(id)a4;
- (id)_proxyLoginWithAccount:(id)a3 cell:(id)a4;
- (id)kickOffManualLogin;
- (unint64_t)didSelectItem:(id)a3;
- (void)_disableCells;
- (void)_enableCells;
- (void)_reloadForAuthEvent;
- (void)_setupButtonCell:(id)a3 enabled:(BOOL)a4;
- (void)_setupCompanionAuthenticationForAccount:(id)a3 cell:(id)a4;
- (void)_setupProxyAuthenticationForAccount:(id)a3 cell:(id)a4;
- (void)_updateModuleState:(unint64_t)a3 notifyDelegate:(BOOL)a4;
- (void)clearLogoutFuture;
- (void)dealloc;
- (void)logout;
- (void)setActiveAuthCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemToCellMap:(id)a3;
- (void)setLoginButton:(id)a3;
- (void)setLoginFuture:(id)a3;
- (void)setLogoutButton:(id)a3;
- (void)setLogoutFuture:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUAppleMusicAccountModuleController

- (HUAppleMusicAccountModuleController)initWithModule:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUAppleMusicAccountModuleController;
  v3 = [(HUItemModuleController *)&v6 initWithModule:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    [(HUAppleMusicAccountModuleController *)v3 setItemToCellMap:v4];
  }
  return v3;
}

- (HUAppleMusicAccountModule)module
{
  v4.receiver = self;
  v4.super_class = (Class)HUAppleMusicAccountModuleController;
  v2 = [(HUItemModuleController *)&v4 module];

  return (HUAppleMusicAccountModule *)v2;
}

- (void)dealloc
{
  v3 = [(HUAppleMusicAccountModuleController *)self loginFuture];
  [v3 cancel];

  objc_super v4 = [(HUAppleMusicAccountModuleController *)self logoutFuture];
  [v4 cancel];

  v5.receiver = self;
  v5.super_class = (Class)HUAppleMusicAccountModuleController;
  [(HUAppleMusicAccountModuleController *)&v5 dealloc];
}

- (Class)cellClassForItem:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(HUAppleMusicAccountModuleController *)self module];
  id v7 = [v6 logoutItem];

  if (v7 == v5) {
    goto LABEL_6;
  }
  v8 = [(HUAppleMusicAccountModuleController *)self module];
  id v9 = [v8 loginItem];

  if (v9 == v5
    || ([(HUAppleMusicAccountModuleController *)self module],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 loggedInUsernameItem],
        id v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11 == v5))
  {
LABEL_6:
    v16 = objc_opt_class();
  }
  else
  {
    v12 = [(HUAppleMusicAccountModuleController *)self module];
    v13 = [v12 appleMusicAccountItemProvider];

    v14 = [v13 items];
    char v15 = [v14 containsObject:v5];

    if ((v15 & 1) == 0)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"HUAppleMusicAccountModuleController.m", 79, @"Missing cell class for item %@", v5 object file lineNumber description];
    }
    v16 = objc_opt_class();
  }

  return (Class)v16;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(HUAppleMusicAccountModuleController *)self module];
  id v8 = [v7 logoutItem];

  if (v8 == v6)
  {
    [(HUAppleMusicAccountModuleController *)self setLogoutButton:v17];
  }
  else
  {
    id v9 = [(HUAppleMusicAccountModuleController *)self module];
    id v10 = [v9 loginItem];

    if (v10 == v6)
    {
      [(HUAppleMusicAccountModuleController *)self setLoginButton:v17];
    }
    else
    {
      id v11 = [(HUAppleMusicAccountModuleController *)self module];
      id v12 = [v11 loggedInUsernameItem];

      if (v12 == v6)
      {
        objc_opt_class();
        id v13 = v17;
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
        id v15 = v14;

        [v15 setHideIcon:1];
      }
    }
  }
  v16 = [(HUAppleMusicAccountModuleController *)self itemToCellMap];
  [v16 setObject:v17 forKey:v6];
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v35 = a3;
  id v7 = a4;
  id v8 = [(HUAppleMusicAccountModuleController *)self module];
  id v9 = [v8 logoutItem];

  if (v9 == v7)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    [v35 setAccessoryView:v21];

    id v16 = [(HUAppleMusicAccountModuleController *)self logoutButton];
    v19 = [(HUAppleMusicAccountModuleController *)self logoutFuture];
    uint64_t v22 = [v19 isFinished] ^ 1;
    v23 = self;
    id v24 = v16;
LABEL_13:
    [(HUAppleMusicAccountModuleController *)v23 _setupButtonCell:v24 enabled:v22];
    goto LABEL_14;
  }
  id v10 = [(HUAppleMusicAccountModuleController *)self module];
  id v11 = [v10 loginItem];

  if (v11 != v7)
  {
    id v12 = [(HUAppleMusicAccountModuleController *)self module];
    id v13 = [v12 loggedInUsernameItem];

    if (v13 != v7) {
      goto LABEL_15;
    }
    objc_opt_class();
    id v14 = v35;
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    id v17 = [v7 latestResults];
    v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    [v16 setTitleText:v18];

    v19 = [v7 latestResults];
    v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
    [v16 setValueText:v20];
    goto LABEL_11;
  }
  id v16 = [(HUAppleMusicAccountModuleController *)self loginButton];
  v19 = [(HUAppleMusicAccountModuleController *)self loginFuture];
  if (!v19)
  {
    v23 = self;
    id v24 = v16;
    uint64_t v22 = 1;
    goto LABEL_13;
  }
  v20 = [(HUAppleMusicAccountModuleController *)self loginFuture];
  -[HUAppleMusicAccountModuleController _setupButtonCell:enabled:](self, "_setupButtonCell:enabled:", v16, [v20 isFinished]);
LABEL_11:

LABEL_14:
LABEL_15:
  v25 = [(HUAppleMusicAccountModuleController *)self module];
  v26 = [v25 appleMusicAccountItemProvider];

  v27 = [v26 items];
  int v28 = [v27 containsObject:v7];

  if (v28)
  {
    objc_opt_class();
    id v29 = v35;
    if (objc_opt_isKindOfClass()) {
      v30 = v29;
    }
    else {
      v30 = 0;
    }
    id v31 = v30;

    v32 = [v7 latestResults];
    v33 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    v34 = [v31 textLabel];
    [v34 setText:v33];

    [v31 setTextColorFollowsTintColor:1];
  }
}

- (void)_setupButtonCell:(id)a3 enabled:(BOOL)a4
{
  uint64_t v4 = a4;
  id v12 = a3;
  objc_opt_class();
  id v6 = [v12 accessoryView];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [(HUAppleMusicAccountModuleController *)self activeAuthCell];

  if (v9 == v12)
  {
    if (!v8)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
      [v6 setHidesWhenStopped:1];
      [v12 setAccessoryView:v6];
    }
    int v11 = [v6 isAnimating];
    if (!v11 || (v4 & 1) != 0)
    {
      if (((v11 | v4 ^ 1) & 1) == 0) {
        [v6 startAnimating];
      }
    }
    else
    {
      [v6 stopAnimating];
      uint64_t v4 = 0;
    }
    id v10 = v12;
  }
  else
  {
    [v8 stopAnimating];
    [v12 setAccessoryView:0];
    id v10 = v12;
    uint64_t v4 = v4 ^ 1;
    id v6 = v8;
  }
  [v10 setDisabled:v4];
}

- (BOOL)canSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAppleMusicAccountModuleController *)self module];
  id v6 = [v5 loggedInUsernameItem];

  return v6 != v4;
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUAppleMusicAccountModuleController *)self module];
  id v6 = [v5 appleMusicAccountItemProvider];

  id v7 = [(HUAppleMusicAccountModuleController *)self module];
  id v8 = [v7 mediaProfileContainer];
  int v9 = objc_msgSend(v8, "hf_homePodSupportsMultiUser");

  id v10 = [(HUAppleMusicAccountModuleController *)self module];
  id v11 = [v10 loginItem];

  if (v11 == v4)
  {
    if (!v9) {
      goto LABEL_8;
    }
    v20 = [v6 mediaProfileContainer];
    v21 = objc_msgSend(v20, "hf_appleMusicCurrentLoggedInAccount");

    if (!v21) {
      goto LABEL_8;
    }
    uint64_t v22 = [(HUAppleMusicAccountModuleController *)self module];
    v23 = [v22 mediaProfileContainer];
    int v24 = objc_msgSend(v23, "hf_supportsPreferredMediaUser");

    if (!v24)
    {
      v27 = [(HUAppleMusicAccountModuleController *)self delegate];
      [v27 appleMusicModuleControllerPresentSignInFlow:self];
    }
    else
    {
LABEL_8:
      id v25 = [(HUAppleMusicAccountModuleController *)self kickOffManualLogin];
    }
  }
  else
  {
    id v12 = [(HUAppleMusicAccountModuleController *)self module];
    id v13 = [v12 logoutItem];

    if (v13 == v4)
    {
      [(HUAppleMusicAccountModuleController *)self logout];
    }
    else
    {
      id v14 = [v6 items];
      int v15 = [v14 containsObject:v4];

      if (v15)
      {
        id v16 = [(HUAppleMusicAccountModuleController *)self itemToCellMap];
        id v17 = [v16 objectForKey:v4];

        v18 = [v4 latestResults];
        v19 = [v18 objectForKeyedSubscript:@"HOAppleMusicAccountKey"];
        [(HUAppleMusicAccountModuleController *)self _setupCompanionAuthenticationForAccount:v19 cell:v17];
      }
    }
  }

  return 0;
}

- (void)setLoginFuture:(id)a3
{
  id v5 = (NAFuture *)a3;
  if (self->_loginFuture != v5)
  {
    objc_storeStrong((id *)&self->_loginFuture, a3);
    objc_initWeak(&location, self);
    loginFuture = self->_loginFuture;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__HUAppleMusicAccountModuleController_setLoginFuture___block_invoke;
    v8[3] = &unk_1E63867B0;
    objc_copyWeak(&v9, &location);
    id v7 = (id)[(NAFuture *)loginFuture addCompletionBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __54__HUAppleMusicAccountModuleController_setLoginFuture___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setActiveAuthCell:0];
  [WeakRetained _enableCells];
  if (v4)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Login future completed with NSError = [%@]", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = objc_msgSend(v4, "hf_errorWithOperationType:options:", *MEMORY[0x1E4F68770], 0);

  id v8 = HFLogForCategory();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, "Login future completed with HFError = [%@]", (uint8_t *)&v13, 0xCu);
    }

    id v10 = [v7 domain];
    if (![v10 isEqualToString:*MEMORY[0x1E4F281F8]] || objc_msgSend(v7, "code") != 3072)
    {
      id v11 = [v7 domain];
      if ([v11 isEqualToString:*MEMORY[0x1E4F4ED70]])
      {
        uint64_t v12 = [v7 code];

        if (v12 == -7003) {
          goto LABEL_19;
        }
      }
      else
      {
      }
      id v10 = [MEMORY[0x1E4F69110] sharedHandler];
      [v10 handleError:v7];
    }

LABEL_19:
    [WeakRetained _updateModuleState:0 notifyDelegate:1];
    goto LABEL_20;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Login future completed Successfully", (uint8_t *)&v13, 2u);
  }

  [WeakRetained _updateModuleState:1 notifyDelegate:1];
  [WeakRetained _reloadForAuthEvent];
LABEL_20:
}

- (void)setLogoutFuture:(id)a3
{
  id v5 = (NAFuture *)a3;
  if (self->_logoutFuture != v5)
  {
    objc_storeStrong((id *)&self->_logoutFuture, a3);
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke;
    v7[3] = &unk_1E63867B0;
    objc_copyWeak(&v8, &location);
    id v6 = (id)[(NAFuture *)v5 addCompletionBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained setActiveAuthCell:0];
  [WeakRetained _enableCells];
  if (v6 && (objc_msgSend(v6, "na_isCancelledError") & 1) == 0)
  {
    uint64_t v9 = objc_msgSend(v6, "hf_errorWithOperationType:options:", *MEMORY[0x1E4F68778], 0);

    id v10 = [MEMORY[0x1E4F69110] sharedHandler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke_2;
    v11[3] = &unk_1E63862A0;
    objc_copyWeak(&v12, v7);
    [v10 handleError:v9 retryBlock:v11 cancelBlock:0];

    objc_destroyWeak(&v12);
    id v6 = (id)v9;
  }
  else
  {
    [WeakRetained _reloadForAuthEvent];
  }
  [WeakRetained clearLogoutFuture];
}

void __55__HUAppleMusicAccountModuleController_setLogoutFuture___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained logout];
}

- (void)clearLogoutFuture
{
  logoutFuture = self->_logoutFuture;
  self->_logoutFuture = 0;
}

- (id)kickOffManualLogin
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F69758];
  id v5 = [(HUAppleMusicAccountModuleController *)self module];
  id v6 = [v5 mediaProfileContainer];
  id v7 = [v6 accessories];
  id v8 = [v4 itemIdentifierForAccessories:v7];

  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v20 = self;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    int v24 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Now posting HFAppleMusicAccountStartManualLoginNotification with task identifier %@", buf, 0x20u);
  }
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v12 = *MEMORY[0x1E4F68310];
  uint64_t v17 = *MEMORY[0x1E4F697B8];
  v18 = v8;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v11 postNotificationName:v12 object:0 userInfo:v13];

  id v14 = [(HUAppleMusicAccountModuleController *)self loginButton];
  [(HUAppleMusicAccountModuleController *)self _setupProxyAuthenticationForAccount:0 cell:v14];

  uint64_t v15 = [(HUAppleMusicAccountModuleController *)self loginFuture];

  return v15;
}

- (void)_setupProxyAuthenticationForAccount:(id)a3 cell:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = [(HUAppleMusicAccountModuleController *)self loginFuture];
    uint64_t v12 = [(HUAppleMusicAccountModuleController *)self logoutFuture];
    int v14 = 138413058;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    v19 = v11;
    __int16 v20 = 2112;
    __int16 v21 = v12;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ loginFuture=[%@] logoutFuture=[%@]", (uint8_t *)&v14, 0x2Au);
  }
  if ([(HUAppleMusicAccountModuleController *)self _canExecuteAccountAction])
  {
    [(HUAppleMusicAccountModuleController *)self setActiveAuthCell:v8];
    [(HUAppleMusicAccountModuleController *)self _disableCells];
    [(HUAppleMusicAccountModuleController *)self _setupButtonCell:v8 enabled:1];
    int v13 = [(HUAppleMusicAccountModuleController *)self _proxyLoginWithAccount:v7 cell:v8];
    [(HUAppleMusicAccountModuleController *)self setLoginFuture:v13];
  }
  else
  {
    int v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "-[HUAppleMusicAccountModuleController _setupProxyAuthenticationForAccount:] returning", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)_setupCompanionAuthenticationForAccount:(id)a3 cell:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(HUAppleMusicAccountModuleController *)self _canExecuteAccountAction])
  {
    [(HUAppleMusicAccountModuleController *)self setActiveAuthCell:v6];
    [(HUAppleMusicAccountModuleController *)self _disableCells];
    [(HUAppleMusicAccountModuleController *)self _setupButtonCell:v6 enabled:1];
    id v7 = [(HUAppleMusicAccountModuleController *)self _companionLoginWithAccount:v8 cell:v6];
    [(HUAppleMusicAccountModuleController *)self setLoginFuture:v7];
  }
}

- (id)_proxyLoginWithAccount:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HUAppleMusicAccountModuleController *)self module];
  uint64_t v9 = [v8 mediaProfileContainer];
  id v10 = [v9 accessories];

  id v11 = objc_alloc(MEMORY[0x1E4F68EF0]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __67__HUAppleMusicAccountModuleController__proxyLoginWithAccount_cell___block_invoke;
  __int16 v18 = &unk_1E638CF30;
  objc_copyWeak(&v19, &location);
  uint64_t v12 = (void *)[v11 initWithAccessories:v10 account:v6 contextGenerator:&v15];
  objc_msgSend(v12, "setLoginType:", 2, v15, v16, v17, v18);
  [(HUAppleMusicAccountModuleController *)self _updateModuleState:2 notifyDelegate:1];
  int v13 = [v12 pendingArbitrationExecutionFuture];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

id __67__HUAppleMusicAccountModuleController__proxyLoginWithAccount_cell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _authenticationContextForAccessory:v6 account:v5];

  return v8;
}

- (id)_companionLoginWithAccount:(id)a3 cell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(HUAppleMusicAccountModuleController *)self module];
  uint64_t v9 = [v8 mediaProfileContainer];
  id v10 = [v9 accessories];

  id v11 = objc_alloc(MEMORY[0x1E4F68EF0]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __71__HUAppleMusicAccountModuleController__companionLoginWithAccount_cell___block_invoke;
  __int16 v18 = &unk_1E638CF30;
  objc_copyWeak(&v19, &location);
  uint64_t v12 = (void *)[v11 initWithAccessories:v10 account:v6 contextGenerator:&v15];
  objc_msgSend(v12, "setLoginType:", 0, v15, v16, v17, v18);
  [(HUAppleMusicAccountModuleController *)self _updateModuleState:2 notifyDelegate:1];
  int v13 = [v12 pendingArbitrationExecutionFuture];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

id __71__HUAppleMusicAccountModuleController__companionLoginWithAccount_cell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _authenticationContextForAccessory:v6 account:v5];

  return v8;
}

- (void)logout
{
  if ([(HUAppleMusicAccountModuleController *)self _canExecuteAccountAction])
  {
    v3 = [(HUAppleMusicAccountModuleController *)self logoutButton];
    [(HUAppleMusicAccountModuleController *)self setActiveAuthCell:v3];

    [(HUAppleMusicAccountModuleController *)self _disableCells];
    id v4 = [(HUAppleMusicAccountModuleController *)self logoutButton];
    [(HUAppleMusicAccountModuleController *)self _setupButtonCell:v4 enabled:1];

    [(HUAppleMusicAccountModuleController *)self _updateModuleState:3 notifyDelegate:1];
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x1E4F68EF8];
    id v6 = [(HUAppleMusicAccountModuleController *)self module];
    id v7 = [v6 mediaProfileContainer];
    id v8 = [v7 accessories];
    uint64_t v9 = [v5 logoutAccessories:v8];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    int v13 = __45__HUAppleMusicAccountModuleController_logout__block_invoke;
    int v14 = &unk_1E6389BC8;
    objc_copyWeak(&v15, &location);
    id v10 = [v9 addCompletionBlock:&v11];
    -[HUAppleMusicAccountModuleController setLogoutFuture:](self, "setLogoutFuture:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __45__HUAppleMusicAccountModuleController_logout__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateModuleState:0 notifyDelegate:1];
  [WeakRetained _enableCells];
}

- (BOOL)_canExecuteAccountAction
{
  uint64_t v3 = [(HUAppleMusicAccountModuleController *)self logoutFuture];
  if (!v3) {
    return 1;
  }
  id v4 = (void *)v3;
  id v5 = [(HUAppleMusicAccountModuleController *)self logoutFuture];
  if ([v5 isFinished]
    || ([(HUAppleMusicAccountModuleController *)self loginFuture],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    return 1;
  }
  id v7 = (void *)v6;
  id v8 = [(HUAppleMusicAccountModuleController *)self loginFuture];
  char v9 = [v8 isFinished];

  if (v9) {
    return 1;
  }
  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_debug_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEBUG, "-[HUAppleMusicAccountModuleController _canExecuteAccountAction:] returning NO", v12, 2u);
  }

  return 0;
}

- (void)_disableCells
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUAppleMusicAccountModuleController *)self _authCells];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(HUAppleMusicAccountModuleController *)self _setupButtonCell:*(void *)(*((void *)&v8 + 1) + 8 * v7++) enabled:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_enableCells
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HUAppleMusicAccountModuleController *)self _authCells];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(HUAppleMusicAccountModuleController *)self _setupButtonCell:*(void *)(*((void *)&v8 + 1) + 8 * v7++) enabled:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_authCells
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(HUAppleMusicAccountModuleController *)self itemToCellMap];
  uint64_t v4 = [v3 objectEnumerator];
  uint64_t v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_144);
  uint64_t v6 = [v5 allObjects];
  uint64_t v7 = [v2 setWithArray:v6];

  return v7;
}

uint64_t __49__HUAppleMusicAccountModuleController__authCells__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateModuleState:(unint64_t)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(HUAppleMusicAccountModuleController *)self module];
  [v7 setState:a3];

  if (v4)
  {
    long long v8 = [(HUAppleMusicAccountModuleController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(HUAppleMusicAccountModuleController *)self delegate];
      [v10 appleMusicModuleControllerDidUpdateAuthenticationState:self];
    }
  }
}

- (void)_reloadForAuthEvent
{
  BOOL v4 = (void *)MEMORY[0x1E4F69230];
  uint64_t v5 = [(HUAppleMusicAccountModuleController *)self module];
  uint64_t v6 = [v5 itemProviders];
  id v12 = [v4 requestToReloadItemProviders:v6 senderSelector:a2];

  uint64_t v7 = [(HUAppleMusicAccountModuleController *)self module];
  uint64_t v8 = [v7 itemUpdater];
  id v9 = (id)[(id)v8 performItemUpdateRequest:v12];

  id v10 = [(HUAppleMusicAccountModuleController *)self delegate];
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if (v8)
  {
    long long v11 = [(HUAppleMusicAccountModuleController *)self delegate];
    [v11 appleMusicModuleControllerDidUpdateAuthenticationState:self];
  }
}

- (id)_authenticationContextForAccessory:(id)a3 account:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 remoteLoginHandler];
  uint64_t v8 = objc_msgSend(v7, "hu_appleMusicInAppAuthenticationContext");
  id v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  id v10 = [v8 reschedule:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__HUAppleMusicAccountModuleController__authenticationContextForAccessory_account___block_invoke;
  v14[3] = &unk_1E638C608;
  v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  id v12 = [v10 flatMap:v14];

  return v12;
}

id __82__HUAppleMusicAccountModuleController__authenticationContextForAccessory_account___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 appleMusicModuleController:*(void *)(a1 + 32) willPresentContext:v3 account:*(void *)(a1 + 40)];
  }
  uint64_t v7 = [v3 presentingViewController];

  if (!v7) {
    NSLog(&cfstr_PresentingView.isa);
  }
  uint64_t v8 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v8;
}

- (HUAppleMusicAccountModuleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUAppleMusicAccountModuleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUButtonCell)logoutButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logoutButton);

  return (HUButtonCell *)WeakRetained;
}

- (void)setLogoutButton:(id)a3
{
}

- (NAFuture)logoutFuture
{
  return self->_logoutFuture;
}

- (HUButtonCell)loginButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loginButton);

  return (HUButtonCell *)WeakRetained;
}

- (void)setLoginButton:(id)a3
{
}

- (NAFuture)loginFuture
{
  return self->_loginFuture;
}

- (HUButtonCell)activeAuthCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAuthCell);

  return (HUButtonCell *)WeakRetained;
}

- (void)setActiveAuthCell:(id)a3
{
}

- (NSMapTable)itemToCellMap
{
  return self->_itemToCellMap;
}

- (void)setItemToCellMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemToCellMap, 0);
  objc_destroyWeak((id *)&self->_activeAuthCell);
  objc_storeStrong((id *)&self->_loginFuture, 0);
  objc_destroyWeak((id *)&self->_loginButton);
  objc_storeStrong((id *)&self->_logoutFuture, 0);
  objc_destroyWeak((id *)&self->_logoutButton);

  objc_destroyWeak((id *)&self->_delegate);
}

@end