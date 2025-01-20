@interface CNDowntimeWhitelistContainerFetcher
+ (OS_os_log)os_log;
- (ACAccountStore)accountStore;
- (CNContactStore)contactStore;
- (CNContainer)primaryiCloudContainer;
- (CNDowntimeWhitelistContainerFetcher)init;
- (CNDowntimeWhitelistContainerFetcher)initWithContactStore:(id)a3 accountStore:(id)a4 notificationCenter:(id)a5;
- (NSNotificationCenter)notificationCenter;
- (NSObject)accountStoreDidChangeNotificationToken;
- (id)fetchPrimaryiCloudCardDAVAccountIdentifier;
- (id)fetchPrimaryiCloudCardDAVContainer;
- (void)beginObservingChangeNotifications;
- (void)dealloc;
- (void)fetchPrimaryiCloudCardDAVAccountIdentifier;
- (void)fetchPrimaryiCloudCardDAVContainer;
@end

@implementation CNDowntimeWhitelistContainerFetcher

- (CNDowntimeWhitelistContainerFetcher)initWithContactStore:(id)a3 accountStore:(id)a4 notificationCenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNDowntimeWhitelistContainerFetcher;
  v12 = [(CNDowntimeWhitelistContainerFetcher *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contactStore, a3);
    objc_storeStrong((id *)&v13->_accountStore, a4);
    objc_storeStrong((id *)&v13->_notificationCenter, a5);
    [(CNDowntimeWhitelistContainerFetcher *)v13 beginObservingChangeNotifications];
    v14 = v13;
  }

  return v13;
}

- (void)beginObservingChangeNotifications
{
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  uint64_t v4 = *MEMORY[0x1E4F178D8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CNDowntimeWhitelistContainerFetcher_beginObservingChangeNotifications__block_invoke;
  v7[3] = &unk_1E56B4850;
  objc_copyWeak(&v8, &location);
  v5 = [(NSNotificationCenter *)notificationCenter addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  accountStoreDidChangeNotificationToken = self->_accountStoreDidChangeNotificationToken;
  self->_accountStoreDidChangeNotificationToken = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_4 != -1) {
    dispatch_once(&os_log_cn_once_token_0_4, &__block_literal_global_23);
  }
  v2 = (void *)os_log_cn_once_object_0_4;

  return (OS_os_log *)v2;
}

uint64_t __45__CNDowntimeWhitelistContainerFetcher_os_log__block_invoke()
{
  os_log_cn_once_object_0_4 = (uint64_t)os_log_create("com.apple.contacts", "whitelist");

  return MEMORY[0x1F41817F8]();
}

- (CNDowntimeWhitelistContainerFetcher)init
{
  v3 = objc_alloc_init(CNContactStore);
  uint64_t v4 = [MEMORY[0x1E4F179C8] defaultStore];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = [(CNDowntimeWhitelistContainerFetcher *)self initWithContactStore:v3 accountStore:v4 notificationCenter:v5];

  return v6;
}

void __72__CNDowntimeWhitelistContainerFetcher_beginObservingChangeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1909E3000, v2, OS_LOG_TYPE_INFO, "will clear primary iCloud CardDAV container identifier", buf, 2u);
    }

    cn_runWithObjectLock();
  }
}

void __72__CNDowntimeWhitelistContainerFetcher_beginObservingChangeNotifications__block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (void)dealloc
{
  [(NSNotificationCenter *)self->_notificationCenter removeObserver:self->_accountStoreDidChangeNotificationToken];
  v3.receiver = self;
  v3.super_class = (Class)CNDowntimeWhitelistContainerFetcher;
  [(CNDowntimeWhitelistContainerFetcher *)&v3 dealloc];
}

- (CNContainer)primaryiCloudContainer
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContainer *)v2;
}

id __61__CNDowntimeWhitelistContainerFetcher_primaryiCloudContainer__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[1];
  if (!v3)
  {
    uint64_t v4 = [v2 fetchPrimaryiCloudCardDAVContainer];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v4;

    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 8);
  }

  return v3;
}

- (id)fetchPrimaryiCloudCardDAVContainer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1909E3000, v3, OS_LOG_TYPE_INFO, "will fetch primary iCloud CardDAV container", buf, 2u);
  }

  uint64_t v4 = [(CNDowntimeWhitelistContainerFetcher *)self fetchPrimaryiCloudCardDAVAccountIdentifier];
  uint64_t v5 = +[CNContainer predicateForContainersInAccountWithExternalIdentifier:v4];
  uint64_t v6 = [(CNDowntimeWhitelistContainerFetcher *)self contactStore];
  id v15 = 0;
  v7 = [(id)v6 containersMatchingPredicate:v5 error:&v15];
  id v8 = v15;

  LOBYTE(v6) = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))();
  id v9 = objc_msgSend((id)objc_opt_class(), "os_log");
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(CNDowntimeWhitelistContainerFetcher *)(uint64_t)v4 fetchPrimaryiCloudCardDAVContainer];
    }

    id v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = [v7 firstObject];
      v13 = [v12 identifier];
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      __int16 v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_INFO, "found primary CardDAV container with identifier %{public}@ for primary CardDAV account with identifier %{public}@", buf, 0x16u);
    }
    id v11 = [v7 firstObject];
  }

  return v11;
}

- (id)fetchPrimaryiCloudCardDAVAccountIdentifier
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CNDowntimeWhitelistContainerFetcher *)self accountStore];
  objc_super v3 = objc_msgSend((id)v2, "aa_primaryAppleAccount");
  uint64_t v4 = [v3 childCardDAVAccountIdentifier];

  LOBYTE(v2) = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))();
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  uint64_t v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CNDowntimeWhitelistContainerFetcher fetchPrimaryiCloudCardDAVAccountIdentifier](v6);
    }

    v7 = &stru_1EE052B80;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_INFO, "found primary CardDAV account identifier %{public}@", (uint8_t *)&v9, 0xCu);
    }

    v7 = v4;
  }

  return v7;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSObject)accountStoreDidChangeNotificationToken
{
  return self->_accountStoreDidChangeNotificationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStoreDidChangeNotificationToken, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_primaryiCloudContainer, 0);
}

- (void)fetchPrimaryiCloudCardDAVContainer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "error fetching primary CardDAV container for account with identifier %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)fetchPrimaryiCloudCardDAVAccountIdentifier
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "error fetching primary CardDAV account identifier", v1, 2u);
}

@end