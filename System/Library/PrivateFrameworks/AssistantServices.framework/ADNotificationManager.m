@interface ADNotificationManager
+ (id)_createBBObserverWithQueue:(id)a3;
+ (id)sharedManager;
- (ADNotificationManagerDataSource)dataSource;
- (BOOL)_isAppRestrictedAndSiriRelated:(id)a3;
- (BOOL)hasIncomingCallNotification;
- (id)_afbulletinForBBBulletin:(id)a3 forFeed:(unint64_t)a4;
- (id)_displayNameForBulletin:(id)a3;
- (id)_init;
- (id)_siriRelatedRestrictedAppsForApps:(id)a3;
- (void)_bulletinsDidChange;
- (void)_fetchFromDataSourceIfNecessary;
- (void)_fetchInitialState;
- (void)_getNotificationsFromBulletinBoard;
- (void)_getRestrictedAppsFromBulletinBoard;
- (void)_notifyDelegatesDidAddBulletin:(id)a3;
- (void)_notifyDelegatesDidRemoveBulletin:(id)a3;
- (void)_performActionWithIdentifier:(id)a3 forAFBulletin:(id)a4 completion:(id)a5;
- (void)_setUpBBObserver;
- (void)addDelegate:(id)a3;
- (void)fetchActionsForBulletinWithID:(id)a3 completion:(id)a4;
- (void)fetchAllBulletinsWithCompletion:(id)a3;
- (void)fetchBulletinWithID:(id)a3 completion:(id)a4;
- (void)fetchBulletinsAfterBulletinWithID:(id)a3 completion:(id)a4;
- (void)fetchBulletinsOnLockScreenWithCompletion:(id)a3;
- (void)fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:(id)a3;
- (void)fetchSpokenNotificationEnabledAppsWithCompletion:(id)a3;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4;
- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4;
- (void)observer:(id)a3 purgeReferencesToBulletinID:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4;
- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)performActionWithIdentifier:(id)a3 forBulletinWithIdentifier:(id)a4 completion:(id)a5;
- (void)performActionWithIdentifier:(id)a3 forUNNotificationWithIdentifier:(id)a4 completion:(id)a5;
- (void)setDataSource:(id)a3;
@end

@implementation ADNotificationManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_callNotificationObserver, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_spokenNotificationEnabledApps, 0);
  objc_storeStrong((id *)&self->_siriRelatedPreviewRestrictedApps, 0);
  objc_storeStrong((id *)&self->_settingsGroup, 0);
  objc_storeStrong((id *)&self->_bulletinsOnLockScreen, 0);
  objc_storeStrong((id *)&self->_allBulletins, 0);
  objc_storeStrong((id *)&self->_notificationsGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (ADNotificationManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (ADNotificationManagerDataSource *)WeakRetained;
}

- (BOOL)hasIncomingCallNotification
{
  if (+[AFFeatureFlags isHSAnswerCallNotificationEnabled])
  {
    unsigned int v3 = [(ADCallNotificationObserver *)self->_callNotificationObserver hasIncomingCallNotification];
    v4 = +[ADExternalNotificationRequestHandler sharedNotificationRequestHandler];
    v5 = [v4 currentRequest];

    if ([v5 requestType] == (id)1)
    {
      BOOL v6 = [v5 announcementType] == (id)7;
      if (!v3) {
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v6 = 0;
      if (!v3)
      {
LABEL_8:
        BOOL v7 = v3 & !v6;

        return v7;
      }
    }
    v8 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v10 = @"NO";
      int v11 = 136315650;
      v12 = "-[ADNotificationManager hasIncomingCallNotification]";
      __int16 v13 = 2112;
      CFStringRef v14 = @"YES";
      if (v6) {
        CFStringRef v10 = @"YES";
      }
      __int16 v15 = 2112;
      CFStringRef v16 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s isOnPhoneCall: %@, and beingAnnounced: %@ for call notification", (uint8_t *)&v11, 0x20u);
    }
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)_isAppRestrictedAndSiriRelated:(id)a3
{
  id v4 = a3;
  v5 = [v4 sectionID];
  if ([v4 allowsNotifications]
    && [v4 lockScreenSetting] == (id)2
    && [v4 contentPreviewSetting] == (id)1)
  {
    BOOL v6 = 0;
  }
  else
  {
    CFStringRef v10 = v5;
    BOOL v7 = +[NSArray arrayWithObjects:&v10 count:1];
    v8 = [(ADNotificationManager *)self _siriRelatedRestrictedAppsForApps:v7];
    BOOL v6 = [v8 count] != 0;
  }
  return v6;
}

- (void)_getRestrictedAppsFromBulletinBoard
{
  if (self->_observer)
  {
    unsigned int v3 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ADNotificationManager _getRestrictedAppsFromBulletinBoard]";
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&buf, 0xCu);
    }
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = objc_alloc_init((Class)NSMutableArray);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    v25 = sub_100367EBC;
    v26 = sub_100367ECC;
    id v27 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100367ED4;
    v22[3] = &unk_10050E2C8;
    v22[4] = self;
    v22[5] = &buf;
    id v6 = [objc_alloc((Class)AFSafetyBlock) initWithBlock:v22];
    id v7 = objc_alloc((Class)AFWatchdogTimer);
    queue = self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10036800C;
    v20[3] = &unk_10050E138;
    id v9 = v6;
    id v21 = v9;
    id v10 = [v7 initWithTimeoutInterval:queue onQueue:v20 timeoutHandler:5.0];
    int v11 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v10;

    dispatch_group_enter((dispatch_group_t)self->_settingsGroup);
    [*(id *)(*((void *)&buf + 1) + 40) start];
    observer = self->_observer;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100368018;
    v16[3] = &unk_10050E2F0;
    v16[4] = self;
    id v13 = v4;
    id v17 = v13;
    id v14 = v5;
    id v18 = v14;
    id v15 = v9;
    id v19 = v15;
    [(BBObserver *)observer getSectionInfoWithCompletion:v16];
    self->_batchedUpdatePending = 0;

    _Block_object_dispose(&buf, 8);
  }
}

