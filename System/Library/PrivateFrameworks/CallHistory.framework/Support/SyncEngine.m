@interface SyncEngine
- (BOOL)checkAndSetOperationInProgress_sync:(id)a3;
- (SyncEngine)initWithCloudKit:(id)a3 withTransactionLog:(id)a4 withAutoSync:(id)a5;
- (void)begin:(id)a3;
- (void)begin_sync:(id)a3;
- (void)dealloc;
- (void)downloadChanges:(id)a3;
- (void)downloadChanges_sync;
- (void)handleOperationComplete_sync;
- (void)handleRemoteTransactionsApplied:(id)a3;
- (void)handleRemoteTransactionsApplied_sync:(id)a3;
- (void)registerForNotifications;
- (void)removeOperationInProgress_sync;
- (void)updateMergeResult_sync:(id)a3;
- (void)uploadChanges_sync;
@end

@implementation SyncEngine

- (SyncEngine)initWithCloudKit:(id)a3 withTransactionLog:(id)a4 withAutoSync:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SyncEngine;
  v12 = [(SyncEngine *)&v15 initWithName:"SyncEngine"];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cloudKit, a3);
    objc_storeStrong((id *)&v13->_txLog, a4);
    objc_storeStrong((id *)&v13->_autoSync, a5);
    [(SyncEngine *)v13 registerForNotifications];
    [(SyncEngine *)v13 removeOperationInProgress_sync];
  }

  return v13;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_autoSyncRef];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self->_fetchChangesRef];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self->_remoteTransactionsAppliedRef];

  v6.receiver = self;
  v6.super_class = (Class)SyncEngine;
  [(SyncEngine *)&v6 dealloc];
}

- (void)begin:(id)a3
{
  id v4 = a3;
  if ([(CloudKitProtocol *)self->_cloudKit isActive])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000E70C;
    v5[3] = &unk_100049038;
    v5[4] = self;
    id v6 = v4;
    [(SyncEngine *)self execute:v5];
  }
  else
  {
    (*((void (**)(id, uint64_t, const __CFString *))v4 + 2))(v4, 3, @"Cannot sync without an active account!");
  }
}

- (void)begin_sync:(id)a3
{
  id v4 = a3;
  if (![(SyncEngine *)self checkAndSetOperationInProgress_sync:v4])
  {
    v5 = [(SyncEngine *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Syncing to iCloud...", buf, 2u);
    }

    *(void *)buf = 0;
    objc_super v15 = buf;
    uint64_t v16 = 0x3032000000;
    v17 = sub_10000E8C0;
    v18 = sub_10000E8D0;
    id v19 = (id)os_transaction_create();
    [(AutoSync *)self->_autoSync cancel];
    self->_fetchChangesQualityOfService = 25;
    v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_10000E8D8;
    id v11 = &unk_100049060;
    v13 = buf;
    id v12 = v4;
    id v6 = objc_retainBlock(&v8);
    id callback = self->_callback;
    self->_id callback = v6;

    [(SyncEngine *)self uploadChanges_sync];
    _Block_object_dispose(buf, 8);
  }
}

- (void)uploadChanges_sync
{
  id v4 = [(TransactionLog *)self->_txLog getSomeTransactions];
  if ([v4 count])
  {
    cloudKit = self->_cloudKit;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000EA6C;
    v7[3] = &unk_100049088;
    v7[4] = self;
    v7[5] = v4;
    [(CloudKitProtocol *)cloudKit upload:v4 withCallback:v7];
  }
  else
  {
    id v6 = [(SyncEngine *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No local transactions to upload", buf, 2u);
    }

    [(SyncEngine *)self downloadChanges_sync];
  }
}

- (void)downloadChanges:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EC00;
  v4[3] = &unk_100049038;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SyncEngine *)v5 execute:v4];
}

- (void)downloadChanges_sync
{
  ++self->_fetchIterations;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EEAC;
  v4[3] = &unk_1000490B0;
  void v4[4] = self;
  id v3 = objc_retainBlock(v4);
  [(CloudKitProtocol *)self->_cloudKit getUpdatesWithQualityOfService:self->_fetchChangesQualityOfService withCallback:v3];
}

- (BOOL)checkAndSetOperationInProgress_sync:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void *))a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  v5 = [v4 objectForKey:@"kCHSyncInProgressKey"];
  if (v5)
  {
    id v6 = +[NSString stringWithFormat:@"Sync currently in progress since %@", v5];
    v3[2](v3, 4, v6);
  }
  else
  {
    v7 = +[NSDate date];
    [v4 setObject:v7 forKey:@"kCHSyncInProgressKey"];

    [v4 synchronize];
  }

  return v5 != 0;
}

