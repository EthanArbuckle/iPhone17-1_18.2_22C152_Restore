@interface AutoSync
- (AutoSync)init;
- (BOOL)canWeSync;
- (NSDate)nextScheduledSync;
- (id)getSyncHistory;
- (void)cancel;
- (void)cancel_sync;
- (void)dealloc;
- (void)fireSyncNotification_sync;
- (void)handleTransactionAdded:(id)a3;
- (void)handleTransactionAdded_sync:(id)a3 withUpdate:(BOOL)a4 orDelete:(BOOL)a5;
- (void)registerForNotifications;
- (void)setNextScheduledSync:(id)a3;
- (void)startWatchDogTimer_sync;
- (void)updateSyncHistory:(id)a3;
@end

@implementation AutoSync

- (AutoSync)init
{
  v9.receiver = self;
  v9.super_class = (Class)AutoSync;
  v2 = [(AutoSync *)&v9 initWithName:"AutoSync"];
  v3 = v2;
  if (v2)
  {
    v2->_alreadyWaiting = 0;
    v2->_unsigned int syncWindowSeconds = 3600;
    watchDog = v2->_watchDog;
    v2->_watchDog = 0;

    nextScheduledSync = v3->_nextScheduledSync;
    v3->_nextScheduledSync = 0;

    [(AutoSync *)v3 registerForNotifications];
  }
  v6 = [(AutoSync *)v3 logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int syncWindowSeconds = v3->_syncWindowSeconds;
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = syncWindowSeconds;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Using auto-sync window of %d seconds", buf, 8u);
  }

  return v3;
}

- (void)cancel
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100011038;
  v2[3] = &unk_100048BC8;
  v2[4] = self;
  [(AutoSync *)self execute:v2];
}

- (void)cancel_sync
{
  nextScheduledSync = self->_nextScheduledSync;
  if (nextScheduledSync)
  {
    sub_100010D7C(nextScheduledSync);
    v4 = self->_nextScheduledSync;
    self->_nextScheduledSync = 0;
  }
  [(WatchDogTimer *)self->_watchDog cancel];
  watchDog = self->_watchDog;
  self->_watchDog = 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AutoSync;
  [(AutoSync *)&v4 dealloc];
}

- (void)registerForNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleTransactionAdded:" name:@"kCallHistoryTransactionAddedNotification" object:0];
}

- (void)handleTransactionAdded:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"kCHTransactionCountKey"];

  v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"kCHTransactionUpdateKey"];
  unsigned __int8 v9 = [v8 BOOLValue];

  v10 = [v4 userInfo];

  unsigned int v11 = [v10 objectForKeyedSubscript:@"kCHTransactionDeleteKey"];
  LOBYTE(v8) = [v11 BOOLValue];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000112CC;
  v13[3] = &unk_1000493F8;
  v13[4] = self;
  id v14 = v6;
  unsigned __int8 v15 = v9;
  char v16 = (char)v8;
  id v12 = v6;
  [(AutoSync *)self execute:v13];
}

- (void)handleTransactionAdded_sync:(id)a3 withUpdate:(BOOL)a4 orDelete:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = (__CFString *)a3;
  unsigned __int8 v9 = [(AutoSync *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    CFStringRef v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got %{public}@ transactions", (uint8_t *)&v15, 0xCu);
  }

  if (v6 || v5)
  {
    id v12 = [(AutoSync *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v6) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      if (v5) {
        CFStringRef v13 = @"YES";
      }
      int v15 = 138543618;
      CFStringRef v16 = v14;
      __int16 v17 = 2114;
      CFStringRef v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Detected update (%{public}@) or delete (%{public}@) transaction", (uint8_t *)&v15, 0x16u);
    }

LABEL_17:
    [(AutoSync *)self fireSyncNotification_sync];
    goto LABEL_18;
  }
  if ([(__CFString *)v8 intValue] != 1)
  {
    if ((unint64_t)[(__CFString *)v8 unsignedIntegerValue] < 4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v10 = [(AutoSync *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int syncWindowSeconds = self->_syncWindowSeconds;
    int v15 = 67109120;
    LODWORD(v16) = syncWindowSeconds;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Waiting %u seconds for more transactions", (uint8_t *)&v15, 8u);
  }

  [(AutoSync *)self startWatchDogTimer_sync];
LABEL_18:
}

- (void)startWatchDogTimer_sync
{
  id v3 = +[NSNumber numberWithUnsignedInteger:self->_syncWindowSeconds];
  id v4 = sub_100010BEC(v3);
  [(AutoSync *)self setNextScheduledSync:v4];

  objc_initWeak(&location, self);
  BOOL v5 = [WatchDogTimer alloc];
  BOOL v6 = [(AutoSync *)self queue];
  LODWORD(v7) = self->_syncWindowSeconds;
  double v8 = (double)v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100011634;
  v11[3] = &unk_100049420;
  objc_copyWeak(&v12, &location);
  unsigned __int8 v9 = [(WatchDogTimer *)v5 initWithQueue:v6 withName:@"SyncWindow" withTimeout:v11 withCallback:v8];
  watchDog = self->_watchDog;
  self->_watchDog = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)fireSyncNotification_sync
{
  [(AutoSync *)self cancel_sync];
  if ([(AutoSync *)self canWeSync])
  {
    id v3 = [(AutoSync *)self logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Firing sync notification", v5, 2u);
    }

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"kCallHistoryStartCloudKitSyncNotification" object:0];
  }
  else
  {
    [(AutoSync *)self startWatchDogTimer_sync];
  }
}

- (id)getSyncHistory
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = +[NSString stringWithUTF8String:"SyncHistory"];
  BOOL v5 = [v3 arrayForKey:v4];

  if (v5)
  {
    v19 = v3;
    BOOL v6 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    CFStringRef v18 = v5;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        unsigned int v11 = 0;
        do
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v11);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          CFStringRef v14 = [(AutoSync *)self logHandle];
          int v15 = v14;
          if (isKindOfClass)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v25 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Adding %{public}@", buf, 0xCu);
            }

            [v6 addObject:v12];
          }
          else
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v25 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ is not a NSDate, ignoring", buf, 0xCu);
            }
          }
          unsigned int v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v9);
    }

    BOOL v5 = v18;
    id v3 = v19;
  }
  else
  {
    CFStringRef v16 = [(AutoSync *)self logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No sync history found", buf, 2u);
    }

    BOOL v6 = objc_opt_new();
  }

  return v6;
}