- (id)_displayNameForBulletin:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sectionID];
  unsigned int v5 = [v4 isEqualToString:@"com.apple.cmas"];

  if (v5)
  {
    id v6 = [v3 title];
  }
  else
  {
    id v6 = [v3 sectionDisplayName];
    if (![v6 length])
    {
      id v7 = [v3 sectionID];
      v8 = +[LSApplicationProxy applicationProxyForIdentifier:v7];
      uint64_t v9 = [v8 localizedNameForContext:0];

      id v6 = (void *)v9;
    }
  }

  return v6;
}

- (void)_notifyDelegatesDidRemoveBulletin:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v5 = self->_delegates;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "notificationManager:didRemoveBulletin:", self, v4, (void)v11);
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDelegatesDidAddBulletin:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v5 = self->_delegates;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "notificationManager:didAddBulletin:", self, v4, (void)v11);
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_bulletinsDidChange
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_delegates;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "notificationManagerDidChangeBulletins:", self, (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addDelegate:(id)a3
{
}

- (void)_getNotificationsFromBulletinBoard
{
  observer = self->_observer;
  if (observer)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[ADNotificationManager _getNotificationsFromBulletinBoard]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
      observer = self->_observer;
    }
    [(BBObserver *)observer requestNoticesBulletinsForAllSections];
  }
}

- (id)_afbulletinForBBBulletin:(id)a3 forFeed:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)AFBulletin);
  [v7 setRead:0];
  [v7 setBulletin:v6 forFeed:a4];

  bulletinsOnLockScreen = self->_bulletinsOnLockScreen;
  long long v9 = [v7 internalID];
  long long v10 = [(NSMutableDictionary *)bulletinsOnLockScreen objectForKey:v9];

  objc_msgSend(v7, "setAvailableOnLockScreen:", objc_msgSend(v10, "availableOnLockScreen"));
  objc_msgSend(v7, "setSupportsSpokenNotification:", objc_msgSend(v10, "supportsSpokenNotification"));

  return v7;
}

- (void)_fetchFromDataSourceIfNecessary
{
  if (!self->_initialFetchSuccess)
  {
    dispatch_group_enter((dispatch_group_t)self->_notificationsGroup);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1003688FC;
    v4[3] = &unk_10050E2A0;
    v4[4] = self;
    [WeakRetained fetchBulletinsOnLockScreenForNotificationManager:self completion:v4];
  }
}

- (void)observer:(id)a3 noteServerConnectionStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (BBObserver *)a3;
  id v7 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v11 = "-[ADNotificationManager observer:noteServerConnectionStateChanged:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  if (!v4 && self->_observer == v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100368C20;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v10 = "-[ADNotificationManager observer:updateSectionInfo:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100368D8C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)observer:(id)a3 noteInvalidatedBulletinIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      __int16 v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ADNotificationManager *)self observer:v6 purgeReferencesToBulletinID:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
        __int16 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)observer:(id)a3 purgeReferencesToBulletinID:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10036906C;
  v8[3] = &unk_10050E160;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)observer:(id)a3 removeBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003692B8;
  block[3] = &unk_10050E278;
  id v11 = v7;
  long long v12 = self;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)observer:(id)a3 removeBulletin:(id)a4
{
  id v6 = a3;
  id v7 = [a4 bulletinID];
  [(ADNotificationManager *)self observer:v6 purgeReferencesToBulletinID:v7];
}

