@interface CallHistoryDBPrivacyPruner
- (CHFeatureFlags)featureFlags;
- (CHSpotlightIndexManager)spotlightIndexManager;
- (CallHistoryDBClientHandle)dbHandle;
- (CallHistoryDBPrivacyPruner)initWithDBHandle:(id)a3 interactionManager:(id)a4;
- (CallHistoryDBPrivacyPruner)initWithDBHandle:(id)a3 interactionManager:(id)a4 spotlightIndexManager:(id)a5;
- (InteractionProtocol)interactionManager;
- (id)observerCallRecordRef;
- (int64_t)callHistoryDBFetchLimit;
- (unint64_t)pruneCallsWithPredicate:(id)a3;
- (void)prune;
- (void)pruneSync;
- (void)registerForNotifications;
- (void)setDbHandle:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setInteractionManager:(id)a3;
- (void)setObserverCallRecordRef:(id)a3;
- (void)setSpotlightIndexManager:(id)a3;
@end

@implementation CallHistoryDBPrivacyPruner

- (CallHistoryDBPrivacyPruner)initWithDBHandle:(id)a3 interactionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CallHistoryDBPrivacyPruner;
  v9 = [(CallHistoryDBPrivacyPruner *)&v16 initWithName:"CallHistoryDBPrivacyPruner"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dbHandle, a3);
    v11 = (CHFeatureFlags *)objc_alloc_init((Class)CHFeatureFlags);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v11;

    objc_storeStrong((id *)&v10->_interactionManager, a4);
    uint64_t v13 = +[CHSpotlightIndexManager sharedInstance];
    spotlightIndexManager = v10->_spotlightIndexManager;
    v10->_spotlightIndexManager = (CHSpotlightIndexManager *)v13;

    [(CallHistoryDBPrivacyPruner *)v10 registerForNotifications];
  }

  return v10;
}

- (CallHistoryDBPrivacyPruner)initWithDBHandle:(id)a3 interactionManager:(id)a4 spotlightIndexManager:(id)a5
{
  id v9 = a5;
  v10 = [(CallHistoryDBPrivacyPruner *)self initWithDBHandle:a3 interactionManager:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_spotlightIndexManager, a5);
  }

  return v11;
}

