@interface AppBadgeController
+ (OS_os_log)log;
- (AppBadgeController)initWithMessagePersistence:(id)a3 hookRegistry:(id)a4 mailboxProvider:(id)a5 focusController:(id)a6 bucketBarController:(id)a7;
- (EDMessageCountQueryHandler)queryHandler;
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceHookRegistry)hookRegistry;
- (EFCancelable)focusObservationToken;
- (EFScheduler)scheduler;
- (EMFocus)currentFocus;
- (EMFocusController)focusController;
- (EMObjectID)mailboxObserverID;
- (EMQuery)query;
- (MFMailboxProvider)mailboxProvider;
- (MSBucketBarConfigurationController)bucketBarController;
- (NSDictionary)notificationSettingsByTopic;
- (UNUserNotificationCenter)notificationCenter;
- (id)_enabledAndExcludedMailboxesExcludingAccountIDs:(id)a3;
- (id)_excludedAccountIdentifiersByCurrentFocus;
- (int64_t)oldBadgeCount;
- (void)_createCountQueryPredicateFromNotificationTopics;
- (void)_nts_getAccountsExcludedFromUnreadCount:(id *)a3 includeUnreadVIPs:(BOOL *)a4 includeUnreadNotifiedThreads:(BOOL *)a5 includeUnreadPrimaries:(BOOL *)a6;
- (void)_startObservingCountPredicate:(id)a3 serverCountMailboxScope:(id)a4;
- (void)bucketBarConfigurationController:(id)a3 isHidden:(BOOL)a4 forMailboxes:(id)a5;
- (void)bucketBarConfigurationControllerRequiresReload:(id)a3;
- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4;
- (void)currentFocusChanged:(id)a3;
- (void)dealloc;
- (void)mailboxListChanged:(id)a3;
- (void)setBadgeCount:(int64_t)a3;
- (void)setBucketBarController:(id)a3;
- (void)setCurrentFocus:(id)a3;
- (void)setFocusController:(id)a3;
- (void)setFocusObservationToken:(id)a3;
- (void)setHookRegistry:(id)a3;
- (void)setMailboxObserverID:(id)a3;
- (void)setMailboxProvider:(id)a3;
- (void)setMessagePersistence:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setNotificationSettingsByTopic:(id)a3;
- (void)setOldBadgeCount:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setQueryHandler:(id)a3;
- (void)setScheduler:(id)a3;
- (void)userNotificationCenterSettingsDidChange:(id)a3;
@end

@implementation AppBadgeController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000061B0;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B6E0 != -1) {
    dispatch_once(&qword_10016B6E0, block);
  }
  v2 = (void *)qword_10016B6D8;

  return (OS_os_log *)v2;
}

- (AppBadgeController)initWithMessagePersistence:(id)a3 hookRegistry:(id)a4 mailboxProvider:(id)a5 focusController:(id)a6 bucketBarController:(id)a7
{
  id v13 = a3;
  id v35 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v36.receiver = self;
  v36.super_class = (Class)AppBadgeController;
  v17 = [(AppBadgeController *)&v36 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_messagePersistence, a3);
    objc_storeStrong((id *)&v18->_hookRegistry, a4);
    objc_storeStrong((id *)&v18->_mailboxProvider, a5);
    v18->_oldBadgeCount = 0x7FFFFFFFFFFFFFFFLL;
    id v19 = objc_alloc((Class)UNUserNotificationCenter);
    v20 = (UNUserNotificationCenter *)[v19 initWithBundleIdentifier:kMFMobileMailBundleIdentifier];
    notificationCenter = v18->_notificationCenter;
    v18->_notificationCenter = v20;

    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    uint64_t v24 = +[EFScheduler serialDispatchQueueSchedulerWithName:v23 qualityOfService:25];
    scheduler = v18->_scheduler;
    v18->_scheduler = (EFScheduler *)v24;

    id v26 = objc_alloc((Class)EMObjectID);
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = (EMObjectID *)[v26 initWithRepresentedObjectID:v28];
    mailboxObserverID = v18->_mailboxObserverID;
    v18->_mailboxObserverID = v29;

    objc_storeStrong((id *)&v18->_bucketBarController, a7);
    [v16 addConfigurationObserver:v18];
    v31 = [v13 mailboxPersistence];
    [v31 addChangeObserver:v18 withIdentifier:v18->_mailboxObserverID];

    uint64_t v32 = [v15 addObserver:v18 currentFocus:&v18->_currentFocus];
    focusObservationToken = v18->_focusObservationToken;
    v18->_focusObservationToken = (EFCancelable *)v32;
  }
  return v18;
}