- (void)observer:(id)a3 modifyBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100369598;
  block[3] = &unk_10050E278;
  void block[4] = self;
  id v11 = v7;
  unint64_t v12 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003697C0;
  block[3] = &unk_10050E278;
  id v11 = v7;
  unint64_t v12 = self;
  unint64_t v13 = a5;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)fetchSpokenNotificationEnabledAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    settingsGroup = self->_settingsGroup;
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100369AAC;
    v8[3] = &unk_10050E188;
    void v8[4] = self;
    id v9 = v4;
    dispatch_group_notify(settingsGroup, queue, v8);
  }
}

- (void)fetchSiriRelatedNotificationPreviewRestrictedAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    settingsGroup = self->_settingsGroup;
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100369B70;
    v8[3] = &unk_10050E188;
    void v8[4] = self;
    id v9 = v4;
    dispatch_group_notify(settingsGroup, queue, v8);
  }
}

- (id)_siriRelatedRestrictedAppsForApps:(id)a3
{
  id v3 = a3;
  id v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"com.apple.MobileSMS", @"com.apple.mobilephone", @"com.apple.facetime", @"com.apple.NanoPhone", @"com.apple.tincan", 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([v4 containsObject:v9])
        {
          [v17 addObject:v9];
        }
        else
        {
          id v11 = +[LSApplicationProxy applicationProxyForIdentifier:v9];
          unint64_t v12 = +[INAppInfo appInfoWithAppProxy:v11];
          unint64_t v13 = [v12 supportedIntents];
          id v14 = [v13 count];

          if (v14) {
            [v17 addObject:v9];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v17;
}

- (void)_performActionWithIdentifier:(id)a3 forAFBulletin:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if (![v8 length])
  {
    id v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Missing action identifier", buf, 0xCu);
      if (!v10) {
        goto LABEL_9;
      }
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    v10[2](v10, 0);
    goto LABEL_9;
  }
  id v11 = [v9 actionForIdentifier:v8];
  unint64_t v12 = v11;
  if (!v11)
  {
    unsigned int v18 = [v8 isEqualToString:UNNotificationDismissActionIdentifier];
    long long v19 = AFSiriLogContextDaemon;
    if (v18)
    {
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v29 = v19;
        v30 = [v9 bulletinID];
        v31 = [v9 sectionID];
        *(_DWORD *)long long buf = 136315650;
        v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
        __int16 v37 = 2112;
        v38 = v30;
        __int16 v39 = 2112;
        v40 = v31;
        _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%s Clearing bulletin: %@ from section: %@", buf, 0x20u);
      }
      long long v20 = [v9 bbBulletin];

      if (v20)
      {
        id v21 = objc_alloc((Class)NSSet);
        v22 = [v9 bbBulletin];
        v34 = v22;
        v23 = +[NSArray arrayWithObjects:&v34 count:1];
        id v13 = [v21 initWithArray:v23];

        observer = self->_observer;
        v25 = [v9 sectionID];
        [(BBObserver *)observer clearBulletins:v13 inSection:v25];

        goto LABEL_4;
      }
      v28 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)long long buf = 136315138;
      v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
      v26 = "%s bbBulletin field is nil on bulletin";
      id v27 = v28;
    }
    else
    {
      if (!os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        if (!v10) {
          goto LABEL_5;
        }
LABEL_19:
        v10[2](v10, 0);
        goto LABEL_5;
      }
      *(_DWORD *)long long buf = 136315138;
      v36 = "-[ADNotificationManager _performActionWithIdentifier:forAFBulletin:completion:]";
      v26 = "%s Could not find action to perform";
      id v27 = v19;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
  id v13 = [v11 bbAction];
  id v14 = [v9 bbBulletin];
  long long v15 = [v14 responseForAction:v13];

  CFStringRef v16 = self->_observer;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10036A19C;
  v32[3] = &unk_10050E250;
  v33 = v10;
  [(BBObserver *)v16 sendResponse:v15 withCompletion:v32];

LABEL_4:
LABEL_5:

LABEL_9:
}

- (void)performActionWithIdentifier:(id)a3 forUNNotificationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if (![v9 length])
  {
    unint64_t v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v18 = "-[ADNotificationManager performActionWithIdentifier:forUNNotificationWithIdentifier:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Missing notification identifier", buf, 0xCu);
      if (!v10) {
        goto LABEL_6;
      }
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    v10[2](v10, 0);
    goto LABEL_6;
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10036A354;
  v13[3] = &unk_10050E228;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  CFStringRef v16 = v10;
  dispatch_async(queue, v13);

LABEL_6:
}

