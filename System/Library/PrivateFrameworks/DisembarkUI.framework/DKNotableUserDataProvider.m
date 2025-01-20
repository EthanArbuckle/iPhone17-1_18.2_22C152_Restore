@interface DKNotableUserDataProvider
- (DKAccountProvider)accountProvider;
- (DKFindMyProvider)findMyProvider;
- (DKNotableUserDataProvider)init;
- (DKNotableUserDataProvider)initWithAccountProvider:(id)a3 findMyProvider:(id)a4 walletProvider:(id)a5;
- (DKRestrictionsProvider)restrictionsProvider;
- (DKStorageProvider)storageProvider;
- (DKTelephonyProvider)telephonyProvider;
- (DKWalletProvider)walletProvider;
- (void)fetchNotableUserData:(id)a3;
- (void)setAccountProvider:(id)a3;
- (void)setFindMyProvider:(id)a3;
- (void)setRestrictionsProvider:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)setTelephonyProvider:(id)a3;
- (void)setWalletProvider:(id)a3;
@end

@implementation DKNotableUserDataProvider

- (DKNotableUserDataProvider)initWithAccountProvider:(id)a3 findMyProvider:(id)a4 walletProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(DKNotableUserDataProvider *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountProvider, a3);
    objc_storeStrong((id *)&v13->_findMyProvider, a4);
    objc_storeStrong((id *)&v13->_walletProvider, a5);
  }

  return v13;
}

- (DKNotableUserDataProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)DKNotableUserDataProvider;
  v2 = [(DKNotableUserDataProvider *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(DKRestrictionsProvider);
    restrictionsProvider = v2->_restrictionsProvider;
    v2->_restrictionsProvider = v3;

    v5 = objc_alloc_init(DKStorageProvider);
    storageProvider = v2->_storageProvider;
    v2->_storageProvider = v5;

    v7 = objc_alloc_init(DKTelephonyProvider);
    telephonyProvider = v2->_telephonyProvider;
    v2->_telephonyProvider = v7;
  }
  return v2;
}

- (void)fetchNotableUserData:(id)a3
{
  id v4 = a3;
  v5 = [(DKNotableUserDataProvider *)self accountProvider];
  if (!v5) {
    -[DKNotableUserDataProvider fetchNotableUserData:]();
  }

  v6 = [(DKNotableUserDataProvider *)self findMyProvider];
  if (!v6) {
    -[DKNotableUserDataProvider fetchNotableUserData:]();
  }

  v7 = [(DKNotableUserDataProvider *)self restrictionsProvider];
  if (!v7) {
    -[DKNotableUserDataProvider fetchNotableUserData:]();
  }

  v8 = [(DKNotableUserDataProvider *)self storageProvider];
  if (!v8) {
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.4();
  }

  id v9 = [(DKNotableUserDataProvider *)self telephonyProvider];
  if (!v9) {
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.5();
  }

  objc_super v10 = [(DKNotableUserDataProvider *)self walletProvider];
  if (!v10) {
    -[DKNotableUserDataProvider fetchNotableUserData:].cold.6();
  }

  id v11 = objc_alloc_init(DKNotableUserData);
  v12 = _DKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v12, OS_LOG_TYPE_DEFAULT, "Fetching synchronous notable user data...", buf, 2u);
  }

  v13 = [(DKNotableUserDataProvider *)self restrictionsProvider];
  int v14 = [v13 isPreserveESIMOnEraseEnforced];

  if (v14)
  {
    [(DKNotableUserData *)v11 setCellularPlans:MEMORY[0x263EFFA68]];
  }
  else
  {
    v15 = [(DKNotableUserDataProvider *)self telephonyProvider];
    v16 = [v15 cellularPlans];
    [(DKNotableUserData *)v11 setCellularPlans:v16];
  }
  v17 = [(DKNotableUserDataProvider *)self storageProvider];
  -[DKNotableUserData setDataSize:](v11, "setDataSize:", [v17 dataSize]);

  v18 = _DKLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_237B3F000, v18, OS_LOG_TYPE_DEFAULT, "Fetching asynchronous notable user data...", buf, 2u);
  }

  v19 = dispatch_group_create();
  dispatch_group_enter(v19);
  v20 = [(DKNotableUserDataProvider *)self findMyProvider];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke;
  v40[3] = &unk_264CF10C0;
  v21 = v11;
  v41 = v21;
  v22 = v19;
  v42 = v22;
  [v20 fetchFindMyState:v40];

  dispatch_group_enter(v22);
  v23 = [(DKNotableUserDataProvider *)self accountProvider];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_45;
  v37[3] = &unk_264CF10E8;
  v24 = v21;
  v38 = v24;
  v25 = v22;
  v39 = v25;
  [v23 fetchAccounts:v37];

  dispatch_group_enter(v25);
  v26 = [(DKNotableUserDataProvider *)self walletProvider];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_47;
  v34[3] = &unk_264CF1110;
  v27 = v24;
  v35 = v27;
  v36 = v25;
  v28 = v25;
  [v26 fetchAppleWalletCards:v34];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_49;
  v31[3] = &unk_264CF0B80;
  v32 = v27;
  id v33 = v4;
  v29 = v27;
  id v30 = v4;
  dispatch_group_notify(v28, MEMORY[0x263EF83A0], v31);
}

void __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = _DKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Finished fetching Find My state", v5, 2u);
  }

  [*(id *)(a1 + 32) setFindMyEnabled:a2];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_45(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _DKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Finished fetching accounts", v5, 2u);
  }

  [*(id *)(a1 + 32) setAccounts:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _DKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_237B3F000, v4, OS_LOG_TYPE_DEFAULT, "Finished fetching Wallet data", v5, 2u);
  }

  [*(id *)(a1 + 32) setWalletData:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__DKNotableUserDataProvider_fetchNotableUserData___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (DKAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
}

- (DKFindMyProvider)findMyProvider
{
  return self->_findMyProvider;
}

- (void)setFindMyProvider:(id)a3
{
}

- (DKRestrictionsProvider)restrictionsProvider
{
  return self->_restrictionsProvider;
}

- (void)setRestrictionsProvider:(id)a3
{
}

- (DKStorageProvider)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (DKTelephonyProvider)telephonyProvider
{
  return self->_telephonyProvider;
}

- (void)setTelephonyProvider:(id)a3
{
}

- (DKWalletProvider)walletProvider
{
  return self->_walletProvider;
}

- (void)setWalletProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletProvider, 0);
  objc_storeStrong((id *)&self->_telephonyProvider, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
  objc_storeStrong((id *)&self->_restrictionsProvider, 0);
  objc_storeStrong((id *)&self->_findMyProvider, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
}

- (void)fetchNotableUserData:.cold.1()
{
}

- (void)fetchNotableUserData:.cold.2()
{
}

- (void)fetchNotableUserData:.cold.3()
{
}

- (void)fetchNotableUserData:.cold.4()
{
}

- (void)fetchNotableUserData:.cold.5()
{
}

- (void)fetchNotableUserData:.cold.6()
{
}

@end