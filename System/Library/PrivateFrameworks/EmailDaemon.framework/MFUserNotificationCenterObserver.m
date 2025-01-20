@interface MFUserNotificationCenterObserver
- (BOOL)_nts_updateObservationWithAccounts:(id)a3;
- (BOOL)isObservingMailbox:(id)a3 inAccountID:(id)a4;
- (EMVIPReader)vipReader;
- (MFFavoritesReader)favoritesReader;
- (MFUserNotificationCenterObserver)initWithVIPReader:(id)a3 favoritesReader:(id)a4 delegate:(id)a5;
- (MFUserNotificationCenterObserverDelegate)delegate;
- (NSArray)activeAccounts;
- (NSMutableDictionary)observedStoresByAccountID;
- (NSMutableSet)observedAccountIDs;
- (OS_dispatch_queue)queue;
- (void)_handleAccountsChanged:(id)a3;
- (void)_handleConversationFlagsChanged:(id)a3;
- (void)_handleFavoriteMailboxesChanged:(id)a3;
- (void)_handleFoldersChanged:(id)a3;
- (void)_handleMessagesAdded:(id)a3;
- (void)_handleMessagesDeleted:(id)a3;
- (void)_handleMessagesFlagsChanged:(id)a3;
- (void)_handlePushedFoldersChanged:(id)a3;
- (void)_handleVIPsChanged:(id)a3;
- (void)_nts_startObservingAccounts:(id)a3;
- (void)_nts_stopObservingAccountWithIDs:(id)a3;
- (void)_startObservingStore:(id)a3;
- (void)_stopObservingStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObservedAccountIDs:(id)a3;
- (void)setObservedStoresByAccountID:(id)a3;
- (void)setQueue:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation MFUserNotificationCenterObserver

- (MFUserNotificationCenterObserver)initWithVIPReader:(id)a3 favoritesReader:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MFUserNotificationCenterObserver;
  v12 = [(MFUserNotificationCenterObserver *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_vipReader, a3);
    objc_storeStrong((id *)&v13->_favoritesReader, a4);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.mail.UserNotificationCenter.Observer", v15);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    observedStoresByAccountID = v13->_observedStoresByAccountID;
    v13->_observedStoresByAccountID = v18;

    activeAccounts = v13->_activeAccounts;
    v13->_activeAccounts = 0;

    v13->_activeAccountsLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)startObserving
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleAccountsChanged:" name:ECMailAccountsDidChangeNotification object:0];
  v4 = [(MFUserNotificationCenterObserver *)self vipReader];
  [v3 addObserver:self selector:"_handleVIPsChanged:" name:EMVIPsDidChangeNotification object:v4];

  [v3 addObserver:self selector:"_handleConversationFlagsChanged:" name:EDConversationFlagsChanged object:0];
  v5 = [(MFUserNotificationCenterObserver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7BB8;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)stopObserving
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ECMailAccountsDidChangeNotification object:0];
  [v3 removeObserver:self name:EMVIPsDidChangeNotification object:0];
  [v3 removeObserver:self name:@"MailApplicationDidChangePreviewLinesNotification" object:0];
  [v3 removeObserver:self name:MailMessageLibraryDidFinishReconciliation object:0];
  [v3 removeObserver:self name:EDConversationFlagsChanged object:0];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A7D50;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startObservingStore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_handleMessagesAdded:" name:MailMessageStoreMessagesAdded object:v6];
    [v5 addObserver:self selector:"_handleMessagesFlagsChanged:" name:MailMessageStoreMessageFlagsChanged object:v6];
    [v5 addObserver:self selector:"_handleMessagesDeleted:" name:MailMessageStoreMessagesCompacted object:v6];

    id v4 = v6;
  }
}

- (void)_stopObservingStore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:MailMessageStoreMessagesAdded object:v6];
    [v5 removeObserver:self name:MailMessageStoreMessageFlagsChanged object:v6];
    [v5 removeObserver:self name:MailMessageStoreMessagesCompacted object:v6];

    id v4 = v6;
  }
}