- (void)performActionWithIdentifier:(id)a3 forBulletinWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if (![v9 length])
  {
    unint64_t v12 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v19 = "-[ADNotificationManager performActionWithIdentifier:forBulletinWithIdentifier:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Missing bulletin identifer", buf, 0xCu);
      if (!v10) {
        goto LABEL_6;
      }
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    v10[2](v10, 0);
    goto LABEL_6;
  }
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10036A550;
  v13[3] = &unk_10050E228;
  id v14 = v9;
  id v15 = self;
  id v16 = v8;
  id v17 = v10;
  dispatch_async(queue, v13);

LABEL_6:
}

- (void)fetchActionsForBulletinWithID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10036A678;
    v8[3] = &unk_10050E200;
    id v9 = v6;
    [(ADNotificationManager *)self fetchBulletinWithID:a3 completion:v8];
  }
}

- (void)fetchBulletinWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10036A79C;
    block[3] = &unk_10050E1D8;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)fetchBulletinsAfterBulletinWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10036A968;
    block[3] = &unk_10050E1D8;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

- (void)fetchBulletinsOnLockScreenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10036AB98;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)fetchAllBulletinsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10036ADC0;
    v7[3] = &unk_10050E188;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)setDataSource:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10036AF30;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_fetchInitialState
{
  [(ADNotificationManager *)self _getNotificationsFromBulletinBoard];
  [(ADNotificationManager *)self _getRestrictedAppsFromBulletinBoard];
}

- (void)_setUpBBObserver
{
  if ((AFIsHorseman() & 1) == 0 && (!AFIsNano() || AFDeviceSupportsANE()))
  {
    id v3 = [(id)objc_opt_class() _createBBObserverWithQueue:self->_queue];
    observer = self->_observer;
    self->_observer = v3;

    [(BBObserver *)self->_observer setDelegate:self];
    id v5 = self->_observer;
    [(BBObserver *)v5 setObserverFeed:0xFFFFLL];
  }
}

- (id)_init
{
  v23.receiver = self;
  v23.super_class = (Class)ADNotificationManager;
  v2 = [(ADNotificationManager *)&v23 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("ADNotificationManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    settingsGroup = v2->_settingsGroup;
    v2->_settingsGroup = (OS_dispatch_group *)v7;

    dispatch_group_t v9 = dispatch_group_create();
    notificationsGroup = v2->_notificationsGroup;
    v2->_notificationsGroup = (OS_dispatch_group *)v9;

    id v11 = objc_alloc_init(ADNotificationOrderedDictionary);
    allBulletins = v2->_allBulletins;
    v2->_allBulletins = v11;

    id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bulletinsOnLockScreen = v2->_bulletinsOnLockScreen;
    v2->_bulletinsOnLockScreen = v13;

    uint64_t v15 = +[NSHashTable weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v15;

    [(ADNotificationManager *)v2 _setUpBBObserver];
    id v17 = objc_alloc_init(ADCallNotificationObserver);
    callNotificationObserver = v2->_callNotificationObserver;
    v2->_callNotificationObserver = v17;

    [(ADNotificationManager *)v2 addDelegate:v2->_callNotificationObserver];
    long long v19 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10036B210;
    block[3] = &unk_10050E138;
    v22 = v2;
    dispatch_async(v19, block);
  }
  return v2;
}

+ (id)_createBBObserverWithQueue:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v4 = (void *)qword_1005864B0;
  uint64_t v12 = qword_1005864B0;
  if (!qword_1005864B0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10036B320;
    v8[3] = &unk_10050E318;
    void v8[4] = &v9;
    sub_10036B320((uint64_t)v8);
    id v4 = (void *)v10[3];
  }
  dispatch_queue_t v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [[v5 alloc] initWithQueue:v3 calloutQueue:v3];

  return v6;
}

+ (id)sharedManager
{
  if (qword_1005864A0 != -1) {
    dispatch_once(&qword_1005864A0, &stru_10050E110);
  }
  v2 = (void *)qword_1005864A8;
  return v2;
}

@end