- (void)dealloc
{
  v3 = [(EDMessagePersistence *)self->_messagePersistence mailboxPersistence];
  [v3 removeChangeObserverWithIdentifier:self->_mailboxObserverID];

  [(MSBucketBarConfigurationController *)self->_bucketBarController removeConfigurationObserver:self];
  [(EDMessageCountQueryHandler *)self->_queryHandler cancel];
  v4.receiver = self;
  v4.super_class = (Class)AppBadgeController;
  [(AppBadgeController *)&v4 dealloc];
}

- (void)_nts_getAccountsExcludedFromUnreadCount:(id *)a3 includeUnreadVIPs:(BOOL *)a4 includeUnreadNotifiedThreads:(BOOL *)a5 includeUnreadPrimaries:(BOOL *)a6
{
  v11 = +[NSMutableSet set];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 1;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v12 = [(AppBadgeController *)self notificationSettingsByTopic];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006740;
  v15[3] = &unk_100139B58;
  v17 = &v28;
  v18 = &v24;
  id v19 = &v20;
  id v13 = v11;
  id v16 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v15];

  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = *((unsigned char *)v29 + 24);
  }
  if (a5) {
    *a5 = *((unsigned char *)v25 + 24);
  }
  if (a6)
  {
    if (EMBlackPearlIsFeatureEnabled()) {
      BOOL v14 = *((unsigned char *)v21 + 24) != 0;
    }
    else {
      BOOL v14 = 0;
    }
    *a6 = v14;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

- (id)_enabledAndExcludedMailboxesExcludingAccountIDs:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSMutableSet set];
  v5 = +[NSMutableSet set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = +[MailAccount activeAccounts];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 primaryMailboxUid];
        if (v11)
        {
          v12 = [v10 uniqueID];
          unsigned int v13 = [v3 containsObject:v12];

          if (v13) {
            BOOL v14 = v5;
          }
          else {
            BOOL v14 = v4;
          }
          [v14 addObject:v11];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = +[EFPair pairWithFirst:v4 second:v5];

  return v15;
}

