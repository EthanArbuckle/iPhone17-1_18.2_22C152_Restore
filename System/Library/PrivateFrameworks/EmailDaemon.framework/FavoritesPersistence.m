@interface FavoritesPersistence
- (BOOL)hasFavoriteMailboxes;
- (BOOL)includeFavoriteMailboxesDuringFetch;
- (BOOL)shouldHideInbox;
- (BOOL)shouldHideNotesForAccount:(id)a3;
- (BOOL)showingOutbox;
- (EDConversationSubscriptionProvider)conversationSubscriptionProvider;
- (EDMailboxPersistence)mailboxPersistence;
- (FavoriteItem)lastSelectedItem;
- (FavoritesCollection)mailboxesCollection;
- (FavoritesPersistence)initWithConversationSubscriptionProvider:(id)a3 accountsProvider:(id)a4 mailboxPersistence:(id)a5 daemonInterface:(id)a6 analyticsCollector:(id)a7;
- (NSArray)mailboxCollections;
- (NSString)storagePath;
- (id)coreAnalyticsPeriodicEvent;
- (id)dictionaryRepresentation;
- (id)favoriteMailboxesForAccount:(id)a3;
- (id)indexPathForItem:(id)a3;
- (id)mailboxesForAutoFetch;
- (id)orderedFavoriteMailboxesForAccount:(id)a3 includeUnifiedMailboxes:(BOOL)a4;
- (void)_accountsDidChange:(id)a3;
- (void)_focusDidChange:(id)a3;
- (void)_keyValueStoreChangedExternally:(id)a3;
- (void)_loadMailboxesAfterMailboxListingChanged;
- (void)_mailboxListingChanged:(id)a3;
- (void)_mailboxNameChanged:(id)a3;
- (void)dealloc;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)setLastSelectedItem:(id)a3;
- (void)setMailboxPersistence:(id)a3;
- (void)setVisibility:(BOOL)a3 forSourceType:(unint64_t)a4;
- (void)updateCollections:(id)a3 changeType:(unint64_t)a4 withReason:(id)a5 source:(id)a6;
- (void)updateCollections:(id)a3 forItemChangeAddedItems:(id)a4 removedItems:(id)a5 withReason:(id)a6 source:(id)a7;
- (void)updateCollections:(id)a3 forOrderChange:(unint64_t)a4 withReason:(id)a5 source:(id)a6;
- (void)userNotificationCenterSettingsDidChange:(id)a3;
@end

@implementation FavoritesPersistence