- (void)removeOperationInProgress_sync
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"kCHSyncInProgressKey"];
  if (v4)
  {
    v5 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    id v6 = +[NSDate date];
    v7 = [v5 components:192 fromDate:v4 toDate:v6 options:0];

    v8 = [(SyncEngine *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      id v12 = [v7 minute];
      __int16 v13 = 2048;
      id v14 = [v7 second];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Operation complete after %ld minutes and %ld seconds", (uint8_t *)&v11, 0x16u);
    }

    [v3 removeObjectForKey:@"kCHSyncInProgressKey"];
    [v3 synchronize];
  }
  else
  {
    v5 = [(SyncEngine *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did not find sync currently in progress token", (uint8_t *)&v11, 2u);
    }
  }

  self->_fetchIterations = 0;
  self->_mergeResultInsertCount = 0;
  self->_mergeResultUpdateCount = 0;
  self->_mergeResultDeleteCount = 0;
  errorMessage = self->_errorMessage;
  self->_errorMessage = 0;

  id callback = self->_callback;
  self->_id callback = 0;

  self->_fetchChangesQualityOfService = 17;
}

- (void)handleRemoteTransactionsApplied:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000F42C;
  v4[3] = &unk_1000490D8;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SyncEngine *)v5 execute:v4];
}

- (void)handleRemoteTransactionsApplied_sync:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKeyedSubscript:@"kCHSyncSourceKey"];
    unsigned int v8 = sub_100025E28(v7);
    if (v8 != 1)
    {
      unsigned int v9 = v8;
      if (v8)
      {
        id v10 = [(SyncEngine *)self logHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v15 = sub_100025E00(v9);
          *(_DWORD *)v23 = 138543618;
          *(void *)&v23[4] = @"kCallHistoryRemoteTransactionsAppliedNotification";
          *(_WORD *)&v23[12] = 2114;
          *(void *)&v23[14] = v15;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@ notification from source %{public}@", v23, 0x16u);
        }
      }
      else
      {
        id v10 = [(SyncEngine *)self logHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v23 = 138543618;
          *(void *)&v23[4] = @"kCHSyncSourceKey";
          *(_WORD *)&v23[12] = 2114;
          *(void *)&v23[14] = @"kCallHistoryRemoteTransactionsAppliedNotification";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Expected valid %{public}@ key to be present in user info dictionary for %{public}@ notification", v23, 0x16u);
        }
      }
      goto LABEL_27;
    }
    int v11 = [v4 userInfo];
    id v10 = [v11 objectForKeyedSubscript:@"kCHChangeTokenKey"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = [(SyncEngine *)self logHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10002E8A0(@"kCHChangeTokenKey", v14);
      }
      goto LABEL_26;
    }
    id v12 = [(CloudKitProtocol *)self->_cloudKit containerUserDefaults];
    [v12 setPreviousServerChangeTokenData:v10];

    __int16 v13 = [v4 userInfo];
    id v14 = [v13 objectForKeyedSubscript:@"kCHMergeTransactionsResultKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SyncEngine *)self updateMergeResult_sync:v14];
    }
    else
    {
      uint64_t v16 = [(SyncEngine *)self logHandle];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v23 = 138543618;
        *(void *)&v23[4] = @"kCHMergeTransactionsResultKey";
        *(_WORD *)&v23[12] = 2114;
        *(void *)&v23[14] = objc_opt_class();
        id v17 = *(id *)&v23[14];
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Expected %{public}@ key to be of type %{public}@", v23, 0x16u);
      }
    }
    v18 = objc_msgSend(v4, "userInfo", *(_OWORD *)v23, *(void *)&v23[16]);
    id v19 = [v18 objectForKeyedSubscript:@"kCHMoreTransactionsComingKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v19 BOOLValue])
      {
        [(SyncEngine *)self downloadChanges_sync];
LABEL_25:

LABEL_26:
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      v20 = [(SyncEngine *)self logHandle];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        *(_DWORD *)v23 = 138543618;
        *(void *)&v23[4] = @"kCHMoreTransactionsComingKey";
        *(_WORD *)&v23[12] = 2114;
        *(void *)&v23[14] = v21;
        id v22 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Expected %{public}@ key to be of type %{public}@", v23, 0x16u);
      }
    }
    [(SyncEngine *)self handleOperationComplete_sync];
    goto LABEL_25;
  }
  v7 = [(SyncEngine *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10002E818(v7);
  }
LABEL_28:
}