- (NSArray)activeAccounts
{
  p_activeAccountsLock = &self->_activeAccountsLock;
  os_unfair_lock_lock(&self->_activeAccountsLock);
  activeAccounts = self->_activeAccounts;
  if (!activeAccounts)
  {
    v5 = +[MailAccount activeAccountsWithError:0];
    objc_msgSend(v5, "ef_filter:", &stru_10013DAE0);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeAccounts;
    self->_activeAccounts = v6;

    activeAccounts = self->_activeAccounts;
  }
  v8 = activeAccounts;
  os_unfair_lock_unlock(p_activeAccountsLock);

  return v8;
}

- (BOOL)isObservingMailbox:(id)a3 inAccountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000A8320;
  v30 = sub_1000A8330;
  id v31 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8338;
  block[3] = &unk_10013AE88;
  v25 = &v26;
  block[4] = self;
  id v9 = v7;
  id v24 = v9;
  dispatch_sync(queue, block);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = (id)v27[5];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "mailbox", (void)v19);
        v15 = [v14 uniqueId];
        dispatch_queue_t v16 = [v6 uniqueId];
        unsigned __int8 v17 = [v15 isEqual:v16];

        if (v17)
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  _Block_object_dispose(&v26, 8);
  return (char)v11;
}

- (void)_handleMessagesAdded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A8420;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleMessagesFlagsChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A8574;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleMessagesDeleted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A86F8;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_handleAccountsChanged:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A8830;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleVIPsChanged:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKeyedSubscript:EMVIPsRemovedKey];
  v5 = [(MFUserNotificationCenterObserver *)self delegate];
  if ([v4 count]) {
    [v5 notificationCenterObserver:self removedVIPs:v4];
  }
  else {
    [v5 vipsChangedForNotificationCenterObserver:self];
  }
}

- (void)_handleConversationFlagsChanged:(id)a3
{
  id v4 = [(MFUserNotificationCenterObserver *)self delegate];
  [v4 conversationFlagsDidChangeForNotificationCenterObserver:self];
}

- (void)_handleFoldersChanged:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A8DD0;
  v8[3] = &unk_100139C20;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_handlePushedFoldersChanged:(id)a3
{
}

- (void)_handleFavoriteMailboxesChanged:(id)a3
{
}

- (void)_nts_startObservingAccounts:(id)a3
{
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v22 = +[NSNotificationCenter defaultCenter];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v18;
  id v23 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v31;
    uint64_t v20 = MFMailAccountPushedMailboxUidsDidChange;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v5 = [(MFUserNotificationCenterObserver *)self favoritesReader];
        id v24 = [v4 mailboxesToBeObserved:v5];

        id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v24 count]);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v7 = v24;
        id v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v27;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v27 != v9) {
                objc_enumerationMutation(v7);
              }
              id v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
              uint64_t v12 = [v4 storeForMailboxUid:v11];
              if (v12)
              {
                [(MFUserNotificationCenterObserver *)self _startObservingStore:v12];
                [v6 addObject:v12];
              }
              else
              {
                v13 = MSUserNotificationsLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  v14 = objc_msgSend(v11, "ef_publicDescription");
                  *(_DWORD *)buf = 138543362;
                  v35 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error: got nil store for mailbox uid %{public}@", buf, 0xCu);
                }
              }
            }
            id v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
          }
          while (v8);
        }

        [v22 addObserver:self selector:"_handlePushedFoldersChanged:" name:v20 object:v4];
        [v22 addObserver:self selector:"_handleFavoriteMailboxesChanged:" name:@"MailApplicationAccountFavoritesDidChange" object:v4];
        v15 = [v4 uniqueID];
        [(NSMutableDictionary *)self->_observedStoresByAccountID setObject:v6 forKeyedSubscript:v15];
      }
      id v23 = [obj countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v23);
  }

  dispatch_queue_t v16 = MSUserNotificationsLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v17 = [(NSMutableDictionary *)self->_observedStoresByAccountID allKeys];
    *(_DWORD *)buf = 138543362;
    v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Observer: Started observing stores for accounts %{public}@", buf, 0xCu);
  }
}