- (FavoritesPersistence)initWithConversationSubscriptionProvider:(id)a3 accountsProvider:(id)a4 mailboxPersistence:(id)a5 daemonInterface:(id)a6 analyticsCollector:(id)a7
{
  id v49 = a3;
  id v50 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v60.receiver = self;
  v60.super_class = (Class)FavoritesPersistence;
  v16 = [(FavoritesPersistence *)&v60 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_accountsProvider, a4);
    objc_storeStrong((id *)&v17->_conversationSubscriptionProvider, a3);
    v18 = (NSRecursiveLock *)[objc_alloc((Class)MFRecursiveLock) initWithName:@"FavoritesManagerLock" andDelegate:0];
    lock = v17->_lock;
    v17->_lock = v18;

    v20 = MFMailDirectory();
    uint64_t v21 = [v20 stringByAppendingPathComponent:@"MailboxCollections.plist"];
    storagePath = v17->_storagePath;
    v17->_storagePath = (NSString *)v21;

    objc_storeStrong((id *)&v17->_mailboxPersistence, a5);
    objc_storeStrong((id *)&v17->_daemonInterface, a6);
    uint64_t v23 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.FavoritesPersistence.writeCollectionData" qualityOfService:17];
    writeCollectionScheduler = v17->_writeCollectionScheduler;
    v17->_writeCollectionScheduler = (EFScheduler *)v23;

    uint64_t v25 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.FavoritesPersistence.mergeExternalChanges"];
    mergeExternalChangesScheduler = v17->_mergeExternalChangesScheduler;
    v17->_mergeExternalChangesScheduler = (EFScheduler *)v25;

    sub_100020E08((uint64_t)v17);
    v27 = +[NSNotificationCenter defaultCenter];
    v28 = MFUserAgent();
    unsigned int v29 = [v28 isMaild];

    if (v29)
    {
      v30 = +[EFObservable observableOnNotifyTokenWithName:@"FavoritePersistenceShouldReload"];
      v31 = +[EFScheduler mainThreadScheduler];
      v32 = [v30 debounceWithTimeInterval:v31 scheduler:0.1];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1000216E0;
      v57[3] = &unk_10013A778;
      v33 = v17;
      v58 = v33;
      id v34 = v27;
      id v59 = v34;
      uint64_t v35 = [v32 subscribeWithResultBlock:v57];
      favoritesPersistenceUpdateToken = v33->_favoritesPersistenceUpdateToken;
      v33->_favoritesPersistenceUpdateToken = (EFCancelable *)v35;

      [v34 postNotificationName:@"MailApplicationFavoritesDidChange" object:v33];
      id v37 = [v15 registerForLogEventsWithPeriodicDataProvider:v33];
    }
    [v27 addObserver:v17 selector:"_mailboxListingChanged:" name:AccountMailboxListingDidChange object:0];
    [v27 addObserver:v17 selector:"_mailboxNameChanged:" name:MFMailboxUidWasRenamedNotification object:0];
    [v27 addObserver:v17 selector:"_accountsDidChange:" name:ECMailAccountsDidChangeNotification object:0];
    [v27 addObserver:v17 selector:"_focusDidChange:" name:@"MFFocusDidChangeNotification" object:0];
    v38 = MFUserAgent();
    unsigned __int8 v39 = [v38 isMaild];

    if (v39)
    {
      [v27 addObserver:v17 selector:"_keyValueStoreChangedExternally:" name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification object:0];
    }
    else
    {
      uint64_t v40 = +[NSUbiquitousKeyValueStore additionalStoreWithIdentifier:@"com.apple.mail.favorites"];
      kvStore = v17->_kvStore;
      v17->_kvStore = (NSUbiquitousKeyValueStore *)v40;

      if (v17->_kvStore)
      {
        objc_msgSend(v27, "addObserver:selector:name:object:", v17, "_keyValueStoreChangedExternally:", NSUbiquitousKeyValueStoreDidChangeExternallyNotification);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002176C;
        block[3] = &unk_100139C20;
        v55 = v27;
        v56 = v17;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        v42 = v55;
      }
      else
      {
        v42 = sub_1000205F8();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = @"com.apple.mail.favorites";
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "failed to create kv store for %@", buf, 0xCu);
        }
      }
    }
    v43 = +[NSUserDefaults em_userDefaults];
    uint64_t v44 = EMUserDefaultDisableFollowUp;
    v17->_hideFollowUp = [v43 BOOLForKey:EMUserDefaultDisableFollowUp];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v17);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100021830;
    v51[3] = &unk_10013A7A0;
    objc_copyWeak(&v53, (id *)buf);
    id v45 = v43;
    id v52 = v45;
    uint64_t v46 = objc_msgSend(v45, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v44, 1, 1, v51);
    userDefaultsObserver = v17->_userDefaultsObserver;
    v17->_userDefaultsObserver = (EFCancelable *)v46;

    objc_destroyWeak(&v53);
    objc_destroyWeak((id *)buf);
  }
  return v17;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FavoritesPersistence;
  [(FavoritesPersistence *)&v4 dealloc];
}

- (BOOL)showingOutbox
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL showingOutbox = self->_showingOutbox;
  [(NSRecursiveLock *)self->_lock unlock];
  return showingOutbox;
}

