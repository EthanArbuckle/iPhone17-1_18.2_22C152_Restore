@interface MFNanoAccountHandler
- (MFNanoAccountHandler)initWithExecutionQueue:(id)a3 syncProvider:(id)a4;
- (NNMKSyncProvider)syncProvider;
- (NSArray)activeAccounts;
- (OS_dispatch_queue)executionQueue;
- (id)_nanoMailboxesFromMailAccount:(id)a3;
- (id)accountWithId:(id)a3;
- (id)favoriteMailboxUidList;
- (id)nanoAccountFromMailAccount:(id)a3;
- (void)_accountsChanged:(id)a3;
- (void)_addObservers;
- (void)_checkIfSettingsChanged;
- (void)_handleAccountEmailTokenHasChanged;
- (void)_handleImportantBridgeSettingHasChanged;
- (void)_handleNewAccountIdentityAvailable;
- (void)_notifyFavoritesManagerSelectedMailboxesChanged;
- (void)_settingsChanged:(id)a3;
- (void)_swipeActionsChanged:(id)a3;
- (void)dealloc;
- (void)handleWatchAccountsUpdated;
- (void)notifyAuthenticationFailedForAccount:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setSyncProvider:(id)a3;
- (void)updateBridgeSettingsWithMailboxSelection:(id)a3;
@end

@implementation MFNanoAccountHandler

- (MFNanoAccountHandler)initWithExecutionQueue:(id)a3 syncProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFNanoAccountHandler;
  v9 = [(MFNanoAccountHandler *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_executionQueue, a3);
    objc_storeStrong((id *)&v10->_syncProvider, a4);
    [(MFNanoAccountHandler *)v10 _checkIfSettingsChanged];
    [(MFNanoAccountHandler *)v10 _addObservers];
    [(MFNanoAccountHandler *)v10 _handleNewAccountIdentityAvailable];
    id v11 = +[MFNanoBridgeSettingsManager sharedInstance];
  }

  return v10;
}

- (void)_addObservers
{
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_accountsChanged:" name:ECMailAccountsDidChangeNotification object:0];
  v3 = [(objc_class *)off_10016A990() sharedInstance];
  v4 = [v3 getPairedDevices];
  v5 = [v4 firstObject];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D8A5B9F1-722E-436E-B616-1398AEB94F1B"];
  LODWORD(v4) = [v5 supportsCapability:v6];

  if (v4) {
    [v8 addObserver:self selector:"_accountsChanged:" name:AccountMailboxListingDidChange object:0];
  }
  [v8 addObserver:self selector:"_settingsChanged:" name:@"MailDefaultsChangedNotification" object:0];
  [v8 addObserver:self selector:"_swipeActionsChanged:" name:@"MailApplicationDidChangeSwipeActions" object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10007EC88, @"MFNanoAccountIdentityAvailableDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10007EC90, @"MFNanoMailImportantBridgeSettingHasChangedDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10007EC98, @"MFNanoWatchAccountEmailTokenChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MFNanoAccountIdentityAvailableDarwinNotification", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MFNanoMailImportantBridgeSettingHasChangedDarwinNotification", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"MFNanoWatchAccountEmailTokenChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)MFNanoAccountHandler;
  [(MFNanoAccountHandler *)&v4 dealloc];
}

- (id)accountWithId:(id)a3
{
  objc_super v4 = +[MailAccount accountWithUniqueId:a3];
  v5 = [(MFNanoAccountHandler *)self nanoAccountFromMailAccount:v4];

  return v5;
}

- (NSArray)activeAccounts
{
  v3 = +[MailAccount nano_activeMailAccounts];
  objc_super v4 = v3;
  if (v3)
  {
    v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = -[MFNanoAccountHandler nanoAccountFromMailAccount:](self, "nanoAccountFromMailAccount:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (void)handleWatchAccountsUpdated
{
  v2 = [(MFNanoAccountHandler *)self syncProvider];
  v17 = [v2 watchAccounts];

  v3 = +[NSMutableDictionary dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v17;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 standaloneState]);
        v10 = [v8 localId];
        [v3 setObject:v9 forKeyedSubscript:v10];

        id v11 = MFLogGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          long long v12 = [v8 localId];
          id v13 = [v8 standaloneState];
          *(_DWORD *)buf = 138543618;
          v23 = v12;
          __int16 v24 = 2048;
          id v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#Nano Account %{public}@, State: %lu", buf, 0x16u);
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v5);
  }

  long long v14 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v14 setStandaloneAccountStateByAccountId:v3];

  long long v15 = MFLogGeneral();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#Nano Posting Darwin Notification Watch Account Status Changed", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MFNanoWatchAccountStatusChanged", 0, 0, 1u);
}

