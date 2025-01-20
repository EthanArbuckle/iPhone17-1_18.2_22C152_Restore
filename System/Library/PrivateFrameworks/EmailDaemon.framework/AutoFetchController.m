@interface AutoFetchController
+ (AutoFetchController)sharedController;
+ (BOOL)shouldSyncAccountByMailbox:(id)a3;
+ (id)activeAccountsToSyncByAccount;
+ (id)partitionAccounts:(id)a3;
+ (id)partitionMailboxes:(id)a3;
- (AutoFetchController)init;
- (AutoFetchControllerDataSource)dataSource;
- (EFLocked)state;
- (MFAccountAutoFetchController)accountController;
- (MFAccountsProvider)accountsProvider;
- (MailboxAutoFetchController)mailboxController;
- (NSArray)activeAccountsToSyncByMailbox;
- (NSArray)visibleMailboxesToSyncByMailbox;
- (NSSet)displayedAccountsToSyncByMailbox;
- (id)diagnosticInformation;
- (id)favoritesPersistence;
- (id)freeSpaceMonitor;
- (id)networkController;
- (void)_accountContentsDidChange:(id)a3;
- (void)_freeSpaceStatusDidChange:(id)a3;
- (void)_mailboxAutoFetchDone:(id)a3;
- (void)_mailboxAutoFetchFinished:(id)a3;
- (void)_mailboxAutoFetchStarted:(id)a3;
- (void)_networkConfigurationChanged:(id)a3;
- (void)_networkHasAlternateAdvice:(id)a3;
- (void)_updateState:(int64_t)a3;
- (void)fetchNow:(int)a3;
- (void)fetchNow:(int)a3 withAccounts:(id)a4;
- (void)fetchNow:(int)a3 withMailboxes:(id)a4;
- (void)resetPushStateWithCompletion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSuppressedContexts:(id)a3;
@end

@implementation AutoFetchController

+ (AutoFetchController)sharedController
{
  if (qword_10016B6F0 != -1) {
    dispatch_once(&qword_10016B6F0, &stru_100139CE0);
  }
  v2 = (void *)qword_10016B6E8;

  return (AutoFetchController *)v2;
}

- (AutoFetchController)init
{
  v13.receiver = self;
  v13.super_class = (Class)AutoFetchController;
  v2 = [(AutoFetchController *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)EFLocked);
    v4 = objc_opt_new();
    v5 = (EFLocked *)[v3 initWithObject:v4];
    state = v2->_state;
    v2->_state = v5;

    v7 = (MFAccountAutoFetchController *)objc_alloc_init((Class)MFAccountAutoFetchController);
    accountController = v2->_accountController;
    v2->_accountController = v7;

    v9 = [(AutoFetchController *)v2 mailboxController];
    [v9 setDataSource:v2];

    v10 = +[NSNotificationCenter defaultCenter];
    v11 = [(AutoFetchController *)v2 freeSpaceMonitor];
    [v10 addObserver:v2 selector:"_freeSpaceStatusDidChange:" name:@"MFDiskFreeSpaceMonitorDidChangeNotification" object:v11];

    [v10 addObserver:v2 selector:"_networkConfigurationChanged:" name:NetworkConfigurationDidChangeNotification object:0];
    [v10 addObserver:v2 selector:"_networkHasAlternateAdvice:" name:NetworkSymptomsHasAlternativeAdvice object:0];
    [v10 addObserver:v2 selector:"_accountContentsDidChange:" name:MailAccountContentsDidChange object:0];
    [v10 addObserver:v2 selector:"_mailboxAutoFetchStarted:" name:@"MailboxAutoFetchProcessStartNotification" object:0];
    [v10 addObserver:v2 selector:"_mailboxAutoFetchFinished:" name:@"MailboxAutoFetchProcessFinishedNotification" object:0];
    [v10 addObserver:v2 selector:"_mailboxAutoFetchDone:" name:@"MailboxAutoFetchDoneNotification" object:0];
  }
  return v2;
}

- (void)_updateState:(int64_t)a3
{
  v5 = [(AutoFetchController *)self state];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008910;
  v6[3] = &unk_100139D08;
  v6[4] = self;
  v6[5] = a3;
  [v5 performWhileLocked:v6];
}

- (MFAccountsProvider)accountsProvider
{
  v2 = +[DaemonAppController sharedController];
  id v3 = [v2 accountsProvider];

  return (MFAccountsProvider *)v3;
}

- (id)favoritesPersistence
{
  v2 = +[DaemonAppController sharedController];
  id v3 = [v2 favoritesPersistence];

  return v3;
}