- (void)setLastSelectedItem:(id)a3
{
  v6 = (FavoriteItem *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_lastSelectedItem != v6)
  {
    objc_storeStrong((id *)&self->_lastSelectedItem, a3);
    v5 = +[NSString stringWithFormat:@"setLastSelectedItem: %@", v6];
    sub_1000232A8((uint64_t)self, v5);
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (FavoritesCollection)mailboxesCollection
{
  [(NSRecursiveLock *)self->_lock lock];
  if ([(NSMutableArray *)self->_mailboxCollections count])
  {
    v3 = [(NSMutableArray *)self->_mailboxCollections objectAtIndex:0];
  }
  else
  {
    v3 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return (FavoritesCollection *)v3;
}

- (id)mailboxesForAutoFetch
{
  id v3 = objc_alloc((Class)NSMutableSet);
  objc_super v4 = sub_100023920((uint64_t)self, 7);
  id v5 = [v3 initWithArray:v4];

  [(NSRecursiveLock *)self->_lock lock];
  v6 = [(FavoritesPersistence *)self mailboxesCollection];
  v7 = [v6 visibleItems];

  BOOL includeFavoriteMailboxesDuringFetch = self->_includeFavoriteMailboxesDuringFetch;
  [(NSRecursiveLock *)self->_lock unlock];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (void)v19) == (id)4)
        {
          id v14 = v13;
          id v15 = sub_100023920((uint64_t)self, (uint64_t)[v14 mailboxType]);
          [v5 addObjectsFromArray:v15];

LABEL_12:
          continue;
        }
        id v16 = [v13 type];
        if (includeFavoriteMailboxesDuringFetch && v16 == (id)2)
        {
          id v14 = [v13 representingMailbox];
          if (v14) {
            [v5 addObject:v14];
          }
          goto LABEL_12;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v17 = [v5 allObjects];

  return v17;
}

- (id)indexPathForItem:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002352C((uint64_t)self);
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= (unint64_t)[v5 count])
    {
      id v10 = 0;
      goto LABEL_7;
    }
    v7 = [v5 objectAtIndex:i];
    v8 = [v7 visibleItems];
    id v9 = [v8 indexOfObject:v4];

    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
  }
  id v10 = +[NSIndexPath indexPathForRow:v9 inSection:i];

LABEL_7:

  return v10;
}

- (void)updateCollections:(id)a3 changeType:(unint64_t)a4 withReason:(id)a5 source:(id)a6
{
  id v15 = a3;
  id v10 = a5;
  id v11 = a6;
  sub_100023CE4((uint64_t)self, v15, v10);
  [(NSRecursiveLock *)self->_lock lock];
  v12 = (NSMutableArray *)[v15 mutableCopy];
  mailboxCollections = self->_mailboxCollections;
  self->_mailboxCollections = v12;

  visibleMailboxCollections = self->_visibleMailboxCollections;
  self->_visibleMailboxCollections = 0;

  [(NSRecursiveLock *)self->_lock unlock];
  if (a4 != 2) {
    sub_10002464C((uint64_t)self, v11);
  }
}

- (void)updateCollections:(id)a3 forItemChangeAddedItems:(id)a4 removedItems:(id)a5 withReason:(id)a6 source:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [(FavoritesPersistence *)self updateCollections:v16 changeType:0 withReason:v14 source:v15];
  [(NSRecursiveLock *)self->_lock lock];
  sub_1000247D8((id *)&self->super.isa, v12, v13);
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)updateCollections:(id)a3 forOrderChange:(unint64_t)a4 withReason:(id)a5 source:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  [(FavoritesPersistence *)self updateCollections:v13 changeType:1 withReason:v10 source:v11];
  +[NSNotificationCenter defaultCenter];
  if (a4) {
    id v12 = {;
  }
    [v12 postNotificationName:@"MailApplicationFavoritesOrderDidChange" object:0];
  }
  else {
    id v12 = {;
  }
    [v12 postNotificationName:@"MailApplicationAccountsOrderDidChange" object:0];
  }
}

- (void)_keyValueStoreChangedExternally:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey];
  id v6 = [v5 integerValue];

  if (v6 == (id)2)
  {
    v7 = sub_1000205F8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C0898(v7);
    }
  }
  else
  {
    v8 = [v4 objectForKey:NSUbiquitousKeyValueStoreChangedKeysKey];
    sub_100024DC0(self, v6, v8);
  }
}

- (BOOL)shouldHideInbox
{
  return self->_showingSingleAccount;
}

- (BOOL)shouldHideNotesForAccount:(id)a3
{
  return [a3 isSyncingNotes];
}

- (void)_loadMailboxesAfterMailboxListingChanged
{
}