- (void)_nts_stopObservingAccountWithIDs:(id)a3
{
  id v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v21 = +[NSNotificationCenter defaultCenter];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v17;
  id v4 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v4)
  {
    uint64_t v20 = *(void *)v27;
    uint64_t v19 = MFMailAccountPushedMailboxUidsDidChange;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_observedStoresByAccountID, "objectForKeyedSubscript:", v6, v17);
        if (v7)
        {
          id v8 = +[MailAccount accountWithUniqueId:v6];
          [v21 removeObserver:self name:v19 object:v8];
          [v21 removeObserver:self name:@"MailApplicationAccountFavoritesDidChange" object:v8];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v9 = v7;
          id v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v23;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v23 != v11) {
                  objc_enumerationMutation(v9);
                }
                [(MFUserNotificationCenterObserver *)self _stopObservingStore:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)];
              }
              id v10 = [v9 countByEnumeratingWithState:&v22 objects:v32 count:16];
            }
            while (v10);
          }

          [(NSMutableDictionary *)self->_observedStoresByAccountID setObject:0 forKeyedSubscript:v6];
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v4);
  }

  v13 = MSUserNotificationsLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = obj;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Observer: Stopped observing stores for accounts %{public}@", buf, 0xCu);
  }

  v14 = MSUserNotificationsLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(NSMutableDictionary *)self->_observedStoresByAccountID allKeys];
    *(_DWORD *)buf = 138543362;
    id v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Observer: Currently observed accounts %{public}@", buf, 0xCu);
  }
  dispatch_queue_t v16 = [(MFUserNotificationCenterObserver *)self delegate];
  [v16 notificationCenterObserver:self didStopListeningForChangesForAccountIDs:obj];
}

- (BOOL)_nts_updateObservationWithAccounts:(id)a3
{
  id v21 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v21;
  id v25 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v25)
  {
    char v22 = 0;
    uint64_t v24 = *(void *)v39;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v26 = [v4 uniqueID];
        long long v27 = -[NSMutableDictionary objectForKeyedSubscript:](self->_observedStoresByAccountID, "objectForKeyedSubscript:");
        id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:v27];
        uint64_t v6 = [(MFUserNotificationCenterObserver *)self favoritesReader];
        long long v29 = [v4 mailboxesToBeObserved:v6];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v7 = v27;
        char v8 = 0;
        id v9 = [v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v35;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v35 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
              v13 = [v12 mailbox];
              if (!v13 || ([v29 containsObject:v13] & 1) == 0)
              {
                [v5 removeObject:v12];
                [(MFUserNotificationCenterObserver *)self _stopObservingStore:v12];
                char v8 = 1;
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v9);
        }

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v14 = v29;
        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v31;
          do
          {
            for (k = 0; k != v15; k = (char *)k + 1)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v14);
              }
              id v18 = [v4 storeForMailboxUid:*(void *)(*((void *)&v30 + 1) + 8 * (void)k)];
              if (v18 && ([v7 containsObject:v18] & 1) == 0)
              {
                [v5 addObject:v18];
                [(MFUserNotificationCenterObserver *)self _startObservingStore:v18];
                char v8 = 1;
              }
            }
            id v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
          }
          while (v15);
        }

        if (v8)
        {
          if ([v5 count]) {
            id v19 = v5;
          }
          else {
            id v19 = 0;
          }
          [(NSMutableDictionary *)self->_observedStoresByAccountID setObject:v19 forKeyedSubscript:v26];
          char v22 = 1;
        }
      }
      id v25 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v25);
  }
  else
  {
    char v22 = 0;
  }

  return v22 & 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (EMVIPReader)vipReader
{
  return self->_vipReader;
}

- (MFFavoritesReader)favoritesReader
{
  return self->_favoritesReader;
}

- (NSMutableSet)observedAccountIDs
{
  return self->_observedAccountIDs;
}

- (void)setObservedAccountIDs:(id)a3
{
}

- (NSMutableDictionary)observedStoresByAccountID
{
  return self->_observedStoresByAccountID;
}

- (void)setObservedStoresByAccountID:(id)a3
{
}

- (MFUserNotificationCenterObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFUserNotificationCenterObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observedStoresByAccountID, 0);
  objc_storeStrong((id *)&self->_observedAccountIDs, 0);
  objc_storeStrong((id *)&self->_favoritesReader, 0);
  objc_storeStrong((id *)&self->_vipReader, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_activeAccounts, 0);
}

@end