- (id)freeSpaceMonitor
{
  return +[MFDiskFreeSpaceMonitor defaultMonitor];
}

- (MailboxAutoFetchController)mailboxController
{
  return +[MailboxAutoFetchController sharedController];
}

- (id)networkController
{
  return +[MFNetworkController sharedInstance];
}

- (void)_freeSpaceStatusDidChange:(id)a3
{
  v4 = [(AutoFetchController *)self freeSpaceMonitor];
  unsigned __int8 v5 = [v4 isFreeSpaceCritical];

  if ((v5 & 1) == 0)
  {
    v6 = MFAutoFetchLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "low disk mode turned OFF, starting autofetch", v7, 2u);
    }

    [(AutoFetchController *)self fetchNow:16];
  }
}

- (void)_accountContentsDidChange:(id)a3
{
  id v10 = a3;
  v4 = MFUserAgent();
  unsigned int v5 = [v4 isMaild];

  if (v5)
  {
    v6 = [v10 object];
    v7 = [v10 userInfo];
    v8 = [v7 objectForKey:MailAccountContentsDidChangeUids];

    if (!v8)
    {
      v9 = [v6 primaryMailboxUid];
      v8 = +[NSArray arrayWithObject:v9];
    }
    [(AutoFetchController *)self fetchNow:EMFetchTypePush withMailboxes:v8];
  }
}

- (void)_networkConfigurationChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(AutoFetchController *)self networkController];
  unsigned int v6 = [v5 isNetworkUp];

  if (v6)
  {
    v7 = dispatch_get_global_queue(17, 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100008F60;
    v10[3] = &unk_100139C20;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }
  else
  {
    sub_10000913C();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 name];
      *(_DWORD *)buf = 138412290;
      objc_super v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: network down", buf, 0xCu);
    }
  }
}

- (void)_networkHasAlternateAdvice:(id)a3
{
  id v4 = sub_10000913C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RNF: received notification, dropping all connections", buf, 2u);
  }

  unsigned int v5 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009264;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_mailboxAutoFetchStarted:(id)a3
{
}

- (void)_mailboxAutoFetchFinished:(id)a3
{
}

- (void)_mailboxAutoFetchDone:(id)a3
{
}

+ (BOOL)shouldSyncAccountByMailbox:(id)a3
{
  id v3 = [a3 taskManager];
  BOOL v4 = v3 == 0;

  return v4;
}

+ (id)partitionAccounts:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_partition:", &stru_100139D48);
  BOOL v4 = [AutoFetchPartition alloc];
  unsigned int v5 = [v3 first];
  unsigned int v6 = [v3 second];
  v7 = [(AutoFetchPartition *)v4 initWithSyncedByMailbox:v5 syncedByAccount:v6];

  return v7;
}

+ (id)partitionMailboxes:(id)a3
{
  id v3 = objc_msgSend(a3, "ef_partition:", &stru_100139D88);
  BOOL v4 = [AutoFetchPartition alloc];
  unsigned int v5 = [v3 first];
  unsigned int v6 = [v3 second];
  v7 = [(AutoFetchPartition *)v4 initWithSyncedByMailbox:v5 syncedByAccount:v6];

  return v7;
}

+ (id)activeAccountsToSyncByAccount
{
  v2 = +[MailAccount activeAccounts];
  id v3 = objc_msgSend(v2, "ef_filter:", &stru_100139DA8);

  return v3;
}

- (void)fetchNow:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (EMFetchTypePowerNap == a3)
  {
    id v5 = +[AutoFetchController activeAccountsToSyncByAccount];
    -[AutoFetchController fetchNow:withAccounts:](self, "fetchNow:withAccounts:", v3);

    id v6 = [(AutoFetchController *)self mailboxController];
    [v6 fetchForPowernap];
  }
  else
  {
    id v6 = +[MailAccount activeAccounts];
    -[AutoFetchController fetchNow:withAccounts:](self, "fetchNow:withAccounts:", v3);
  }
}

- (void)fetchNow:(int)a3 withAccounts:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v14 = +[AutoFetchController partitionAccounts:a4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v14 syncedByAccount];
  id obj = v6;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
        [(AutoFetchController *)self _updateState:0];
        id v11 = [(AutoFetchController *)self accountController];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10000995C;
        v16[3] = &unk_100139DD0;
        v16[4] = v10;
        v16[5] = self;
        [v11 fetchNow:v4 withMailboxes:0 fromAccount:v10 completion:v16];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = obj;
      id v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v12 = [(AutoFetchController *)self mailboxController];
  objc_super v13 = [v14 syncedByMailbox];
  [v12 fetchNow:v4 withAccounts:v13];
}