- (void)_accountsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:ECMailAccountsDidChangeNotificationKeyPreviousAccountIdentifiers];

  v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:ECMailAccountsDidChangeNotificationKeyAccountIdentifiers];

  char v16 = [v6 isEqualToSet:v8] ^ 1;
  id v9 = v6;
  id v13 = v9;
  id v10 = v8;
  id v14 = v10;
  id v15 = self;
  id v11 = +[EFScheduler mainThreadScheduler];
  [v11 performBlock:&v12];
}

- (void)_focusDidChange:(id)a3
{
  id v6 = self;
  id v3 = a3;
  id v7 = v3;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:&v5];
}

- (void)_mailboxListingChanged:(id)a3
{
  id v5 = a3;
  id v6 = sub_1000205F8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100026F58;
  v9[3] = &unk_100139C20;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)_mailboxNameChanged:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = [v4 object];
  id v6 = [(FavoritesPersistence *)self mailboxesCollection];
  [v6 itemsOfType:2];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      uint64_t v12 = [v11 representingMailbox];
      if ([v12 isEqual:v5]) {
        break;
      }

      if (v8 == (id)++v10)
      {
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v8 = v11;

    if (!v8) {
      goto LABEL_14;
    }
    id v13 = [v8 syncKey];
    if ([v8 shouldSync])
    {
      [v8 wasChangedExternally];
      id v14 = sub_100024C0C(self, v8);
      [(NSUbiquitousKeyValueStore *)self->_kvStore setObject:v14 forKey:v13];
      [(NSUbiquitousKeyValueStore *)self->_kvStore synchronize];
      id v15 = +[NSString stringWithFormat:@"_mailboxNameChanged: changedItem: %@", v8];
      sub_1000232A8((uint64_t)self, v15);
    }
  }
  else
  {
LABEL_9:
    id v13 = v7;
  }

LABEL_14:
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setVisibility:(BOOL)a3 forSourceType:(unint64_t)a4
{
  BOOL v5 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v14 = [(FavoritesPersistence *)self mailboxesCollection];
  id v7 = [v14 items];
  id v8 = +[FavoriteItem itemForSharedMailboxWithType:a4 selected:0];
  id v9 = [v7 indexOfObject:v8];

  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int v10 = 0;
  }
  else
  {
    id v11 = [v7 objectAtIndex:v9];
    uint64_t v12 = v11;
    if (!v11 || [v11 isSelected] == v5)
    {
      int v10 = 0;
    }
    else
    {
      [v12 setSelected:v5];
      id v13 = [(FavoritesPersistence *)self mailboxCollections];
      sub_100023CE4((uint64_t)self, v13, @"_sharedMailboxControllerBadgeCountDidChange");

      [v14 invalidateVisibleItems];
      int v10 = 1;
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
  if (v10) {
    sub_10002464C((uint64_t)self, 0);
  }
}

- (void)userNotificationCenterSettingsDidChange:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForKeyedSubscript:MSUserNotificationCenterTopicFavoriteMailboxes];
  BOOL v5 = [v4 alertSetting] == (id)2
    || [v4 notificationCenterSetting] == (id)2
    || [v4 lockScreenSetting] == (id)2;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL includeFavoriteMailboxesDuringFetch = v5;
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  BOOL v7 = a5 > 0;
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    int64_t v12 = a5;
    __int16 v13 = 2048;
    BOOL v14 = a5 > 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Favorites Outbox countDidChange to: %lld shouldShow: %lld", (uint8_t *)&v11, 0x16u);
  }

  [(NSRecursiveLock *)self->_lock lock];
  if (self->_showingOutbox == v7)
  {
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    self->_BOOL showingOutbox = v7;
    [(NSRecursiveLock *)self->_lock unlock];
    id v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Favorites Posting notifications for outbox visibility change", (uint8_t *)&v11, 2u);
    }

    visibleMailboxCollections = self->_visibleMailboxCollections;
    self->_visibleMailboxCollections = 0;

    sub_10002464C((uint64_t)self, 0);
  }
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  [(NSRecursiveLock *)self->_lock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = self->_mailboxCollections;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "transient", (void)v14) & 1) == 0)
        {
          int v10 = [v9 dictionaryRepresentation];
          [v4 addObject:v10];
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(NSRecursiveLock *)self->_lock unlock];
  [v3 setObject:v4 forKeyedSubscript:@"Collections"];
  lastSelectedItem = self->_lastSelectedItem;
  if (lastSelectedItem)
  {
    int64_t v12 = [(FavoriteItem *)lastSelectedItem dictionaryRepresentation];
    [v3 setObject:v12 forKeyedSubscript:@"LastSelectedItem"];
  }

  return v3;
}

