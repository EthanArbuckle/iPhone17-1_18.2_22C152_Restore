@interface ECAccountsObserver
+ (OS_os_log)log;
+ (id)observedAccountTypes;
- (ACAccountStore)accountStore;
- (BOOL)_shouldNotifyOnAccountChangeForNotification:(id)a3;
- (ECAccountsObserver)initWithAccountStore:(id)a3;
- (void)_accountStoreDidChange:(id)a3;
- (void)_credentialsDidChange:(id)a3;
- (void)_mailAccountsChanged:(id)a3;
- (void)handleAccountStoreChangeForAccountIdentifier:(id)a3;
- (void)handleCredentialChangeForAccountIdentifier:(id)a3;
- (void)handleMailAccountsHaveChanged:(id)a3 accountsNeedInitialization:(BOOL)a4;
- (void)setAccountStore:(id)a3;
@end

@implementation ECAccountsObserver

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__ECAccountsObserver_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return (OS_os_log *)v2;
}

void __25__ECAccountsObserver_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (ECAccountsObserver)initWithAccountStore:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ECAccountsObserver.m", 33, @"Invalid parameter not satisfying: %@", @"accountStore" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)ECAccountsObserver;
  v7 = [(ECAccountsObserver *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_accountStore, a3);
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F17728] object:v8->_accountStore];
    [v9 addObserver:v8 selector:sel__credentialsDidChange_ name:*MEMORY[0x1E4F17520] object:0];
    [v9 addObserver:v8 selector:sel__mailAccountsChanged_ name:@"ECMailAccountsChangedNotification" object:0];
  }
  return v8;
}

- (void)_accountStoreDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[ECAccountsObserver log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1BF11D000, v5, OS_LOG_TYPE_DEFAULT, "Received account store did change notification: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ([(ECAccountsObserver *)self _shouldNotifyOnAccountChangeForNotification:v4])
  {
    id v6 = [v4 userInfo];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F17648]];

    [(ECAccountsObserver *)self handleAccountStoreChangeForAccountIdentifier:v7];
  }
}

- (void)_credentialsDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[ECAccountsObserver log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1BF11D000, v5, OS_LOG_TYPE_DEFAULT, "Received account credentials did change notification: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ([(ECAccountsObserver *)self _shouldNotifyOnAccountChangeForNotification:v4])
  {
    id v6 = [v4 userInfo];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F17648]];

    [(ECAccountsObserver *)self handleCredentialChangeForAccountIdentifier:v7];
  }
}

- (void)_mailAccountsChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[ECAccountsObserver log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1BF11D000, v5, OS_LOG_TYPE_DEFAULT, "Received accounts did change notification: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [v4 object];
  v7 = [v4 userInfo];
  int v8 = [v7 objectForKeyedSubscript:@"ECMailAccountInitialization"];
  uint64_t v9 = [v8 BOOLValue];

  [(ECAccountsObserver *)self handleMailAccountsHaveChanged:v6 accountsNeedInitialization:v9];
}

- (BOOL)_shouldNotifyOnAccountChangeForNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F17810]];

  if (v4)
  {
    v5 = +[ECAccountsObserver observedAccountTypes];
    char v6 = [v5 containsObject:v4];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

+ (id)observedAccountTypes
{
  if (observedAccountTypes_onceToken != -1) {
    dispatch_once(&observedAccountTypes_onceToken, &__block_literal_global);
  }
  v2 = (void *)observedAccountTypes_sObservedAccountTypes;
  return v2;
}

void __42__ECAccountsObserver_observedAccountTypes__block_invoke()
{
  v9[14] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F177F0];
  v9[0] = *MEMORY[0x1E4F177E8];
  v9[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F17830];
  v9[2] = *MEMORY[0x1E4F17798];
  v9[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F17828];
  v9[4] = *MEMORY[0x1E4F17850];
  v9[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F17750];
  v9[6] = *MEMORY[0x1E4F17740];
  v9[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F177C0];
  v9[8] = *MEMORY[0x1E4F17878];
  v9[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F17730];
  v9[10] = *MEMORY[0x1E4F177D0];
  v9[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F17840];
  v9[12] = *MEMORY[0x1E4F17738];
  v9[13] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:14];
  int v8 = (void *)observedAccountTypes_sObservedAccountTypes;
  observedAccountTypes_sObservedAccountTypes = v7;
}

- (void)handleAccountStoreChangeForAccountIdentifier:(id)a3
{
  id v5 = a3;
  [(ECAccountsObserver *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ECAccountsObserver handleAccountStoreChangeForAccountIdentifier:]", "ECAccountsObserver.m", 105, "0");
}

- (void)handleCredentialChangeForAccountIdentifier:(id)a3
{
  id v5 = a3;
  [(ECAccountsObserver *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ECAccountsObserver handleCredentialChangeForAccountIdentifier:]", "ECAccountsObserver.m", 109, "0");
}

- (void)handleMailAccountsHaveChanged:(id)a3 accountsNeedInitialization:(BOOL)a4
{
  id v6 = a3;
  [(ECAccountsObserver *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ECAccountsObserver handleMailAccountsHaveChanged:accountsNeedInitialization:]", "ECAccountsObserver.m", 113, "0");
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end