- (void)fetchNow:(int)a3 withMailboxes:(id)a4
{
  id v19 = a4;
  v21 = +[AutoFetchController partitionMailboxes:](AutoFetchController, "partitionMailboxes:");
  id v5 = [v21 syncedByAccount];
  long long v20 = objc_msgSend(v5, "ef_groupBy:", &stru_100139E10);

  id v6 = +[NSNotificationCenter defaultCenter];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v20;
  id v24 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v24)
  {
    unsigned int v7 = a3 & 0x800;
    uint64_t v22 = *(void *)v39;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v9 = [obj objectForKeyedSubscript:v8];
        uint64_t v26 = v8;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v10 = v9;
        id v11 = (char *)[v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v35;
          while (1)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v10);
            }
            CFStringRef v42 = @"AutoFetchDontNotify";
            objc_super v13 = +[NSNumber numberWithBool:v7 != 0];
            v43 = v13;
            v14 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

            [v6 postNotificationName:@"AutoFetchPushStartedNotification" object:self userInfo:v14];
            if (!--v11)
            {
              id v11 = (char *)[v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
              if (!v11) {
                break;
              }
            }
          }
        }

        v15 = [(AutoFetchController *)self accountController];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10000A050;
        v28[3] = &unk_100139E38;
        id v16 = v10;
        id v29 = v16;
        uint64_t v30 = v26;
        char v33 = v7 >> 11;
        id v31 = v6;
        v32 = self;
        [v15 fetchNow:a3 withMailboxes:v16 fromAccount:v26 completion:v28];
      }
      id v24 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v24);
  }

  long long v17 = [(AutoFetchController *)self mailboxController];
  long long v18 = [v21 syncedByMailbox];
  [v17 fetchNow:a3 withMailboxes:v18];
}

- (void)resetPushStateWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, uint64_t, uint64_t, void))a3;
  id v4 = +[MailAccount mailAccounts];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 canFetch]) {
          [v5 addObject:v10];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  sub_10000A994(v6, (uint64_t)"stopListeningForNotifications");
  id v11 = +[MFPowerController sharedInstance];
  if ([v11 isBatterySaverModeEnabled])
  {
  }
  else
  {
    uint64_t v12 = +[MFPowerController sharedInstance];
    unsigned __int8 v13 = [v12 gameModeEnabled];

    if ((v13 & 1) == 0) {
      sub_10000A994(v5, (uint64_t)"startListeningForNotifications");
    }
  }

  +[MailAccount activeAccounts];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)j), "uniqueIdForPersistentConnection", (void)v20);
        if (PCSettingsGetStyle() != 2)
        {
          LODWORD(v15) = 1;
          goto LABEL_24;
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_24:

  uint64_t ClassPollInterval = PCSettingsGetClassPollInterval();
  if (ClassPollInterval == -1) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v15;
  }
  v3[2](v3, 1, v19, ClassPollInterval, 0);
}

- (void)setSuppressedContexts:(id)a3
{
  id v5 = a3;
  id v4 = [(AutoFetchController *)self mailboxController];
  [v4 setSuppressedContexts:v5];
}

- (id)diagnosticInformation
{
  v2 = [(AutoFetchController *)self mailboxController];
  uint64_t v3 = [v2 diagnosticInformation];

  return v3;
}

- (NSArray)activeAccountsToSyncByMailbox
{
  v2 = +[MailAccount activeAccounts];
  uint64_t v3 = objc_msgSend(v2, "ef_filter:", &stru_100139E58);

  return (NSArray *)v3;
}

- (NSSet)displayedAccountsToSyncByMailbox
{
  v2 = [(AutoFetchController *)self accountsProvider];
  uint64_t v3 = [v2 displayedAccounts];
  id v4 = objc_msgSend(v3, "ef_filter:", &stru_100139E78);

  return (NSSet *)v4;
}

- (NSArray)visibleMailboxesToSyncByMailbox
{
  uint64_t v3 = [(AutoFetchController *)self dataSource];
  id v4 = [v3 visibleMailboxes];

  if (![v4 count])
  {
    id v5 = [(AutoFetchController *)self favoritesPersistence];
    uint64_t v6 = [v5 mailboxesForAutoFetch];

    id v4 = (void *)v6;
  }
  id v7 = objc_msgSend(v4, "ef_filter:", &stru_100139E98);

  return (NSArray *)v7;
}

- (AutoFetchControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (AutoFetchControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (EFLocked)state
{
  return self->_state;
}

- (MFAccountAutoFetchController)accountController
{
  return self->_accountController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end