- (BOOL)hasFavoriteMailboxes
{
  v2 = [(FavoritesPersistence *)self mailboxesCollection];
  id v3 = [v2 visibleItems];
  unsigned __int8 v4 = objc_msgSend(v3, "ef_any:", &stru_10013A9F0);

  return v4;
}

- (id)favoriteMailboxesForAccount:(id)a3
{
  id v3 = [(FavoritesPersistence *)self orderedFavoriteMailboxesForAccount:a3 includeUnifiedMailboxes:0];
  unsigned __int8 v4 = [v3 set];

  return v4;
}

- (id)orderedFavoriteMailboxesForAccount:(id)a3 includeUnifiedMailboxes:(BOOL)a4
{
  id v6 = a3;
  id v21 = objc_alloc_init((Class)NSMutableOrderedSet);
  if (a4)
  {
    uint64_t v7 = [(FavoritesPersistence *)self mailboxesCollection];
    id v8 = [v7 visibleItems];
  }
  else
  {
    id v8 = sub_100023788((uint64_t)self, 2);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v25;
    do
    {
      for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", v21) != (id)2)
        {
          if ([v13 type] != (id)4) {
            continue;
          }
          long long v18 = [v13 representingMailboxes];
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1000284E4;
          v22[3] = &unk_10013AA18;
          id v23 = v6;
          long long v19 = objc_msgSend(v18, "ef_filter:", v22);

          [v21 addObjectsFromArray:v19];
          long long v17 = v23;
          goto LABEL_15;
        }
        id v14 = v13;
        id v15 = [v14 account];
        BOOL v16 = v15 == v6;

        if (v16)
        {
          long long v17 = [v14 representingMailbox];
          if (v17) {
            [v21 addObject:v17];
          }
LABEL_15:
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v21;
}

- (id)coreAnalyticsPeriodicEvent
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned __int8 v4 = [(FavoritesPersistence *)self mailboxesCollection];
  BOOL v5 = [v4 selectedItems];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) analyticsKey];
        if (v9)
        {
          id v10 = [v3 objectForKeyedSubscript:v9];
          uint64_t v11 = (uint64_t)[v10 integerValue];

          if (v11 >= 1) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = v11;
          }
          __int16 v13 = +[NSNumber numberWithInteger:v12 + 1];
          [v3 setObject:v13 forKeyedSubscript:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v14 = [objc_alloc((Class)EMCoreAnalyticsEvent) initWithEventName:@"com.apple.mail.mailboxes.favorites.configuration" collectionData:v3];

  return v14;
}

- (NSArray)mailboxCollections
{
  return &self->_mailboxCollections->super;
}

- (BOOL)includeFavoriteMailboxesDuringFetch
{
  return self->_includeFavoriteMailboxesDuringFetch;
}

- (FavoriteItem)lastSelectedItem
{
  return self->_lastSelectedItem;
}

- (NSString)storagePath
{
  return self->_storagePath;
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (void)setMailboxPersistence:(id)a3
{
}

- (EDConversationSubscriptionProvider)conversationSubscriptionProvider
{
  return self->_conversationSubscriptionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_mergeExternalChangesScheduler, 0);
  objc_storeStrong((id *)&self->_favoritesPersistenceUpdateToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_writeCollectionScheduler, 0);
  objc_storeStrong((id *)&self->_outboxFuture, 0);
  objc_storeStrong((id *)&self->_outboxCountObserver, 0);
  objc_storeStrong((id *)&self->_outbox, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_visibleMailboxCollections, 0);
  objc_storeStrong((id *)&self->_conversationSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_storagePath, 0);
  objc_storeStrong((id *)&self->_lastSelectedItem, 0);

  objc_storeStrong((id *)&self->_mailboxCollections, 0);
}

@end