- (void)notifyAuthenticationFailedForAccount:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 localId], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Nano Posting Darwin Notification Account Authentication Failed", v10, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v11 = @"MFNanoWatchAuthenticationFailedAccountIdDarwinNotificationUserInfoKey";
    uint64_t v8 = [v4 localId];
    long long v12 = v8;
    v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"MFNanoWatchAuthenticationFailedDarwinNotification", v9, 0, 1u);
  }
  else
  {
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000C1DB4(v9);
    }
  }
}

- (void)updateBridgeSettingsWithMailboxSelection:(id)a3
{
  id v5 = a3;
  id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  [v4 setUpdateMailboxSelection:v5];

  [(MFNanoAccountHandler *)self _notifyFavoritesManagerSelectedMailboxesChanged];
}

- (void)_accountsChanged:(id)a3
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F53C;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)_settingsChanged:(id)a3
{
  id v4 = a3;
  executionQueue = self->_executionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007F690;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(executionQueue, v7);
}

- (void)_swipeActionsChanged:(id)a3
{
}

- (id)nanoAccountFromMailAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "nano_account");
    id v7 = [(MFNanoAccountHandler *)self _nanoMailboxesFromMailAccount:v5];
    [v6 setMailboxes:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_nanoMailboxesFromMailAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[MFNanoBridgeSettingsManager sharedInstance];
  id v5 = [v4 bridgeSettingsMailboxSelection];

  id v6 = [v3 allMailboxUids];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007F9D0;
  v11[3] = &unk_10013CE40;
  id v7 = v3;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  v9 = objc_msgSend(v6, "ef_map:", v11);

  return v9;
}

- (void)_checkIfSettingsChanged
{
  if ([(NNMKSyncProvider *)self->_syncProvider isPaired])
  {
    id v3 = objc_alloc((Class)NNMKMailboxSelection);
    id v4 = [(MFNanoAccountHandler *)self activeAccounts];
    id v8 = [v3 initWithAccounts:v4];

    id v5 = [(NNMKSyncProvider *)self->_syncProvider mailboxSelection];
    LOBYTE(v3) = [v8 isEqual:v5];

    if ((v3 & 1) == 0)
    {
      [(NNMKSyncProvider *)self->_syncProvider updateMailboxSelection:v8];
      [(MFNanoAccountHandler *)self _notifyFavoritesManagerSelectedMailboxesChanged];
    }
    id v6 = +[MFNanoBridgeSettingsManager sharedInstance];
    id v7 = [v6 organizeByThread];

    if (v7 != [(NNMKSyncProvider *)self->_syncProvider organizeByThread]) {
      [(NNMKSyncProvider *)self->_syncProvider setOrganizeByThread:v7];
    }
  }
}

- (id)favoriteMailboxUidList
{
  id v3 = +[NSMutableArray array];
  if ([(NNMKSyncProvider *)self->_syncProvider isPaired])
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [(NNMKSyncProvider *)self->_syncProvider mailboxSelection];
    id v6 = [v5 allMailboxesSyncEnabled];

    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          CFStringRef v11 = [v10 accountId];
          id v12 = [v4 objectForKeyedSubscript:v11];

          if (!v12)
          {
            id v13 = [v10 accountId];
            id v12 = +[MailAccount accountWithUniqueId:v13];

            if (v12)
            {
              long long v14 = [v10 accountId];
              [v4 setObject:v12 forKeyedSubscript:v14];
            }
          }
          long long v15 = [v10 url];
          v16 = [v15 absoluteString];
          v17 = [v12 mailboxUidForURL:v16];

          if (v17) {
            [v3 addObject:v17];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
  }

  return v3;
}

- (void)_notifyFavoritesManagerSelectedMailboxesChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_executionQueue);
  [(MFNanoAccountHandler *)self favoriteMailboxUidList];
  id v6 = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:&v5];
}

- (void)_handleNewAccountIdentityAvailable
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080198;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)_handleImportantBridgeSettingHasChanged
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080430;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (void)_handleAccountEmailTokenHasChanged
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000804AC;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (NNMKSyncProvider)syncProvider
{
  return self->_syncProvider;
}

- (void)setSyncProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncProvider, 0);

  objc_storeStrong((id *)&self->_executionQueue, 0);
}

@end