- (unint64_t)pruneCallsWithPredicate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(CallHistoryDBPrivacyPruner *)self dbHandle];
    unint64_t v6 = (unint64_t)[v5 deleteCallsWithPredicate:v4];

    if (v6)
    {
      id v12 = 0;
      unsigned int v7 = [v5 saveDatabase:&v12];
      id v8 = v12;
      id v9 = v8;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL || !v7)
      {
        if (!v8)
        {
          unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_14;
        }
        v10 = [(CallHistoryDBPrivacyPruner *)self logHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10002D458((uint64_t)v9, v10);
        }
        unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

LABEL_14:
        return v6;
      }
    }
    else
    {
      id v9 = 0;
    }
    v10 = [(CallHistoryDBPrivacyPruner *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pruned %ld calls from the data store.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)registerForNotifications
{
  objc_initWeak(&location, self);
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  unsigned int v7 = sub_100002EB8;
  id v8 = &unk_100048BA0;
  objc_copyWeak(&v9, &location);
  id v4 = [v3 addObserverForName:@"kCallHistoryCallRecordInsertedNotification" object:0 queue:0 usingBlock:&v5];
  -[CallHistoryDBPrivacyPruner setObserverCallRecordRef:](self, "setObserverCallRecordRef:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)prune
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100002F68;
  v2[3] = &unk_100048BC8;
  v2[4] = self;
  [(CallHistoryDBPrivacyPruner *)self execute:v2];
}

- (void)pruneSync
{
  id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"date" ascending:0];
  v5 = +[NSPredicate predicateWithFormat:@"service_provider == %@", @"com.apple.FaceTime"];
  uint64_t v6 = [(CallHistoryDBPrivacyPruner *)self dbHandle];
  id v34 = v3;
  unsigned int v7 = +[NSArray arrayWithObjects:&v34 count:1];
  id v8 = objc_msgSend(v6, "fetchCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:", v5, v7, 0, -[CallHistoryDBPrivacyPruner callHistoryDBFetchLimit](self, "callHistoryDBFetchLimit"), 0);

  id v9 = [(CallHistoryDBPrivacyPruner *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v33 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FT calls not visible to user: %lu", buf, 0xCu);
  }

  if ([v8 count])
  {
    v10 = +[CHRecentCall predicateForCallsWithAnyUniqueIDs:v8];

    [(CallHistoryDBPrivacyPruner *)self pruneCallsWithPredicate:v10];
    v11 = [(CallHistoryDBPrivacyPruner *)self interactionManager];
    [v11 deleteInteractionWithCalls:v8];

    id v12 = [(CallHistoryDBPrivacyPruner *)self featureFlags];
    unsigned int v13 = [v12 callHistorySearchEnabled];

    if (v13)
    {
      unint64_t v14 = [(CallHistoryDBPrivacyPruner *)self logHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v8 count];
        *(_DWORD *)buf = 134217984;
        id v33 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Pruned %lu FT calls. Removing them from index", buf, 0xCu);
      }

      objc_super v16 = [(CallHistoryDBPrivacyPruner *)self spotlightIndexManager];
      [v16 removeDeletedCalls:v8];
    }
  }
  else
  {
    v10 = v5;
  }
  v18 = +[NSPredicate predicateWithFormat:@"service_provider != %@", @"com.apple.FaceTime"];

  v19 = [(CallHistoryDBPrivacyPruner *)self dbHandle];
  id v31 = v3;
  v20 = +[NSArray arrayWithObjects:&v31 count:1];
  v21 = objc_msgSend(v19, "fetchCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:", v18, v20, 0, -[CallHistoryDBPrivacyPruner callHistoryDBFetchLimit](self, "callHistoryDBFetchLimit"), 0);

  v22 = [(CallHistoryDBPrivacyPruner *)self logHandle];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v21 count];
    *(_DWORD *)buf = 134217984;
    id v33 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Non FT calls not visible to user: %lu", buf, 0xCu);
  }

  if ([v21 count])
  {
    v24 = +[CHRecentCall predicateForCallsWithAnyUniqueIDs:v21];

    [(CallHistoryDBPrivacyPruner *)self pruneCallsWithPredicate:v24];
    v25 = [(CallHistoryDBPrivacyPruner *)self interactionManager];
    [v25 deleteInteractionWithCalls:v21];

    v26 = [(CallHistoryDBPrivacyPruner *)self featureFlags];
    unsigned int v27 = [v26 callHistorySearchEnabled];

    if (v27)
    {
      v28 = [(CallHistoryDBPrivacyPruner *)self logHandle];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [v21 count];
        *(_DWORD *)buf = 134217984;
        id v33 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Pruned %lu non FT calls. Removing them from index", buf, 0xCu);
      }

      v30 = [(CallHistoryDBPrivacyPruner *)self spotlightIndexManager];
      [v30 removeDeletedCalls:v21];
    }
  }
  else
  {
    v24 = v18;
  }
}

- (int64_t)callHistoryDBFetchLimit
{
  id v3 = [(CallHistoryDBPrivacyPruner *)self featureFlags];
  unsigned int v4 = [v3 increaseCallHistoryEnabled];

  if (!v4) {
    return 200;
  }
  v5 = [(CallHistoryDBPrivacyPruner *)self featureFlags];
  unsigned int v6 = [v5 keepCallsEnabled];
  unsigned int v7 = (int64_t *)&unk_100037B40;
  if (!v6) {
    unsigned int v7 = (int64_t *)&unk_100037B30;
  }
  int64_t v8 = *v7;

  return v8;
}

- (CallHistoryDBClientHandle)dbHandle
{
  return (CallHistoryDBClientHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDbHandle:(id)a3
{
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (id)observerCallRecordRef
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setObserverCallRecordRef:(id)a3
{
}

- (InteractionProtocol)interactionManager
{
  return self->_interactionManager;
}

- (void)setInteractionManager:(id)a3
{
}

- (CHSpotlightIndexManager)spotlightIndexManager
{
  return self->_spotlightIndexManager;
}

- (void)setSpotlightIndexManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightIndexManager, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong(&self->_observerCallRecordRef, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_dbHandle, 0);
}

@end