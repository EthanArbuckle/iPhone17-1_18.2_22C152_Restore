@interface MFNanoAccountsSettingsDataSource
- (BOOL)canMakeChanges:(id)a3;
- (BOOL)isAccountActive:(id)a3;
- (BOOL)isAccountDisabled:(id)a3;
- (BOOL)isAccountRequiringAttention:(id)a3;
- (BOOL)isGmailAccount:(id)a3;
- (BOOL)isiCloudAccount:(id)a3;
- (MFNanoAccountsSettingsDataSource)init;
- (MFNanoBridgeSettingsManager)settingsManager;
- (NSArray)accounts;
- (NSHashTable)observers;
- (unint64_t)activeAccountCount;
- (unint64_t)numberOfAccountsRequiringAttention;
- (void)_handleAccountAuthenticationFailed:(id)a3;
- (void)_handleWatchAccountStatusChanged;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)refreshAccounts;
- (void)removeObserver:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)syncStandaloneAccountIdentity:(id)a3;
@end

@implementation MFNanoAccountsSettingsDataSource

- (MFNanoAccountsSettingsDataSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)MFNanoAccountsSettingsDataSource;
  v2 = [(MFNanoAccountsSettingsDataSource *)&v9 init];
  if (v2)
  {
    v3 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:4];
    observers = v2->_observers;
    v2->_observers = v3;

    uint64_t v5 = +[MFNanoBridgeSettingsManager sharedInstance];
    settingsManager = v2->_settingsManager;
    v2->_settingsManager = (MFNanoBridgeSettingsManager *)v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_8B98, @"MFNanoWatchAccountStatusChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_8BA0, @"MFNanoWatchAuthenticationFailedDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MFNanoWatchAccountStatusChanged", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MFNanoWatchAuthenticationFailedDarwinNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)MFNanoAccountsSettingsDataSource;
  [(MFNanoAccountsSettingsDataSource *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)refreshAccounts
{
  v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "#Nano AccountsSettingsDataSource refreshing accounts", buf, 2u);
  }

  [(MFNanoBridgeSettingsManager *)self->_settingsManager reloadCachedAccounts];
  v15 = [(MFNanoBridgeSettingsManager *)self->_settingsManager activeAccounts];
  v3 = [(MFNanoBridgeSettingsManager *)self->_settingsManager standaloneAccountStateByAccountId];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v15;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "nano_account");
        v10 = [v9 localId];
        v11 = [v3 objectForKeyedSubscript:v10];
        objc_msgSend(v9, "setStandaloneState:", objc_msgSend(v11, "unsignedIntegerValue"));

        v12 = MFLogGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [v9 username];
          id v14 = [v9 standaloneState];
          *(_DWORD *)buf = 138412546;
          v22 = v13;
          __int16 v23 = 2048;
          id v24 = v14;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "#Nano Account %@, State: %lu", buf, 0x16u);
        }
        [v4 addObject:v9];
      }
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }

  [(MFNanoAccountsSettingsDataSource *)self setAccounts:v4];
}

- (void)syncStandaloneAccountIdentity:(id)a3
{
  id v4 = a3;
  id v5 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v6 = [v5 accountIdentities];

  if (v6)
  {
    id v7 = [v6 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableArray array];
  }
  v8 = v7;
  [v7 addObject:v4];
  [(MFNanoBridgeSettingsManager *)self->_settingsManager setAccountIdentities:v8];
  objc_super v9 = MFLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "#Nano Posting Darwin Notification Account Identity Available", v11, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MFNanoAccountIdentityAvailableDarwinNotification", 0, 0, 1u);
}

- (unint64_t)numberOfAccountsRequiringAttention
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_accounts;
  unint64_t v4 = 0;
  id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v4 += -[MFNanoAccountsSettingsDataSource isAccountRequiringAttention:](self, "isAccountRequiringAttention:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v7), (void)v9);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v4;
}

- (unint64_t)activeAccountCount
{
  accounts = self->_accounts;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9278;
  v6[3] = &unk_2C808;
  v6[4] = self;
  v3 = [(NSArray *)accounts ef_filter:v6];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (BOOL)isAccountRequiringAttention:(id)a3
{
  id v4 = a3;
  if ([(MFNanoAccountsSettingsDataSource *)self isAccountActive:v4]
    || [(MFNanoAccountsSettingsDataSource *)self isAccountDisabled:v4])
  {
    char v5 = 0;
  }
  else if ([v4 standaloneState])
  {
    char v5 = [v4 standaloneState] == (char *)&dword_0 + 3;
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)_handleWatchAccountStatusChanged
{
  v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "#Nano Received Darwin Notification Watch Account Status Changed", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_942C;
  block[3] = &unk_2C830;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_handleAccountAuthenticationFailed:(id)a3
{
  id v4 = a3;
  char v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "#Nano Received Darwin Notification Account Authentication Failed. %@", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_96B0;
  v7[3] = &unk_2C858;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (BOOL)isGmailAccount:(id)a3
{
  v3 = [a3 localId];
  id v4 = +[MailAccount accountWithUniqueId:v3];

  char v5 = [v4 statisticsKind];
  unsigned __int8 v6 = [v5 isEqualToString:MSMailAccountStatisticsKindGmail];

  return v6;
}

- (BOOL)isiCloudAccount:(id)a3
{
  v3 = [a3 localId];
  id v4 = +[MailAccount accountWithUniqueId:v3];

  char v5 = [v4 statisticsKind];
  unsigned __int8 v6 = [v5 isEqualToString:MSMailAccountStatisticsKindICloud];

  return v6;
}

- (BOOL)isAccountDisabled:(id)a3
{
  id v4 = a3;
  if ([(MFNanoAccountsSettingsDataSource *)self isiCloudAccount:v4]) {
    LOBYTE(v5) = 0;
  }
  else {
    unsigned int v5 = ![(MFNanoAccountsSettingsDataSource *)self isGmailAccount:v4];
  }

  return v5;
}

- (BOOL)isAccountActive:(id)a3
{
  id v4 = a3;
  if ([v4 standaloneState] == (char *)&dword_0 + 2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(MFNanoAccountsSettingsDataSource *)self isiCloudAccount:v4];
  }

  return v5;
}

- (BOOL)canMakeChanges:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFNanoAccountsSettingsDataSource *)self isGmailAccount:v4]
    && [v4 standaloneState] != (char *)&dword_0 + 2
    && [v4 standaloneState] != (char *)&dword_0 + 1;

  return v5;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MFNanoBridgeSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_accounts, 0);
}

@end