- (void)updateMergeResult_sync:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Insert"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [(SyncEngine *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v17 = 138543362;
      *(void *)&v17[4] = objc_opt_class();
      id v7 = *(id *)&v17[4];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Expected insert key to be of type %{public}@", v17, 0xCu);
    }
    v5 = &off_10004B6A8;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", @"Update", *(_OWORD *)v17);
  unsigned int v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unsigned int v9 = [(SyncEngine *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_opt_class();
      *(_DWORD *)id v17 = 138543362;
      *(void *)&v17[4] = v10;
      id v11 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Expected update key to be of type %{public}@", v17, 0xCu);
    }
    unsigned int v8 = &off_10004B6A8;
  }
  id v12 = [v4 objectForKeyedSubscript:@"Delete"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v13 = [(SyncEngine *)self logHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_opt_class();
      *(_DWORD *)id v17 = 138543362;
      *(void *)&v17[4] = v14;
      id v15 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Expected delete key to be of type %{public}@", v17, 0xCu);
    }
    id v12 = &off_10004B6A8;
  }
  uint64_t v16 = [(SyncEngine *)self logHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v17 = 138543874;
    *(void *)&v17[4] = v5;
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v8;
    __int16 v18 = 2114;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Merge result: %{public}@ insert %{public}@ update %{public}@ delete", v17, 0x20u);
  }

  self->_mergeResultInsertCount += (unint64_t)[v5 unsignedIntegerValue];
  self->_mergeResultUpdateCount += (unint64_t)[v8 unsignedIntegerValue];
  self->_mergeResultDeleteCount += (unint64_t)[v12 unsignedIntegerValue];
}

- (void)registerForNotifications
{
  objc_initWeak(&location, self);
  id v3 = +[NSNotificationCenter defaultCenter];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000FE2C;
  v16[3] = &unk_100048BA0;
  objc_copyWeak(&v17, &location);
  id v4 = [v3 addObserverForName:@"kCallHistoryStartCloudKitSyncNotification" object:0 queue:0 usingBlock:v16];
  id autoSyncRef = self->_autoSyncRef;
  self->_id autoSyncRef = v4;

  id v6 = +[NSNotificationCenter defaultCenter];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000FF78;
  v14[3] = &unk_100048BA0;
  objc_copyWeak(&v15, &location);
  id v7 = [v6 addObserverForName:@"kCallHistoryFetchChangesNotification" object:0 queue:0 usingBlock:v14];
  id fetchChangesRef = self->_fetchChangesRef;
  self->_id fetchChangesRef = v7;

  unsigned int v9 = +[NSNotificationCenter defaultCenter];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000100C4;
  v12[3] = &unk_100048BA0;
  objc_copyWeak(&v13, &location);
  id v10 = [v9 addObserverForName:@"kCallHistoryRemoteTransactionsAppliedNotification" object:0 queue:0 usingBlock:v12];
  id remoteTransactionsAppliedRef = self->_remoteTransactionsAppliedRef;
  self->_id remoteTransactionsAppliedRef = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)handleOperationComplete_sync
{
  id v3 = [(SyncEngine *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t fetchIterations = self->_fetchIterations;
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = fetchIterations;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sync result after %lu iterations", buf, 0xCu);
  }

  v5 = [(SyncEngine *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mergeResultInsertCount = self->_mergeResultInsertCount;
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = mergeResultInsertCount;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%lu inserts", buf, 0xCu);
  }

  id v7 = [(SyncEngine *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mergeResultUpdateCount = self->_mergeResultUpdateCount;
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = mergeResultUpdateCount;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%lu updates", buf, 0xCu);
  }

  unsigned int v9 = [(SyncEngine *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mergeResultDeleteCount = self->_mergeResultDeleteCount;
    *(_DWORD *)buf = 134217984;
    unint64_t v16 = mergeResultDeleteCount;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%lu deletes", buf, 0xCu);
  }

  id v11 = +[NSString stringWithFormat:@"Applied %lu update %lu insert %lu delete transactions", self->_mergeResultInsertCount, self->_mergeResultUpdateCount, self->_mergeResultDeleteCount];
  id v12 = [(SyncEngine *)self logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unint64_t v16 = (unint64_t)v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Calling back with result %{public}@", buf, 0xCu);
  }

  id v13 = objc_retainBlock(self->_callback);
  id v14 = v13;
  if (v13) {
    (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, 1, v11);
  }
  [(SyncEngine *)self removeOperationInProgress_sync];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_autoSync, 0);
  objc_storeStrong(&self->_remoteTransactionsAppliedRef, 0);
  objc_storeStrong(&self->_fetchChangesRef, 0);
  objc_storeStrong(&self->_autoSyncRef, 0);
  objc_storeStrong((id *)&self->_txLog, 0);
  objc_storeStrong((id *)&self->_cloudKit, 0);
}

@end