- (void)updateSyncHistory:(id)a3
{
  id v4 = +[NSMutableArray arrayWithArray:a3];
  BOOL v5 = +[NSDate date];
  [v4 insertObject:v5 atIndex:0];
  if ((unint64_t)[v4 count] >= 9)
  {
    BOOL v6 = [v4 lastObject];
    id v7 = [(AutoSync *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      unsigned int v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dropping oldest sync %{public}@", (uint8_t *)&v10, 0xCu);
    }

    [v4 removeLastObject];
  }
  id v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = +[NSString stringWithUTF8String:"SyncHistory"];
  [v8 setObject:v4 forKey:v9];
}

- (BOOL)canWeSync
{
  id v3 = [(AutoSync *)self getSyncHistory];
  if ((unint64_t)[v3 count] > 7)
  {
    BOOL v6 = [v3 lastObject];
    [v6 timeIntervalSinceNow];
    double v8 = v7;
    id v9 = [(AutoSync *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2048;
      double v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Comparing oldest sync %{public}@ to now, difference=%f seconds", (uint8_t *)&v14, 0x16u);
    }

    if (v8 >= 0.0)
    {
      uint64_t v12 = [(AutoSync *)self logHandle];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Oldest sync is in the future, we must still wait", (uint8_t *)&v14, 2u);
      }
    }
    else
    {
      int v10 = [(AutoSync *)self logHandle];
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (fabs(v8) >= 86400.0)
      {
        if (v11)
        {
          LOWORD(v14) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Oldest sync is more than 24 hours ago, we can still sync", (uint8_t *)&v14, 2u);
        }

        [(AutoSync *)self updateSyncHistory:v3];
        BOOL v5 = 1;
        goto LABEL_19;
      }
      if (v11)
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Oldest sync was less than 24 hours ago, we must still wait", (uint8_t *)&v14, 2u);
      }
    }
    BOOL v5 = 0;
LABEL_19:

    goto LABEL_20;
  }
  id v4 = [(AutoSync *)self logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134217984;
    id v15 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Only have %ld syncs today, we can sync again", (uint8_t *)&v14, 0xCu);
  }

  [(AutoSync *)self updateSyncHistory:v3];
  BOOL v5 = 1;
LABEL_20:

  return v5;
}

- (NSDate)nextScheduledSync
{
  id v3 = [(AutoSync *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "getting next schedule sync", buf, 2u);
  }

  *(void *)buf = 0;
  double v8 = buf;
  uint64_t v9 = 0x3032000000;
  int v10 = sub_100011F0C;
  BOOL v11 = sub_100011F1C;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011F24;
  v6[3] = &unk_100049448;
  v6[4] = self;
  v6[5] = buf;
  [(AutoSync *)self executeSync:v6];
  id v4 = *((id *)v8 + 5);
  _Block_object_dispose(buf, 8);

  return (NSDate *)v4;
}

- (void)setNextScheduledSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextScheduledSync, 0);
  objc_storeStrong((id *)&self->_watchDog, 0);
}

@end