- (void)setBadgeCount:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006ADC;
  v3[3] = &unk_100139BA8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_createCountQueryPredicateFromNotificationTopics
{
  __int16 v60 = 0;
  unsigned __int8 v59 = 0;
  id v58 = 0;
  [(AppBadgeController *)self _nts_getAccountsExcludedFromUnreadCount:&v58 includeUnreadVIPs:(char *)&v60 + 1 includeUnreadNotifiedThreads:&v60 includeUnreadPrimaries:&v59];
  id v3 = v58;
  objc_super v4 = [(AppBadgeController *)self _excludedAccountIdentifiersByCurrentFocus];
  v49 = [v3 setByAddingObjectsFromSet:v4];

  v52 = [(AppBadgeController *)self _enabledAndExcludedMailboxesExcludingAccountIDs:v49];
  v51 = [(AppBadgeController *)self mailboxProvider];
  v5 = [v52 first];
  v6 = [v5 allObjects];
  id v7 = [v51 mailboxesFromLegacyMailboxes:v6];

  uint64_t v8 = [v52 second];
  v9 = [v8 allObjects];
  uint64_t v46 = [v51 mailboxesFromLegacyMailboxes:v9];

  id v48 = objc_alloc_init((Class)NSMutableArray);
  id v50 = objc_alloc_init((Class)NSMutableArray);
  if (EMBlackPearlIsFeatureEnabled())
  {
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100007740;
    v55[3] = &unk_100139BD0;
    v55[4] = self;
    id v56 = v48;
    id v57 = v50;
    [v7 enumerateObjectsUsingBlock:v55];
  }
  v10 = +[AppBadgeController log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = HIBYTE(v60);
    int v12 = v60;
    int v13 = v59;
    BOOL v14 = objc_msgSend(v48, "ef_mapSelector:", "ef_publicDescription");
    id v15 = objc_msgSend(v50, "ef_mapSelector:", "ef_publicDescription");
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v68 = v11;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = v12;
    LOWORD(v69) = 1024;
    *(_DWORD *)((char *)&v69 + 2) = v13;
    HIWORD(v69) = 2114;
    v70 = v49;
    __int16 v71 = 2114;
    v72 = v14;
    __int16 v73 = 2114;
    v74 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Generating new query include VIPs:%{BOOL}d, include Notified Threads: %{BOOL}d, include Primary: %{BOOL}d, excluding accounts: %{public}@, enabled mailboxes with primary: %{public}@\n without primary: %{public}@", buf, 0x32u);
  }
  if ([v47 count])
  {
    id v16 = objc_alloc_init((Class)NSMutableArray);
    if (HIBYTE(v60))
    {
      long long v17 = +[EMMessageListItemPredicates predicateForIsVIP:1];
      [v16 addObject:v17];
    }
    int v18 = v60;
    if ((_BYTE)v60)
    {
      long long v19 = +[EMMessageListItemPredicates predicateForNotifyMessages];
      [v16 addObject:v19];

      int v18 = v60;
    }
    if (HIBYTE(v60) || v18 || v59)
    {
      v21 = [(AppBadgeController *)self currentFocus];
      uint64_t v22 = v21;
      if (v21)
      {
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10000784C;
        v53[3] = &unk_100139BF8;
        id v54 = v21;
        objc_msgSend(v47, "ef_filter:", v53);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v23 = v47;
      }
      if ([v16 count] == (id)1) {
        [v16 firstObject];
      }
      else {
      uint64_t v24 = +[NSCompoundPredicate orPredicateWithSubpredicates:v16];
      }
      v25 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v23];
      v66[0] = v24;
      v66[1] = v25;
      uint64_t v26 = +[NSArray arrayWithObjects:v66 count:2];
      long long v20 = +[NSCompoundPredicate andPredicateWithSubpredicates:v26];
    }
    else
    {
      long long v20 = 0;
    }
  }
  else
  {
    long long v20 = 0;
  }
  char v27 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v7];
  if (v59 && EMBlackPearlIsFeatureEnabled() && [v48 count])
  {
    if ([v50 count])
    {
      uint64_t v28 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v48];
      v65[0] = v28;
      v29 = +[EMMessageListItemPredicates predicateForPrimaryMessages];
      v65[1] = v29;
      uint64_t v30 = +[NSArray arrayWithObjects:v65 count:2];
      char v31 = +[NSPredicate ef_andCompoundPredicateWithSubpredicates:v30];

      uint64_t v32 = +[EMMessageListItemPredicates predicateForMessagesInMailboxes:v50];
      v64[0] = v31;
      v64[1] = v32;
      v33 = +[NSArray arrayWithObjects:v64 count:2];
      uint64_t v34 = +[NSCompoundPredicate orPredicateWithSubpredicates:v33];

      char v27 = (void *)v34;
    }
    else
    {
      v63[0] = v27;
      char v31 = +[EMMessageListItemPredicates predicateForPrimaryMessages];
      v63[1] = v31;
      uint64_t v32 = +[NSArray arrayWithObjects:v63 count:2];
      +[NSCompoundPredicate andPredicateWithSubpredicates:v32];
      char v27 = v33 = v27;
    }
  }
  if (v20)
  {
    v62[0] = v27;
    v62[1] = v20;
    id v35 = +[NSArray arrayWithObjects:v62 count:2];
    uint64_t v36 = +[NSCompoundPredicate orPredicateWithSubpredicates:v35];

    char v27 = (void *)v36;
  }
  v61[0] = v27;
  v37 = +[EMMessageListItemPredicates predicateForUnreadMessages];
  v61[1] = v37;
  v38 = +[NSArray arrayWithObjects:v61 count:2];
  v39 = +[NSCompoundPredicate andPredicateWithSubpredicates:v38];

  if ([v7 count])
  {
    id v40 = v7;
    if (EMBlackPearlIsFeatureEnabled())
    {
      id v41 = v50;

      id v40 = v41;
    }
    v42 = objc_msgSend(v40, "ef_mapSelector:", "objectID");
    uint64_t v43 = +[EMMailboxScope mailboxScopeForMailboxObjectIDs:v42 forExclusion:0];

    v44 = (void *)v43;
  }
  else
  {
    v44 = 0;
  }
  v45 = +[AppBadgeController log];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v68 = v39;
    *(_WORD *)&v68[8] = 2112;
    v69 = v44;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Generated app badge predicate %@\nserverCountMailboxScope %@", buf, 0x16u);
  }

  [(AppBadgeController *)self _startObservingCountPredicate:v39 serverCountMailboxScope:v44];
}

- (id)_excludedAccountIdentifiersByCurrentFocus
{
  v2 = [(AppBadgeController *)self currentFocus];
  id v3 = [v2 focusedAccountIdentifiers];

  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSMutableSet);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = +[MailAccount activeAccounts];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) identifier];
          if (v9 && ([v3 containsObject:v9] & 1) == 0) {
            [v4 addObject:v9];
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v4 = +[NSSet set];
  }

  return v4;
}

- (void)_startObservingCountPredicate:(id)a3 serverCountMailboxScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v6 sortDescriptors:&__NSArray0__struct queryOptions:0 label:@"App badge"];
  v9 = [(AppBadgeController *)self query];
  unsigned __int8 v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    long long v11 = [(AppBadgeController *)self queryHandler];
    [v11 cancel];

    long long v12 = +[AppBadgeController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating app badge with predicate %@", (uint8_t *)&v17, 0xCu);
    }

    id v13 = objc_alloc((Class)EDMessageCountQueryHandler);
    long long v14 = [(AppBadgeController *)self messagePersistence];
    id v15 = [(AppBadgeController *)self hookRegistry];
    id v16 = [v13 initWithQuery:v8 serverCountMailboxScope:v7 messagePersistence:v14 hookRegistry:v15 observer:self];
    [(AppBadgeController *)self setQueryHandler:v16];

    [(AppBadgeController *)self setQuery:v8];
  }
}

- (void)userNotificationCenterSettingsDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(AppBadgeController *)self scheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007E24;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)countDidChange:(int64_t)a3 acknowledgementToken:(id)a4
{
  id v6 = a4;
  [v6 invoke];
  [(AppBadgeController *)self setBadgeCount:a3];
}

- (void)mailboxListChanged:(id)a3
{
  id v4 = [(AppBadgeController *)self scheduler];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007FAC;
  v5[3] = &unk_100139C48;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (void)currentFocusChanged:(id)a3
{
  id v4 = a3;
  v5 = [(AppBadgeController *)self scheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008090;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

- (void)bucketBarConfigurationController:(id)a3 isHidden:(BOOL)a4 forMailboxes:(id)a5
{
  id v6 = [(AppBadgeController *)self scheduler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008168;
  v7[3] = &unk_100139C48;
  v7[4] = self;
  [v6 performBlock:v7];
}

- (void)bucketBarConfigurationControllerRequiresReload:(id)a3
{
  id v4 = [(AppBadgeController *)self scheduler];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008208;
  v5[3] = &unk_100139C48;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (void)setMessagePersistence:(id)a3
{
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void)setHookRegistry:(id)a3
{
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (void)setMailboxProvider:(id)a3
{
}

- (EMFocusController)focusController
{
  return self->_focusController;
}

- (void)setFocusController:(id)a3
{
}

- (MSBucketBarConfigurationController)bucketBarController
{
  return self->_bucketBarController;
}

- (void)setBucketBarController:(id)a3
{
}

- (EDMessageCountQueryHandler)queryHandler
{
  return self->_queryHandler;
}

- (void)setQueryHandler:(id)a3
{
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSDictionary)notificationSettingsByTopic
{
  return self->_notificationSettingsByTopic;
}

- (void)setNotificationSettingsByTopic:(id)a3
{
}

- (int64_t)oldBadgeCount
{
  return self->_oldBadgeCount;
}

- (void)setOldBadgeCount:(int64_t)a3
{
  self->_oldBadgeCount = a3;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (EMObjectID)mailboxObserverID
{
  return self->_mailboxObserverID;
}

- (void)setMailboxObserverID:(id)a3
{
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(id)a3
{
}

- (EFCancelable)focusObservationToken
{
  return self->_focusObservationToken;
}

- (void)setFocusObservationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusObservationToken, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_mailboxObserverID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationSettingsByTopic, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryHandler, 0);
  objc_storeStrong((id *)&self->_bucketBarController, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end